#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193562 SRBS
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/SRBS.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'SRBS';
    dataset
    {
        dataitem("PR Employee Transactions"; "PR Employee Transactions")
        {
            DataItemTableView = where("Transaction Code" = filter('D162'), Stopped = const(false));
            RequestFilterFields = "Payroll Period";
            column(ReportForNavId_1; 1) { }
            column(EmployeeCode_PREmployeeTransactions; "PR Employee Transactions"."Employee Code") { }
            column(TransactionCode_PREmployeeTransactions; "PR Employee Transactions"."Transaction Code") { }
            column(Amount_PREmployeeTransactions; "PR Employee Transactions".Amount) { }
            column(Name; CI.Name) { }
            column(Picture; CI.Picture) { }
            column(EmpAmount; EmpAmount) { }
            column(Total; Total) { }
            column(pension; pension) { }
            column(bPAY; bPAY) { }
            column(PayrollPeriod_PREmployeeTransactions; "PR Employee Transactions"."Payroll Period") { }
            dataitem("HR Employees"; "HR Employees")
            {
                DataItemLink = "No." = field("Employee Code");
                RequestFilterFields = "No.";
                column(ReportForNavId_5; 5) { }
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
                    column(ReportForNavId_3; 3) { }
                    column(BasicPay_PRSalaryCard; "PR Salary Card"."Basic Pay") { }
                }
            }

            trigger OnAfterGetRecord()
            begin
                EmpAmount := ("PR Employee Transactions".Amount) * 2;
                Total := ("PR Employee Transactions".Amount) * 3;





                PerTrans.Reset();
                PerTrans.SetRange(PerTrans."Payroll Period", "PR Employee Transactions"."Payroll Period");
                //PerTrans.setrange(PerTrans.)
                PerTrans.SetRange(PerTrans."Employee Code", HREmployees."No.");
                PerTrans.SetRange(PerTrans."Transaction Code", 'BPAY');
                if PerTrans.Find('-') then
                    bPAY := 0;


                repeat
                    bPAY := PerTrans.Amount;
                // ERROR(FORMAT(bPAY))
                until PerTrans.Next() = 0;




                PerTrans.Reset();
                PerTrans.SetRange(PerTrans."Payroll Period", "PR Employee Transactions"."Payroll Period");
                PerTrans.SetRange(PerTrans."Employee Code", "PR Employee Transactions"."Employee Code");
                PerTrans.SetRange(PerTrans."Transaction Code", 'D162');
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
