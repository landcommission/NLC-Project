#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193681 "Update Central Payment"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update Central Payment.rdlc';
    ApplicationArea = All;
    Caption = 'Update Central Payment';
    dataset
    {
        dataitem("Central Payment"; "Central Payment")
        {
            column(ReportForNavId_1102755000; 1102755000) { }

            trigger OnAfterGetRecord()
            begin
                case "Central Payment"."Table ID" of
                    //Payment Voucher and Petty Cash
                    Database::"Payments Header":
                        begin
                            PaymentsHeader.Reset();
                            PaymentsHeader.SetRange(PaymentsHeader."No.", "Central Payment"."Document No.");
                            if PaymentsHeader.FindFirst() then
                                if PaymentsHeader.Posted = true then begin
                                    "Central Payment".DocumentPosted := true;
                                    "Central Payment".Modify();
                                end
                        end;

                    //Imprests
                    Database::"Imprest Header":
                        begin
                            ImprestHeader.Reset();
                            ImprestHeader.SetRange(ImprestHeader."No.", "Central Payment"."Document No.");
                            if ImprestHeader.FindFirst() then
                                if ImprestHeader.Posted = true then begin
                                    "Central Payment".DocumentPosted := true;
                                    "Central Payment".Modify();
                                end
                        end;

                    //staff advance
                    Database::"Staff Advance Header":
                        begin
                            StaffAdvance.Reset();
                            StaffAdvance.SetRange(StaffAdvance."No.", "Central Payment"."Document No.");
                            if StaffAdvance.FindFirst() then
                                if StaffAdvance.Posted = true then begin
                                    "Central Payment".DocumentPosted := true;
                                    "Central Payment".Modify();
                                end

                        end;

                    //Staff Advance Surrender Header
                    Database::"Staff Advance Surrender Header":
                        begin
                            StaffAdvanceSurr.Reset();
                            StaffAdvanceSurr.SetRange(StaffAdvanceSurr.No, "Central Payment"."Document No.");
                            if StaffAdvanceSurr.FindFirst() then
                                if StaffAdvanceSurr.Posted = true then begin
                                    "Central Payment".DocumentPosted := true;
                                    "Central Payment".Modify();
                                end

                        end;


                    //Imprest Surrender
                    Database::"Imprest Surrender Header":
                        begin
                            ImprestSurr.Reset();
                            ImprestSurr.SetRange(ImprestSurr.No, "Central Payment"."Document No.");
                            if ImprestSurr.FindFirst() then
                                if ImprestSurr.Posted = true then begin
                                    "Central Payment".DocumentPosted := true;
                                    "Central Payment".Modify();
                                end

                        end;
                    //Interbank Transfer
                    Database::"InterBank Transfers":
                        begin
                            Interbank.Reset();
                            Interbank.SetRange(Interbank.No, "Central Payment"."Document No.");
                            if Interbank.FindFirst() then
                                if Interbank.Posted = true then begin
                                    "Central Payment".DocumentPosted := true;
                                    "Central Payment".Modify();
                                end

                        end;

                    //staff claims
                    Database::"Staff Claims Header":
                        begin
                            StaffClaim.Reset();
                            StaffClaim.SetRange(StaffClaim."No.", "Central Payment"."Document No.");
                            if StaffClaim.FindFirst() then
                                if StaffClaim.Posted = true then begin
                                    "Central Payment".DocumentPosted := true;
                                    "Central Payment".Modify();
                                end

                        end;


                    else
                        exit;
                end;
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
        SalesHeader: Record "Sales Header";
        PurchHeader: Record "Purchase Header";
        PaymentsHeader: Record "Payments Header";
        ImprestHeader: Record "Imprest Header";
        SRHeader: Record "Store Requistion Header";
        ImprestSurr: Record "Imprest Surrender Header";
        Interbank: Record "InterBank Transfers";
        StaffAdvance: Record "Staff Advance Header";
        StaffAdvanceSurr: Record "Staff Advance Surrender Header";
        StaffClaim: Record "Staff Claims Header";


    procedure GetPostedDocStatus()
    begin
    end;
}
