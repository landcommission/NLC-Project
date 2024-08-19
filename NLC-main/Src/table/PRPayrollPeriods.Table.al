#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193530 "PR Payroll Periods"
{
    LookupPageId = "PR Payroll Periods";
    Caption = 'PR Payroll Periods';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Period Month"; Integer)
        {
            Caption = 'Period Month';
        }
        field(2; "Period Year"; Integer)
        {
            Caption = 'Period Year';
        }
        field(3; "Period Name"; Text[30])
        {
            Description = 'e.g November 2009';
            Caption = 'Period Name';
        }
        field(4; "Date Opened"; Date)
        {
            NotBlank = true;
            Caption = 'Date Opened';
        }
        field(5; "Date Closed"; Date)
        {
            Caption = 'Date Closed';
        }
        field(6; Closed; Boolean)
        {
            Description = 'A period is either closed or open';
            Editable = false;
            Caption = 'Closed';
        }
        field(7; "Closed By"; Code[50])
        {
            Caption = 'Closed By';
        }
        field(8; "Opened By"; Code[50])
        {
            Caption = 'Opened By';
        }
        field(9; "Variance Report"; Boolean)
        {
            Description = 'Used to run Variance Report';
            Caption = 'Variance Report';
        }
        field(10; Prorated; Boolean)
        {
            Caption = 'Prorated';
        }
    }

    keys
    {
        key(Key1; "Date Opened", "Period Year")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Date Opened", "Period Name") { }
    }
}
