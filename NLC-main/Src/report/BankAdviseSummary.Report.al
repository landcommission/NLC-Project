#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193615 "Bank Advise Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Bank Advise Summary.rdlc';
    ApplicationArea = All;
    Caption = 'Bank Advise Summary';
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
        CompanyInfo: Record "Company Information";
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Bank_Advice_SummaryCaptionLbl: Label 'Bank Advice Summary';
        Bank_NameCaptionLbl: Label 'Bank Name';
        Bank_BranchCaptionLbl: Label 'Bank Branch';
        No__Of_EmployeesCaptionLbl: Label 'No. Of Employees';
        Net_AmountCaptionLbl: Label 'Net Amount';
        Signature___DateCaptionLbl: Label 'Signature & Date';
        NameCaptionLbl: Label 'Name';
        EmptyStringCaptionLbl: Label '......................................................................................................................................................';
        EmptyStringCaption_Control1102755017Lbl: Label '......................................................................................................................................................';
        Signature___DateCaption_Control1102755018Lbl: Label 'Signature & Date';
        NameCaption_Control1102755019Lbl: Label 'Name';
        EmptyStringCaption_Control1102755020Lbl: Label '......................................................................................................................................................';
        EmptyStringCaption_Control1102755028Lbl: Label '......................................................................................................................................................';
        NameCaption_Control1102755029Lbl: Label 'Name';
        Signature___DateCaption_Control1102755030Lbl: Label 'Signature & Date';
        EmptyStringCaption_Control1102755031Lbl: Label '......................................................................................................................................................';
        EmptyStringCaption_Control1102755032Lbl: Label '......................................................................................................................................................';
        Prepared_by_CaptionLbl: Label 'Prepared by:';
        Authorised_by_CaptionLbl: Label 'Authorised by:';
        Approved_by_CaptionLbl: Label 'Approved by:';
}
