#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193584 Analysis
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Analysis.rdlc';
    ApplicationArea = All;
    Caption = 'Analysis';
    dataset
    {
        dataitem("PR Period Transactions"; "PR Period Transactions")
        {
            column(ReportForNavId_1; 1) { }
            column(EmployeeCode_PRPeriodTransactions; "PR Period Transactions"."Employee Code") { }
            column(TransactionCode_PRPeriodTransactions; "PR Period Transactions"."Transaction Code") { }
            column(TransactionName_PRPeriodTransactions; "PR Period Transactions"."Transaction Name") { }
            column(Amount_PRPeriodTransactions; "PR Period Transactions".Amount) { }
            column(Period1_Filter; Period1_Filter) { }
            column(Period2_Filter; Period2_Filter) { }
            column(Period_1_TransAmount; Period_1_TransAmount) { }
            column(Period_2_TransAmount; Period_2_TransAmount) { }
            column(Var_TransAmount; Var_TransAmount) { }
            column(AppliedFilters; AppliedFilters) { }
            column(CompInfoName; CompInfo.Name) { }
            column(CompInfoAddress; CompInfo.Address) { }
            column(CompInfoCity; CompInfo.City) { }
            column(CompInfoPicture; CompInfo.Picture) { }
            column(CompInfoEMail; CompInfo."E-Mail") { }
            column(CompInfoHomePage; CompInfo."Home Page") { }

            trigger OnAfterGetRecord()
            begin


                //Initialize
                Period_1_TransAmount := 0;
                Period_2_TransAmount := 0;
                Var_TransAmount := 0;

                //Period 1
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", "PR Period Transactions"."Transaction Code");
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "PR Period Transactions"."Employee Code");

                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", Period1_Filter);
                if PRPeriodTrans.Find('-') then
                    // PRPeriodTrans.CALCSUMS(PRPeriodTrans.Amount);
                    Period_1_TransAmount := PRPeriodTrans.Amount;

                //Period 2
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", "PR Period Transactions"."Transaction Code");
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "PR Period Transactions"."Employee Code");

                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", Period2_Filter);
                if PRPeriodTrans.Find('-') then
                    // PRPeriodTrans.CALCSUMS(PRPeriodTrans.Amount);
                    Period_2_TransAmount := PRPeriodTrans.Amount;

                //Variance
                Var_TransAmount := Period_2_TransAmount - Period_1_TransAmount;

                //Skip if no results
                if Var_TransAmount = 0 then
                    CurrReport.Skip();
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(Content)
            {
                field("Payroll Period 1"; Period1_Filter)
                {
                    ApplicationArea = Basic;
                    TableRelation = "PR Payroll Periods"."Date Opened";
                    ToolTip = 'Specifies the value of the Period1_Filter field.';
                }
                field("Payroll Period 2"; Period2_Filter)
                {
                    ApplicationArea = Basic;
                    TableRelation = "PR Payroll Periods"."Date Opened";
                    ToolTip = 'Specifies the value of the Period2_Filter field.';
                }
            }
        }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin

        //Test Fields
        if Period1_Filter = 0D then
            Error('Please select Period 1 filter');
        if Period2_Filter = 0D then
            Error('Please select Period 2 filter');
        if Period1_Filter = Period2_Filter then
            Error('Period 1 Filter cannot be same as Period 2 Filter');

        //Company Info
        fnCompanyInfo();

        //Applied Filters
        AppliedFilters := 'Period 1 Filter: ' + Format(Period1_Filter) + ', Period 2 Filter: ' + Format(Period2_Filter) +
                         ',' + "PR Period Transactions".GetFilters;
    end;

    var
        Period_1_TransAmount: Decimal;
        Period_2_TransAmount: Decimal;
        Var_TransAmount: Decimal;
        PRPeriodTrans: Record "PR Period Transactions";
        Period1_Filter: Date;
        Period2_Filter: Date;
        AppliedFilters: Text;
        CompInfo: Record "Company Information";


    procedure fnCompanyInfo()
    begin
        CompInfo.Reset();
        if CompInfo.Get() then
            CompInfo.CalcFields(CompInfo.Picture);
    end;
}
