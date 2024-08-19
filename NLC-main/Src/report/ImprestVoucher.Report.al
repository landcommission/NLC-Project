#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193670 "Imprest Voucher"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Imprest Voucher.rdlc';
    ApplicationArea = All;
    Caption = 'Imprest Voucher';
    dataset
    {
        dataitem("Imprest Header"; "Imprest Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            column(ReportForNavId_6437; 6437) { }
            column(Project_Dept; "Imprest Header"."Shortcut Dimension 2 Code") { }
            column(Date; "Imprest Header"."Date Posted") { }
            column(Picture; objLogos.Picture) { }
            column(Project; Project) { }
            dataitem("Imprest Lines"; "Imprest Lines")
            {
                DataItemLink = No = field("No.");
                DataItemTableView = sorting("Line No.", No) order(ascending);
                column(ReportForNavId_3474; 3474) { }
                column(Destination; "Imprest Lines"."Destination Code") { }
            }

            trigger OnAfterGetRecord()
            begin
                objLogos.Get();
                objLogos.CalcFields(objLogos.Picture);
                /*
                objLogos.RESET;
                objLogos.SETRANGE(objLogos.Code,"Imprest Header"."Global Dimension 1 Code");
               IF objLogos.FIND('-') THEN BEGIN
                   objLogos.CALCFIELDS(objLogos.Picture);
                   //MESSAGE('FOUND PICTURE');
               END ELSE BEGIN
                   objLogos.SETRANGE(objLogos.Default,TRUE);
                   objLogos.CALCFIELDS(objLogos.Picture);
                   //MESSAGE('DEFAULT PICTURE');
               END;
                 */

                DimVal.Reset();
                DimVal.SetRange(DimVal.Code, "Imprest Header"."Shortcut Dimension 2 Code");
                if DimVal.Find('-') then
                    Project := DimVal.Name;

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
        STAFF_TRAVEL_ADVANCE_REQUESTCaptionLbl: Label 'STAFF TRAVEL ADVANCE REQUEST';
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
        EmptyStringCaptionLbl: Label '================================================================================================================================================================================================';
        RecipientCaptionLbl: Label 'Recipient';
        Name_CaptionLbl: Label 'Name:';
        Date_CaptionLbl: Label 'Date:';
        Signature_CaptionLbl: Label 'Signature:';
        objLogos: Record "Company Information";
        CompanyInfo: Record "Company Information";
        DimVal: Record "Dimension Value";
        Project: Text;
}
