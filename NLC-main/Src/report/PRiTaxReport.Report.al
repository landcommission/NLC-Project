#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193636 "PR iTax Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR iTax Report.rdlc';
    ApplicationArea = All;
    Caption = 'PR iTax Report';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            RequestFilterFields = "No.", "Posting Group";
            column(ReportForNavId_1; 1) { }
            column(EmployeeType_HREmployees; "HR Employees"."Employee Type") { }
            column(Citizenship_HREmployees; "HR Employees".Citizenship) { }
            column(FullName_HREmployees; "HR Employees"."Full Name") { }
            column(PINNo_HREmployees; "HR Employees"."PIN No.") { }
            column(BPAY; BPAY) { }
            column(HouseAllowance; HouseAllowance) { }
            column(TransportAllowance; TransportAllowance) { }
            column(LeaveAllowance; LeaveAllowance) { }
            column(DirectorsFee; DirectorsFee) { }
            column(OvertimeAllowance; OvertimeAllowance) { }
            column(Lumpsum; Lumpsum) { }
            column(OtherAllowances; OtherAllowances) { }
            column(TotalCashPay; TotalCashPay) { }
            column(ValueOfCar; ValueOfCar) { }
            column(OtherNonCash; OtherNonCash) { }
            column(TotalNonCash; TotalNonCash) { }
            column(GlobalIncome; GlobalIncome) { }
            column(TypeOfHousing; TypeOfHousing) { }
            column(RentOfHouse; RentOfHouse) { }
            column(ComputedRent; ComputedRent) { }
            column(RentRecovered; RentRecovered) { }
            column(NetValue; NetValue) { }
            column(TotalGross; TotalGross) { }
            column(ThirtyPCash; ThirtyPCash) { }
            column(ActualContr; ActualContr) { }
            column(PermissibleLimit; PermissibleLimit) { }
            column(MortgageIntrest; MortgageIntrest) { }
            column(HOSP; HOSP) { }
            column(AmountOfBenefit; AmountOfBenefit) { }
            column(TaxablePay; TaxablePay) { }
            column(TaxPayable; TaxPayable) { }
            column(MonthlyRelief; MonthlyRelief) { }
            column(InsuranceRelief; InsuranceRelief) { }
            column(PAYE; PAYE) { }

            trigger OnAfterGetRecord()
            begin
                //Init
                BPAY := 0;
                HouseAllowance := 0;
                TransportAllowance := 0;
                OvertimeAllowance := 0;
                DirectorsFee := 0;
                LeaveAllowance := 0;
                OvertimeAllowance := 0;
                Lumpsum := 0;
                OtherAllowances := 0;
                TotalCashPay := 0;
                ValueOfCar := 0;
                OtherNonCash := 0;
                TotalNonCash := 0;
                GlobalIncome := 0;
                TypeOfHousing := 0;
                ComputedRent := 0;
                RentRecovered := 0;
                NetValue := 0;
                TotalGross := 0;
                ThirtyPCash := 0;
                ActualContr := 0;
                PermissibleLimit := 0;
                MortgageIntrest := 0;
                AmountOfBenefit := 0;
                TaxablePay := 0;
                TaxPayable := 0;
                MonthlyRelief := 0;
                InsuranceRelief := 0;
                PAYE := 0;


                //Basic Pay
                fn_PeriodTrans();
                PRPeriodTrans.SetFilter(PRPeriodTrans."Transaction Code", '%1|%2', 'BPAY', 'E12');
                if PRPeriodTrans.Find('-') then begin
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    BPAY := PRPeriodTrans.Amount;
                end;

                //House Allowance & Arrears
                fn_PeriodTrans();
                PRPeriodTrans.SetFilter(PRPeriodTrans."Transaction Code", '%1|%2', 'E01', 'E07');
                if PRPeriodTrans.Find('-') then begin
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    HouseAllowance := PRPeriodTrans.Amount;
                end;

                //Transport Allowance & Arrears
                fn_PeriodTrans();
                PRPeriodTrans.SetFilter(PRPeriodTrans."Transaction Code", '%1|%2', 'E11', 'E11-ARR');
                if PRPeriodTrans.Find('-') then begin
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    TransportAllowance := PRPeriodTrans.Amount;
                end;

                //Leave Allowance & Arrears
                fn_PeriodTrans();
                PRPeriodTrans.SetFilter(PRPeriodTrans."Transaction Code", '%1|%2', 'E14', 'E14-ARR');
                if PRPeriodTrans.Find('-') then begin
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    LeaveAllowance := PRPeriodTrans.Amount;
                end;

                //Overtime Allowance
                fn_PeriodTrans();
                PRPeriodTrans.SetFilter(PRPeriodTrans."Transaction Code", '%1', 'E35-NA');
                if PRPeriodTrans.Find('-') then begin
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    OvertimeAllowance := PRPeriodTrans.Amount;
                end;

                //Directors Fee


                //Lumpsum
                fn_PeriodTrans();
                PRPeriodTrans.SetFilter(PRPeriodTrans."Transaction Code", '%1', 'E14');
                if PRPeriodTrans.Find('-') then begin
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    Lumpsum := PRPeriodTrans.Amount;
                end;

                //Other Allowances 1
                fn_PeriodTrans();
                PRPeriodTrans.SetFilter(PRPeriodTrans."Transaction Code", '%1|%2|%3|%4|%5|%6|%7|%8|%9'
                              , 'E03', 'E03-ARREARS', 'E04', 'E04ARR', 'E05', 'E18', 'E06', 'E22', 'E08');
                if PRPeriodTrans.Find('-') then begin
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    OtherAllowances := PRPeriodTrans.Amount;
                end;

                //Other Allowances 2
                fn_PeriodTrans();
                PRPeriodTrans.SetFilter(PRPeriodTrans."Transaction Code", '%1|%2|%3|%4|%5|%6|%7|%8'
                              , 'E09', 'E09 ARREARS', 'E11', 'E19', 'E23', 'E24', 'E25', 'E25ARREARS');
                if PRPeriodTrans.Find('-') then begin
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    OtherAllowances += PRPeriodTrans.Amount;
                end;

                //Other Allowances 3
                fn_PeriodTrans();
                PRPeriodTrans.SetFilter(PRPeriodTrans."Transaction Code", '%1|%2|%3|%4|%5|%6'
                              , 'E26', 'E27', 'E28', 'E15', 'E16', 'E20');
                if PRPeriodTrans.Find('-') then begin
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    OtherAllowances += PRPeriodTrans.Amount;
                end;

                ////Other Non Cash
                //PRTransCodes.RESET;
                //PRTransCodes.SETRANGE(PRTransCodes."Transaction Type",PRTransCodes."Transaction Type"::Benefit);
                //IF PRTransCodes.FIND('-') THEN
                //BEGIN
                //    REPEAT
                //        fn_PeriodTrans;
                //        PRPeriodTrans.SETRANGE(PRPeriodTrans."Transaction Code",PRTransCodes."Transaction Code");
                //        IF PRPeriodTrans.FIND('-') THEN
                //        BEGIN
                //            OtherNonCash += PRPeriodTrans.Amount;
                //        END;
                //     UNTIL PRTransCodes.NEXT =0;
                //END;

                ////Total Cash Pay
                //TotalCashPay:=BPAY + HouseAllowance + TransportAllowance + OvertimeAllowance
                //              + DirectorsFee + LeaveAllowance + Lumpsum + OtherAllowances + OtherNonCash;


                //Value of Car


                //Total Non Cash
                TotalNonCash := OtherNonCash + ValueOfCar;

                //Globa Income
                GlobalIncome := TotalNonCash + TotalCashPay;

                //Type of Housing

                //Rent of House

                //Computed Rent

                //Rent Recovered

                //Net Value

                //Total Gross
                TotalGross := GlobalIncome;

                //30% of Cash
                ThirtyPCash := 0.3 * GlobalIncome;

                //Actual Contribution - Include Voluntary Pension & Voluntary NSSF & NSSF
                PRTransCodes.Reset();
                PRTransCodes.SetFilter(PRTransCodes."Special Transactions", '%1', (PRTransCodes."Special Transactions"::"Defined Contribution"));
                if PRTransCodes.Find('-') then
                    repeat
                        fn_PeriodTrans();
                        PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", PRTransCodes."Transaction Code");
                        if PRPeriodTrans.Find('-') then
                            ActualContr += PRPeriodTrans.Amount;
                    until PRTransCodes.Next() = 0;
                //Add NSSF too
                fn_PeriodTrans();
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'NSSF');
                if PRPeriodTrans.Find('-') then
                    ActualContr += PRPeriodTrans.Amount;

                //Permissible Limit
                PermissibleLimit := 20000;

                //Mortgage Intrest
                fn_PeriodTrans();
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'MORG-RL');
                if PRPeriodTrans.Find('-') then begin
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    MortgageIntrest := PRPeriodTrans.Amount;
                end;

                //Amount of Benefit
                E1 := 0.3 * TotalCashPay;
                E2 := ActualContr;
                E3 := 20000;

                //Column G - Get least between e1,E2,e3
                if E1 > E2 then
                    AmountOfBenefit := E2
                else
                    AmountOfBenefit := E1;

                if E3 < AmountOfBenefit then
                    AmountOfBenefit := E3;
                AmountOfBenefit += MortgageIntrest;

                //Taxable Pay
                fn_PeriodTrans();
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'TXBP');
                if PRPeriodTrans.Find('-') then
                    TaxablePay := PRPeriodTrans.Amount;

                //Tax Payable
                fn_PeriodTrans();
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'TXCHRG');
                if PRPeriodTrans.Find('-') then
                    TaxPayable := PRPeriodTrans.Amount;

                //Monthly Relief
                fn_PeriodTrans();
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'PSNR');
                if PRPeriodTrans.Find('-') then
                    MonthlyRelief := PRPeriodTrans.Amount;

                //Insurance Relief
                fn_PeriodTrans();
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'INSR');
                if PRPeriodTrans.Find('-') then begin
                    PRPeriodTrans.CalcSums(PRPeriodTrans.Amount);
                    InsuranceRelief := PRPeriodTrans.Amount;
                end;

                //PAYE
                fn_PeriodTrans();
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'PAYE');
                if PRPeriodTrans.Find('-') then
                    PAYE := PRPeriodTrans.Amount;


                if TotalCashPay = 0 then
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
        PRPeriodTrans: Record "PR Period Transactions";
        PeriodFilter: Date;
        PRTransCodes: Record "PR Transaction Codes";
        BPAY: Decimal;
        HouseAllowance: Decimal;
        TransportAllowance: Decimal;
        LeaveAllowance: Decimal;
        OvertimeAllowance: Decimal;
        DirectorsFee: Decimal;
        Lumpsum: Decimal;
        OtherAllowances: Decimal;
        TotalCashPay: Decimal;
        ValueOfCar: Decimal;
        OtherNonCash: Decimal;
        TotalNonCash: Decimal;
        GlobalIncome: Decimal;
        TypeOfHousing: Decimal;
        RentOfHouse: Decimal;
        ComputedRent: Decimal;
        RentRecovered: Decimal;
        NetValue: Decimal;
        TotalGross: Decimal;
        ThirtyPCash: Decimal;
        ActualContr: Decimal;
        PermissibleLimit: Decimal;
        MortgageIntrest: Decimal;
        HOSP: Decimal;
        AmountOfBenefit: Decimal;
        E1: Decimal;
        E2: Decimal;
        E3: Decimal;
        TaxablePay: Decimal;
        TaxPayable: Decimal;
        MonthlyRelief: Decimal;
        InsuranceRelief: Decimal;
        PAYE: Decimal;


    procedure fnCompanyInfo()
    begin
        CompInfo.Reset();
        if CompInfo.Get() then
            CompInfo.CalcFields(CompInfo.Picture);
    end;

    local procedure fn_PeriodTrans()
    begin
        PRPeriodTrans.Reset();
        PRPeriodTrans.SetCurrentKey("Employee Code", "Transaction Code", "Period Month", "Period Year", Membership, "Reference No");
        PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "HR Employees"."No.");
        PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
    end;
}
