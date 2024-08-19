#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193559 "PR Basic Pay"
{
    Caption = 'PR Basic Pay';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee No"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee No';
        }
        field(2; "Basic Pay"; Decimal)
        {
            Caption = 'Basic Pay';
        }
        field(3; "Payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'Payroll Period';
        }
    }

    keys
    {
        key(Key1; "Employee No", "Payroll Period")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
