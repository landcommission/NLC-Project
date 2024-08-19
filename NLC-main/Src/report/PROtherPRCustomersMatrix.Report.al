#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193470 "PR Other PR Customers (Matrix)"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR Other PR Customers (Matrix).rdlc';
    ApplicationArea = All;
    Caption = 'PR Other PR Customers (Matrix)';
    dataset
    {
        dataitem("PR Period Transactions"; "PR Period Transactions")
        {
            PrintOnlyIfDetail = false;
            RequestFilterFields = "Period Filter", "Transaction Code", "Payroll Period", "Transaction Type";
            column(ReportForNavId_1102755000; 1102755000) { }
            column(TransactionCode_PRPeriodTransactions; "PR Period Transactions"."Transaction Code") { }
            column(TransactionName_PRPeriodTransactions; "PR Period Transactions"."Transaction Name") { }
            column(Amount_PRPeriodTransactions; "PR Period Transactions".Amount) { }
            column(PayrollPeriod_PRPeriodTransactions; "PR Period Transactions"."Payroll Period") { }
            column(CompInfoName; CompInfo.Name) { }
            column(CompInfoAddress; CompInfo.Address) { }
            column(CompInfoCity; CompInfo.City) { }
            column(CompInfoPicture; CompInfo.Picture) { }
            column(CompInfoEMail; CompInfo."E-Mail") { }
            column(CompInfoHomePage; CompInfo."Home Page") { }
            column(PeriodName; PeriodName) { }
            column(COMPANYNAME; CompanyName) { }
            column(GlobalDimension1Code_PRPeriodTransactions; "PR Period Transactions"."Global Dimension 1 Code") { }
            column(GlobalDimension2Code_PRPeriodTransactions; "PR Period Transactions"."Global Dimension 2 Code") { }

            trigger OnPreDataItem()
            begin
                "PR Period Transactions".SetRange("PR Period Transactions"."Payroll Period", SelectedPeriod);
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

        PeriodFilter := "PR Period Transactions".GetFilter("Period Filter");
        if PeriodFilter = '' then
            Error('You must specify the period filter');

        SelectedPeriod := "PR Period Transactions".GetRangeMin("Period Filter");
        PRPayrollPeriods.Reset();
        if PRPayrollPeriods.Get(SelectedPeriod) then
            PeriodName := PRPayrollPeriods."Period Name";


        fnCompanyInfo();
    end;

    var
        CompInfo: Record "Company Information";
        PeriodFilter: Text[30];
        SelectedPeriod: Date;
        PRPayrollPeriods: Record "PR Payroll Periods";
        PeriodName: Text;


    procedure fnCompanyInfo()
    begin
        CompInfo.Reset();
        if CompInfo.Get() then
            CompInfo.CalcFields(CompInfo.Picture);
    end;
}
