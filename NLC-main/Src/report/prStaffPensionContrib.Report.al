#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193507 "prStaff Pension Contrib"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prStaff Pension Contrib.rdlc';
    ApplicationArea = All;
    Caption = 'prStaff Pension Contrib';
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
        EmployeeName: Text[50];
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
        EmpVol: Decimal;
        TotVolContrib: Decimal;
        prEmpTrans: Record "CshMgt Approvals";
        EmpCount: Integer;
        Employee_Employer_Pension_ContributionCaptionLbl: Label 'Employee/Employer Pension Contribution';
        Self_Contribution_CaptionLbl: Label 'Self Contribution:';
        Company_Contrib_CaptionLbl: Label 'Company Contrib:';
        Cumm_Contribution_CaptionLbl: Label 'Cumm Contribution:';
        Basic_Pay_CaptionLbl: Label 'Basic Pay:';
        User_Name_CaptionLbl: Label 'User Name:';
        Print_Date_CaptionLbl: Label 'Print Date:';
        Period_CaptionLbl: Label 'Period:';
        Page_No_CaptionLbl: Label 'Page No:';
        Prepared_by_______________________________________Date_________________CaptionLbl: Label 'Prepared byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                 DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Checked_by________________________________________Date_________________CaptionLbl: Label 'Checked byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                   DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Authorized_by____________________________________Date_________________CaptionLbl: Label 'Authorized byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..              DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Approved_by______________________________________Date_________________CaptionLbl: Label 'Approved byÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ..                DateÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁÁ';
        Totals_CaptionLbl: Label 'Totals:';
        "prSalary Card": Record "PR Salary Card";
}
