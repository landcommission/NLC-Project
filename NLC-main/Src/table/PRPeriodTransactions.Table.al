#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193537 "PR Period Transactions"
{
    DrillDownPageId = "prMassEmployee Trans";
    LookupPageId = "prMassEmployee Trans";
    Caption = 'PR Period Transactions';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee Code"; Code[50])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee Code';
        }
        field(2; "Transaction Code"; Text[30])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code";
            Caption = 'Transaction Code';
        }
        field(3; "Group Text"; Text[30])
        {
            Description = 'e.g Statutory, Deductions, Tax Calculation etc';
            Caption = 'Group Text';
        }
        field(4; "Transaction Name"; Text[200])
        {
            Caption = 'Transaction Name';
        }
        field(5; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(6; Balance; Decimal)
        {
            Caption = 'Balance';
        }
        field(7; "Original Amount"; Decimal)
        {
            Caption = 'Original Amount';
        }
        field(8; "Group Order"; Integer)
        {
            Caption = 'Group Order';
        }
        field(9; "Sub Group Order"; Integer)
        {
            Caption = 'Sub Group Order';
        }
        field(10; "Period Month"; Integer)
        {
            Caption = 'Period Month';
        }
        field(11; "Period Year"; Integer)
        {
            Caption = 'Period Year';
        }
        field(12; "Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            Caption = 'Period Filter';
        }
        field(13; "Payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods";
            Caption = 'Payroll Period';
        }
        field(14; Membership; Code[50])
        {
            TableRelation = "prInstitutional Membership"."Institution No";
            Caption = 'Membership';
        }
        field(15; "Reference No"; Text[20])
        {
            Caption = 'Reference No';
        }
        field(16; "Department Code"; Code[20])
        {
            Caption = 'Department Code';
        }
        field(17; Lumpsumitems; Boolean)
        {
            Caption = 'Lumpsumitems';
        }
        field(18; TravelAllowance; Code[20])
        {
            Caption = 'TravelAllowance';
        }
        field(19; "GL Account"; Code[20])
        {
            TableRelation = "G/L Account";
            Caption = 'GL Account';
        }
        field(20; "Company Deduction"; Boolean)
        {
            Description = 'Dennis- Added to filter out the company deductions esp: the Pensions';
            Caption = 'Company Deduction';
        }
        field(21; "Emp Amount"; Decimal)
        {
            Description = 'Dennis- Added to take care of the balances that need a combiantion btwn employee and employer';
            Caption = 'Emp Amount';
        }
        field(22; "Emp Balance"; Decimal)
        {
            Description = 'Dennis- Added to take care of the balances that need a combiantion btwn employee and employer';
            Caption = 'Emp Balance';
        }
        field(23; "Journal Account Code"; Code[20])
        {
            Caption = 'Journal Account Code';
        }
        field(24; "Journal Account Type"; Option)
        {
            OptionMembers = " ","G/L Account",Customer,Vendor;
            Caption = 'Journal Account Type';
        }
        field(25; "Post As"; Option)
        {
            OptionMembers = " ",Debit,Credit;
            Caption = 'Post As';
        }
        field(26; "Loan Number"; Code[10])
        {
            Caption = 'Loan Number';
        }
        field(27; "coop parameters"; Option)
        {
            Description = 'to be able to report the different coop contributions -Dennis';
            OptionMembers = none,shares,loan,"loan Interest","Emergency loan","Emergency loan Interest","School Fees loan","School Fees loan Interest",Welfare,Pension,NSSF,Overtime;
            Caption = 'coop parameters';
        }
        field(28; "Payroll Code"; Code[20])
        {
            TableRelation = "prPayroll Type";
            Caption = 'Payroll Code';
        }
        field(29; "Payment Mode"; Option)
        {
            Description = 'Bank Transfer,Cheque,Cash,SACCO';
            OptionMembers = " ","Bank Transfer",Cheque,Cash,SACCO;
            Caption = 'Payment Mode';
        }
        field(30; "Location/Division"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
            Caption = 'Location/Division';
        }
        field(31; Department; Code[20])
        {
            Caption = 'Department';
            //TableRelation = Table50082.Field1;
        }
        field(32; "Cost Centre"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('COSTCENTRE'));
            Caption = 'Cost Centre';
        }
        field(33; "Salary Grade"; Code[20])
        {
            TableRelation = "PR Basic Pay"."Employee No";
            Caption = 'Salary Grade';
        }
        field(34; "Salary Notch"; Code[20])
        {
            Caption = 'Salary Notch';
            //TableRelation = "prSalary Review Lines".test where("Line No." = field("Salary Grade"));
        }
        field(35; "Payslip Order"; Integer)
        {
            Caption = 'Payslip Order';
        }
        field(36; "No. Of Units"; Decimal)
        {
            Caption = 'No. Of Units';
        }
        field(37; "Employee Classification"; Code[20])
        {
            TableRelation = "Employee Class".Code;
            Caption = 'Employee Classification';
        }
        field(38; State; Code[20])
        {
            TableRelation = "Post Code";
            Caption = 'State';
        }
        field(39; "New Departmental Code"; Code[20])
        {
            Caption = 'New Departmental Code';
        }
        field(40; grants; Code[20])
        {
            TableRelation = "HR Employee Qualifications"."Employee No.";
            Caption = 'grants';
        }
        field(39003900; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(39003901; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(39003902; "Contract Type"; Option)
        {
            OptionCaption = 'Permanent&Pensionable,Contract,Secondment,Temporary,Volunteer,Project Staff,Consultant-Contract,Consultant,Graduate Trainee,Intern';
            OptionMembers = "Permanent&Pensionable",Contract,Secondment,"Temporary",Volunteer,"Project Staff","Consultant-Contract",Consultant,"Graduate Trainee",Intern;
            Caption = 'Contract Type';
        }
        field(39003903; "Transaction Type"; Option)
        {
            OptionCaption = 'Income,Deduction';
            OptionMembers = Income,Deduction;
            Caption = 'Transaction Type';
        }
        field(39003904; "Job Title"; Text[50])
        {
            FieldClass = Normal;
            Caption = 'Job Title';
        }
        field(39003905; "Bank Name"; Text[100])
        {
            Caption = 'Bank Name';
        }
        field(39003906; "Branch Name"; Text[100])
        {
            Caption = 'Branch Name';
        }
        field(39003907; "Account Number"; Code[50])
        {
            Caption = 'Account Number';
        }
    }

    keys
    {
        key(Key1; "Employee Code", "Transaction Code", "Period Month", "Period Year", Membership, "Reference No")
        {
            Clustered = true;
            SumIndexFields = Amount, "No. Of Units";
        }
        key(Key2; "Employee Code", "Period Month", "Period Year", "Group Order", "Sub Group Order", "Payslip Order", Membership, "Reference No")
        {
            SumIndexFields = Amount, "No. Of Units";
        }
        key(Key3; "Group Order", "Transaction Code", "Period Month", "Period Year", Membership, "Reference No", "Department Code")
        {
            SumIndexFields = Amount, "No. Of Units";
        }
        key(Key4; Membership) { }
        key(Key5; "Transaction Code", "Payroll Period", Membership, "Reference No")
        {
            SumIndexFields = Amount, "No. Of Units";
        }
        key(Key6; "Payroll Period", "Group Order", "Sub Group Order")
        {
            SumIndexFields = Amount, "No. Of Units";
        }
        key(Key7; "Employee Code", "Department Code")
        {
            SumIndexFields = Amount, "No. Of Units";
        }
        key(Key8; "Transaction Code", "Employee Code", "Payroll Period", "Location/Division", Department)
        {
            SumIndexFields = Amount, "No. Of Units";
        }
        key(Key9; "Payslip Order") { }
        key(Key10; "Transaction Code", "Employee Code", "Payroll Period", "Reference No") { }
        key(Key11; Department)
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups { }

    trigger OnDelete()
    begin
        //ERROR('HAHA');
        PRPayrollPeriods.Reset();
        if PRPayrollPeriods.Get("Payroll Period") then
            if PRPayrollPeriods.Closed = true then
                Error(Text001, 'DELETE', "Payroll Period");
    end;

    trigger OnInsert()
    begin
        PRPayrollPeriods.Reset();
        if PRPayrollPeriods.Get("Payroll Period") then
            if PRPayrollPeriods.Closed = true then
                Error(Text001, 'INSERT', "Payroll Period");
    end;

    trigger OnModify()
    begin
        PRPayrollPeriods.Reset();
        if PRPayrollPeriods.Get("Payroll Period") then
            if PRPayrollPeriods.Closed = true then
                Error(Text001, 'MODIFY', "Payroll Period");
    end;

    trigger OnRename()
    begin
        PRPayrollPeriods.Reset();
        if PRPayrollPeriods.Get("Payroll Period") then
            if PRPayrollPeriods.Closed = true then
                Error(Text001, 'RENAME', "Payroll Period");
    end;

    var
        Text001: Label 'You cannot [ %1  ] records in this Payroll Period [ %2  ] because it is CLOSED';
        PRPayrollPeriods: Record "PR Payroll Periods";
        HrEmp: Record "HR Employees";
}
