#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193555 "prEmployee Salary Ledger"
{
    Caption = 'prEmployee Salary Ledger';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee Code"; Code[30])
        {
            TableRelation = "PR Salary Arrears22"."Payroll Period";
            Caption = 'Employee Code';
        }
        field(2; "Transaction Code"; Code[30])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code";
            Caption = 'Transaction Code';
            trigger OnValidate()
            begin
                objPeriod.Reset();
                objPeriod.SetRange(objPeriod.Closed, false);
                if objPeriod.Find('-') then
                    CurrentYr := objPeriod."Period Year";


                if Transcode.Get("Transaction Code") then
                    if Transcode."Transaction Code" = 'LEAVE' then begin
                        EmployeeTrans.Reset();
                        EmployeeTrans.SetRange(EmployeeTrans."Employee Code", "Employee Code");
                        EmployeeTrans.SetRange(EmployeeTrans."Transaction Code", "Transaction Code");
                        if EmployeeTrans.Find('-') then
                            repeat
                                if EmployeeTrans."Period Year" = CurrentYr then begin
                                    MonthName := Format(EmployeeTrans."Payroll Period", 0, '<Month Text>');
                                    //ERROR(MonthName);
                                    Error('Employee has already been paid leave allowance in the period of %1.- %2', EmployeeTrans."Payroll Period",
                                           EmployeeTrans."Employee Code");
                                end;
                            until EmployeeTrans.Next() = 0;
                    end;
            end;
        }
        field(3; "Transaction Name 2"; Text[100])
        {
            Caption = 'Transaction Name 2';
        }
        field(4; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(5; Balance; Decimal)
        {
            Caption = 'Balance';
            trigger OnValidate()
            begin
                "#of Repayments" := 0;
                //IF (Balance > 0) AND ("#of Repayments" > 0) THEN
                //Amount:=Balance/"#of Repayments"
            end;
        }
        field(6; "Original Amount"; Decimal)
        {
            Caption = 'Original Amount';
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
            trigger OnValidate()
            begin
                if (Balance > 0) and ("#of Repayments" > 0) then
                    Amount := Balance / "#of Repayments"
            end;
        }
        field(11; Grant; Code[30])
        {
            TableRelation = "HR Employee Qualifications"."Employee No.";
            Caption = 'Grant';
        }
        field(12; "Reference No"; Text[100])
        {
            Caption = 'Reference No';
        }
        field(13; integera; Integer)
        {
            Caption = 'integera';
        }
        field(14; "Employer Amount"; Decimal)
        {
            Caption = 'Employer Amount';
        }
        field(15; "Employer Balance"; Decimal)
        {
            Caption = 'Employer Balance';
        }
        field(16; "Stop for Next Period"; Boolean)
        {
            Caption = 'Stop for Next Period';
        }
        field(17; "Amortized Loan Total Repay Amt"; Decimal)
        {
            Caption = 'Amortized Loan Total Repay Amt';
        }
        field(18; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(19; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(20; "Loan Number"; Code[10])
        {
            Caption = 'Loan Number';
        }
        field(21; "Payroll Code"; Code[20])
        {
            TableRelation = "prPayroll Type";
            Caption = 'Payroll Code';
        }
        field(22; "No of Units"; Decimal)
        {
            Caption = 'No of Units';
        }
        field(23; Suspended; Boolean)
        {
            Caption = 'Suspended';
        }
        field(24; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
        field(38; "IsCoop/LnRep"; Boolean)
        {
            CalcFormula = lookup("PR Transaction Codes"."IsCoop/LnRep" where("Transaction Code" = field("Transaction Code")));
            Description = 'to be able to report the different coop contributions -Dennis';
            FieldClass = FlowField;
            Caption = 'IsCoop/LnRep';
            Editable = false;
        }
        field(39; EmployeePostingG; Code[20])
        {
            CalcFormula = lookup("PR Salary Arrears22"."Transaction Code" where("Payroll Period" = field("Payroll Period"),
                                                                                 "Employeee Code" = field("Employee Code")));
            FieldClass = FlowField;
            Caption = 'EmployeePostingG';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Employee Code", "Transaction Code", "Period Month", "Period Year", "Payroll Period", "Reference No")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
        key(Key2; "Employee Code", "Transaction Code", "Period Month", "Period Year", Suspended) { }
    }

    fieldgroups { }

    var
        Transcode: Record "PR Transaction Codes";
        EmployeeTrans: Record "PR Employee Transactions";
        MonthName: Text[100];
        SalCard: Record "PR Salary Card";
        SalaryNotches: Record "prSalary Review Lines";
        CurrentYr: Integer;
        objPeriod: Record "PR Payroll Periods";
}
