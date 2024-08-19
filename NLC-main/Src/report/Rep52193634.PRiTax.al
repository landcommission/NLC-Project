#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193634 "PR iTax"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR iTax.rdlc';
    ApplicationArea = All;
    Caption = 'PR iTax';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_1; 1) { }
            column(No_HREmployees; "HR Employees"."No.") { }
            column(PINNo_HREmployees; "HR Employees"."PIN No.") { }
            column(CompInfoName; CompInfo.Name) { }
            column(CompInfoAddress; CompInfo.Address) { }
            column(CompInfoCity; CompInfo.City) { }
            column(CompInfoPicture; CompInfo.Picture) { }
            column(CompInfoEMail; CompInfo."E-Mail") { }
            column(CompInfoHomePage; CompInfo."Home Page") { }
            column(EmpFullName; EmpFullName) { }
            column(BasicSalary; BasicSalary) { }
            column(HouseAllowance; HouseAllowance) { }
            column(TransportAllowance; TransportAllowance) { }
            column(LeaveAllowance; LeaveAllowance) { }
            column(OvertimeAllowance; OvertimeAllowance) { }
            column(OtherAllowance; OtherAllowance) { }
            column(TotalCashPay; TotalCashPay) { }
            column(GrossPay; GrossPay) { }
            column(TaxablePay; TaxablePay) { }
            column(TaxCharged; TaxCharged) { }
            column(MonthlyRelief; MonthlyRelief) { }
            column(InsuranceRelief; InsuranceRelief) { }
            column(PAYE; PAYE) { }

            trigger OnAfterGetRecord()
            begin
                //Initialize
                EmpFullName := '';
                BasicSalary := 0;
                HouseAllowance := 0;
                TransportAllowance := 0;
                LeaveAllowance := 0;
                OvertimeAllowance := 0;
                OtherAllowance := 0;
                GrossPay := 0;
                TaxablePay := 0;
                TaxCharged := 0;
                MonthlyRelief := 0;
                InsuranceRelief := 0;


                //Full Name
                HREmp.Reset();
                HREmp.SetRange(HREmp."No.", "HR Employees"."No.");
                if HREmp.Find('-') then
                    EmpFullName := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";

                //Basic Salary
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "HR Employees"."No.");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'BPAY');
                if PRPeriodTrans.Find('-') then
                    BasicSalary := PRPeriodTrans.Amount;

                //House Allowance
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "HR Employees"."No.");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'E01');
                if PRPeriodTrans.Find('-') then
                    HouseAllowance := PRPeriodTrans.Amount;

                //Transport Allowance
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "HR Employees"."No.");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'E02');
                if PRPeriodTrans.Find('-') then
                    TransportAllowance := PRPeriodTrans.Amount;

                //Leave Allowance
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "HR Employees"."No.");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'E14');
                if PRPeriodTrans.Find('-') then
                    LeaveAllowance := PRPeriodTrans.Amount;

                //Overtime Allowance
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "HR Employees"."No.");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'OverTime Allowance Code Here');
                if PRPeriodTrans.Find('-') then
                    OvertimeAllowance := PRPeriodTrans.Amount;

                //Other Allowances
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetCurrentKey("Employee Code", "Transaction Code"
                                            , "Period Month", "Period Year", Membership, "Reference No");
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "HR Employees"."No.");
                PRPeriodTrans.SetFilter(PRPeriodTrans."Transaction Code", '<>%1|<>%2|<>%3', 'E01', 'E11', 'E10');
                if PRPeriodTrans.Find('-') then begin
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    OtherAllowance := PRPeriodTrans.Amount;
                end;

                //Total Cash Pay
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "HR Employees"."No.");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'NPAY');
                if PRPeriodTrans.Find('-') then
                    TotalCashPay := PRPeriodTrans.Amount;

                //Gross Pay
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "HR Employees"."No.");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'GPAY');
                if PRPeriodTrans.Find('-') then
                    GrossPay := PRPeriodTrans.Amount;

                //Taxable Pay
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "HR Employees"."No.");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'TXBP');
                if PRPeriodTrans.Find('-') then
                    TaxablePay := PRPeriodTrans.Amount;

                //Tax Charged
                PRPeriodTrans.Reset();
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "HR Employees"."No.");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'TXCHRG');
                if PRPeriodTrans.Find('-') then
                    TaxCharged := PRPeriodTrans.Amount;

                //Monthly Relief
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "HR Employees"."No.");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'PSNR');
                if PRPeriodTrans.Find('-') then
                    MonthlyRelief := PRPeriodTrans.Amount;

                //Insurance Relief
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "HR Employees"."No.");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'ISNR');
                if PRPeriodTrans.Find('-') then
                    InsuranceRelief := PRPeriodTrans.Amount;
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
                }
            }
        }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        if PeriodFilter = 0D then
            Error('Please select payroll period');
        fnCompanyInfo();
    end;

    var
        CompInfo: Record "Company Information";
        PeriodName: Text[30];
        PeriodFilter: Date;
        HREmp: Record "HR Employees";
        EmpFullName: Text;
        PRPeriodTrans: Record "PR Period Transactions";
        BasicSalary: Decimal;
        HouseAllowance: Decimal;
        TransportAllowance: Decimal;
        LeaveAllowance: Decimal;
        OvertimeAllowance: Decimal;
        OtherAllowance: Decimal;
        TotalCashPay: Decimal;
        GrossPay: Decimal;
        TaxablePay: Decimal;
        TaxCharged: Decimal;
        MonthlyRelief: Decimal;
        InsuranceRelief: Decimal;
        PAYE: Decimal;


    procedure fnCompanyInfo()
    begin
        CompInfo.Reset();
        if CompInfo.Get() then
            CompInfo.CalcFields(CompInfo.Picture);
    end;
}
