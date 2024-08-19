/* #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 169000834 "Purch. Line-Reserve99000834"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Purch. Line-Reserve"(Codeunit 99000834)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=06272015D;
        //      Time=151552T;
        //      Modified=Yes;
        //      Version List=NAVW18.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Purch. Line-Reserve"(Codeunit 99000834);
        //    }
        //    CHANGES
        //    {
        //      { Insertion         ;InsertAfter=VerifyPurchLine(PROCEDURE 22);
        //                           ChangedElements=PROCEDURECollection
        //                           {
        //                             PROCEDURE CallItemTrackingS11@1000000001(VAR PurchLine@1003 : Record "Store Requistion Lines");
        //                             VAR
        //                               TrackingSpecification@1001 : Record "Tracking Specification";
        //                               ItemTrackingForm@1002 : Page "Item Tracking Lines";
        //                             BEGIN
        //                               InitTrackingSpecificationS11(PurchLine,TrackingSpecification);
        //                               IF (PurchLine."Lot No." <> '')    //To continue from here DENNIS
        //                               THEN
        //                                 ItemTrackingForm.SetFormRunMode(2); // Combined shipment/receipt
        //
        //                               ItemTrackingForm.SetSource(TrackingSpecification,PurchLine."Last Date of Issue");
        //                               //ItemTrackingForm.SetInbound(PurchLine.IsInbound);
        //                               ItemTrackingForm.RUNMODAL;
        //                             END;
        //
        //                             PROCEDURE CallItemTracking2S11@1000000000(VAR PurchLine@1000 : Record "Store Requistion Lines";SecondSourceQuantityArray@1001 : ARRAY [3] OF Decimal);
        //                             VAR
        //                               TrackingSpecification@1002 : Record "Tracking Specification";
        //                               ItemTrackingForm@1003 : Page "Item Tracking Lines";
        //                             BEGIN
        //                               InitTrackingSpecificationS11(PurchLine,TrackingSpecification);
        //                               ItemTrackingForm.SetSource(TrackingSpecification,PurchLine."Last Date of Issue");
        //                               ItemTrackingForm.SetSecondSourceQuantity(SecondSourceQuantityArray);
        //                               ItemTrackingForm.RUNMODAL;
        //                             END;
        //
        //                             PROCEDURE InitTrackingSpecificationS11@1000000003(VAR PurchLine@1001 : Record "Store Requistion Lines";VAR TrackingSpecification@1003 : Record "Tracking Specification");
        //                             BEGIN
        //                               TrackingSpecification.INIT;
        //                               TrackingSpecification."Source Type" := DATABASE::Table39005885;
        //                               WITH PurchLine DO BEGIN
        //                                 TrackingSpecification."Item No." := "No.";
        //                                 TrackingSpecification."Location Code" :=PurchLine."Issuing Store";
        //                                 TrackingSpecification.Description := Description;
        //                               //  TrackingSpecification."Variant Code" := "Variant Code";
        //                               //  TrackingSpecification."Source Subtype" := "Document Type";
        //                                 TrackingSpecification."Source ID" :=PurchLine."Bin Code";
        //                                 TrackingSpecification."Source Batch Name" := '';
        //                                 TrackingSpecification."Source Prod. Order Line" := 0;
        //                                 TrackingSpecification."Source Ref. No." := "Line No.";
        //                                 TrackingSpecification."Quantity (Base)" := "Qty in store";
        //                                 TrackingSpecification."Qty. to Invoice (Base)" := "Quantity Requested";
        //                                 TrackingSpecification."Qty. to Invoice" := "Quantity Requested";
        //                                 TrackingSpecification."Quantity Invoiced (Base)" := "Quantity Requested";;
        //                                 TrackingSpecification."Qty. per Unit of Measure" := 1;
        //                                 TrackingSpecification."Bin Code" := "Bin Code";
        //
        //                                   TrackingSpecification."Qty. to Handle (Base)" := "Quantity Requested";
        //                                   TrackingSpecification."Quantity Handled (Base)" := "Quantity Requested";
        //                                   TrackingSpecification."Qty. to Handle" := "Quantity Requested";
        //                               END;
        //                             END;
        //
        //                           }
        //                            }
        //    }
        //    CODE
        //    {
        //
        //      BEGIN
        //      END.
        //    }
        //  }
        //
        //

    end;
}
 */