#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193561 "SRBS_Pension Contribution"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/SRBS_Pension Contribution.rdlc';
    ApplicationArea = All;
    Caption = 'SRBS_Pension Contribution';
    dataset
    {
        dataitem("PR Employee Transactions"; "PR Employee Transactions")
        {
            DataItemTableView = where("Transaction Code" = filter('D162'));
            RequestFilterFields = "Payroll Period", "Employee Code";
            column(ReportForNavId_4; 4) { }
            column(EmployeeCode_PREmployeeTransactions; "PR Employee Transactions"."Employee Code") { }
            column(TransactionCode_PREmployeeTransactions; "PR Employee Transactions"."Transaction Code") { }
            column(TransactionName_PREmployeeTransactions; "PR Employee Transactions"."Transaction Name") { }
            column(Amount_PREmployeeTransactions; "PR Employee Transactions".Amount) { }
            column(PeriodMonth_PREmployeeTransactions; "PR Employee Transactions"."Period Month") { }
            column(PeriodYear_PREmployeeTransactions; "PR Employee Transactions"."Period Year") { }
            column(PayrollPeriod_PREmployeeTransactions; "PR Employee Transactions"."Payroll Period") { }
            column(EmployerAmount_PREmployeeTransactions; "PR Employee Transactions"."Employer Amount") { }
            column(Name; CompanyInfo.Name) { }
            column(Picture; CompanyInfo.Picture) { }
            dataitem("HR Employees"; "HR Employees")
            {
                DataItemLink = "No." = field("Employee Code");
                column(ReportForNavId_10; 10) { }
                column(FullName_HREmployees; "HR Employees"."Full Name") { }
                column(IDNumber_HREmployees; "HR Employees"."ID Number") { }
                column(BasicPay_HREmployees; "HR Employees"."Basic Pay") { }
                column(DepartmentCode_HREmployees; "HR Employees"."Responsibility Center") { }
                column(GlobalDimension2Code_HREmployees; "HR Employees"."Global Dimension 2 Code") { }
                column(Gender_HREmployees; "HR Employees".Gender) { }
                dataitem("PR Employer Deductions"; "PR Employer Deductions")
                {
                    DataItemLink = "Employee Code" = field("No.");
                    column(ReportForNavId_19; 19) { }
                    column(Amount_PREmployerDeductions; "PR Employer Deductions".Amount) { }
                }
            }
        }
    }

    requestpage
    {
        SaveValues = true;

        layout { }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin

        CompanyInfo.Get();
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        HREmp: Record "HR Employees";
        CompanyInfo: Record "Company Information";
        objEmp: Record "HR Employees";
        objEmplyer: Record "PR Employer Deductions";
        EmployerAmount: Decimal;
}
