#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193471 "PR Payroll Summary - Listing"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR Payroll Summary - Listing.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'PR Payroll Summary - Listing';
    dataset
    {
        dataitem("PR Period Transactions"; "PR Period Transactions")
        {
            RequestFilterFields = "Transaction Code", "Payroll Period", "Employee Code", "Department Code";
            column(ReportForNavId_1000000000; 1000000000) { }
            column(EmployeeCode_PRPeriodTransactions; "PR Period Transactions"."Employee Code") { }
            column(TransactionCode_PRPeriodTransactions; "PR Period Transactions"."Transaction Code") { }
            column(TransactionName_PRPeriodTransactions; "PR Period Transactions"."Transaction Name") { }
            column(Amount_PRPeriodTransactions; "PR Period Transactions".Amount) { }
            column(SchemeCode_PRPeriodTransactions; "PR Period Transactions"."Global Dimension 1 Code") { }
            column(strEmpName; strEmpName) { }
            column(CompInfoName; CompInfo.Name) { }
            column(CompInfoAddress; CompInfo.Address) { }
            column(CompInfoCity; CompInfo.City) { }
            column(CompInfoPicture; CompInfo.Picture) { }
            column(CompInfoEMail; CompInfo."E-Mail") { }
            column(CompInfoHomePage; CompInfo."Home Page") { }
            column(PeriodName; PeriodName) { }
            column(COMPANYNAME; CompanyName) { }

            trigger OnAfterGetRecord()
            begin
                //CALCFIELDS(Gender);

                HREmp.Reset();
                if HREmp.Get("PR Period Transactions"."Employee Code") then
                    strEmpName := HREmp."Full Name";
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
        fnCompanyInfo();

        PeriodFilter := "PR Period Transactions".GetFilter("Payroll Period");
        if PeriodFilter = '' then
            Error('Please Specify "Payroll Period" on the Request Page');
        SelectedPeriod := "PR Period Transactions".GetRangeMin("Payroll Period");

        PRPayrollPeriods.Reset();
        if PRPayrollPeriods.Get(SelectedPeriod) then
            PeriodName := PRPayrollPeriods."Period Name";
    end;

    var
        strEmpName: Text;
        HREmp: Record "HR Employees";
        CompInfo: Record "Company Information";
        PeriodName: Text[30];
        PeriodFilter: Text[30];
        PRPayrollPeriods: Record "PR Payroll Periods";
        SelectedPeriod: Date;


    procedure fnCompanyInfo()
    begin
        CompInfo.Reset();
        if CompInfo.Get() then
            CompInfo.CalcFields(CompInfo.Picture);
    end;
}
