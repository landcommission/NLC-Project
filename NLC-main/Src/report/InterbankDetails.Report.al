#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193673 "Interbank Details"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Interbank Details.rdlc';
    ApplicationArea = All;
    Caption = 'Interbank Details';
    dataset
    {
        dataitem("InterBank Transfers"; "InterBank Transfers")
        {
            DataItemTableView = sorting(No);
            RequestFilterFields = No;
            column(ReportForNavId_5698; 5698) { }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4)) { }
            column(USERID; UserId) { }
            column(InterBank_Transfers_Date; "InterBank Transfers".Date) { }
            column(InterBank_Transfers_No; "InterBank Transfers".No) { }
            column(InterBank_Transfers_Status; "InterBank Transfers".Status) { }
            column(InterBank_Transfers__Receipt_Resp_Centre_; "InterBank Transfers"."Receipt Resp Centre") { }
            column(Receiving_Account_______Receiving_Bank_Account_Name_; "InterBank Transfers"."Receiving Account" + ':' + "InterBank Transfers"."Receiving Bank Account Name") { }
            column(InterBank_Transfers__Currency_Code_Destination_; "InterBank Transfers"."Currency Code Destination") { }
            column(InterBank_Transfers__Amount_2_; "InterBank Transfers"."Amount 2") { }
            column(InterBank_Transfers__Exch__Rate_Destination_; "InterBank Transfers"."Exch. Rate Destination") { }
            column(InterBank_Transfers__Request_Amt_LCY_; "InterBank Transfers"."Request Amt LCY") { }
            column(InterBank_Transfers__Sending_Resp_Centre_; "InterBank Transfers"."Sending Resp Centre") { }
            column(Paying_Account_______Paying__Bank_Account_Name_; "InterBank Transfers"."Paying Account" + ':' + "InterBank Transfers"."Paying  Bank Account Name") { }
            column(InterBank_Transfers__Currency_Code_Source_; "InterBank Transfers"."Currency Code Source") { }
            column(InterBank_Transfers_Amount; "InterBank Transfers".Amount) { }
            column(InterBank_Transfers__Exch__Rate_Source_; "InterBank Transfers"."Exch. Rate Source") { }
            column(InterBank_Transfers__Pay_Amt_LCY_; "InterBank Transfers"."Pay Amt LCY") { }
            column(CurrReport_PAGENO; CurrReport.PageNo()) { }
            column(Bank_and_Cash_TransferCaption; Bank_and_Cash_TransferCaptionLbl) { }
            column(InterBank_Transfers_DateCaption; "InterBank Transfers".FieldCaption("InterBank Transfers".Date)) { }
            column(InterBank_Transfers_NoCaption; "InterBank Transfers".FieldCaption("InterBank Transfers".No)) { }
            column(InterBank_Transfers_StatusCaption; "InterBank Transfers".FieldCaption("InterBank Transfers".Status)) { }
            column(EmptyStringCaption; EmptyStringCaptionLbl) { }
            column(InterBank_Transfers__Receipt_Resp_Centre_Caption; "InterBank Transfers".FieldCaption("InterBank Transfers"."Receipt Resp Centre")) { }
            column(Receiving_BankCaption; Receiving_BankCaptionLbl) { }
            column(Currency_CodeCaption; Currency_CodeCaptionLbl) { }
            column(AmountCaption; AmountCaptionLbl) { }
            column(InterBank_Transfers__Exch__Rate_Destination_Caption; "InterBank Transfers".FieldCaption("InterBank Transfers"."Exch. Rate Destination")) { }
            column(InterBank_Transfers__Request_Amt_LCY_Caption; "InterBank Transfers".FieldCaption("InterBank Transfers"."Request Amt LCY")) { }
            column(InterBank_Transfers__Sending_Resp_Centre_Caption; "InterBank Transfers".FieldCaption("InterBank Transfers"."Sending Resp Centre")) { }
            column(Paying_BankCaption; Paying_BankCaptionLbl) { }
            column(Currency_CodeCaption_Control1102756045; Currency_CodeCaption_Control1102756045Lbl) { }
            column(InterBank_Transfers_AmountCaption; "InterBank Transfers".FieldCaption("InterBank Transfers".Amount)) { }
            column(InterBank_Transfers__Exch__Rate_Source_Caption; "InterBank Transfers".FieldCaption("InterBank Transfers"."Exch. Rate Source")) { }
            column(Transferred_Amt_LCYCaption; Transferred_Amt_LCYCaptionLbl) { }
            column(Request_DetailsCaption; Request_DetailsCaptionLbl) { }
            column(Source_DetailsCaption; Source_DetailsCaptionLbl) { }
            column(Signature_Caption; Signature_CaptionLbl) { }
            column(Date_Caption; Date_CaptionLbl) { }
            column(Name_Caption; Name_CaptionLbl) { }
            column(Name_Caption_Control1102756018; Name_Caption_Control1102756018Lbl) { }
            column(Date_Caption_Control1102756019; Date_Caption_Control1102756019Lbl) { }
            column(Signature_Caption_Control1102756022; Signature_Caption_Control1102756022Lbl) { }
            column(AuthorisationsCaption; AuthorisationsCaptionLbl) { }
            column(AuthorisationsCaption_Control1102756028; AuthorisationsCaption_Control1102756028Lbl) { }
            column(Signature_Caption_Control1102756031; Signature_Caption_Control1102756031Lbl) { }
            column(Date_Caption_Control1102756034; Date_Caption_Control1102756034Lbl) { }
            column(Name_Caption_Control1102756037; Name_Caption_Control1102756037Lbl) { }
            column(RecipientCaption; RecipientCaptionLbl) { }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl) { }
            column(EmptyStringCaption_Control1102756003; EmptyStringCaption_Control1102756003Lbl) { }
            column(EmptyStringCaption_Control1102756043; EmptyStringCaption_Control1102756043Lbl) { }
            column(CompanyINfoName; CompanyINfo.Name) { }
            column(CompanyINfoPicture; CompanyINfo.Picture) { }
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
        CompanyINfo.Get();
        CompanyINfo.CalcFields(Picture);
    end;

    var
        Bank_and_Cash_TransferCaptionLbl: Label 'Bank and Cash Transfer';
        EmptyStringCaptionLbl: Label '===============================================================================================================================================';
        Receiving_BankCaptionLbl: Label 'Receiving Bank';
        Currency_CodeCaptionLbl: Label 'Currency Code';
        AmountCaptionLbl: Label 'Amount';
        Paying_BankCaptionLbl: Label 'Paying Bank';
        Currency_CodeCaption_Control1102756045Lbl: Label 'Currency Code';
        Transferred_Amt_LCYCaptionLbl: Label 'Transferred Amt LCY';
        Request_DetailsCaptionLbl: Label 'Request Details';
        Source_DetailsCaptionLbl: Label 'Source Details';
        Signature_CaptionLbl: Label 'Signature:';
        Date_CaptionLbl: Label 'Date:';
        Name_CaptionLbl: Label 'Name:';
        Name_Caption_Control1102756018Lbl: Label 'Name:';
        Date_Caption_Control1102756019Lbl: Label 'Date:';
        Signature_Caption_Control1102756022Lbl: Label 'Signature:';
        AuthorisationsCaptionLbl: Label 'Authorisations';
        AuthorisationsCaption_Control1102756028Lbl: Label 'Authorisations';
        Signature_Caption_Control1102756031Lbl: Label 'Signature:';
        Date_Caption_Control1102756034Lbl: Label 'Date:';
        Name_Caption_Control1102756037Lbl: Label 'Name:';
        RecipientCaptionLbl: Label 'Recipient';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        EmptyStringCaption_Control1102756003Lbl: Label '===============================================================================================================================================';
        EmptyStringCaption_Control1102756043Lbl: Label '===============================================================================================================================================';
        CompanyINfo: Record "Company Information";
}
