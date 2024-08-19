#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193442 "HR Individual Target Line"
{
    Caption = 'HR Individual Target Line';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No';
        }
        field(2; "Appraisal No"; Code[50])
        {
            TableRelation = "HR Individual Targets Header"."Appraisal No";
            Caption = 'Appraisal No';
        }
        field(3; "Perspective Code"; Integer)
        {
            Caption = 'Perspective Code';
            trigger OnValidate()
            begin
                CalcFields("Perspective Description");
            end;
        }
        field(4; "Perspective Description"; Text[250])
        {
            CalcFormula = lookup("HR Perspectives Setup".Code /* where ("Qualification Type"=field("Perspective Code")) */);
            FieldClass = FlowField;
            Caption = 'Perspective Description';
            Editable = false;
        }
        field(5; "Targeted Score"; Decimal)
        {
            Caption = 'Targeted Score';
            trigger OnValidate()
            begin
                "Unachieved Targets" := "Targeted Score" - "Achieved Score";
            end;
        }
        field(6; "Perspective Type"; Option)
        {
            OptionCaption = ' ,Service Delivery,Financial Stewardship,Training and Development,Customer and Sales';
            OptionMembers = " ","Service Delivery","Financial Stewardship","Training and Development","Customer and Sales";
            Caption = 'Perspective Type';
        }
        field(7; "Achieved Score"; Decimal)
        {
            Caption = 'Achieved Score';
            trigger OnValidate()
            begin
                "Unachieved Targets" := "Targeted Score" - "Achieved Score";
                if ("Targeted Score" <> 0) and ("Achieved Score" <> 0) then
                    Score := "Achieved Score" / "Targeted Score" * 100
            end;
        }
        field(8; "Unachieved Targets"; Decimal)
        {
            Caption = 'Unachieved Targets';
        }
        field(9; "Appraisee Comments"; Text[250])
        {
            Caption = 'Appraisee Comments';
        }
        field(10; Objective; Text[250])
        {
            Caption = 'Objective';
        }
        field(11; "Company Target"; Code[50])
        {
            Caption = 'Company Target';
        }
        field(12; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(13; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(14; "Self Rating"; Decimal)
        {
            MaxValue = 5;
            Caption = 'Self Rating';
        }
        field(15; "Supervisor Rating"; Decimal)
        {
            MaxValue = 5;
            Caption = 'Supervisor Rating';
        }
        field(16; "Agreed Rating"; Decimal)
        {
            MaxValue = 5;
            Caption = 'Agreed Rating';
            trigger OnValidate()
            begin
                BSCHead.Reset();
                BSCHead.SetRange(BSCHead."Appraisal No", "Appraisal No");
                if BSCHead.Find('-') then begin
                    BSCHead.CalcFields("Finance Rating", "Customer Rating", "Training Rating", "Service Rating", Customer, Training, Service, Finance);
                    if (BSCHead."Finance Rating" <> 0) and (BSCHead.Finance <> 0) then
                        BSCHead."Finance Perc Score" := (BSCHead."Finance Rating" * 25) / (BSCHead.Finance * 5);
                    if (BSCHead."Customer Rating" <> 0) and (BSCHead.Customer <> 0) then
                        BSCHead."Customer Perc Score" := (BSCHead."Customer Rating" * 25) / (BSCHead.Customer * 5);
                    if (BSCHead."Training Rating" <> 0) and (BSCHead.Training <> 0) then
                        BSCHead."Training Perc Score" := (BSCHead."Training Rating" * 25) / (BSCHead.Training * 5);
                    if (BSCHead."Service Rating" <> 0) and (BSCHead.Service <> 0) then
                        BSCHead."Service Perc Score" := (BSCHead."Service Rating" * 25) / (BSCHead.Service * 5);
                    //MESSAGE('%1,%2,%3,%4',"Finance Perc Score","Customer Perc Score","Training Perc Score","Service Perc Score");
                    BSCHead."Overall Perc Score" := BSCHead."Finance Perc Score" + BSCHead."Customer Perc Score" + BSCHead."Training Perc Score" + BSCHead."Service Perc Score";
                    BSCHead.Modify();
                end
            end;
        }
        field(17; "Appraisal Period"; Date)
        {
            Caption = 'Appraisal Period';
        }
        field(18; "Appraisal Type"; Option)
        {
            CalcFormula = lookup("HR Individual Targets Header"."Appraisal Type" where("Appraisal No" = field("Appraisal No")));
            FieldClass = FlowField;
            OptionCaption = 'Appraisal Review,Target Setting,End Year Appraisal';
            OptionMembers = "Appraisal Review","Target Setting","End Year Appraisal";
            Caption = 'Appraisal Type';
            Editable = false;
        }
        field(19; Status; Option)
        {
            CalcFormula = lookup("HR Individual Targets Header".Status where("Appraisal No" = field("Appraisal No")));
            FieldClass = FlowField;
            OptionCaption = 'Open,Pending Approval,Discussed,Approved,Posted';
            OptionMembers = Open,"Pending Approval",Discussed,Approved,Posted;
            Caption = 'Status';
            Editable = false;
        }
        field(20; "Appraiser Comments"; Text[250])
        {
            Caption = 'Appraiser Comments';
        }
        field(21; "Review Line Reference"; Text[30])
        {
            Caption = 'Review Line Reference';
        }
        field(22; Score; Decimal)
        {
            Caption = 'Score';
        }
    }

    keys
    {
        key(Key1; "Line No", "Appraisal No", "Perspective Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        BSCHead: Record "HR Individual Targets Header";
}
