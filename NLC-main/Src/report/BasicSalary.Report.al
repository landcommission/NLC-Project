#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50034 "Basic Salary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Basic Salary.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Basic Salary';
    dataset
    {
        dataitem("PR Period Transactions"; "PR Period Transactions")
        {
            DataItemTableView = where("Transaction Code" = const('BPAY'));
            column(ReportForNavId_1; 1) { }
            column(TransactionCode_PRPeriodTransactions; "PR Period Transactions"."Transaction Code") { }
            column(PayrollPeriod_PRPeriodTransactions; "PR Period Transactions"."Payroll Period") { }
            column(Amount_PRPeriodTransactions; "PR Period Transactions".Amount) { }
            dataitem("HR Employees"; "HR Employees")
            {
                DataItemLink = "No." = field("Employee Code");
                RequestFilterFields = "No.";
                column(ReportForNavId_4; 4) { }
                column(No_HREmployees; "HR Employees"."No.") { }
                column(FullName_HREmployees; "HR Employees"."Full Name") { }
                column(Gender_HREmployees; "HR Employees".Gender) { }
                column(Grade_HREmployees; "HR Employees".Grade) { }
                column(JobTitle_HREmployees; "HR Employees"."Job Title") { }
                column(ResponsibilityCenter_HREmployees; "HR Employees"."Responsibility Center") { }
                column(Name; CI.Name) { }
                column(Picture; CI.Picture) { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        CI: Record "Company Information";
}
