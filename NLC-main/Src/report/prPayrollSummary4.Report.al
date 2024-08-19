#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193639 prPayrollSummary4
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prPayrollSummary4.rdlc';
    ApplicationArea = All;
    Caption = 'prPayrollSummary4';
    dataset { }

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
}
