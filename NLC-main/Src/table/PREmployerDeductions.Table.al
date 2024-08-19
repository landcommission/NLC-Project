#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193539 "PR Employer Deductions"
{
    DrillDownPageId = "Staff Advance Request List";
    LookupPageId = "Staff Advance Request List";
    Caption = 'PR Employer Deductions';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee Code"; Code[20])
        {
            Caption = 'Employee Code';
        }
        field(2; "Transaction Code"; Code[20])
        {
            Caption = 'Transaction Code';
        }
        field(3; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(4; "Period Month"; Integer)
        {
            Caption = 'Period Month';
        }
        field(5; "Period Year"; Integer)
        {
            Caption = 'Period Year';
        }
        field(6; "Payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'Payroll Period';
        }
        field(7; "Payroll Code"; Code[20])
        {
            TableRelation = "prPayroll Type";
            Caption = 'Payroll Code';
        }
    }

    keys
    {
        key(Key1; "Employee Code", "Transaction Code", "Period Month", "Period Year", "Payroll Period")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
    }

    fieldgroups { }
}
