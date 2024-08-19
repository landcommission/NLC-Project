#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193538 "PR Employee P9 Info"
{
    DrillDownPageId = "Cash Receipt Header";
    LookupPageId = "Cash Receipt Header";
    Caption = 'PR Employee P9 Info';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee Code"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee Code';
        }
        field(2; "Basic Pay"; Decimal)
        {
            Caption = 'Basic Pay';
        }
        field(3; Allowances; Decimal)
        {
            Caption = 'Allowances';
        }
        field(4; Benefits; Decimal)
        {
            Caption = 'Benefits';
        }
        field(5; "Value Of Quarters"; Decimal)
        {
            Caption = 'Value Of Quarters';
        }
        field(6; "Defined Contribution"; Decimal)
        {
            Caption = 'Defined Contribution';
        }
        field(7; "Owner Occupier Interest"; Decimal)
        {
            Caption = 'Owner Occupier Interest';
        }
        field(8; "Gross Pay"; Decimal)
        {
            Caption = 'Gross Pay';
        }
        field(9; "Taxable Pay"; Decimal)
        {
            Caption = 'Taxable Pay';
        }
        field(10; "Tax Charged"; Decimal)
        {
            Caption = 'Tax Charged';
        }
        field(11; "Insurance Relief"; Decimal)
        {
            Caption = 'Insurance Relief';
        }
        field(12; "Tax Relief"; Decimal)
        {
            Caption = 'Tax Relief';
        }
        field(13; PAYE; Decimal)
        {
            Caption = 'PAYE';
        }
        field(14; NSSF; Decimal)
        {
            Caption = 'NSSF';
        }
        field(15; NHIF; Decimal)
        {
            Caption = 'NHIF';
        }
        field(16; Deductions; Decimal)
        {
            Caption = 'Deductions';
        }
        field(17; "Net Pay"; Decimal)
        {
            Caption = 'Net Pay';
        }
        field(18; "Period Month"; Integer)
        {
            Caption = 'Period Month';
        }
        field(19; "Period Year"; Integer)
        {
            Caption = 'Period Year';
        }
        field(20; "Payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'Payroll Period';
        }
        field(21; "Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'Period Filter';
        }
        field(22; Pension; Decimal)
        {
            Caption = 'Pension';
        }
        field(23; HELB; Decimal)
        {
            Caption = 'HELB';
        }
        field(24; "Payroll Code"; Code[20])
        {
            TableRelation = "prPayroll Type";
            Caption = 'Payroll Code';
        }
        field(25; "Pension Contrib"; Decimal)
        {
            CalcFormula = lookup("PR Period Transactions".Amount where("Transaction Code" = filter('D162'),
                                                                        "Employee Code" = field("Employee Code"),
                                                                        "Payroll Period" = field("Payroll Period")));
            FieldClass = FlowField;
            Caption = 'Pension Contrib';
            Editable = false;
        }
        field(26; "NHIF Relief"; Decimal)
        {
            Caption = 'NHIF Relief';
        }
    }

    keys
    {
        key(Key1; "Employee Code", "Payroll Period")
        {
            Clustered = true;
            SumIndexFields = "Basic Pay", "Gross Pay", "Net Pay", Allowances, Deductions, PAYE, NSSF, NHIF;
        }
    }

    fieldgroups { }
}
