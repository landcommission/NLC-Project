#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193640 prPayrollSummary5
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prPayrollSummary5.rdlc';
    ApplicationArea = All;
    Caption = 'prPayrollSummary5';
    dataset
    {
        dataitem("Dimension Value"; "Dimension Value")
        {
            DataItemTableView = sorting("Dimension Code", Code) where("Dimension Code" = const('FUND'));
            PrintOnlyIfDetail = true;
            column(ReportForNavId_6363; 6363) { }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4)) { }
            column(PeriodName; PeriodName) { }
            column(COMPANYNAME; CompanyName) { }
            column(CompanyInfo_Picture; CompanyInfo.Picture) { }
            column(Dimension_Value_Name; "Dimension Value".Name) { }
            column(subTotBasicPay; subTotBasicPay) { }
            column(SubTotOtherAllow; SubTotOtherAllow) { }
            column(SubTotGrosspay; SubTotGrosspay) { }
            column(subTotnonTaxAmount; subTotnonTaxAmount) { }
            column(subTotstatutoryDed; subTotstatutoryDed) { }
            column(subTotPension; subTotPension) { }
            column(subTotNetPay; subTotNetPay) { }
            column(subtotTotalDeductions; subtotTotalDeductions) { }
            column(TotBasicPay; TotBasicPay) { }
            column(TotOtherAllow; TotOtherAllow) { }
            column(TotGrosspay; TotGrosspay) { }
            column(TotnonTaxAmount; TotnonTaxAmount) { }
            column(TotstatutoryDed; TotstatutoryDed) { }
            column(totTotalDeductions; totTotalDeductions) { }
            column(TotNetPay; TotNetPay) { }
            column(TotnonstatutoryDed; TotnonstatutoryDed) { }
            column(TotPension; TotPension) { }
            column(TotnegNet; TotnegNet) { }
            column(NAME_________________________________________________________________________________________; 'NAME........................................................................................') { }
            column(DESIGNATION_____________________________________________________; 'DESIGNATION....................................................') { }
            column(SIGNATURE____________________________________________________; 'SIGNATURE...................................................') { }
            column(DATE____________________________________________________________; 'DATE...........................................................') { }
            column(NAME__________________________________________________________________________________________Control1102756043; 'NAME........................................................................................') { }
            column(DESIGNATION______________________________________________________Control1102756044; 'DESIGNATION....................................................') { }
            column(SIGNATURE_____________________________________________________Control1102756046; 'SIGNATURE...................................................') { }
            column(DATE_____________________________________________________________Control1102756047; 'DATE...........................................................') { }
            column(Other_AllowancesCaption; Other_AllowancesCaptionLbl) { }
            column(Gross_Taxable_PayCaption; Gross_Taxable_PayCaptionLbl) { }
            column(Non_Taxable_AmountCaption; Non_Taxable_AmountCaptionLbl) { }
            column(Statutory_DeductionsCaption; Statutory_DeductionsCaptionLbl) { }
            column(Total_DeductionsCaption; Total_DeductionsCaptionLbl) { }
            column(Net_PayCaption; Net_PayCaptionLbl) { }
            column(Basic_PayCaption; Basic_PayCaptionLbl) { }
            column(Employee_Name_Caption; Employee_Name_CaptionLbl) { }
            column(Payroll_Summary_Per_DepartmentCaption; Payroll_Summary_Per_DepartmentCaptionLbl) { }
            column(Non_Statutory_DeductionsCaption; Non_Statutory_DeductionsCaptionLbl) { }
            column(Pension_Staff_Cont_Caption; Pension_Staff_Cont_CaptionLbl) { }
            column(Negative_Net_PayCaption; Negative_Net_PayCaptionLbl) { }
            column(Employee_Code_Caption; Employee_Code_CaptionLbl) { }
            column(Sub_Totals_Caption; Sub_Totals_CaptionLbl) { }
            column(Totals_Caption; Totals_CaptionLbl) { }
            column(Checked_byCaption; Checked_byCaptionLbl) { }
            column(Dimension_Value_Dimension_Code; "Dimension Value"."Dimension Code") { }
            column(Dimension_Value_Code; "Dimension Value".Code) { }
            dataitem("FA Budget Entry"; "FA Budget Entry")
            {
                //DataItemLink = Field35=field(Code);
                DataItemTableView = sorting("Entry No.");
                //RequestFilterFields = Field35,Field324,Field188;
                column(ReportForNavId_8631; 8631) { }
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
                column(HR_Employee_No_; "FA Budget Entry"."Entry No.") { }
                column(HOUSE; HOUSE) { }
                column(TRANS; TRANS) { }
                column(ERELIEF; ERELIEF) { }
                column(R; R) { }
                column(INC; INC) { }
                column(LEAVE; LEAVE) { }
                column(EDU; EDUC) { }
                column(UTIL; UTIL) { }
                column(DOMES; DOMES) { }
                column(MEDICAL; MEDICAL) { }
                column(NYSC; NYSC) { }
                column(XMASS; XMASS) { }
                column(FURN; FURN) { }
                column(BAREAS; BAREAS) { }
                column(ENTER; ENTER) { }
                column(TAX; TAX) { }
                column(PENSIONN; PENSIONN) { }
                column(AVC; AVC) { }
                column(SCBANK; SCBANK) { }
                column(AGLCO; AGLCO) { }
                column(GUINEA; GUINEA) { }
                column(LTCOOP; LTCOOP) { }
                column(SALREC; SALREC) { }
                column(SALDEDUC; SALDEDUC) { }
                column(LOAN; LOAN) { }
                column(NBCCOOP; NBCCOOP) { }
                column(HITV; HITV) { }
                column(LEVY; LEVY) { }
                column(FAMILY; FAMILY) { }
                column(OTHERALL; OTHERALL) { }
                column(DRIVE; DRIVE) { }
                column(OVERTIME; OVERTIME) { }
                column(SIWES; SIWES) { }

            }

        }
        dataitem(Banks; Banks)
        {
            //RequestFilterFields = Field4;
            column(ReportForNavId_4946; 4946) { }
        }
    }

    requestpage
    {

        layout
        {
            area(Content)
            {
                field(DateFilter; DateFilter)
                {
                    ApplicationArea = Basic;
                    Caption = 'Date';
                    ToolTip = 'Specifies the value of the Date field.';
                }
            }
        }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin

        SelectedPeriod := DateFilter;//"prPayroll Periods".GETRANGEMIN("Date Opened");;
        objPeriod.Reset();
        //objPeriod.SETRANGE(objPeriod."Date Opened",SelectedPeriod);
        if objPeriod.Find('-') then;
        /// PeriodName:=objPeriod."Period Name";
        // MESSAGE('%1,',PeriodName);


        if CompanyInfo.Get() then
            CompanyInfo.CalcFields(CompanyInfo.Picture);
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
        PeriodTrans: Record "Cshmgt PV Audit";
        TransCodes: Record "Bank Bal. Alert Buffer";
        objPeriod: Record Banks;
        SelectedPeriod: Date;
        PeriodName: Text[50];
        HseAllow: Decimal;
        HseTotAllow: Decimal;
        HREmployee: Record "FA Budget Entry";
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
        strCodes: Code[10];
        CompanyInfo: Record "Company Information";
        PayrollMode: Option " ","Bank Transfer",Cheque,Cash,SACCO;
        Other_AllowancesCaptionLbl: Label 'Other Allowances';
        Gross_Taxable_PayCaptionLbl: Label 'Gross Taxable Pay';
        Non_Taxable_AmountCaptionLbl: Label 'Non-Taxable Amount';
        Statutory_DeductionsCaptionLbl: Label 'Statutory Deductions';
        Total_DeductionsCaptionLbl: Label 'Total Deductions';
        Net_PayCaptionLbl: Label 'Net Pay';
        Basic_PayCaptionLbl: Label 'Basic Pay';
        Employee_Name_CaptionLbl: Label 'Employee Name:';
        Payroll_Summary_Per_DepartmentCaptionLbl: Label 'Payroll Summary-Per Department';
        Non_Statutory_DeductionsCaptionLbl: Label 'Non Statutory Deductions';
        Pension_Staff_Cont_CaptionLbl: Label 'Pension Staff Cont.';
        Negative_Net_PayCaptionLbl: Label 'Negative Net Pay';
        Employee_Code_CaptionLbl: Label 'Employee Code:';
        Sub_Totals_CaptionLbl: Label 'Sub Totals:';
        Totals_CaptionLbl: Label 'Totals:';
        Checked_byCaptionLbl: Label 'Checked by';
        DateFilter: Date;
        HOUSE: Decimal;
        TRANS: Decimal;
        ERELIEF: Decimal;
        R: Decimal;
        INC: Decimal;
        LEAVE: Decimal;
        EDUC: Decimal;
        UTIL: Decimal;
        DOMES: Decimal;
        MEDICAL: Decimal;
        NYSC: Decimal;
        XMASS: Decimal;
        FURN: Decimal;
        BAREAS: Decimal;
        ENTER: Decimal;
        TAX: Decimal;
        PENSIONN: Decimal;
        AVC: Decimal;
        SCBANK: Decimal;
        AGLCO: Decimal;
        GUINEA: Decimal;
        LTCOOP: Decimal;
        SALREC: Decimal;
        SALDEDUC: Decimal;
        LOAN: Decimal;
        NBCCOOP: Decimal;
        HITV: Decimal;
        LEVY: Decimal;
        FAMILY: Decimal;
        OTHERALL: Decimal;
        DRIVE: Decimal;
        OVERTIME: Decimal;
        SIWES: Decimal;
}
