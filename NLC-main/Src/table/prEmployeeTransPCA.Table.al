#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193551 "prEmployee Trans PCA"
{
    Caption = 'prEmployee Trans PCA';
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
        field(3; "Transaction Name"; Text[100])
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
        field(6; "Period Month"; Integer)
        {
            Caption = 'Period Month';
        }
        field(7; "Period Year"; Integer)
        {
            Caption = 'Period Year';
        }
        field(8; "Payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'Payroll Period';
        }
        field(9; Comments; Text[250])
        {
            Caption = 'Comments';
        }
        field(10; "Change Advice Serial No."; Code[50])
        {
            TableRelation = "prBasic pay PCA"."Change Advice Serial No.";
            Caption = 'Change Advice Serial No.';
        }
        field(11; "Employer Amount"; Decimal)
        {
            Caption = 'Employer Amount';
        }
    }

    keys
    {
        key(Key1; "Change Advice Serial No.", "Employee Code", "Transaction Code", "Payroll Period")
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
        SalCard: Record "PR Salary Card";
        SalaryNotches: Record "prSalary Review Lines";
        CurrentYr: Integer;
        objPeriod: Record "PR Payroll Periods";
}
