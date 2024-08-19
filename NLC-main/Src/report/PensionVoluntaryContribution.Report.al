#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193737 "Pension Voluntary Contribution"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Pension Voluntary Contribution.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Pension Voluntary Contribution';
    dataset
    {
        dataitem("PR Period Transactions"; "PR Period Transactions")
        {
            DataItemTableView = where("Transaction Code" = filter('D404'));
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
            column(PayrollPeriod_PRPeriodTransactions; "PR Period Transactions"."Payroll Period") { }
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
                /* EmpAmount:=("PR Period Transactions".Amount)*2;
                 Total :=("PR Period Transactions".Amount)*3;
                */





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
                PerTrans.SetRange(PerTrans."Employee Code", "PR Period Transactions"."Employee Code");
                PerTrans.SetRange(PerTrans."Transaction Code", 'D404');
                if PerTrans.Find('-') then
                    repeat
                        pension := PerTrans.Amount;
                    // ERROR(FORMAT(bPAY))
                    until PerTrans.Next() = 0;

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
}
