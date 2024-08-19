/* #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 70005813 "Undo Purchase Receipt Line5813"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Undo Purchase Receipt Line"(Codeunit 5813)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=01212015D;
        //      Time=115735T;
        //      Modified=Yes;
        //      Version List=NAVW18.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Undo Purchase Receipt Line"(Codeunit 5813);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH PurchRcptLine DO
        //                                            IF BlanketOrderPurchaseLine.GET(
        //                                                 BlanketOrderPurchaseLine."Document Type"::"Blanket Order","Blanket Order No.","Blanket Order Line No.")
        //                                          #4..6
        //                                              BlanketOrderPurchaseLine.TESTFIELD("Buy-from Vendor No.","Buy-from Vendor No.");
        //
        //                                              IF BlanketOrderPurchaseLine."Qty. per Unit of Measure" = "Qty. per Unit of Measure" THEN
        //                                                BlanketOrderPurchaseLine."Quantity Received" := BlanketOrderPurchaseLine."Quantity Received" - Quantity
        //                                              ELSE
        //                                                BlanketOrderPurchaseLine."Quantity Received" :=
        //                                                  BlanketOrderPurchaseLine."Quantity Received" -
        //                                                  ROUND("Qty. per Unit of Measure" / BlanketOrderPurchaseLine."Qty. per Unit of Measure" * Quantity,0.00001);
        //
        //                                              BlanketOrderPurchaseLine."Qty. Received (Base)" := BlanketOrderPurchaseLine."Qty. Received (Base)" - "Quantity (Base)";
        //                                              BlanketOrderPurchaseLine.InitOutstanding;
        //                                              BlanketOrderPurchaseLine.MODIFY;
        //                                            END;
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          #1..9
        //                                                BlanketOrderPurchaseLine.l8 := BlanketOrderPurchaseLine.l8 - Quantity
        //                                              ELSE
        //                                                BlanketOrderPurchaseLine.l8 :=
        //                                                  BlanketOrderPurchaseLine.l8 -
        //                                          #14..19
        //                                        END;
        //
        //                           Target=UpdateBlanketOrder(PROCEDURE 5) }
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