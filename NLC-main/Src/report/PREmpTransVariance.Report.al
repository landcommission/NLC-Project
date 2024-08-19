#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193664 "PR Emp Trans  Variance"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR Emp Trans  Variance.rdlc';
    Caption = 'PR Emp Trans  Variance';
    ApplicationArea = All;

    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            DataItemTableView = where(Status = const(Active));
            column(ReportForNavId_15; 15) { }
            column(EmployeeNo; "HR Employees"."No.") { }
            column(EmployeeName; EmployeeName) { }
            dataitem("PR Transaction Codes"; "PR Transaction Codes")
            {
                RequestFilterFields = "Transaction Type", "Transaction Code";
                column(ReportForNavId_27; 27) { }
                column(TransactionCode_PRTransactionCodes; "PR Transaction Codes"."Transaction Code") { }
                column(TransactionType; "PR Transaction Codes"."Transaction Type") { }
                column(SortOrder; "PR Transaction Codes"."itax Grouping") { }
                column(TransactionName_PRTransactionCodes; "PR Transaction Codes"."Transaction Name") { }
                column(Period1_Filter; Period1_Filter) { }
                column(Period2_Filter; Period2_Filter) { }
                column(Period_1_TransAmount; Period_1_TransAmount) { }
                column(Period_2_TransAmount; Period_2_TransAmount) { }
                column(Var_TransAmount; Var_TransAmount) { }
                column(TotalVariance; TotalVariance) { }
                column(AppliedFilters; AppliedFilters) { }
                column(CompInfoName; CompInfo.Name) { }
                column(CompInfoAddress; CompInfo.Address) { }
                column(CompInfoCity; CompInfo.City) { }
                column(CompInfoPicture; CompInfo.Picture) { }
                column(CompInfoEMail; CompInfo."E-Mail") { }
                column(CompInfoHomePage; CompInfo."Home Page") { }

                trigger OnAfterGetRecord()
                begin

                    Period_1_TransAmount := 0;
                    Period_2_TransAmount := 0;
                    Var_TransAmount := 0;

                    Message('HERE');

                    //Period 1
                    PRPeriodTrans.Reset();
                    PRPeriodTrans.SetRange("Transaction Code", "PR Transaction Codes"."Transaction Code");
                    PRPeriodTrans.SetRange("Payroll Period", Period1_Filter);
                    PRPeriodTrans.SetRange("Employee Code", "HR Employees"."No.");
                    if PRPeriodTrans.Find('-') then
                        Period_1_TransAmount := PRPeriodTrans.Amount;


                    //Period 2
                    PRPeriodTrans.Reset();
                    PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", "PR Transaction Codes"."Transaction Code");
                    PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", Period2_Filter);
                    PRPeriodTrans.SetRange("Employee Code", "HR Employees"."No.");
                    if PRPeriodTrans.Find('-') then
                        Period_2_TransAmount := PRPeriodTrans.Amount;

                    //Variance
                    Var_TransAmount := Period_2_TransAmount - Period_1_TransAmount;
                    TotalVariance += Var_TransAmount;
                    //Skip if no results
                    if Var_TransAmount = 0 then
                        CurrReport.Skip();
                end;
            }

            trigger OnAfterGetRecord()
            begin

                EmployeeName := "HR Employees"."First Name" + ' ' + "HR Employees"."Middle Name" + ' ' + "HR Employees"."Last Name";
                TotalVariance := 0;
                //Period 1
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetRange("Payroll Period", Period1_Filter);
                PRPeriodTrans.SetRange("Employee Code", "HR Employees"."No.");
                if PRPeriodTrans.Find('-') then begin
                    PRPeriodTrans.CalcSums(Amount);
                    Period_1_Var := PRPeriodTrans.Amount;
                end;
                //Period 2
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", Period2_Filter);
                PRPeriodTrans.SetRange("Employee Code", "HR Employees"."No.");
                if PRPeriodTrans.Find('-') then begin
                    PRPeriodTrans.CalcSums(Amount);
                    Period_2_Var := PRPeriodTrans.Amount;
                end;
                TotalVariance := Period_2_Var - Period_1_Var;
                if TotalVariance = 0 then
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
                         ',' + "PR Transaction Codes".GetFilters;
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
        EmployeeName: Text;
        TotalVariance: Decimal;
        Period_1_Var: Decimal;
        Period_2_Var: Decimal;
        Counter: Integer;


    procedure fnCompanyInfo()
    begin
        CompInfo.Reset();
        if CompInfo.Get() then
            CompInfo.CalcFields(CompInfo.Picture);
    end;
}
