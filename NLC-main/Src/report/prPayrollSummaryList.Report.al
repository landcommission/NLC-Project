#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193518 "prPayrollSummary List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prPayrollSummary List.rdlc';
    ApplicationArea = All;
    Caption = 'prPayrollSummary List';
    dataset
    {
        dataitem("PR Period Transactions"; "PR Period Transactions")
        {
            column(ReportForNavId_4946; 4946) { }

            trigger OnPreDataItem()
            begin
                CompanyInfo.Get();
                CompanyInfo.CalcFields(CompanyInfo.Picture);
            end;
        }
        dataitem("HR Employees"; "HR Employees")
        {
            DataItemTableView = sorting("No.");
            column(ReportForNavId_8631; 8631) { }
            column(GETFILTERS; "HR Employees".GetFilters) { }
            column(USERID; UserId) { }
            column(CurrReport_PAGENO; CurrReport.PageNo()) { }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4)) { }
            column(COMPANYNAME; CompanyName) { }
            column(strEmpName; strEmpName) { }
            column(BasicPay; BasicPay) { }
            column(Grosspay; Grosspay) { }
            column(nonTaxAmount; nonTaxAmount) { }
            column(statutoryDed; statutoryDed) { }
            column(NetPay; NetPay) { }
            column(OtherAllow; OtherAllow) { }
            column(TotalDeductions; TotalDeductions) { }
            column(nonstatutoryDed; nonstatutoryDed) { }
            column(Pension; Pension) { }
            column(negNet; negNet) { }
            column(strCodes; strCodes) { }
            column(TotnegNet; TotnegNet) { }
            column(TotNetPay; TotNetPay) { }
            column(totTotalDeductions; totTotalDeductions) { }
            column(TotPension; TotPension) { }
            column(TotnonstatutoryDed; TotnonstatutoryDed) { }
            column(TotstatutoryDed; TotstatutoryDed) { }
            column(TotnonTaxAmount; TotnonTaxAmount) { }
            column(TotGrosspay; TotGrosspay) { }
            column(TotOtherAllow; TotOtherAllow) { }
            column(TotBasicPay; TotBasicPay) { }
            column(DATE____________________________________________________________; 'DATE...........................................................') { }
            column(NAME_________________________________________________________________________________________; 'NAME........................................................................................') { }
            column(DESIGNATION_____________________________________________________; 'DESIGNATION....................................................') { }
            column(SIGNATURE____________________________________________________; 'SIGNATURE...................................................') { }
            column(SIGNATURE_____________________________________________________Control1102756035; 'SIGNATURE...................................................') { }
            column(DATE_____________________________________________________________Control1102756042; 'DATE...........................................................') { }
            column(NAME__________________________________________________________________________________________Control1102756031; 'NAME........................................................................................') { }
            column(DESIGNATION______________________________________________________Control1102756034; 'DESIGNATION....................................................') { }
            column(Gross_Taxable_PayCaption; Gross_Taxable_PayCaptionLbl) { }
            column(Non_Taxable_AmountCaption; Non_Taxable_AmountCaptionLbl) { }
            column(Statutory_DeductionsCaption; Statutory_DeductionsCaptionLbl) { }
            column(Total_DeductionsCaption; Total_DeductionsCaptionLbl) { }
            column(Pension_Staff_Cont_Caption; Pension_Staff_Cont_CaptionLbl) { }
            column(Negative_Net_PayCaption; Negative_Net_PayCaptionLbl) { }
            column(Other_AllowancesCaption; Other_AllowancesCaptionLbl) { }
            column(Net_PayCaption; Net_PayCaptionLbl) { }
            column(Basic_PayCaption; Basic_PayCaptionLbl) { }
            column(Employee_Name_Caption; Employee_Name_CaptionLbl) { }
            column(Non_Statutory_DeductionsCaption; Non_Statutory_DeductionsCaptionLbl) { }
            column(Employee_Code_Caption; Employee_Code_CaptionLbl) { }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl) { }
            column(Payroll_SummaryCaption; Payroll_SummaryCaptionLbl) { }
            column(Totals_Caption; Totals_CaptionLbl) { }
            column(Checked_byCaption; Checked_byCaptionLbl) { }
            column(HR_Employee_No_; "HR Employees"."No.") { }
            column(objLogos_Picture; CompanyInfo.Picture) { }
            column(Report_Name; Report_Name) { }

            trigger OnAfterGetRecord()
            begin
                strEmpName := "HR Employees"."Last Name" + ' ' + "HR Employees"."First Name" + ' ' + "HR Employees"."Middle Name";
                strCodes := "HR Employees"."No.";

                BasicPay := 0;
                Allow := 0;
                Grosspay := 0;
                PenGrat := 0;
                Nssf := 0;
                HseAllow := 0;
                statutoryDed := 0;
                nonstatutoryDed := 0;
                TaxablePay := 0;
                Reliefs := 0;
                OtherAllow := 0;
                TotalDeductions := 0;
                NetPay := 0;
                negNet := 0;
                nonTaxAmount := 0;
                Pension := 0;

                //Loop through the Income/Earnings and deductions************************************************************************
                PeriodTrans.Reset();
                PeriodTrans.SetRange(PeriodTrans."Employee Code", "HR Employees"."No.");
                PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                PeriodTrans.SetCurrentKey(PeriodTrans."Employee Code", PeriodTrans."Period Month", PeriodTrans."Period Year",
                PeriodTrans."Group Order", PeriodTrans."Sub Group Order");
                if PeriodTrans.Find('-') then
                    repeat
                        //Basic Pay************************START
                        if (PeriodTrans."Group Order" = 1) and (PeriodTrans."Sub Group Order" = 1) then begin
                            BasicPay := PeriodTrans.Amount;
                            TotBasicPay := TotBasicPay + BasicPay;
                        end;

                        //Other Allowances************************START
                        if (PeriodTrans."Group Order" = 3) and (PeriodTrans."Sub Group Order" = 0) then begin
                            OtherAllow := OtherAllow + PeriodTrans.Amount;
                            TotOtherAllow := TotOtherAllow + PeriodTrans.Amount;
                        end;

                        //Gross Pay************************START
                        if (PeriodTrans."Group Order" = 4) and (PeriodTrans."Sub Group Order" = 0) then begin
                            Grosspay := Grosspay + PeriodTrans.Amount;
                            TotGrosspay := TotGrosspay + PeriodTrans.Amount;
                        end;

                        //other non taxable*************START
                        TransCodes.Reset();
                        TransCodes.SetRange(TransCodes."Transaction Code", PeriodTrans."Transaction Code");
                        TransCodes.SetRange(TransCodes.Taxable, false);
                        if TransCodes.FindFirst() then begin
                            nonTaxAmount := nonTaxAmount + PeriodTrans.Amount;
                            TotnonTaxAmount := TotnonTaxAmount + PeriodTrans.Amount;
                        end;

                        //Statutory Deductions*************START
                        if (PeriodTrans."Group Order" = 7) then begin
                            statutoryDed := statutoryDed + PeriodTrans.Amount;
                            TotstatutoryDed := TotstatutoryDed + PeriodTrans.Amount;
                        end;

                        //Pension *************************** please redo this ;-) dennis tihihihi
                        if (PeriodTrans."Transaction Code" = '0007') then begin
                            Pension := Pension + PeriodTrans.Amount;
                            TotPension := TotPension + PeriodTrans.Amount;
                        end;

                        //Total Deductions***********************
                        if (PeriodTrans."Group Order" = 8) and (PeriodTrans."Sub Group Order" = 9) then begin
                            TotalDeductions := TotalDeductions + PeriodTrans.Amount;
                            totTotalDeductions := totTotalDeductions + PeriodTrans.Amount;
                        end;

                        //Net Pay************************START
                        if (PeriodTrans."Group Order" = 9) and (PeriodTrans."Sub Group Order" = 0) then
                            if PeriodTrans.Amount < 0 then begin
                                NetPay := NetPay + 0;
                                TotNetPay := TotNetPay + 0;
                                negNet := PeriodTrans.Amount;
                                TotnegNet := TotnegNet + PeriodTrans.Amount;
                            end
                            else begin
                                NetPay := NetPay + PeriodTrans.Amount;
                                TotNetPay := TotNetPay + PeriodTrans.Amount
                            end;
                    until PeriodTrans.Next() = 0
                else
                    CurrReport.Skip();
            end;

            trigger OnPreDataItem()
            begin
                if PayrollMode <> PayrollMode::" " then
                    "HR Employees".SetRange("HR Employees"."Payment Mode", PayrollMode);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(Content)
            {
                field("Date Opened"; SelectedPeriod)
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

        //SelectedPeriod:="prPayroll Periods".GETRANGEMIN("Date Opened");
        //"prPeriod Transactions".GETRANGEMIN("Payroll Period");
        objPeriod.Reset();
        objPeriod.SetRange(objPeriod."Date Opened", SelectedPeriod);
        if objPeriod.Find('-') then
            PeriodName := objPeriod."Period Name";

        //IF CompanyInfo.GET() THEN
        //CompanyInfo.CALCFIELDS(CompanyInfo.Picture);
        /*
       //Logos-----------------------------------------------------------------------
        objLogos.RESET;
        objLogos.SETRANGE(objLogos.Code,'OTHERS');
       IF objLogos.FIND('-') THEN BEGIN
           objLogos.CALCFIELDS(objLogos.Picture);
       END;
       //Logos-----------------------------------------------------------------------
         */

    end;

    var
        strEmpName: Text[100];
        BasicPay: Decimal;
        Allow: Decimal;
        Grosspay: Decimal;
        PenGrat: Decimal;
        Nssf: Decimal;
        subTotNssf: Decimal;
        TotBasicPay: Decimal;
        TotAllow: Decimal;
        TotGrosspay: Decimal;
        TotPenGrat: Decimal;
        TotNssf: Decimal;
        PeriodTrans: Record "PR Period Transactions";
        TransCodes: Record "PR Transaction Codes";
        objPeriod: Record "PR Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[50];
        HseAllow: Decimal;
        HseTotAllow: Decimal;
        HREmployee: Record "HR Employees";
        subTotNHIF: Decimal;
        TotNHIF: Decimal;
        NHIF: Decimal;
        statutoryDed: Decimal;
        TotstatutoryDed: Decimal;
        subTotstatutoryDed: Decimal;
        TaxablePay: Decimal;
        TotTaxablePay: Decimal;
        SubTotTaxablePay: Decimal;
        Reliefs: Decimal;
        TotReliefs: Decimal;
        TaxCharged: Decimal;
        TotTaxCharged: Decimal;
        UnusedRelief: Decimal;
        SubTotUnusedRelief: Decimal;
        TotUnusedRelief: Decimal;
        PersonalRelief: Decimal;
        SubTotPersonalRelief: Decimal;
        TotPersonalRelief: Decimal;
        PAYETaxDeduction: Decimal;
        TotPAYETaxDeduction: Decimal;
        OtherDeduction: Decimal;
        TotOtherDeduction: Decimal;
        NetPay: Decimal;
        subTotNetPay: Decimal;
        TotNetPay: Decimal;
        subTotBasicPay: Decimal;
        subTotHseAllow: Decimal;
        SubTotGrosspay: Decimal;
        OtherAllow: Decimal;
        TotOtherAllow: Decimal;
        SubTotOtherAllow: Decimal;
        subtotTotalDeductions: Decimal;
        totTotalDeductions: Decimal;
        TotalDeductions: Decimal;
        companyHousing: Decimal;
        TotcompanyHousing: Decimal;
        SubTotcompanyHousing: Decimal;
        subTotReliefs: Decimal;
        SubTotTaxCharged: Decimal;
        subtotPAYETaxDeduction: Decimal;
        subTotOtherDeductions: Decimal;
        nonTaxAmount: Decimal;
        TotnonTaxAmount: Decimal;
        subTotnonTaxAmount: Decimal;
        nonstatutoryDed: Decimal;
        TotnonstatutoryDed: Decimal;
        subTotnonstatutoryDed: Decimal;
        Pension: Decimal;
        TotPension: Decimal;
        subTotPension: Decimal;
        negNet: Decimal;
        TotnegNet: Decimal;
        subTotnegNet: Decimal;
        strCodes: Code[20];
        CompanyInfo: Record "Company Information";
        PayrollMode: Option " ","Bank Transfer",Cheque,Cash,SACCO;
        Gross_Taxable_PayCaptionLbl: Label 'Gross Taxable Pay';
        Non_Taxable_AmountCaptionLbl: Label 'Non-Taxable Amount';
        Statutory_DeductionsCaptionLbl: Label 'Statutory Deductions';
        Total_DeductionsCaptionLbl: Label 'Total Deductions';
        Pension_Staff_Cont_CaptionLbl: Label 'Pension Staff Cont.';
        Negative_Net_PayCaptionLbl: Label 'Negative Net Pay';
        Other_AllowancesCaptionLbl: Label 'Other Allowances';
        Net_PayCaptionLbl: Label 'Net Pay';
        Basic_PayCaptionLbl: Label 'Basic Pay';
        Employee_Name_CaptionLbl: Label 'Employee Name:';
        Non_Statutory_DeductionsCaptionLbl: Label 'Non Statutory Deductions';
        Employee_Code_CaptionLbl: Label 'Employee Code:';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Payroll_SummaryCaptionLbl: Label 'Payroll Summary';
        Totals_CaptionLbl: Label 'Totals:';
        Checked_byCaptionLbl: Label 'Checked by';
        Report_Name: Label 'Payroll Summary List';
}
