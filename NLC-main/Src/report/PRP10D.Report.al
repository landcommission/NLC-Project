#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193467 "PR P10D"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PR P10D.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'PR P10D';
    dataset
    {
        dataitem("PR Salary Card"; "PR Salary Card")
        {
            RequestFilterFields = "Period Filter", "Employee Code";
            column(ReportForNavId_9285; 9285) { }
            column(EmployerPIN; EmployerPIN) { }
            column(EmployerName; EmployerName) { }
            column(DATE2DMY_SelectedPeriod_1_; Date2DMY(SelectedPeriod, 1)) { }
            column(DATE2DMY_SelectedPeriod_2__2; Date2DMY(SelectedPeriod, 2) + 2) { }
            column(DATE2DMY_SelectedPeriod_3_; Date2DMY(SelectedPeriod, 3)) { }
            column(EmployeeName; EmployeeName) { }
            column(PinNumber; PinNumber) { }
            column(PayeAmount; PayeAmount) { }
            column(TaxablePay; TaxablePay) { }
            column(TotPayeAmount; TotPayeAmount) { }
            column(TotPayeAmount_Control1102756037; TotPayeAmount) { }
            column(TotTaxablePay; TotTaxablePay) { }
            column(TotPayeAmount_Control1102756041; TotPayeAmount) { }
            column(KENYA_REVENUECaption; KENYA_REVENUECaptionLbl) { }
            column(AUTHORITYCaption; AUTHORITYCaptionLbl) { }
            column(P_10DCaption; P_10DCaptionLbl) { }
            column(DOMESTIC_TAXES_DEPARTMENTCaption; DOMESTIC_TAXES_DEPARTMENTCaptionLbl) { }
            column(EMPLOYER_S_QUARTELY_RETURN_Caption; EMPLOYER_S_QUARTELY_RETURN_CaptionLbl) { }
            column(P_A_Y_E_RETURN_FOR_THE_QUARTER_ENDING_________________________YEAR______________Caption; P_A_Y_E_RETURN_FOR_THE_QUARTER_ENDING_________________________YEAR______________CaptionLbl) { }
            column(EMPLOYER_S_PINCaption; EMPLOYER_S_PINCaptionLbl) { }
            column(DataItem1102756007; EMPLOYER_S_NAME__________________________________________Lbl) { }
            column(EMPLOYEE_S_NAMECaption; EMPLOYEE_S_NAMECaptionLbl) { }
            column(EMPLOYEE_S_PINCaption; EMPLOYEE_S_PINCaptionLbl) { }
            column(TOTAL_PAYECaption; TOTAL_PAYECaptionLbl) { }
            column(TOTAL_EMOLUMENTSCaption; TOTAL_EMOLUMENTSCaptionLbl) { }
            column(KSHSCaption; KSHSCaptionLbl) { }
            column(DEDUCTED_KSHSCaption; DEDUCTED_KSHSCaptionLbl) { }
            column(BANK_REMITTANCECaption; BANK_REMITTANCECaptionLbl) { }
            column(TOTAL_PAYE_TAXCaption; TOTAL_PAYE_TAXCaptionLbl) { }
            column(EmptyStringCaption; EmptyStringCaptionLbl) { }
            column(EmptyStringCaption_Control1102756014; EmptyStringCaption_Control1102756014Lbl) { }
            column(EmptyStringCaption_Control1102756017; EmptyStringCaption_Control1102756017Lbl) { }
            column(TOTAL_WCPSCaption; TOTAL_WCPSCaptionLbl) { }
            column(TAX_ON_LUMPSUMS_AUDIT_PENALTY_INTERESTCaption; TAX_ON_LUMPSUMS_AUDIT_PENALTY_INTERESTCaptionLbl) { }
            column(TOTAL_TAX_PAID_FOR_THE_QUARTERCaption; TOTAL_TAX_PAID_FOR_THE_QUARTERCaptionLbl) { }
            column(PR_Salary_Card_Employee_Code; "Employee Code") { }

            trigger OnAfterGetRecord()
            begin
                objEmp.Reset();
                objEmp.SetRange(objEmp."No.", "Employee Code");
                if objEmp.Find('-') then
                    EmployeeName := objEmp."First Name" + ' ' + objEmp."Middle Name" + ' ' + objEmp."Last Name";

                PinNumber := objEmp."PIN No.";

                PeriodTrans.Reset();
                PeriodTrans.SetRange(PeriodTrans."Employee Code", "Employee Code");
                //PeriodTrans.SETFILTER(PeriodTrans."Payroll Period",FORMAT(SelectedPeriod));
                PeriodTrans.SetFilter(PeriodTrans."Payroll Period", PeriodFilter);

                TaxablePay := 0;
                PayeAmount := 0;
                if PeriodTrans.Find('-') then
                    repeat
                        //***************************TXBP Taxable Pay****************** -  BY DENNIS
                        if (PeriodTrans."Transaction Code" = 'TXBP') then
                            TaxablePay := TaxablePay + PeriodTrans.Amount;

                        //***************************GrpOrder 7, SubGrpOrder 3 = PAYE ****************
                        // IF (PeriodTrans."Group Order"=7) AND (PeriodTrans."Sub Group Order"=3) THEN
                        if (PeriodTrans."Transaction Code" = 'PAYE') or (PeriodTrans."Transaction Code" = 'PYAR') then
                            PayeAmount := PayeAmount + PeriodTrans.Amount;
                    until PeriodTrans.Next() = 0;

                if PayeAmount <= 0 then
                    CurrReport.Skip();
                TotTaxablePay := TotTaxablePay + TaxablePay;
                TotPayeAmount := TotPayeAmount + PayeAmount;
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        PeriodFilter := "PR Salary Card".GetFilter("Period Filter");
        if PeriodFilter = '' then
            Error('You must specify the period filter');

        SelectedPeriod := "PR Salary Card".GetRangeMin("Period Filter");
        objPeriod.Reset();
        if objPeriod.Get(SelectedPeriod) then
            PeriodName := objPeriod."Period Name";

        controlinfo.SetRange(controlinfo."Primary Key");
        if controlinfo.Find('-') then
            EmployerName := controlinfo.Name;
        //EmployerPIN:=controlinfo."Company P.I.N";
    end;

    var
        PeriodTrans: Record "PR Period Transactions";
        PayeAmount: Decimal;
        TotPayeAmount: Decimal;
        TaxablePay: Decimal;
        TotTaxablePay: Decimal;
        EmployeeName: Text[50];
        PinNumber: Text[30];
        objPeriod: Record "PR Payroll Periods";
        objEmp: Record "HR Employees";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodFilter: Text[30];
        controlinfo: Record "Company Information";
        EmployerPIN: Text[50];
        EmployerName: Text[100];
        DAY: Integer;
        KENYA_REVENUECaptionLbl: Label 'KENYA REVENUE';
        AUTHORITYCaptionLbl: Label 'AUTHORITY';
        P_10DCaptionLbl: Label 'P.10D';
        DOMESTIC_TAXES_DEPARTMENTCaptionLbl: Label 'DOMESTIC TAXES DEPARTMENT';
        EMPLOYER_S_QUARTELY_RETURN_CaptionLbl: Label 'EMPLOYER''S QUARTELY RETURN ';
        P_A_Y_E_RETURN_FOR_THE_QUARTER_ENDING_________________________YEAR______________CaptionLbl: Label 'P.A.Y.E RETURN FOR THE QUARTER ENDING ......... / ........... YEAR .............';
        EMPLOYER_S_PINCaptionLbl: Label 'EMPLOYER''S PIN';
        EMPLOYER_S_NAME__________________________________________Lbl: Label 'EMPLOYER''S NAME....................................................................................................................................';
        EMPLOYEE_S_NAMECaptionLbl: Label 'EMPLOYEE''S NAME';
        EMPLOYEE_S_PINCaptionLbl: Label 'EMPLOYEE''S PIN';
        TOTAL_PAYECaptionLbl: Label 'TOTAL PAYE';
        TOTAL_EMOLUMENTSCaptionLbl: Label 'TOTAL EMOLUMENTS';
        KSHSCaptionLbl: Label 'KSHS';
        DEDUCTED_KSHSCaptionLbl: Label 'DEDUCTED KSHS';
        BANK_REMITTANCECaptionLbl: Label 'BANK REMITTANCE';
        TOTAL_PAYE_TAXCaptionLbl: Label 'TOTAL PAYE TAX';
        EmptyStringCaptionLbl: Label '.................................';
        EmptyStringCaption_Control1102756014Lbl: Label '.................................';
        EmptyStringCaption_Control1102756017Lbl: Label '.................................';
        TOTAL_WCPSCaptionLbl: Label 'TOTAL WCPS';
        TAX_ON_LUMPSUMS_AUDIT_PENALTY_INTERESTCaptionLbl: Label 'TAX ON LUMPSUMS/AUDIT/PENALTY/INTEREST';
        TOTAL_TAX_PAID_FOR_THE_QUARTERCaptionLbl: Label 'TOTAL TAX PAID FOR THE QUARTER';
}

