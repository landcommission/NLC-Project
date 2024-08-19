#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193608 "Reconciliations - Summary Ch"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Reconciliations - Summary Ch.rdlc';
    ApplicationArea = All;
    Caption = 'Reconciliations - Summary Ch';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        TotalFor: Label 'Total for ';
        SelectedPeriod: Date;
        Trans: Record "Bank Bal. Alert Buffer";
        BalanceBF: Decimal;
        TotalEntryExits: Decimal;
        TotalEVariations: Decimal;
        TotalDVariations: Decimal;
        TransR: Record "Bank Bal. Alert Buffer";
        CompanyInfo: Record "Company Information";
        Reconciliation___SummaryCaptionLbl: Label 'Reconciliation - Summary';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        AmountCaptionLbl: Label 'Amount';
        DescriptionCaptionLbl: Label 'Description';
        CodeCaptionLbl: Label 'Code';
        Gross_VariationCaptionLbl: Label 'Gross Variation';
        Balance_BFCaptionLbl: Label 'Balance BF';
        Entry_ExitsCaptionLbl: Label 'Entry/Exits';
        Prepared_by_CaptionLbl: Label 'Prepared by:';
        NameCaptionLbl: Label 'Name';
        EmptyStringCaptionLbl: Label '......................................................................................................................................................';
        EmptyStringCaption_Control1102755033Lbl: Label '......................................................................................................................................................';
        Authorised_by_CaptionLbl: Label 'Authorised by:';
        NameCaption_Control1102755037Lbl: Label 'Name';
        EmptyStringCaption_Control1102755038Lbl: Label '......................................................................................................................................................';
        Approved_by_CaptionLbl: Label 'Approved by:';
        NameCaption_Control1102755040Lbl: Label 'Name';
        Signature___DateCaptionLbl: Label 'Signature & Date';
        EmptyStringCaption_Control1102755042Lbl: Label '......................................................................................................................................................';
        Signature___DateCaption_Control1102755043Lbl: Label 'Signature & Date';
        EmptyStringCaption_Control1102755044Lbl: Label '......................................................................................................................................................';
        Signature___DateCaption_Control1102755045Lbl: Label 'Signature & Date';
        EmptyStringCaption_Control1102755046Lbl: Label '......................................................................................................................................................';
}
