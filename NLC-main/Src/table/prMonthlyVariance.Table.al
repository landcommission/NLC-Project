#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193576 "prMonthly Variance"
{
    Caption = 'prMonthly Variance';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Trans Code"; Code[20])
        {
            TableRelation = "PR Transaction Codes";
            Caption = 'Trans Code';
        }
        field(2; "Employee code"; Code[20])
        {
            TableRelation = "HR Employees";
            Caption = 'Employee code';
        }
        field(3; Period; Integer)
        {
            Caption = 'Period';
        }
        field(4; "Curr Amount"; Decimal)
        {
            Caption = 'Curr Amount';
        }
        field(5; "Prev Amount"; Decimal)
        {
            Caption = 'Prev Amount';
        }
        field(6; Variance; Decimal)
        {
            Caption = 'Variance';
        }
        field(7; "lineNo."; Integer)
        {
            Caption = 'lineNo.';
        }
        field(8; "Trans Name"; Text[50])
        {
            Caption = 'Trans Name';
        }
        field(9; "User Name"; Text[50])
        {
            Caption = 'User Name';
        }
        field(10; "Current Period"; Date)
        {
            Caption = 'Current Period';
        }
        field(11; "Previous Period"; Date)
        {
            Caption = 'Previous Period';
        }
        field(12; "Employee Name"; Text[150])
        {
            Caption = 'Employee Name';
        }
    }

    keys
    {
        key(Key1; "lineNo.")
        {
            Clustered = true;
        }
        key(Key2; "Employee code") { }
        key(Key3; "Curr Amount") { }
        key(Key4; "Trans Code") { }
    }

    fieldgroups { }
}
