#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193667 "Staff Claims Voucher"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Staff Claims Voucher.rdlc';
    ApplicationArea = All;
    Caption = 'Staff Claims Voucher';
    dataset
    {
        dataitem("Payments Header"; "Staff Claims Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            column(ReportForNavId_6437; 6437) { }
            column(Payments_Header__No__; "Payments Header"."No.") { }
            column(CurrCode; CurrCode) { }
            column(StrCopyText; StrCopyText) { }
            column(Payments_Header__Cheque_No__; "Payments Header"."Cheque No.") { }
            column(Payments_Header_Payee; "Payments Header".Payee) { }
            column(Payments_Header__Payments_Header__Date; "Payments Header".Date) { }
            column(Payments_Header__Global_Dimension_1_Code_; "Payments Header"."Global Dimension 1 Code") { }
            column(Payments_Header__Shortcut_Dimension_2_Code_; "Payments Header"."Shortcut Dimension 2 Code") { }
            column(Account_No_________Payee; "Payments Header"."Account No." + ' : ' + "Payments Header".Payee) { }
            column(Payments_Header_Purpose; "Payments Header".Purpose) { }
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
            column(CurrCode_Control1102756004; CurrCode) { }
            column(STAFF_CLAIM_REQUESTCaption; STAFF_CLAIM_REQUESTCaptionLbl) { }
            column(PAYEMENT_DETAILSCaption; PAYEMENT_DETAILSCaptionLbl) { }
            column(AmountCaption; AmountCaptionLbl) { }
            column(Document_No__Caption; Document_No__CaptionLbl) { }
            column(Currency_Caption; Currency_CaptionLbl) { }
            column(Payment_To_Caption; Payment_To_CaptionLbl) { }
            column(Document_Date_Caption; Document_Date_CaptionLbl) { }
            column(Cheque_No__Caption; Cheque_No__CaptionLbl) { }
            column(Payments_Header__Global_Dimension_1_Code_Caption; "Payments Header".FieldCaption("Payments Header"."Global Dimension 1 Code")) { }
            column(Payments_Header__Shortcut_Dimension_2_Code_Caption; "Payments Header".FieldCaption("Payments Header"."Shortcut Dimension 2 Code")) { }
            column(PURPOSECaption; PURPOSECaptionLbl) { }
            column(Payee_Caption; Payee_CaptionLbl) { }
            column(Purpose_Caption; Purpose_CaptionLbl) { }
            column(TotalCaption; TotalCaptionLbl) { }
            column(Printed_By_Caption; Printed_By_CaptionLbl) { }
            column(Amount_in_wordsCaption; Amount_in_wordsCaptionLbl) { }
            column(RecipientCaption; RecipientCaptionLbl) { }
            column(Name_Caption; Name_CaptionLbl) { }
            column(Date_Caption; Date_CaptionLbl) { }
            column(Signature_Caption; Signature_CaptionLbl) { }
            column(CompanyName; CompanyInfo.Name) { }
            column(CompanyAdd; CompanyInfo.Address) { }
            column(CompanyInfoPicture; CompanyInfo.Picture) { }
            dataitem("Payment Line"; "Staff Claim Lines")
            {
                DataItemLink = No = field("No.");
                DataItemTableView = sorting("Line No.", No) order(ascending);
                column(ReportForNavId_3474; 3474) { }
                column(Payment_Line_Amount; "Payment Line".Amount) { }
                column(Account_No________Account_Name_; "Payment Line"."Account No:" + ':' + "Payment Line"."Account Name") { }
                column(Payment_Line__Payment_Line__Purpose; "Payment Line".Purpose) { }
                column(Payment_Line_Line_No_; "Payment Line"."Line No.") { }
                column(Payment_Line_No; "Payment Line".No) { }

                trigger OnAfterGetRecord()
                begin
                    DimVal.Reset();
                    DimVal.SetRange(DimVal."Global Dimension No.", 2);
                    DimVal.SetRange(DimVal.Code, "Payment Line"."Shortcut Dimension 2 Code");
                    DimValName := '';
                    if DimVal.FindFirst() then
                        DimValName := DimVal.Name;

                    TTotal := TTotal + "Payment Line".Amount;
                end;
            }
            dataitem("Approval Entry"; "Approval Entry")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = where(Status = const(Approved));
                column(ReportForNavId_1102755009; 1102755009) { }
                column(SequenceNo_ApprovalEntry; "Approval Entry"."Sequence No.") { }
                column(LastDateTimeModified_ApprovalEntry; "Approval Entry"."Last Date-Time Modified") { }
                column(ApproverID_ApprovalEntry; "Approval Entry"."Approver ID") { }
            }

            trigger OnAfterGetRecord()
            begin
                StrCopyText := '';
                if "Payments Header"."No. Printed" >= 1 then
                    StrCopyText := 'DUPLICATE';
                TTotal := 0;


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
                "Payments Header".CalcFields("Payments Header"."Total Net Amount");
                CheckReport.InitTextVariable();
                CheckReport.FormatNoText(NumberText, ("Payments Header"."Total Net Amount"), "Payments Header"."Currency Code");
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
        STAFF_CLAIM_REQUESTCaptionLbl: Label 'STAFF CLAIM REQUEST';
        PAYEMENT_DETAILSCaptionLbl: Label 'PAYEMENT DETAILS';
        AmountCaptionLbl: Label 'Amount';
        Document_No__CaptionLbl: Label 'Document No.:';
        Currency_CaptionLbl: Label 'Currency:';
        Payment_To_CaptionLbl: Label 'Payment To:';
        Document_Date_CaptionLbl: Label 'Document Date:';
        Cheque_No__CaptionLbl: Label 'Cheque No.:';
        PURPOSECaptionLbl: Label 'PURPOSE';
        Payee_CaptionLbl: Label 'Payee:';
        Purpose_CaptionLbl: Label 'Purpose:';
        TotalCaptionLbl: Label 'Total';
        Printed_By_CaptionLbl: Label 'Printed By:';
        Amount_in_wordsCaptionLbl: Label 'Amount in words';
        RecipientCaptionLbl: Label 'Recipient';
        Name_CaptionLbl: Label 'Name:';
        Date_CaptionLbl: Label 'Date:';
        Signature_CaptionLbl: Label 'Signature:';
        CompanyInfo: Record "Company Information";
}
