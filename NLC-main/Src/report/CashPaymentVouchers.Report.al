#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193679 "Cash Payment Vouchers"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Cash Payment Vouchers.rdlc';
    ApplicationArea = All;
    Caption = 'Cash Payment Vouchers';
    dataset
    {
        dataitem("Payments Header"; "Payments Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            column(ReportForNavId_6437; 6437) { }
            column(DOCNAME; DOCNAME) { }
            column(Payments_Header__No__; "Payments Header"."No.") { }
            column(CurrCode; CurrCode) { }
            column(StrCopyText; StrCopyText) { }
            column(Payments_Header__Cheque_No__; "Payments Header"."Cheque No.") { }
            column(Payments_Header_Payee; "Payments Header".Payee) { }
            column(Payments_Header__Payments_Header__Date; "Payments Header".Date) { }
            column(Payments_Header__Global_Dimension_1_Code_; "Payments Header"."Global Dimension 1 Code") { }
            column(Payments_Header__Shortcut_Dimension_2_Code_; "Payments Header"."Shortcut Dimension 2 Code") { }
            column(USERID; UserId) { }
            column(NumberText_1_; NumberText[1]) { }
            column(TTotal; TTotal) { }
            column(TIME_PRINTED_____FORMAT_TIME_; 'TIME PRINTED:' + Format(Time))
            {
                AutoFormatType = 1;
            }
            column(DATE_PRINTED_____FORMAT_TODAY_0_4_; 'DATE PRINTED:' + Format(Today, 0, 4))
            {
                AutoFormatType = 1;
            }
            column(CurrCode_Control1102756010; CurrCode) { }
            column(CurrCode_Control1102756012; CurrCode) { }
            column(Approved_; 'Approved')
            {
                AutoFormatType = 1;
            }
            column(Approval_Status_____; 'Approval Status' + ':')
            {
                AutoFormatType = 1;
            }
            column(TIME_PRINTED_____FORMAT_TIME__Control1102755003; 'TIME PRINTED:' + Format(Time))
            {
                AutoFormatType = 1;
            }
            column(DATE_PRINTED_____FORMAT_TODAY_0_4__Control1102755004; 'DATE PRINTED:' + Format(Today, 0, 4))
            {
                AutoFormatType = 1;
            }
            column(USERID_Control1102755012; UserId) { }
            column(NumberText_1__Control1102755016; NumberText[1]) { }
            column(TTotal_Control1102755034; TTotal) { }
            column(CurrCode_Control1102755035; CurrCode) { }
            column(CurrCode_Control1102755037; CurrCode) { }
            column(VATCaption; VATCaptionLbl) { }
            column(PAYMENT_DETAILSCaption; PAYMENT_DETAILSCaptionLbl) { }
            column(AMOUNTCaption; AMOUNTCaptionLbl) { }
            column(NET_AMOUNTCaption; NET_AMOUNTCaptionLbl) { }
            column(W_TAXCaption; W_TAXCaptionLbl) { }
            column(Document_No___Caption; Document_No___CaptionLbl) { }
            column(Currency_Caption; Currency_CaptionLbl) { }
            column(Payment_To_Caption; Payment_To_CaptionLbl) { }
            column(Document_Date_Caption; Document_Date_CaptionLbl) { }
            column(Cheque_No__Caption; Cheque_No__CaptionLbl) { }
            column(Payments_Header__Global_Dimension_1_Code_Caption; "Payments Header".FieldCaption("Payments Header"."Global Dimension 1 Code")) { }
            column(Payments_Header__Shortcut_Dimension_2_Code_Caption; "Payments Header".FieldCaption("Payments Header"."Shortcut Dimension 2 Code")) { }
            column(R_CENTERCaption; R_CENTERCaptionLbl) { }
            column(PROJECTCaption; PROJECTCaptionLbl) { }
            column(TotalCaption; TotalCaptionLbl) { }
            column(Printed_By_Caption; Printed_By_CaptionLbl) { }
            column(Amount_in_wordsCaption; Amount_in_wordsCaptionLbl) { }
            column(EmptyStringCaption; EmptyStringCaptionLbl) { }
            column(EmptyStringCaption_Control1102755013; EmptyStringCaption_Control1102755013Lbl) { }
            column(Amount_in_wordsCaption_Control1102755021; Amount_in_wordsCaption_Control1102755021Lbl) { }
            column(Printed_By_Caption_Control1102755026; Printed_By_Caption_Control1102755026Lbl) { }
            column(TotalCaption_Control1102755033; TotalCaption_Control1102755033Lbl) { }
            column(Signature_Caption; Signature_CaptionLbl) { }
            column(Date_Caption; Date_CaptionLbl) { }
            column(Name_Caption; Name_CaptionLbl) { }
            column(RecipientCaption; RecipientCaptionLbl) { }
            column(CompanyInfoName; CompanyInfo.Name) { }
            column(CompanyInfoAddress; CompanyInfo.Address) { }
            column(CompanyInfoAddress2; CompanyInfo."Address 2") { }
            column(CompanyInfoPic; CompanyInfo.Picture) { }
            column(Bank; "Payments Header"."Paying Bank Account")
            {
                IncludeCaption = true;
            }
            column(BankName; "Payments Header"."Bank Name")
            {
                IncludeCaption = true;
            }
            column(PayMode; "Payments Header"."Pay Mode")
            {
                IncludeCaption = true;
            }
            column(CreationDocNo_PaymentsHeader; "Payments Header"."Creation Doc No.") { }
            dataitem("Payment Line"; "Payment Line")
            {
                DataItemLink = No = field("No.");
                DataItemTableView = sorting("Line No.", No, Type) order(ascending);
                column(ReportForNavId_3474; 3474) { }
                column(Payment_Line__Net_Amount__; "Payment Line"."Net Amount") { }
                column(Payment_Line_Amount; "Payment Line".Amount) { }
                column(Transaction_Name_______Account_No________Account_Name_____; "Payment Line"."Transaction Name" + '[' + "Payment Line"."Account No." + ':' + "Payment Line"."Account Name" + ']') { }
                column(AccountNo_PaymentLine; "Payment Line"."Account No.") { }
                column(AccountName_PaymentLine; "Payment Line"."Account Name") { }
                column(Payment_Line__Withholding_Tax_Amount_; "Payment Line"."Withholding Tax Amount") { }
                column(Payment_Line__VAT_Amount_; "Payment Line"."VAT Amount") { }
                column(Payment_Line__Global_Dimension_1_Code_; "Payment Line"."Global Dimension 1 Code") { }
                column(Payment_Line__Shortcut_Dimension_2_Code_; "Payment Line"."Shortcut Dimension 2 Code") { }
                column(Payment_Line_Line_No_; "Payment Line"."Line No.") { }
                column(Payment_Line_No; "Payment Line".No) { }
                column(Payment_Line_Type; "Payment Line".Type) { }

                trigger OnAfterGetRecord()
                begin
                    DimVal.Reset();
                    DimVal.SetRange(DimVal."Dimension Code", 'DEPARTMENT');
                    DimVal.SetRange(DimVal.Code, "Payment Line"."Shortcut Dimension 2 Code");
                    DimValName := '';
                    if DimVal.FindFirst() then
                        DimValName := DimVal.Name;

                    TTotal := TTotal + "Payment Line"."Net Amount";
                end;
            }
            dataitem(Total; "Integer")
            {
                DataItemTableView = sorting(Number) order(ascending) where(Number = const(1));
                column(ReportForNavId_3476; 3476) { }

            }
            dataitem(Summary; "Payment Line")
            {
                DataItemLink = No = field("No.");
                DataItemTableView = sorting("Line No.", No, Type) order(ascending);
                column(ReportForNavId_3570; 3570) { }

                trigger OnAfterGetRecord()
                begin
                    DimVal.Reset();
                    DimVal.SetRange(DimVal."Dimension Code", 'DEPARTMENT');
                    DimVal.SetRange(DimVal.Code, Summary."Shortcut Dimension 2 Code");
                    DimValName := '';
                    if DimVal.FindFirst() then
                        DimValName := DimVal.Name;

                    STotal := STotal + Summary."Net Amount";
                end;
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = sorting(Number) order(ascending) where(Number = const(1));
                column(ReportForNavId_5444; 5444) { }
            }
            dataitem("CshMgt Application"; "CshMgt Application")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = sorting("Line Number") order(ascending) where("Document No." = const('0'));
                column(ReportForNavId_1937; 1937) { }
            }
            dataitem("Approval Entry"; "Approval Entry")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = where(Status = const(Approved));
                column(ReportForNavId_1000000014; 1000000014) { }
                column(SequenceNo_ApprovalEntry; "Approval Entry"."Sequence No.") { }
                column(LastDateTimeModified_ApprovalEntry; "Approval Entry"."Last Date-Time Modified") { }
                column(ApproverID_ApprovalEntry; "Approval Entry"."Approver ID") { }
            }
            dataitem(CreationApprovalEntry; "Approval Entry")
            {
                DataItemLink = "Document No." = field("Creation Doc No.");
                DataItemLinkReference = "Payments Header";
                DataItemTableView = where(Status = const(Approved));
                column(ReportForNavId_1102755024; 1102755024) { }
                column(SequenceNo_CreationApprovalEntry; CreationApprovalEntry."Sequence No.") { }
                column(SenderID_CreationApprovalEntry; CreationApprovalEntry."Sender ID") { }
                column(ApproverID_CreationApprovalEntry; CreationApprovalEntry."Approver ID") { }
                column(DateTimeSentforApproval_CreationApprovalEntry; CreationApprovalEntry."Date-Time Sent for Approval") { }
                column(LastDateTimeModified_CreationApprovalEntry; CreationApprovalEntry."Last Date-Time Modified") { }

            }

            trigger OnAfterGetRecord()
            begin
                StrCopyText := '';
                if "Payments Header"."No. Printed" >= 1 then
                    StrCopyText := 'DUPLICATE';
                TTotal := 0;

                if "Payments Header"."Payment Type" <> "Payments Header"."Payment Type"::"Petty Cash" then
                    DOCNAME := 'BANK PAYMENT VOUCHER'
                else
                    DOCNAME := 'PETTY CASH VOUCHER';

                //Set currcode to Default if blank
                GLSetup.Get();
                if "Payments Header"."Currency Code" = '' then
                    CurrCode := GLSetup."LCY Code"
                else
                    CurrCode := "Payments Header"."Currency Code";

                //For Inv Curr Code
                if "Payments Header"."Invoice Currency Code" = '' then
                    InvoiceCurrCode := GLSetup."LCY Code"
                else
                    InvoiceCurrCode := "Payments Header"."Invoice Currency Code";

                //End;
                "Payments Header".CalcFields("Payments Header"."Total Payment Amount", "Payments Header"."Total Witholding Tax Amount");
                CheckReport.InitTextVariable();
                CheckReport.FormatNoText(NumberText, ("Payments Header"."Total Payment Amount" - "Payments Header"."Total Witholding Tax Amount"), '');
            end;

            trigger OnPostDataItem()
            begin
                if CurrReport.Preview = false then begin
                    "Payments Header"."No. Printed" := "Payments Header"."No. Printed" + 1;
                    "Payments Header".Modify();
                end;
            end;

            trigger OnPreDataItem()
            begin

                LastFieldNo := "Payments Header".FieldNo("Payments Header"."No.");
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
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        StrCopyText: Text[30];
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        DimVal: Record "Dimension Value";
        DimValName: Text[30];
        TTotal: Decimal;
        CheckReport: Report Check;
        NumberText: array[2] of Text[80];
        STotal: Decimal;
        InvoiceCurrCode: Code[10];
        CurrCode: Code[10];
        GLSetup: Record "General Ledger Setup";
        DOCNAME: Text[30];
        VATCaptionLbl: Label 'VAT';
        PAYMENT_DETAILSCaptionLbl: Label 'PAYMENT DETAILS';
        AMOUNTCaptionLbl: Label 'AMOUNT';
        NET_AMOUNTCaptionLbl: Label 'AMOUNT';
        W_TAXCaptionLbl: Label 'W/TAX';
        Document_No___CaptionLbl: Label 'Document No. :';
        Currency_CaptionLbl: Label 'Currency:';
        Payment_To_CaptionLbl: Label 'Payment To:';
        Document_Date_CaptionLbl: Label 'Document Date:';
        Cheque_No__CaptionLbl: Label 'Cheque No.:';
        R_CENTERCaptionLbl: Label 'R.CENTER CODE';
        PROJECTCaptionLbl: Label 'PROJECT CODE';
        TotalCaptionLbl: Label 'Total';
        Printed_By_CaptionLbl: Label 'Printed By:';
        Amount_in_wordsCaptionLbl: Label 'Amount in words';
        EmptyStringCaptionLbl: Label '================================================================================================================================================================================================';
        EmptyStringCaption_Control1102755013Lbl: Label '================================================================================================================================================================================================';
        Amount_in_wordsCaption_Control1102755021Lbl: Label 'Amount in words';
        Printed_By_Caption_Control1102755026Lbl: Label 'Printed By:';
        TotalCaption_Control1102755033Lbl: Label 'Total';
        Signature_CaptionLbl: Label 'Signature:';
        Date_CaptionLbl: Label 'Date:';
        Name_CaptionLbl: Label 'Name:';
        RecipientCaptionLbl: Label 'Recipient';
        CompanyInfo: Record "Company Information";
        BudgetLbl: Label 'Budget';
}
