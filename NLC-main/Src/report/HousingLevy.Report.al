#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193743 "Housing Levy"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Housing Levy.rdlc';
    Caption = 'Housing Levy';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("PR Period Transactions"; "PR Period Transactions")
        {
            DataItemTableView = where("Transaction Code" = const('HOUSING LEVY'));
            RequestFilterFields = "Payroll Period";
            column(ReportForNavId_1; 1) { }
            column(EmployeeCode_PRPeriodTransactions; "PR Period Transactions"."Employee Code") { }
            column(Amount_PRPeriodTransactions; "PR Period Transactions".Amount) { }
            column(Name; CI.Name) { }
            column(Picture; CI.Picture) { }
            column(EmpAmount; EmpAmount) { }
            column(Total; Total) { }
            column(pension; pension) { }
            column(bPAY; bPAY) { }
            column(GPAYAmt; GPAYAmt) { }
            column(HseLevy; HseLevy) { }
            column(PayrollPeriod_PRPeriodTransactions; "PR Period Transactions"."Payroll Period") { }
            column(PeriodMonth_PRPeriodTransactions; "PR Period Transactions"."Period Month") { }
            column(PeriodYear_PRPeriodTransactions; "PR Period Transactions"."Period Year") { }
            dataitem("HR Employees"; "HR Employees")
            {
                DataItemLink = "No." = field("Employee Code");
                RequestFilterFields = "No.";
                column(ReportForNavId_19; 19) { }
                column(No_HREmployees; "HR Employees"."No.") { }
                column(FullName_HREmployees; "HR Employees"."Full Name") { }
                column(ResponsibilityCenter_HREmployees; "HR Employees"."Responsibility Center") { }
                column(DepartmentName_HREmployees; "HR Employees"."Department Name") { }
                column(IDNumber_HREmployees; "HR Employees"."ID Number") { }
                column(PINNo_HREmployees; "HR Employees"."PIN No.") { }
                column(DateOfBirth_HREmployees; "HR Employees"."Date Of Birth") { }
                column(ContractType_HREmployees; "HR Employees"."Contract Type") { }
                column(Status_HREmployees; "HR Employees".Status) { }
                dataitem("PR Salary Card"; "PR Salary Card")
                {
                    DataItemLink = "Employee Code" = field("No.");
                    column(ReportForNavId_4; 4) { }
                    column(BasicPay_PRSalaryCard; "PR Salary Card"."Basic Pay") { }
                }
            }

            trigger OnAfterGetRecord()
            begin
                /*
                EmpAmount:=("PR Period Transactions".Amount)*2;
                Total :=("PR Period Transactions".Amount)*3;
                */


                PerTrans.Reset();
                PerTrans.SetRange(PerTrans."Payroll Period", "PR Period Transactions"."Payroll Period");
                //PerTrans.setrange(PerTrans.)
                PerTrans.SetRange(PerTrans."Employee Code", "PR Period Transactions"."Employee Code");
                PerTrans.SetRange(PerTrans."Transaction Code", 'HOUSING LEVY');
                if PerTrans.Find('-') then
                    HseLevy := 0;

                repeat
                    HseLevy := PerTrans.Amount;
                // ERROR(FORMAT(bPAY))
                until PerTrans.Next() = 0;


                PerTrans.Reset();
                PerTrans.SetRange(PerTrans."Payroll Period", "PR Period Transactions"."Payroll Period");
                //PerTrans.setrange(PerTrans.)
                PerTrans.SetRange(PerTrans."Employee Code", "PR Period Transactions"."Employee Code");
                PerTrans.SetRange(PerTrans."Transaction Code", 'BPAY');
                if PerTrans.Find('-') then
                    bPAY := 0;

                repeat
                    bPAY := PerTrans.Amount;
                // ERROR(FORMAT(bPAY))
                until PerTrans.Next() = 0;


                PerTrans.Reset();
                PerTrans.SetRange(PerTrans."Payroll Period", "PR Period Transactions"."Payroll Period");
                //PerTrans.setrange(PerTrans.)
                PerTrans.SetRange(PerTrans."Employee Code", "PR Period Transactions"."Employee Code");
                PerTrans.SetRange(PerTrans."Transaction Code", 'GPAY');
                if PerTrans.Find('-') then
                    bPAY := 0;

                repeat
                    GPAYAmt := PerTrans.Amount;
                // ERROR(FORMAT(bPAY))
                until PerTrans.Next() = 0;




                PerTrans.Reset();
                PerTrans.SetRange(PerTrans."Payroll Period", "PR Period Transactions"."Payroll Period");
                PerTrans.SetRange(PerTrans."Employee Code", "PR Period Transactions"."Employee Code");
                PerTrans.SetRange(PerTrans."Transaction Code", 'D162');
                if PerTrans.Find('-') then
                    repeat
                        pension := PerTrans.Amount;
                    // ERROR(FORMAT(bPAY))
                    until PerTrans.Next() = 0;

                if HseLevy = 0 then
                    CurrReport.Skip();

            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        CI.Get();
        CI.CalcFields(Picture);
    end;

    var
        PREmployerDeductions: Record "PR Employer Deductions";
        HREmployees: Record "HR Employees";
        PREmployeeTransactions: Record "PR Employee Transactions";
        CI: Record "Company Information";
        EmpAmount: Decimal;
        Total: Decimal;
        PerTrans: Record "PR Period Transactions";
        bPAY: Decimal;
        pension: Decimal;
        GPAYAmt: Decimal;
        HseLevy: Decimal;
}
