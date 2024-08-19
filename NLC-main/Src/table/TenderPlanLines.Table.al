#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193806 "Tender Plan Lines"
{
    Caption = 'Tender Plan Lines';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Tender No."; Code[20])
        {
            Caption = 'Tender No.';
        }
        field(5; "Planned start date"; Date)
        {
            Editable = false;
            Caption = 'Planned start date';
        }
        field(6; "Planned end date"; Date)
        {
            Editable = false;
            Caption = 'Planned end date';
        }
        field(7; "Planned duration"; Decimal)
        {
            Editable = false;
            Caption = 'Planned duration';
        }
        field(8; "Actual start date"; Date)
        {
            Caption = 'Actual start date';
            trigger OnValidate()
            begin
                if "Actual end date" > "Actual start date" then
                    "Actual Duration" := "Actual end date" - "Actual start date";
                SetNextStart();
            end;
        }
        field(9; "Actual end date"; Date)
        {
            Caption = 'Actual end date';
            trigger OnValidate()
            begin
                if "Actual end date" > "Actual start date" then
                    "Actual Duration" := "Actual end date" - "Actual start date";
                SetNextStart();
            end;
        }
        field(10; "Actual Duration"; Decimal)
        {
            Editable = false;
            Caption = 'Actual Duration';
        }
        field(11; Stage; Code[20])
        {
            Editable = false;
            Caption = 'Stage';
        }
        field(12; "Sorting No."; Integer)
        {
            Editable = false;
            Caption = 'Sorting No.';
        }
        field(13; WorkplanCode; Code[20])
        {
            CalcFormula = lookup("Tender Plan Header"."Workplan Code" where(No = field("Tender No.")));
            FieldClass = FlowField;
            Caption = 'WorkplanCode';
            Editable = false;
        }
        field(14; "WorkPlan Code"; Code[20])
        {
            Caption = 'WorkPlan Code';
        }
        field(15; "Proc. Method No."; Code[20])
        {
            CalcFormula = lookup("Tender Plan Header"."Proc. method number" where(No = field("Tender No.")));
            FieldClass = FlowField;
            Caption = 'Proc. Method No.';
            Editable = false;
        }
        field(16; Description; Text[50])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Tender No.", Stage)
        {
            Clustered = true;
        }
        key(Key2; "Tender No.", "Sorting No.") { }
    }

    fieldgroups { }

    var
        me: Record "Tender Plan Lines";


    procedure SetNextStart()
    begin
        me.SetFilter("Sorting No.", '%1', "Sorting No." + 1);
        if me.FindFirst() then begin
            me."Actual start date" := "Actual end date";
            me.Modify();
        end;
    end;
}
