#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193570 "prPayroll Setup"
{
    Caption = 'prPayroll Setup';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
        }
        field(2; "Salary Review Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Salary Review Nos.';
        }
        field(3; "Salary Advance Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Salary Advance Nos.';
        }
        field(4; "Mortgage Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Mortgage Nos.';
        }
        field(5; "Car Loan Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Car Loan Nos.';
        }
        field(6; "Gratuity Approval Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Gratuity Approval Nos.';
        }
        field(7; "Bonus Recommendation Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Bonus Recommendation Nos.';
        }
        field(8; "Employee Change Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Employee Change Nos';
        }
        field(9; "Allowances Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Allowances Nos';
        }
        field(10; "Deductions Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Deductions Nos';
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
