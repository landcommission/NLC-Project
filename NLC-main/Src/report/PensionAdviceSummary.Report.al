#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193616 "Pension Advice Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Pension Advice Summary.rdlc';
    ApplicationArea = All;
    Caption = 'Pension Advice Summary';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        EmployeeName: Text[200];
        bankStruct: Record "Cashier Link";
        bankAcc: Text[50];
        BranchBankNM: Text[100];
        mainBankNM: Text[100];
        RCount: Integer;
        NetAmount: Decimal;
        Employee: Record "FA Budget Entry";
        TCount: Integer;
        TransCodeFilter: Code[200];
        Trans: Record "Bank Bal. Alert Buffer";
        CompanyInfo: Record "Company Information";
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Staff_Pension_Advice_SummaryCaptionLbl: Label 'Staff Pension Advice Summary';
        Pension_HouseCaptionLbl: Label 'Pension House';
        No__Of_EmployeesCaptionLbl: Label 'No. Of Employees';
        Net_AmountCaptionLbl: Label 'Net Amount';
        Prepared_by_CaptionLbl: Label 'Prepared by:';
        Authorised_by_CaptionLbl: Label 'Authorised by:';
        NameCaptionLbl: Label 'Name';
        EmptyStringCaptionLbl: Label '......................................................................................................................................................';
        EmptyStringCaption_Control1102755016Lbl: Label '......................................................................................................................................................';
        NameCaption_Control1102755017Lbl: Label 'Name';
        EmptyStringCaption_Control1102755018Lbl: Label '......................................................................................................................................................';
        Approved_by_CaptionLbl: Label 'Approved by:';
        NameCaption_Control1102755020Lbl: Label 'Name';
        Signature___DateCaptionLbl: Label 'Signature & Date';
        EmptyStringCaption_Control1102755029Lbl: Label '......................................................................................................................................................';
        Signature___DateCaption_Control1102755030Lbl: Label 'Signature & Date';
        EmptyStringCaption_Control1102755031Lbl: Label '......................................................................................................................................................';
        Signature___DateCaption_Control1102755032Lbl: Label 'Signature & Date';
        EmptyStringCaption_Control1102755033Lbl: Label '......................................................................................................................................................';
}
