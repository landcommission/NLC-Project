#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193500 "PR Company Totals-No Round Off"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR Company Totals-No Round Off.rdlc';
    ApplicationArea = All;
    Caption = 'PR Company Totals-No Round Off';
    dataset
    {
        dataitem(prTransactionCodes; "PR Transaction Codes")
        {
            DataItemTableView = where("Transaction Code" = filter(<> 'GPAY' | <> 'NPAY' | <> 'PSNR' | <> 'INSR'));
            column(ReportForNavId_4; 4) { }
            column(NonTaxableIncome; NonTaxableIncome) { }
            column(InsuranceReliefs; InsuranceReliefs) { }
            column(PersonalReliefs; PersonalReliefs) { }
            column(NumStaff; NumStaff) { }
            column(nssf; NSSFAmount) { }
            column(ChargeablePay; ChargeableAmount) { }
            column(BPAY; BPAY) { }
            column(GPAY; GPAY) { }
            column(NPAY; NPAY) { }
            column(Taxcharged; Taxcharged) { }
            column(TODAY; Today) { }
            column(PeriodName; PeriodName) { }
            column(CurrReport_PAGENO; CurrReport.PageNo()) { }
            column(COMPANYNAME; CompanyName) { }
            column(PeriodName_Control1102756011; PeriodName) { }
            column(StrPAyrollStatus; StrPAyrollStatus) { }
            column(TOTDED; TOTDED) { }
            column(PAYEAmount; PAYEAmount) { }
            column(NHIFAmount; NHIFAmount) { }
            column(GratuityBal; GratuityBal) { }
            column(PensioncompanyInfoBal; PensioncompanyInfoBal) { }
            column(intCount; intCount) { }
            column(TransactionCode_prTransactionCodes; prTransactionCodes."Transaction Code") { }
            column(TransactionName_prTransactionCodes; prTransactionCodes."Transaction Name") { }
            column(TransactionType_prTransactionCodes; prTransactionCodes."Transaction Type") { }
            column(decAmount; decAmount) { }
            column(CompanyInfo_Picture; CompanyInfo.Picture) { }
            column(Report_Name; Report_Name) { }
            column(DateOpened; objPeriod."Date Opened") { }
            column(PeriodMonth; objPeriod."Period Month") { }
            column(PeriodYear; objPeriod."Period Year") { }
            column(PrintDate; PrintDate) { }

            trigger OnAfterGetRecord()
            begin

                //error('%1',totded);

                decAmount := 0;
                PeriodTrans.Reset();
                //PeriodTrans.SETRANGE(PeriodTrans."Payroll Code","prPayroll Type"."Payroll Code");
                PeriodTrans.SetRange(PeriodTrans."Transaction Code", prTransactionCodes."Transaction Code");
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                if PeriodTrans.Find('-') then
                    repeat
                        decAmount := decAmount + PeriodTrans.Amount;
                    until PeriodTrans.Next() = 0;


                if decAmount = 0 then
                    CurrReport.Skip();
                // ERROR(FORMAT(decAmount)) ;
                //TOTDED+=decAmount;
            end;

            trigger OnPreDataItem()
            begin
                //Taxation Info*************************************

                NonTaxableIncome := 0;  //NONTAX
                Taxcharged := 0;        //TXCHRG
                InsuranceReliefs := 0;  //INSR
                PersonalReliefs := 0;   //PSNR
                NSSFAmount := 0;        //NSSFAmount
                NHIFAmount := 0;        //NHIFAmount
                ChargeableAmount := 0;  //TXBP
                BPAY := 0;
                GPAY := 0;
                NPAY := 0;
                PYAR := 0;
                //TOTDED:=0;
                PensioncompanyInfoBal := 0;

                PrintDate := Today;

                //----------------------------------------------------------------------------------------
                //PeriodTrans."Payroll Code","prPayroll Type"."Payroll Code"
                PeriodTrans.Reset();
                PeriodTrans.SetRange(PeriodTrans."Transaction Code", 'BPAY');
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                if PeriodTrans.Find('-') then
                    repeat
                        BPAY := BPAY + PeriodTrans.Amount;
                    until PeriodTrans.Next() = 0;
                //----------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------
                PeriodTrans.Reset();
                //PeriodTrans.SETRANGE(PeriodTrans."Payroll Code","prPayroll Type"."Payroll Code");
                PeriodTrans.SetRange(PeriodTrans."Transaction Code", 'GPAY');
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                if PeriodTrans.Find('-') then
                    repeat
                        GPAY := GPAY + PeriodTrans.Amount;
                    until PeriodTrans.Next() = 0;
                // error(format(gpay));
                //----------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------
                PeriodTrans.Reset();
                //PeriodTrans.SETRANGE(PeriodTrans."Payroll Code","prPayroll Type"."Payroll Code");
                PeriodTrans.SetRange(PeriodTrans."Transaction Code", 'NPAY');
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                //PeriodTrans.SETRANGE(PeriodTrans."Payroll Code","prPayroll Type"."Payroll Code");
                if PeriodTrans.Find('-') then
                    repeat
                        NPAY := NPAY + PeriodTrans.Amount;
                    until PeriodTrans.Next() = 0;


                //error(format(npay)) ;
                //----------------------------------------------------------------------------------------
                //----------------------------------------------------------------------------------------
                PeriodTrans.Reset();
                //PeriodTrans.SETRANGE(PeriodTrans."Payroll Code","prPayroll Type"."Payroll Code");
                PeriodTrans.SetRange(PeriodTrans."Transaction Code", 'TXBP');
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                if PeriodTrans.Find('-') then
                    repeat
                        ChargeableAmount := ChargeableAmount + PeriodTrans.Amount;
                    until PeriodTrans.Next() = 0;
                //----------------------------------------------------------------------------------------

                //----------------------------------------------------------------------------------------
                PeriodTrans.Reset();
                //PeriodTrans.SETRANGE(PeriodTrans."Payroll Code","prPayroll Type"."Payroll Code");
                PeriodTrans.SetRange(PeriodTrans."Transaction Code", 'NONTAX');
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                if PeriodTrans.Find('-') then
                    repeat
                        NonTaxableIncome := NonTaxableIncome + PeriodTrans.Amount;
                    until PeriodTrans.Next() = 0;
                //----------------------------------------------------------------------------------------

                //----------------------------------------------------------------------------------------
                PeriodTrans.Reset();
                //PeriodTrans.SETRANGE(PeriodTrans."Payroll Code","prPayroll Type"."Payroll Code");
                PeriodTrans.SetRange(PeriodTrans."Transaction Code", 'TXCHRG');
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                if PeriodTrans.Find('-') then
                    repeat
                        Taxcharged := Taxcharged + PeriodTrans.Amount;
                    until PeriodTrans.Next() = 0;
                //----------------------------------------------------------------------------------------

                //----------------------------------------------------------------------------------------
                PeriodTrans.Reset();
                //PeriodTrans.SETRANGE(PeriodTrans."Payroll Code","prPayroll Type"."Payroll Code");
                PeriodTrans.SetRange(PeriodTrans."Transaction Code", 'NSSF');
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                if PeriodTrans.Find('-') then
                    repeat
                        NSSFAmount := NSSFAmount + PeriodTrans.Amount;
                    until PeriodTrans.Next() = 0;
                //error(format(NSSFAmount)) ;
                //----------------------------------------------------------------------------------------

                //----------------------------------------------------------------------------------------
                PeriodTrans.Reset();
                //PeriodTrans.SETRANGE(PeriodTrans."Payroll Code","prPayroll Type"."Payroll Code");
                PeriodTrans.SetRange(PeriodTrans."Transaction Code", 'NHIF');
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);

                if PeriodTrans.Find('-') then
                    repeat
                        NHIFAmount := NHIFAmount + PeriodTrans.Amount;
                    until PeriodTrans.Next() = 0;
                //----------------------------------------------------------------------------------------

                //----------------------------------------------------------------------------------------
                PeriodTrans.Reset();
                //PeriodTrans.SETRANGE(PeriodTrans."Payroll Code","prPayroll Type"."Payroll Code");
                PeriodTrans.SetRange(PeriodTrans."Transaction Code", 'PAYE');
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                if PeriodTrans.Find('-') then
                    repeat
                        PAYEAmount := PAYEAmount + PeriodTrans.Amount;
                    until PeriodTrans.Next() = 0;
                //----------------------------------------------------------------------------------------

                PeriodTrans.Reset();
                //PeriodTrans.SETRANGE(PeriodTrans."Payroll Code","prPayroll Type"."Payroll Code");
                PeriodTrans.SetRange(PeriodTrans."Transaction Code", 'PYAR');
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                if PeriodTrans.Find('-') then
                    repeat
                        PYAR := PYAR + PeriodTrans.Amount;
                    until PeriodTrans.Next() = 0;

                //----------------------------------------------------------------------------------------
                // PeriodTrans.RESET;
                //PeriodTrans.SETRANGE(PeriodTrans."Payroll Code","prPayroll Type"."Payroll Code");
                // PeriodTrans.SETRANGE(PeriodTrans."Transaction Code",'TOT-DED');
                //PeriodTrans.SETRANGE(PeriodTrans."Group Text",'DEDUCTIONS');
                //PeriodTrans.SETRANGE(PeriodTrans."Payroll Period",SelectedPeriod);
                // IF PeriodTrans.FIND('-') THEN REPEAT
                // IF PeriodTrans."Transaction Code"<>'TOT-DED' THEN BEGIN
                // TOTDED:=TOTDED+PeriodTrans.Amount;
                // END;                                                     r
                //UNTIL PeriodTrans.NEXT=0;
                //----------------------------------------------------------------------------------------
                TOTDED := TOTDED + PAYEAmount + NSSFAmount + NHIFAmount;
                // Error(format(TOTDED));
                //----------------------------------------------------------------------------------------
                PeriodTrans.Reset();
                //PeriodTrans.SETRANGE(PeriodTrans."Payroll Code","prPayroll Type"."Payroll Code");
                PeriodTrans.SetRange(PeriodTrans."Transaction Code", 'INSR');
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                if PeriodTrans.Find('-') then
                    repeat
                        InsuranceReliefs := InsuranceReliefs + PeriodTrans.Amount;
                    until PeriodTrans.Next() = 0;
                //----------------------------------------------------------------------------------------

                //----------------------------------------------------------------------------------------
                PeriodTrans.Reset();
                //PeriodTrans.SETRANGE(PeriodTrans."Payroll Code","prPayroll Type"."Payroll Code");
                PeriodTrans.SetRange(PeriodTrans."Transaction Code", 'PSNR');
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                if PeriodTrans.Find('-') then
                    repeat
                        PersonalReliefs := PersonalReliefs + PeriodTrans.Amount;
                    until PeriodTrans.Next() = 0;
                //----------------------------------------------------------------------------------------

                GratuityBal := 0;

                /*
                objEmplyer.RESET;
                //objEmplyer.SETRANGE(objEmplyer."Payroll Code","prPayroll Type"."Payroll Code");
                objEmplyer.SETRANGE(objEmplyer."Transaction Code",'D162');
                objEmplyer.SETRANGE(objEmplyer."Payroll Period",SelectedPeriod);
                IF objEmplyer.FIND('-') THEN REPEAT
                   PensioncompanyInfoBal:=PensioncompanyInfoBal+objEmplyer.Amount;
                UNTIL objEmplyer.NEXT=0;
                //error(format(PensioncompanyInfoBal)) ;
                */

                PRPeriodTrans.Reset();
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", SelectedPeriod);
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'D162');
                if PRPeriodTrans.Find('-') then
                    repeat
                        PensioncompanyInfoBal := PensioncompanyInfoBal + PRPeriodTrans.Amount * 2;
                    until PRPeriodTrans.Next() = 0;

                /*
                PeriodOtherTrans.RESET;
                //PeriodOtherTrans.SETRANGE(PeriodOtherTrans."Payroll Code","prPayroll Type"."Payroll Code");
                PeriodOtherTrans.SETRANGE(PeriodOtherTrans."Payroll Period",SelectedPeriod);
                PeriodOtherTrans.SETRANGE(PeriodOtherTrans."Group Order",9);
                IF PeriodOtherTrans.FIND('-') THEN REPEAT
                 GratuityBal:=GratuityBal+PeriodOtherTrans.Amount;
                UNTIL PeriodOtherTrans.NEXT=0;
                */

                PRPeriodTrans.Reset();
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", HREmp."No.");
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code");
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", SelectedPeriod);
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'NPAY');
                if PRPeriodTrans.Find('-') then
                    NumStaff := PRPeriodTrans.Count;

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
                field(SelectedPeriod; SelectedPeriod)
                {
                    ApplicationArea = Basic;
                    TableRelation = "PR Payroll Periods";
                    ToolTip = 'Specifies the value of the SelectedPeriod field.';
                }
            }
        }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        if SelectedPeriod = 0D then
            Error('You must specify the period filter');

        objPeriod.Reset();
        if objPeriod.Get(SelectedPeriod) then begin
            PeriodName := objPeriod."Period Name";
            if objPeriod.Closed = true then
                StrPAyrollStatus := ''
            else
                StrPAyrollStatus := 'OPEN';
        end;

        CompanyInfo.Get();
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        HREmp: Record "HR Employees";
        PRPeriodTrans: Record "PR Period Transactions";
        NumStaff: Integer;
        decAmount: Decimal;
        PeriodTrans: Record "PR Period Transactions";
        strTranCode: Code[50];
        strTransName: Text;
        decAmount2: Decimal;
        NSSFAmount: Decimal;
        NHIFAmount: Decimal;
        NonTaxableIncome: Decimal;
        Taxcharged: Decimal;
        InsuranceReliefs: Decimal;
        PersonalReliefs: Decimal;
        ChargeableAmount: Decimal;
        BPAY: Decimal;
        GPAY: Decimal;
        NPAY: Decimal;
        objPeriod: Record "PR Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodFilter: Text[30];
        CompanyInfo: Record "Company Information";
        DimCode: Code[50];
        logoFound: Boolean;
        TOTDED: Decimal;
        PAYEAmount: Decimal;
        StrPAyrollStatus: Code[10];
        PeriodOtherTrans: Record "PR Period Transactions";
        GratuityBal: Decimal;
        Gratuity: Decimal;
        PensionEmployer: Decimal;
        totalDeductions: Decimal;
        objEmp: Record "HR Employees";
        "Payroll Code": Code[50];
        objEmplyer: Record "PR Employer Deductions";
        PensioncompanyInfo: Decimal;
        PensioncompanyInfoBal: Decimal;
        intCount: Integer;
        dimVal: Record "Dimension Value";
        PYAR: Decimal;
        Report_Name: Label 'Company Payslip';
        PrintDate: Date;
        TotNHIFNNSFPAYE: Decimal;
}
