#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193527 "prStaff Pension Balance"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prStaff Pension Balance.rdlc';
    ApplicationArea = All;
    Caption = 'prStaff Pension Balance';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        PeriodTrans: Record "Cshmgt PV Audit";
        BasicPay: Decimal;
        SelfContrib: Decimal;
        CompanyContrib: Decimal;
        CummContrib: Decimal;
        TotBasicPay: Decimal;
        TotSelfContrib: Decimal;
        TotCompanyContrib: Decimal;
        TotCummContrib: Decimal;
        EmployeeName: Text[200];
        objEmp: Record "FA Budget Entry";
        objPeriod: Record Banks;
        SelectedPeriod: Date;
        PeriodFilter: Text[30];
        PeriodName: Text[30];
        SelfContribCode: Text[30];
        CompanyContribCode: Text[30];
        objTransCode: Record "Bank Bal. Alert Buffer";
        SelfContribCodeArrears: Text[30];
        CompanyContribCodeArrears: Text[30];
        SelfContribARREARS: Decimal;
        CompanyContribARREARS: Decimal;
        prEmployerContrib: Record "Cshmgt Cashier Transfer";
        Companyinfo: Record "Company Information";
        PINNo: Code[20];
        PensionHouse: Code[100];
        PensionH: Code[20];
        RCount: Integer;
        Cumm__Self_ContributionCaptionLbl: Label 'Cumm. Self Contribution';
        Cumm__Employer_Contr_CaptionLbl: Label 'Cumm. Employer Contr.';
        Cumm__Total_ContributionCaptionLbl: Label 'Cumm. Total Contribution';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Staff_Pension_BalancesCaptionLbl: Label 'Staff Pension Balances';
        Employee_No_CaptionLbl: Label 'Employee No.';
        NameCaptionLbl: Label 'Name';
        Pension_HouseCaptionLbl: Label 'Pension House';
        PIN_No_CaptionLbl: Label 'PIN No.';
}
