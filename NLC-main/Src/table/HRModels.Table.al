#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 69201 "HR Models"
{
    LookupPageId = "HR Models List";
    Caption = 'HR Models';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Type; Option)
        {
            ExtendedDatatype = None;
            OptionCaption = 'Religion,Language,Medical Scheme,Location,Contract Type,Qualification Type,Stages,Scores,Institution,Appraisal Type,Appraisal Period,Urgency,Succession,Security,Disciplinary Case Rating,Disciplinary Case,Disciplinary Action,Next of Kin,Country,Grade,Checklist Item,Appraisal Sub Category,Appraisal Group Item,Transport Type,Grievance Cause,Grievance Outcome,Appraiser Recom,Training Item Cost,Training Evaluation';
            OptionMembers = Religion,Language,"Medical Scheme",Location,"Contract Type","Qualification Type",Stages,Scores,Institution,"Appraisal Type","Appraisal Period",Urgency,Succession,Security,"Disciplinary Case Rating","Disciplinary Case","Disciplinary Action","Next of Kin",Country,Grade,"Checklist Item","Appraisal Sub Category","Appraisal Group Item","Transport Type","Grievance Cause","Grievance Outcome","Appraiser Recom","Training Item Cost","Training Evaluation";
            Caption = 'Type';
        }
        field(2; "Code"; Code[70])
        {
            Caption = 'Code';
        }
        field(3; Description; Text[2000])
        {
            Caption = 'Description';
        }
        field(4; Remarks; Text[250])
        {
            Caption = 'Remarks';
        }
        field(5; "Notice Period"; Date)
        {
            Caption = 'Notice Period';
        }
        field(6; Closed; Boolean)
        {
            Caption = 'Closed';
            trigger OnValidate()
            begin
                "Last Date Modified" := Today;
            end;
        }
        field(7; "Contract Length"; Integer)
        {
            Caption = 'Contract Length';
        }
        field(8; "Current Appraisal Period"; Boolean)
        {
            Caption = 'Current Appraisal Period';
        }
        field(9; "Disciplinary Case Rating"; Text[30])
        {
            TableRelation = "HR Models".Code where(Type = const("Disciplinary Case Rating"));
            Caption = 'Disciplinary Case Rating';
        }
        field(10; "Disciplinary Action"; Code[20])
        {
            TableRelation = "HR Models".Code where(Type = const("Disciplinary Action"));
            Caption = 'Disciplinary Action';
        }
        field(14; From; Date)
        {
            Caption = 'From';
        }
        field(15; "To"; Date)
        {
            Caption = 'To';
        }
        field(16; Score; Decimal)
        {
            Caption = 'Score';
        }
        field(17; "Basic Salary"; Decimal)
        {
            Caption = 'Basic Salary';
        }
        field(18; "To be cleared by"; Code[10])
        {
            TableRelation = "HR Models".Remarks;
            Caption = 'To be cleared by';
        }
        field(19; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
        }
        field(20; "Supervisor Only"; Boolean)
        {
            Caption = 'Supervisor Only';
        }
        field(21; "Appraisal Stage"; Option)
        {
            OptionMembers = "Target Setting",FirstQuarter,SecondQuarter,ThirdQuarter,EndYearEvaluation;
            Caption = 'Appraisal Stage';
        }
        field(22; "Previous Appraisal Code"; Code[70])
        {
            TableRelation = "HR Models".Code where(Type = const("Appraisal Period"),
                                                    Closed = const(true));
            Caption = 'Previous Appraisal Code';
        }
        field(23; "Requires Prev Interventions"; Boolean)
        {
            Caption = 'Requires Prev Interventions';
        }
    }

    keys
    {
        key(Key1; Type, "Code")
        {
            Clustered = true;
        }
        // key(Key2;'')
        // {
        //     Enabled = false;
        // }
        // key(Key3;'')
        // {
        //     Enabled = false;
        // }
    }

    fieldgroups { }

    var
        HrModels: Record "HR Models";
}

