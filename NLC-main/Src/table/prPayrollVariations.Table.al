#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193565 "prPayroll Variations"
{
    Caption = 'prPayroll Variations';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee Code"; Code[30])
        {
            Caption = 'Employee Code';

        }
        field(2; "Transaction Code"; Code[30])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code";
            Caption = 'Transaction Code';
            trigger OnValidate()
            begin
                /*IF Transcode.GET("Transaction Code") THEN BEGIN
                IF Transcode."Leave Allowance" = TRUE THEN BEGIN
                EmployeeTrans.RESET;
                EmployeeTrans.SETRANGE(EmployeeTrans."Employee Code","Employee Code");
                EmployeeTrans.SETRANGE(EmployeeTrans."Transaction Code","Transaction Code");
                IF EmployeeTrans.FIND('-') THEN BEGIN
                REPEAT
                IF EmployeeTrans."Period Year" = "Period Year" THEN
                MonthName:=FORMAT(EmployeeTrans."Payroll Period",0,'<Month Text>');
                //ERROR(MonthName);
                ERROR('Employee has already been paid leave allowance in the period of %1. - %2',EmployeeTrans."Payroll Period",
                       "Employee Code");
                UNTIL EmployeeTrans.NEXT = 0;
                END;
                END;
                END;
                   */

                if Transcode.Get("Transaction Code") then
                    "Transaction Name" := Transcode."Transaction Name";
                Frequency := Transcode.Frequency;
                "Payroll Period" := SelectedPeriod;
                "Period Month" := PeriodMonth;
                "Period Year" := PeriodYear;
                "Transaction Type" := Transcode."Transaction Type";

            end;
        }
        field(3; "Transaction Name"; Text[100])
        {
            Caption = 'Transaction Name';
        }
        field(4; Amount; Decimal)
        {
            Caption = 'Amount';
            trigger OnValidate()
            begin
                if (Balance > 0) and (Amount > 0) then
                    "#of Repayments" := Balance / Amount;
            end;
        }
        field(5; Balance; Decimal)
        {
            Caption = 'Balance';
            trigger OnValidate()
            begin
                if (Balance > 0) and (Amount > 0) and ("#of Repayments" = 0) then
                    "#of Repayments" := Balance / Amount;

                if (Balance > 0) and ("#of Repayments" > 0) then
                    Amount := Balance / "#of Repayments";
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
        field(11; Membership; Code[10])
        {
            TableRelation = "prInstitutional Membership"."Institution No";
            Caption = 'Membership';
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
        field(24; "Employee Names"; Text[200])
        {
            Caption = 'Employee Names';
        }
        field(25; "Transaction Type"; Option)
        {
            Description = 'Income,Deduction';
            OptionMembers = Income,Deduction;
            Caption = 'Transaction Type';
        }
        field(26; Frequency; Option)
        {
            Description = 'Fixed,Varied';
            OptionMembers = "Fixed",Varied;
            Caption = 'Frequency';
        }
        field(27; Processed; Boolean)
        {
            Caption = 'Processed';
        }
    }

    keys
    {
        key(Key1; "Transaction Type", "Employee Code", "Transaction Code", "Reference No", "Period Month", "Period Year", "Payroll Period")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
    }

    fieldgroups { }

    var
        Transcode: Record "PR Transaction Codes";
        EmployeeTrans: Record "PR Employee Transactions";
        MonthName: Text[100];
        HREmployee: Record "PR Salary Arrears22";
        SalaryCard: Record "PR Salary Card";
        SalCard: Record "PR Salary Card";
        SalaryNotches: Record "prSalary Review Lines";
        SelectedPeriod: Date;
        objPeriod: Record "PR Payroll Periods";
        PeriodName: Text[30];
        PeriodTrans: Record "PR Period Transactions";
        PeriodMonth: Integer;
        PeriodYear: Integer;
}
