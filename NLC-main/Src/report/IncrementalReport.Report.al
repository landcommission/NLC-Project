#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50017 "Incremental Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Incremental Report.rdlc';
    ApplicationArea = All;
    Caption = 'Incremental Report';
    dataset
    {
        dataitem("PR Period Transactions"; "PR Period Transactions")
        {
            DataItemTableView = where("Transaction Code" = filter('BPAY'));
            column(ReportForNavId_1; 1) { }
            column(EmployeeCode_PRPeriodTransactions; "PR Period Transactions"."Employee Code") { }
            column(TransactionCode_PRPeriodTransactions; "PR Period Transactions"."Transaction Code") { }
            column(TransactionName_PRPeriodTransactions; "PR Period Transactions"."Transaction Name") { }
            column(Amount_PRPeriodTransactions; "PR Period Transactions".Amount) { }
            column(PayrollPeriod_PRPeriodTransactions; "PR Period Transactions"."Payroll Period") { }
            column(JobTitle_PRPeriodTransactions; "PR Period Transactions"."Job Title") { }
            column(SalaryGrade_PRPeriodTransactions; "PR Period Transactions"."Salary Grade") { }
            column(Amount; "PR Period Transactions".Amount) { }
            column(VarPeriodAmount; Variant_PeriodAmount) { }
            column(VarAmount; Variance_Amount) { }
            dataitem("HR Employees"; "HR Employees")
            {
                DataItemLink = "No." = field("Employee Code");
                column(ReportForNavId_9; 9) { }
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
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", "PR Period Transactions"."Transaction Code");
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "PR Period Transactions"."Employee Code");
                if PRPeriodTrans.Find('-') then
                    // Cur_No_Assigned:=PRPeriodTrans.COUNT;
                    // PRPeriodTrans.CALCSUMS(PRPeriodTrans.Amount);
                    "PR Period Transactions".Amount := PRPeriodTrans.Amount;
                // MESSAGE(FORMAT(Amount));
                //Variant Period
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetCurrentKey("Employee Code", "Transaction Code", "Period Month"
                                            , "Period Year", Membership, "Reference No");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", "PR Period Transactions"."Transaction Code");
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", Variant_PeriodFilter);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "PR Period Transactions"."Employee Code");
                if PRPeriodTrans.Find('-') then begin
                    Var_No_Assigned := PRPeriodTrans.Count;
                    //PRPeriodTrans.CALCSUMS(PRPeriodTrans.Amount);
                    Variant_PeriodAmount := PRPeriodTrans.Amount;
                    //MESSAGE(FORMAT(  Variant_PeriodAmount));
                end;
                //Variance
                Variance_Amount := "PR Period Transactions".Amount - Variant_PeriodAmount;
                Variance_Amount := Round(Variance_Amount, 0.1, '=');

                VarC_No_Assigned := Cur_No_Assigned - Var_No_Assigned;

                //Variance Percentage
                if Variant_PeriodAmount <> 0 then
                    Variance_AmountPercentage := (Variance_Amount / Variant_PeriodAmount) * 100;
                Variance_AmountPercentage := Round(Variance_AmountPercentage, 0.1, '=');
            end;

            trigger OnPreDataItem()
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
                //PRPeriodTrans.SETRANGE(PRPeriodTrans."Employee Code","PR Period Transactions"."Employee Code");
                if PRPayrollPeriods.Find('-') then
                    Cur_PNAME := PRPayrollPeriods."Period Name";

                //Use Period Name - Var Period
                PRPayrollPeriods.Reset();
                PRPayrollPeriods.SetRange(PRPayrollPeriods."Date Opened", Variant_PeriodFilter);
                //PRPeriodTrans.SETRANGE(PRPeriodTrans."Employee Code","PR Period Transactions"."Employee Code");
                if PRPayrollPeriods.Find('-') then
                    Var_PNAME := PRPayrollPeriods."Period Name";
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

    var
        CI: Record "Company Information";
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
}
