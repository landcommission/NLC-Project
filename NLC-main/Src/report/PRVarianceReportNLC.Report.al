#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50013 "PR Variance Report NLC"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR Variance Report NLC.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'PR Variance Report NLC';
    dataset
    {
        dataitem("PR Period Transactions"; "PR Period Transactions")
        {
            DataItemTableView = where("Transaction Code" = filter('BPAY'));
            RequestFilterFields = "Transaction Type", "Transaction Code", "Payroll Period";
            column(ReportForNavId_26; 26) { }
            column(TransactionCode_PRTransactionCodes; "PR Period Transactions"."Transaction Code") { }
            column(TransactionName_PRTransactionCodes; "PR Period Transactions"."Transaction Name") { }
            column(TransactionType_PRTransactionCodes; "PR Period Transactions"."Transaction Type") { }
            column(EmployeeCode_PRPeriodTransactions; "PR Period Transactions"."Employee Code") { }
            column(PayrollPeriod_PRPeriodTransactions; "PR Period Transactions"."Payroll Period") { }
            column(Amount; "PR Period Transactions".Amount) { }
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
            dataitem("HR Employees"; "HR Employees")
            {
                DataItemLink = "No." = field("Employee Code");
                column(ReportForNavId_27; 27) { }
                column(FullName_HREmployees; "HR Employees"."Full Name") { }
                column(JobTitle_HREmployees; "HR Employees"."Job Title") { }
                column(Grade_HREmployees; "HR Employees".Grade) { }
            }

            trigger OnAfterGetRecord()
            begin
                //Initialize
                "PR Period Transactions".Amount := 0;
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
                    // PRPeriodTrans.CALCSUMS(PRPeriodTrans.Amount);
                    "PR Period Transactions".Amount := PRPeriodTrans.Amount;
                    //    MESSAGE(FORMAT(Amount));

                end;

                //Variant Period
                fn_SR_Variant_PeriodTrans();
                if PRPeriodTrans.Find('-') then begin
                    Var_No_Assigned := PRPeriodTrans.Count;
                    //PRPeriodTrans.CALCSUMS(PRPeriodTrans.Amount);
                    Variant_PeriodAmount := PRPeriodTrans.Amount;
                end;

                //Variance
                Variance_Amount := "PR Period Transactions".Amount - Variant_PeriodAmount;
                Variance_Amount := Round(Variance_Amount, 0.1, '=');

                VarC_No_Assigned := Cur_No_Assigned - Var_No_Assigned;

                //Output Bool
                if "PR Period Transactions".Amount = 0 then
                    CurPeriod_Zero := true;
                if Variant_PeriodAmount = 0 then
                    VarPeriod_Zero := true;
                Variant_PeriodAmount := Round(Variant_PeriodAmount, 0.1, '=');

                if VarPeriod_Zero and CurPeriod_Zero then
                    CurrReport.Skip();


                //Variance Percentage
                if Variant_PeriodAmount <> 0 then
                    Variance_AmountPercentage := (Variance_Amount / Variant_PeriodAmount) * 100;
                Variance_AmountPercentage := Round(Variance_AmountPercentage, 0.1, '=');


                //Counter
                if "PR Period Transactions"."Transaction Type" = "PR Period Transactions"."Transaction Type"::Income then
                    Num_I += 1;
                if "PR Period Transactions"."Transaction Type" = "PR Period Transactions"."Transaction Type"::Deduction then
                    Num_D += 1;
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
                        + "PR Period Transactions".GetFilters;

        //Company Info
        fnCompanyInfo();
    end;

    var
        HRPRAccess: Record "Salary Step/Notch Transactions";
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
        PostingGroup: Code[20];
        EmployeeCode: Code[10];


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


        PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", "PR Period Transactions"."Transaction Code");
        PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
        PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "PR Period Transactions"."Employee Code");
        if DirectorateCode <> '' then
            PRPeriodTrans.SetRange(PRPeriodTrans."Global Dimension 1 Code", DirectorateCode);
    end;

    local procedure fn_SR_Variant_PeriodTrans()
    begin

        PRPeriodTrans.Reset();
        PRPeriodTrans.SetCurrentKey("Employee Code", "Transaction Code", "Period Month"
                                    , "Period Year", Membership, "Reference No");
        PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", "PR Period Transactions"."Transaction Code");
        PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", Variant_PeriodFilter);
        PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "PR Period Transactions"."Employee Code");
        if DirectorateCode <> '' then
            PRPeriodTrans.SetRange(PRPeriodTrans."Global Dimension 1 Code", DirectorateCode);
    end;
}
