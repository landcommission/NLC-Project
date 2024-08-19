#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193666 "Staff Advance Voucher"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Staff Advance Voucher.rdlc';
    ApplicationArea = All;
    Caption = 'Staff Advance Voucher';
    dataset
    {
        dataitem("Payments Header"; "Staff Advance Headers")
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_6437; 6437) { }
            column(Picture; objLogos.Picture) { }
            column(From; "Payments Header".Payee) { }
            column(PF; "Payments Header"."Account No.") { }
            column(Project; "Payments Header"."Shortcut Dimension 2 Code") { }
            column(Date; "Payments Header"."Date Posted") { }
            dataitem("Payment Line"; "Staff Advance Lines")
            {
                DataItemLink = No = field("No.");
                column(ReportForNavId_3474; 3474) { }
                column(Name; "Payment Line"."Account Name") { }
                column(Type; "Payment Line"."Advance Type") { }
                column(Amount; "Payment Line".Amount) { }
                column(NumberText; NumberText[1]) { }

                trigger OnAfterGetRecord()
                begin
                    //Amount := Amount + "Payment Line".Amount;

                    CheckReport.InitTextVariable();
                    CheckReport.FormatNoText(NumberText, "Payment Line".Amount, '');
                end;

                trigger OnPreDataItem()
                begin
                    "Payment Line".Amount := 0;
                    "Payment Line".Reset();
                    "Payment Line".SetRange("Payment Line".No, "Payments Header"."No.");
                    if "Payment Line".Find('-') then
                        "Payment Line".CalcSums("Payment Line".Amount);
                    "Payment Line".Amount := "Payment Line".Amount;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                objLogos.Get();
                objLogos.CalcFields(objLogos.Picture);
                /*
                 objLogos.RESET;
                 objLogos.SETRANGE(objLogos.Code,"Payments Header"."Global Dimension 1 Code");
                IF objLogos.FIND('-') THEN BEGIN
                    objLogos.CALCFIELDS(objLogos.Picture);
                END ELSE BEGIN
                    objLogos.SETRANGE(objLogos.Default,TRUE);
                    objLogos.CALCFIELDS(objLogos.Picture);
                END;
                 */

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
        STAFF_ADVANCE_REQUESTCaptionLbl: Label 'CASH ADVANCE REQUEST';
        PAYEMENT_DETAILSCaptionLbl: Label 'PAYMENT DETAILS';
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
        objLogos: Record "Company Information";
        Amount: Decimal;
        CheckReport: Report Check;
        NumberText: array[2] of Text;
}
