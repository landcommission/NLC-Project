#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193541 prEmployeeEffort
{
    Caption = 'prEmployeeEffort';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee Code"; Code[30])
        {
            TableRelation = "PR Salary Arrears22"."Payroll Period";
            Caption = 'Employee Code';
        }
        field(2; "Job Transaction Code"; Code[30])
        {
            TableRelation = "HR Employee Qualifications"."Employee No.";
            Caption = 'Job Transaction Code';
        }
        field(3; "Transaction Name"; Text[100])
        {
            Caption = 'Transaction Name';
        }
        field(4; Amount; Decimal)
        {
            Caption = 'Amount';

        }
        field(6; "Percentage Pay"; Decimal)
        {
            Description = 'in percentage';
            MaxValue = 100;
            Caption = 'Percentage Pay';

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
        field(24; "Entry No"; Integer)
        {
            AutoIncrement = false;
            Caption = 'Entry No';
        }
        /* field(39;EmployeePostingG;Code[20])
        {
            CalcFormula = lookup("PR Salary Arrears22".Field165 where ("Payroll Period"=field("Employee Code")));
            FieldClass = FlowField;
        } */
        field(40; "Total Amount"; Decimal)
        {
            CalcFormula = sum(prEmployeeEffort.Amount where("Period Month" = field("Period Month"),
                                                             "Period Year" = field("Period Year")));
            FieldClass = FlowField;
            Caption = 'Total Amount';
            Editable = false;
        }
        field(41; Status; Option)
        {
            OptionCaption = 'New,Pending Approval,Approved';
            OptionMembers = New,"Pending Approval",Approved;
            Caption = 'Status';
        }
    }

    keys
    {
        key(Key1; "Employee Code", "Job Transaction Code", "Period Month", "Period Year", "Payroll Period", "Reference No")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
        key(Key2; "Employee Code", "Job Transaction Code", "Period Month", "Period Year", Suspended) { }
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
        objJobs: Record "HR Employee Qualifications";
        objEmp: Record "PR Salary Arrears22";
        objEffort: Record prEmployeeEffort;
        totAmount: Decimal;
}
