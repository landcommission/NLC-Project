#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193533 "prEmployee Banks"
{
    LookupPageId = "Bank Pay In Slip Confirmation";
    Caption = 'prEmployee Banks';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee Code"; Code[10])
        {
            TableRelation = "PR Salary Arrears22"."Payroll Period";
            Caption = 'Employee Code';
        }
        field(2; "Bank Code"; Code[10])
        {
            TableRelation = "PR Bank Accounts"."Bank Code";
            Caption = 'Bank Code';
        }
        field(3; "Branch Code"; Code[10])
        {
            TableRelation = "PR Bank Accounts"."Bank Name";
            Caption = 'Branch Code';
        }
        field(4; Default; Boolean)
        {
            InitValue = true;
            Caption = 'Default';
        }
        field(5; "Account No"; Text[50])
        {
            Caption = 'Account No';
        }
        field(6; Percentage; Decimal)
        {
            Description = 'Refers to %of Net to be transfered to this A/C';
            InitValue = 100;
            Caption = 'Percentage';
        }
        field(7; Amount; Decimal)
        {
            Description = 'Refers to Amount to be transfered to this A/C';
            InitValue = 0;
            Caption = 'Amount';
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
