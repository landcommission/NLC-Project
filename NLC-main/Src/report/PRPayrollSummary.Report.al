#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193530 "PR Payroll Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR Payroll Summary.rdlc';
    ApplicationArea = All;
    Caption = 'PR Payroll Summary';
    dataset
    {
        dataitem("PR Transaction Codes"; "PR Transaction Codes")
        {
            DataItemTableView = sorting("Transaction Code") order(descending);
            RequestFilterFields = "Transaction Type", "Transaction Code";
            column(ReportForNavId_1; 1) { }
            column(TransactionCode_PRTransactionCodes; "PR Transaction Codes"."Transaction Code") { }
            column(TransactionName_PRTransactionCodes; "PR Transaction Codes"."Transaction Name") { }
            column(TransactionType_PRTransactionCodes; "PR Transaction Codes"."Transaction Type") { }
            column(Amount; Amount) { }
            column(PeriodFilter; PeriodFilter) { }
            column(CompInfoName; CompInfo.Name) { }
            column(CompInfoAddress; CompInfo.Address) { }
            column(CompInfoCity; CompInfo.City) { }
            column(CompInfoPicture; CompInfo.Picture) { }
            column(CompInfoEMail; CompInfo."E-Mail") { }
            column(CompInfoHomePage; CompInfo."Home Page") { }
            column(PeriodName; PeriodName) { }
            column(COMPANYNAME; CompanyName) { }
            column(PeriodMOnth; PeriodMonth_Name) { }
            column(PrintDate; PrintDate) { }
            column(PeriodYear; PeriodYear) { }

            trigger OnAfterGetRecord()
            begin

                Amount := 0;

                PRPeriodTrans.Reset();
                PRPeriodTrans.SetCurrentKey("Employee Code", "Transaction Code", "Period Month", "Period Year", Membership, "Reference No");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", "PR Transaction Codes"."Transaction Code");
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                if PRPeriodTrans.Find('-') then begin

                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    Amount := PRPeriodTrans.Amount;
                end;

                if Amount = 0 then
                    CurrReport.Skip();
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(Content)
            {
                field(PeriodFilter; PeriodFilter)
                {
                    ApplicationArea = Basic;
                    Caption = 'Period Filter';
                    TableRelation = "PR Payroll Periods";
                    ToolTip = 'Specifies the value of the Period Filter field.';
                }
            }
        }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        PeriodMonth := 0;
        PrintDate := '';
        PeriodYear := '';


        if PeriodFilter = 0D then
            Error('Please specify period filter');
        PRPayrollPeriods.Reset();
        PRPayrollPeriods.Get(PeriodFilter);


        PeriodMonth := PRPayrollPeriods."Period Month";
        if PeriodMonth = 1 then
            PeriodMonth_Name := 'January';
        if PeriodMonth = 2 then
            PeriodMonth_Name := 'February';
        if PeriodMonth = 3 then
            PeriodMonth_Name := 'March';
        if PeriodMonth = 4 then
            PeriodMonth_Name := 'April';
        if PeriodMonth = 5 then
            PeriodMonth_Name := 'May';
        if PeriodMonth = 6 then
            PeriodMonth_Name := 'June';
        if PeriodMonth = 7 then
            PeriodMonth_Name := 'July';
        if PeriodMonth = 8 then
            PeriodMonth_Name := 'August';
        if PeriodMonth = 9 then
            PeriodMonth_Name := 'September';
        if PeriodMonth = 10 then
            PeriodMonth_Name := 'October';
        if PeriodMonth = 11 then
            PeriodMonth_Name := 'November';
        if PeriodMonth = 12 then
            PeriodMonth_Name := 'December';

        PrintDate := Format(Today);
        PeriodYear := Format(PRPayrollPeriods."Period Year");
        PeriodName := PRPayrollPeriods."Period Name";
        fnCompanyInfo();
    end;

    var
        PRPeriodTrans: Record "PR Period Transactions";
        PeriodFilter: Date;
        Amount: Decimal;
        CompInfo: Record "Company Information";
        PeriodName: Text[30];
        PeriodYear: Text;
        PeriodMonth: Integer;
        PeriodMonth_Name: Text;
        PrintDate: Text;
        PRPayrollPeriods: Record "PR Payroll Periods";


    procedure fnCompanyInfo()
    begin
        CompInfo.Reset();
        if CompInfo.Get() then
            CompInfo.CalcFields(CompInfo.Picture);
    end;
}
