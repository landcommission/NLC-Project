#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193665 "Posted Staff Advance Surrender"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Posted Staff Advance Surrender.rdlc';
    ApplicationArea = All;
    Caption = 'Posted Staff Advance Surrender';
    dataset
    {
        dataitem("Staff Advance Surrender Header"; "Staff Advance Surrender Header")
        {
            DataItemTableView = sorting(No) order(ascending);
            RequestFilterFields = No;
            column(ReportForNavId_8154; 8154) { }
            column(Staff_Advance_Surrender_Header_No; "Staff Advance Surrender Header".No) { }
            column(StrCopyText; StrCopyText) { }
            column(Staff_Advance_Surrender_Header__Imprest_Issue_Doc__No_; "Staff Advance Surrender Header"."Imprest Issue Doc. No") { }
            column(Account_No___________CustName; "Staff Advance Surrender Header"."Account No." + ':   ' + CustName) { }
            column(Staff_Advance_Surrender_Header_Amount; "Staff Advance Surrender Header".Amount) { }
            column(Staff_Advance_Surrender_Header__Global_Dimension_1_Code_; "Staff Advance Surrender Header"."Global Dimension 1 Code") { }
            column(Staff_Advance_Surrender_Header__Shortcut_Dimension_2_Code_; "Staff Advance Surrender Header"."Global Dimension 2 Code") { }
            column(Staff_Advance_Surrender_Header__Staff_Advance_Surrender_Header___Surrender_Date_; "Staff Advance Surrender Header"."Surrender Date") { }
            column(Staff_Advance_Surrender_Header__Currency_Code_; "Staff Advance Surrender Header"."Currency Code") { }
            column(STAFF_ADVANCE_SURRENDERCaption; STAFF_ADVANCE_SURRENDERCaptionLbl) { }
            column(Issue_Doc__No_Caption; Issue_Doc__No_CaptionLbl) { }
            column(Name_Caption; Name_CaptionLbl) { }
            column(Total_Amount_IssuedCaption; Total_Amount_IssuedCaptionLbl) { }
            column(Staff_Advance_Surrender_Header__Global_Dimension_1_Code_Caption; "Staff Advance Surrender Header".FieldCaption("Staff Advance Surrender Header"."Global Dimension 1 Code")) { }
            column(Staff_Advance_Surrender_Header__Shortcut_Dimension_2_Code_Caption; "Staff Advance Surrender Header".FieldCaption("Staff Advance Surrender Header"."Global Dimension 2 Code")) { }
            column(Date_Caption; Date_CaptionLbl) { }
            column(Staff_Advance_Surrender_Header__Currency_Code_Caption; "Staff Advance Surrender Header".FieldCaption("Staff Advance Surrender Header"."Currency Code")) { }
            column(PAYMENT_DETAILSCaption; PAYMENT_DETAILSCaptionLbl) { }
            column(ACTUAL_SPENTCaption; ACTUAL_SPENTCaptionLbl) { }
            column(CASH_SURRENDERCaption; CASH_SURRENDERCaptionLbl) { }
            column(Difference_StaffAdvanceSurrenderHeader; "Staff Advance Surrender Header".Difference) { }
            column(Staff_Advance_Surrender_Header_Cheque; "Staff Advance Surrender Header"."Cheque No") { }
            column(Staff_Advance_Surrender_Header_Pay_Mode; "Staff Advance Surrender Header"."Pay Mode") { }
            column(Staff_Advance_Surrender_Header_Bank_Code; "Staff Advance Surrender Header"."Bank Code") { }
            column(Staff_Advance_Surrender_Header_Account_Name; "Staff Advance Surrender Header"."Account Name") { }
            column(Staff_Advance_Surrender_Header_Function_Name; "Staff Advance Surrender Header"."Function Name") { }
            column(Staff_Advance_Surrender_Header_Budget_Center_Name; "Staff Advance Surrender Header"."Budget Center Name") { }
            column(CompanyName; CompanyInfo.Name) { }
            column(CompanyAdd; CompanyInfo.Address) { }
            column(CompanyPicture; CompanyInfo.Picture) { }
            dataitem("Staff Advanc Surrender Details"; "Staff Advanc Surrender Details")
            {
                DataItemLink = "Surrender Doc No." = field(No);
                DataItemTableView = sorting("Surrender Doc No.", "Line No.") order(ascending);
                column(ReportForNavId_8861; 8861) { }
                column(Staff_Advanc_Surrender_Details_Account_No; "Staff Advanc Surrender Details"."Account No:") { }
                column(Staff_Advanc_Surrender_Details__Account_Name_; "Staff Advanc Surrender Details"."Account Name") { }
                column(Staff_Advanc_Surrender_Details__Actual_Spent_; "Staff Advanc Surrender Details"."Actual Spent") { }
                column(Staff_Advanc_Surrender_Details__Cash_Receipt_Amount_; "Staff Advanc Surrender Details"."Cash Receipt Amount") { }
                column(Staff_Advanc_Surrender_Details__Actual_Spent__Control1000000000; "Staff Advanc Surrender Details"."Actual Spent") { }
                column(TIME_PRINTED_____FORMAT_TIME_; 'TIME PRINTED:' + Format(Time))
                {
                    AutoFormatType = 1;
                }
                column(DATE_PRINTED_____FORMAT_TODAY_0_4_; 'DATE PRINTED:' + Format(Today, 0, 4))
                {
                    AutoFormatType = 1;
                }
                column(USERID; UserId) { }
                column(Staff_Advanc_Surrender_Details__Currency_Code_; "Staff Advanc Surrender Details"."Currency Code") { }
                column(NumberText_1_; NumberText[1]) { }
                column(Staff_Advanc_Surrender_Details__Cash_Receipt_Amount__Control1102756007; "Staff Advanc Surrender Details"."Cash Receipt Amount") { }
                column(TotalCaption; TotalCaptionLbl) { }
                column(Date_Caption_Control1102755030; Date_Caption_Control1102755030Lbl) { }
                column(Name_Caption_Control1102755034; Name_Caption_Control1102755034Lbl) { }
                column(Approved_By_Caption; Approved_By_CaptionLbl) { }
                column(Name_Caption_Control1102755036; Name_Caption_Control1102755036Lbl) { }
                column(Date_Caption_Control1102755037; Date_Caption_Control1102755037Lbl) { }
                column(Signature_Caption; Signature_CaptionLbl) { }
                column(Printed_By_Caption; Printed_By_CaptionLbl) { }
                column(Prepared_By_Caption; Prepared_By_CaptionLbl) { }
                column(Signature_Caption_Control1102755042; Signature_Caption_Control1102755042Lbl) { }
                column(I_confirm_that_the_above_are_legitimate_business_expenses_and_have_not_been_claimed_before_Caption; I_confirm_that_the_above_are_legitimate_business_expenses_and_have_not_been_claimed_before_CaptionLbl) { }
                column(EmptyStringCaption; EmptyStringCaptionLbl) { }
                column(Approvals_Caption; Approvals_CaptionLbl) { }
                column(Amount_in_wordsCaption; Amount_in_wordsCaptionLbl) { }
                column(Staff_Advanc_Surrender_Details_Surrender_Doc_No_; "Staff Advanc Surrender Details"."Surrender Doc No.") { }
                column(Staff_Advanc_Surrender_Details_Line_No_; "Staff Advanc Surrender Details"."Line No.") { }
                column(Staff_Advanc_Surrender_Details_Amount; "Staff Advanc Surrender Details".Amount) { }
                column(Staff_Advanc_Surrender_Details_Difference; "Staff Advanc Surrender Details".Difference) { }
            }
            dataitem("Approval Entry"; "Approval Entry")
            {
                DataItemLink = "Document No." = field(No);
                DataItemTableView = where("Document Type" = const(AdvSurr), Status = const(Approved));
                column(ReportForNavId_1000000014; 1000000014) { }
                column(ApproverID_ApprovalEntry; "Approval Entry"."Approver ID") { }
                column(LastDateTimeModified_ApprovalEntry; "Approval Entry"."Last Date-Time Modified") { }
                column(Sequence_No; "Approval Entry"."Sequence No.") { }
            }

            trigger OnAfterGetRecord()
            begin

                StrCopyText := '';
                if "Staff Advance Surrender Header"."No. Printed" >= 1 then
                    StrCopyText := 'DUPLICATE';

                if Cust.Get("Staff Advance Surrender Header"."Account No.") then
                    CustName := Cust.Name;

                AmountRefundable := 0;
                "Staff Advance Surrender Header".CalcFields("Staff Advance Surrender Header".Difference);
                AmountRefundable := "Staff Advance Surrender Header".Difference;
                if AmountRefundable < 0 then
                    AmountRefundable := AmountRefundable * -1;

                //Amount into words
                CheckReport.InitTextVariable();
                CheckReport.FormatNoText(NumberText, AmountRefundable, '');
            end;

            trigger OnPostDataItem()
            begin
                if CurrReport.Preview = false then begin
                    "Staff Advance Surrender Header"."No. Printed" := "Staff Advance Surrender Header"."No. Printed" + 1;
                    "Staff Advance Surrender Header".Modify();
                end;
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := "Staff Advance Surrender Header".FieldNo("Staff Advance Surrender Header".No);
                // "Imprest Surrender Header".SETRANGE("Imprest Surrender Header".Posted,TRUE);
                CompanyInfo.Get();
                CompanyInfo.CalcFields(Picture);
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        Cust: Record Customer;
        CustName: Text[250];
        CheckReport: Report Check;
        NumberText: array[2] of Text[80];
        StrCopyText: Text[30];
        STAFF_ADVANCE_SURRENDERCaptionLbl: Label 'STAFF ADVANCE SURRENDER';
        Issue_Doc__No_CaptionLbl: Label 'Issue Doc. No.';
        Name_CaptionLbl: Label 'Name:';
        Total_Amount_IssuedCaptionLbl: Label 'Total Amount Issued';
        Date_CaptionLbl: Label 'Date:';
        PAYMENT_DETAILSCaptionLbl: Label 'PAYMENT DETAILS';
        ACTUAL_SPENTCaptionLbl: Label 'ACTUAL SPENT';
        CASH_SURRENDERCaptionLbl: Label 'CASH SURRENDER';
        TotalCaptionLbl: Label 'Total';
        Date_Caption_Control1102755030Lbl: Label 'Date:';
        Name_Caption_Control1102755034Lbl: Label 'Name:';
        Approved_By_CaptionLbl: Label 'Approved By:';
        Name_Caption_Control1102755036Lbl: Label 'Name:';
        Date_Caption_Control1102755037Lbl: Label 'Date:';
        Signature_CaptionLbl: Label 'Signature:';
        Printed_By_CaptionLbl: Label 'Printed By:';
        Prepared_By_CaptionLbl: Label 'Prepared By:';
        Signature_Caption_Control1102755042Lbl: Label 'Signature:';
        I_confirm_that_the_above_are_legitimate_business_expenses_and_have_not_been_claimed_before_CaptionLbl: Label 'I confirm that the above are legitimate business expenses and have not been claimed before.';
        EmptyStringCaptionLbl: Label '================================================================================================================================================================================================';
        Approvals_CaptionLbl: Label 'Approvals:';
        Amount_in_wordsCaptionLbl: Label 'Amount in words';
        AmountRefundable: Decimal;
        CompanyInfo: Record "Company Information";
}
