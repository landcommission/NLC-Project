#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193723 "Employee Bankss"
{
    DrillDownPageId = "Employees Bank List";
    LookupPageId = "Employees Bank List";
    Caption = 'Employee Bankss';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee Code"; Code[20])
        {
            Caption = 'Employee Code';
        }
        field(2; "Bank Code"; Code[20])
        {
            TableRelation = "PR Bank Accounts";
            Caption = 'Bank Code';
        }
        field(3; "Branch Code"; Code[20])
        {
            Caption = 'Branch Code';
        }
        field(4; "Branch Name"; Text[30])
        {
            Caption = 'Branch Name';
        }
        field(5; "Account No"; Code[50])
        {
            Caption = 'Account No';
        }
        field(6; "Bank Name"; Text[30])
        {
            Caption = 'Bank Name';
        }
        field(7; "Salary Percentage"; Decimal)
        {
            Caption = 'Salary Percentage';
        }
        field(8; "Payroll Period"; Date)
        {
            Caption = 'Payroll Period';
        }
    }

    keys
    {
        key(Key1; "Employee Code", "Bank Code", "Branch Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
