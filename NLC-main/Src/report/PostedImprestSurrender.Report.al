#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193671 "Posted Imprest Surrender"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Posted Imprest Surrender.rdlc';
    ApplicationArea = All;
    Caption = 'Posted Imprest Surrender';
    dataset
    {
        dataitem("Imprest Surrender Header"; "Imprest Surrender Header")
        {
            RequestFilterFields = No;
            column(ReportForNavId_8431; 8431) { }
            column(Picture; objLogos.Picture) { }
            column(PF; "Imprest Surrender Header"."Account No.") { }
            column(From; "Imprest Surrender Header"."Account Name") { }
            column(Date; "Imprest Surrender Header"."Date Posted") { }
            dataitem("Imprest Surrender Details"; "Imprest Surrender Details")
            {
                DataItemLink = "Surrender Doc No." = field(No);
                column(ReportForNavId_9509; 9509) { }
                column(Purp; "Imprest Surrender Header"."Account Name") { }
                column(Amount; "Imprest Surrender Header".Amount) { }
            }
            dataitem("Imprest Lines"; "Imprest Lines")
            {
                DataItemLink = No = field("Imprest Issue Doc. No");
                column(ReportForNavId_7; 7) { }
                column(Purpose; "Imprest Lines"."Account Name") { }
            }

        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        TRAVEL_ADVANCE_SURRENDERCaptionLbl: Label 'TRAVEL ADVANCE SURRENDER';
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
        objLogos: Record "Company Information";
        AdvanceDetails: Text;
        Lines: Record "Imprest Lines";
}
