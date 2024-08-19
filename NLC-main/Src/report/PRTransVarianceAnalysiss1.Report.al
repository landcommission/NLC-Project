#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50041 "PR Trans  Variance Analysiss1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR Trans  Variance Analysiss1.rdlc';
    Caption = 'PR Transactions Variance Analysis';
    ApplicationArea = All;

    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            column(ReportForNavId_27; 27) { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(FullName_HREmployees; "HR Employees"."Full Name") { }
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
            column(TransactionCode; TransactionCode) { }
            column(TransactionName; TransactionName) { }

            trigger OnAfterGetRecord()
            begin
                //Initialize
                Period_1_TransAmount := 0;
                Period_2_TransAmount := 0;
                Var_TransAmount := 0;

                //Period 1
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "HR Employees"."No.");
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", Period1_Filter);
                //PRPeriodTrans.SETRANGE(PRPeriodTrans."Transaction Type",TransactionTypes);
                if PRPeriodTrans.Find('-') then begin
                    //PRPeriodTrans.CALCSUMS(PRPeriodTrans.Amount);
                    Period_1_TransAmount := PRPeriodTrans.Amount;
                    TransactionCode := PRPeriodTrans."Transaction Code";
                    TransactionName := PRPeriodTrans."Transaction Name"

                end;

                //Period 2
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "HR Employees"."No.");
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", Period2_Filter);
                //PRPeriodTrans.SETRANGE(PRPeriodTrans."Transaction Type",TransactionTypes);
                if PRPeriodTrans.Find('-') then begin
                    //PRPeriodTrans.CALCSUMS(PRPeriodTrans.Amount);
                    Period_2_TransAmount := PRPeriodTrans.Amount;
                    TransactionCode := PRPeriodTrans."Transaction Code";
                    TransactionName := PRPeriodTrans."Transaction Name"
                end;

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
        SaveValues = true;

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
                field(TransactionTypes; TransactionTypes)
                {
                    ApplicationArea = Basic;
                    Caption = 'TransactionTypes';
                    ToolTip = 'Specifies the value of the TransactionTypes field.';
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
                         ',' + "HR Employees".GetFilters;
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
        TransactionTypes: Option Income,Deduction;
        TransactionCode: Code[100];
        TransactionName: Text[100];


    procedure fnCompanyInfo()
    begin
        CompInfo.Reset();
        if CompInfo.Get() then
            CompInfo.CalcFields(CompInfo.Picture);
    end;
}
