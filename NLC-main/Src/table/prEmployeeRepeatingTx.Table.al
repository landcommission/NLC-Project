#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193552 prEmployeeRepeatingTx
{
    Caption = 'prEmployeeRepeatingTx';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee Code"; Code[10])
        {
            Caption = 'Employee Code';
            //TableRelation = Table52000.Field1;
        }
        field(2; "Transaction Code"; Code[10])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code";
            Caption = 'Transaction Code';
        }
        field(3; "Transaction Name"; Text[30])
        {
            Caption = 'Transaction Name';
        }
        field(4; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(5; Balance; Decimal)
        {
            Caption = 'Balance';
        }
        field(7; "Period Month"; Integer)
        {
            Caption = 'Period Month';
        }
        field(8; "Period Year"; Integer)
        {
            Caption = 'Period Year';
        }
        field(9; "Payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'Payroll Period';
        }
        field(10; "#of Repayments"; Integer)
        {
            Caption = '#of Repayments';
        }
        field(12; "Reference No"; Text[50])
        {
            Caption = 'Reference No';
        }
    }

    keys
    {
        key(Key1; "Employee Code", "Transaction Code", "Reference No", "Period Month", "Period Year", "Payroll Period")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
    }

    fieldgroups { }
}
