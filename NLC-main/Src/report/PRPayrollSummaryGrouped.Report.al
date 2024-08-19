#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193555 "PR Payroll Summary - Grouped"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR Payroll Summary - Grouped.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'PR Payroll Summary - Grouped';
    dataset
    {
        dataitem("PR Transaction Codes"; "PR Transaction Codes")
        {
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
            column(AppliedFilters; AppliedFilters) { }
            column(Variant_PeriodFilter; Variant_PeriodFilter) { }
            column(Variant_PeriodAmount; Variant_PeriodAmount) { }
            column(Variance_Amount; Variance_Amount) { }
            column(Cur_No_Assigned; Cur_No_Assigned) { }
            column(Var_No_Assigned; Var_No_Assigned) { }
            column(VarC_No_Assigned; VarC_No_Assigned) { }
            column(Cur_PNAME; Cur_PNAME) { }
            column(Var_PNAME; Var_PNAME) { }
            column(Num_I; Num_I) { }
            column(Num_D; Num_D) { }
            column(Variance_AmountPercentage; Variance_AmountPercentage) { }
            column(Picture; CompInfo.Picture) { }
            column(Name; CompInfo.Name) { }

            trigger OnAfterGetRecord()
            begin
                //Initialize
                Amount := 0;
                Variant_PeriodAmount := 0;
                Variance_Amount := 0;
                Variance_AmountPercentage := 0;

                CurPeriod_Zero := false;
                VarPeriod_Zero := false;

                Cur_No_Assigned := 0;
                Var_No_Assigned := 0;
                VarC_No_Assigned := 0;

                //Selected Period
                fn_SR_PeriodTrans();
                if PRPeriodTrans.Find('-') then begin
                    Cur_No_Assigned := PRPeriodTrans.Count;
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    Amount := PRPeriodTrans.Amount;
                end;

                //Variant Period
                fn_SR_Variant_PeriodTrans();
                if PRPeriodTrans.Find('-') then begin
                    Var_No_Assigned := PRPeriodTrans.Count;
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    Variant_PeriodAmount := PRPeriodTrans.Amount;
                end;

                //Variance
                Variance_Amount := Amount - Variant_PeriodAmount;
                VarC_No_Assigned := Cur_No_Assigned - Var_No_Assigned;

                //Output Bool
                if Amount = 0 then
                    CurPeriod_Zero := true;
                if Variant_PeriodAmount = 0 then
                    VarPeriod_Zero := true;
                if VarPeriod_Zero and CurPeriod_Zero then
                    CurrReport.Skip();


                //Variance Percentage
                if Variant_PeriodAmount <> 0 then
                    Variance_AmountPercentage := (Variance_Amount / Variant_PeriodAmount) * 100;

                //Counter
                if "PR Transaction Codes"."Transaction Type" = "PR Transaction Codes"."Transaction Type"::Income then
                    Num_I += 1;
                if "PR Transaction Codes"."Transaction Type" = "PR Transaction Codes"."Transaction Type"::Deduction then
                    Num_D += 1;
            end;

        }
    }

    requestpage
    {

        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(PeriodFilter; PeriodFilter)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Period Filter';
                        TableRelation = "PR Payroll Periods";
                        ToolTip = 'Specifies the value of the Period Filter field.';
                    }
                    field(DirectorateCode; DirectorateCode)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Department';
                        TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
                        ToolTip = 'Specifies the value of the Department field.';
                    }
                    field(Variant_PeriodFilter; Variant_PeriodFilter)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Variant Period Filter';
                        TableRelation = "PR Payroll Periods";
                        ToolTip = 'Specifies the value of the Variant Period Filter field.';
                    }
                }
            }
        }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        //HRCodeunit.fn_HRPRAccessList(USERID);

        //Dann

        //Init
        Cur_PNAME := '';
        Var_PNAME := '';

        Num_I := 0;
        Num_D := 0;

        //Default Payroll Period
        if PeriodFilter = 0D then begin
            PRPayrollPeriods.Reset();
            PRPayrollPeriods.SetRange(PRPayrollPeriods.Closed, false);
            if PRPayrollPeriods.Find('-') then
                PeriodFilter := PRPayrollPeriods."Date Opened";
        end;

        //Variant Period Filter
        if Variant_PeriodFilter = 0D then
            Variant_PeriodFilter := CalcDate('-1M', PeriodFilter); //Prev Period

        //Use Period Name - Curr P
        PRPayrollPeriods.Reset();
        PRPayrollPeriods.SetRange(PRPayrollPeriods."Date Opened", PeriodFilter);
        if PRPayrollPeriods.Find('-') then
            Cur_PNAME := PRPayrollPeriods."Period Name";

        //Use Period Name - Var Period
        PRPayrollPeriods.Reset();
        PRPayrollPeriods.SetRange(PRPayrollPeriods."Date Opened", Variant_PeriodFilter);
        if PRPayrollPeriods.Find('-') then
            Var_PNAME := PRPayrollPeriods."Period Name";

        //Save Filters
        if DirectorateCode <> '' then
            txt_DirectorateFilter := 'Directorate Code: ' + DirectorateCode;

        AppliedFilters := 'APPLIED FILTER(s) =' + 'Payroll Period: ' + Format(Cur_PNAME)
                        + txt_DirectorateFilter
                        + "PR Transaction Codes".GetFilters;

        //Company Info
        fnCompanyInfo();
    end;

    var
        PRPeriodTrans: Record "PR Period Transactions";
        PeriodFilter: Date;
        Amount: Decimal;
        CompInfo: Record "Company Information";
        PeriodName: Text[30];
        DirectorateCode: Code[10];
        PRPayrollPeriods: Record "PR Payroll Periods";
        AppliedFilters: Text;
        Variant_PeriodFilter: Date;
        Variant_PeriodAmount: Decimal;
        Variance_Amount: Decimal;
        Variance_AmountPercentage: Decimal;
        CurPeriod_Zero: Boolean;
        VarPeriod_Zero: Boolean;
        Cur_No_Assigned: Integer;
        Var_No_Assigned: Integer;
        VarC_No_Assigned: Integer;
        Num_I: Integer;
        Num_D: Integer;
        Cur_PNAME: Text;
        Var_PNAME: Text;
        txt_DirectorateFilter: Text;
        txt_VarPeriodFilter: Text;
        HRCodeunit: Codeunit "HR Dates";


    procedure fnCompanyInfo()
    begin
        CompInfo.Reset();
        if CompInfo.Get() then
            CompInfo.CalcFields(CompInfo.Picture);
    end;

    local procedure fn_SR_PeriodTrans()
    begin

        PRPeriodTrans.Reset();
        PRPeriodTrans.SetCurrentKey("Employee Code", "Transaction Code", "Period Month"
                                    , "Period Year", Membership, "Reference No");
        PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", "PR Transaction Codes"."Transaction Code");
        PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
        if DirectorateCode <> '' then
            PRPeriodTrans.SetRange(PRPeriodTrans."Global Dimension 1 Code", DirectorateCode);
    end;

    local procedure fn_SR_Variant_PeriodTrans()
    begin
        PRPeriodTrans.Reset();
        PRPeriodTrans.SetCurrentKey("Employee Code", "Transaction Code", "Period Month"
                                    , "Period Year", Membership, "Reference No");
        PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", "PR Transaction Codes"."Transaction Code");
        PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", Variant_PeriodFilter);
        if DirectorateCode <> '' then
            PRPeriodTrans.SetRange(PRPeriodTrans."Global Dimension 1 Code", DirectorateCode);
    end;
}
