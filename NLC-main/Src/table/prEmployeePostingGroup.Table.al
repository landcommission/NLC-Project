#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193553 "prEmployee Posting Group"
{
    DataCaptionFields = "Code", Description;
    DrillDownPageId = prEmployeePosting;
    LookupPageId = prEmployeePosting;
    Caption = 'prEmployee Posting Group';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[50])
        {
            NotBlank = true;
            Caption = 'Code';
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(3; "Salary Account"; Code[100])
        {
            TableRelation = "G/L Account";
            Caption = 'Salary Account';
        }
        field(4; "Income Tax Account"; Code[50])
        {
            TableRelation = "G/L Account";
            Caption = 'Income Tax Account';
        }
        field(5; "SSF Employer Account"; Code[50])
        {
            TableRelation = "G/L Account";
            Caption = 'SSF Employer Account';
        }
        field(6; "SSF Employee Account"; Code[50])
        {
            TableRelation = "G/L Account";
            Caption = 'SSF Employee Account';
        }
        field(7; "Net Salary Payable"; Code[50])
        {
            TableRelation = "G/L Account";
            Caption = 'Net Salary Payable';
        }
        field(8; "Operating Overtime"; Code[50])
        {
            TableRelation = "G/L Account";
            Caption = 'Operating Overtime';
        }
        field(9; "Tax Relief"; Code[50])
        {
            TableRelation = "G/L Account";
            Caption = 'Tax Relief';
        }
        field(10; "Employee Provident Fund Acc."; Code[50])
        {
            TableRelation = "G/L Account";
            Caption = 'Employee Provident Fund Acc.';
        }
        field(11; "Pay Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            Caption = 'Pay Period Filter';
        }
        field(12; "Pension Employer Acc"; Code[50])
        {
            TableRelation = "G/L Account";
            Caption = 'Pension Employer Acc';
        }
        field(13; "Pension Employee Acc"; Code[50])
        {
            TableRelation = "G/L Account";
            Caption = 'Pension Employee Acc';
        }
        field(14; "Earnings and deductions"; Code[50])
        {
            Caption = 'Earnings and deductions';
        }
        field(15; "Staff Benevolent"; Code[50])
        {
            TableRelation = "G/L Account";
            Caption = 'Staff Benevolent';
        }
        field(16; SalaryExpenseAC; Code[100])
        {
            TableRelation = "G/L Account";
            Caption = 'SalaryExpenseAC';
        }
        field(17; DirectorsFeeGL; Code[50])
        {
            TableRelation = "G/L Account";
            Caption = 'DirectorsFeeGL';
        }
        field(18; StaffGratuity; Code[50])
        {
            TableRelation = "G/L Account";
            Caption = 'StaffGratuity';
        }
        field(19; "NHIF Employee Account"; Code[50])
        {
            TableRelation = "G/L Account";
            Caption = 'NHIF Employee Account';
        }
        field(20; "Payroll Code"; Code[20])
        {
            TableRelation = "prPayroll Type";
            Caption = 'Payroll Code';
        }
        field(21; "Upload to Payroll"; Boolean)
        {
            Caption = 'Upload to Payroll';
        }
        field(22; "Table Id"; Code[20])
        {
            Caption = 'Table Id';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Earnings and deductions") { }
    }

    fieldgroups { }
}
