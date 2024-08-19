#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193451 "HR Leave Periods"
{
    Caption = 'Leave Periods';
    LookupPageId = "HR Leave Period List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            NotBlank = true;

            trigger OnValidate()
            begin
                "Period Description" := Format("Starting Date", 0, Text000);
            end;
        }
        field(2; "Period Description"; Text[100])
        {
            Caption = 'Name';
            Editable = false;
        }
        field(3; "New Fiscal Year"; Boolean)
        {
            Caption = 'New Fiscal Year';

            trigger OnValidate()
            begin
                TestField("Date Locked", false);
            end;
        }
        field(4; Closed; Boolean)
        {
            Caption = 'Closed';
            Editable = true;
        }
        field(5; "Date Locked"; Boolean)
        {
            Caption = 'Date Locked';
            Editable = true;
        }
        field(6; "Reimbursement Clossing Date"; Boolean)
        {
            Caption = 'Reimbursement Clossing Date';
        }
        field(8; "Period Code"; Code[10])
        {
            Caption = 'Period Code';
        }
    }

    keys
    {
        key(Key1; "Starting Date")
        {
            Clustered = true;
        }
        key(Key2; "New Fiscal Year", "Date Locked") { }
        key(Key3; Closed) { }
        key(Key4; "Period Code") { }
    }

    fieldgroups { }


    var
        Text000: Label '<Month Text>';
        AccountingPeriod2: Record "HR Leave Periods";
        InvtSetup: Record "Inventory Setup";


    procedure UpdateAvgItems()
    begin
    end;
}
