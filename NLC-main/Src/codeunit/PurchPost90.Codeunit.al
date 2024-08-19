/* #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 70000090 "Purch.-Post90"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Purch.-Post"(Codeunit 90)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=04242015D;
        //      Time=092759T;
        //      Modified=Yes;
        //      Version List=NAVW18.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Purch.-Post"(Codeunit 90);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF PostingDateExists AND (ReplacePostingDate OR ("Posting Date" = 0D)) THEN BEGIN
        //                                            "Posting Date" := PostingDate;
        //                                            VALIDATE("Currency Code");
        //                                          #4..112
        //                                                Invoice := FALSE;
        //                                                PurchLine.FINDSET;
        //                                                REPEAT
        //                                                  Invoice := (PurchLine."Quantity Received" - PurchLine."Quantity Invoiced") <> 0;
        //                                                UNTIL Invoice OR (PurchLine.NEXT = 0);
        //                                              END ELSE
        //                                                IF Invoice AND (NOT Ship) AND
        //                                          #120..187
        //                                                     (PurchLine."Qty. to Receive" <> 0)
        //                                                  THEN
        //                                                    ERROR(Text002);
        //                                                  IF ABS(PurchLine."Quantity Received" - PurchLine."Quantity Invoiced") <
        //                                                     ABS(PurchLine."Qty. to Invoice")
        //                                                  THEN BEGIN
        //                                                    PurchLine."Qty. to Invoice" := PurchLine."Quantity Received" - PurchLine."Quantity Invoiced";
        //                                                    PurchLine."Qty. to Invoice (Base)" := PurchLine."Qty. Received (Base)" - PurchLine."Qty. Invoiced (Base)";
        //                                                  END;
        //                                                  IF ABS(PurchLine.Quantity - (PurchLine."Qty. to Invoice" + PurchLine."Quantity Invoiced")) <
        //                                          #198..565
        //                                                    PurchLine.TESTFIELD("Depr. Acquisition Cost",FALSE);
        //                                                    DeprBook.TESTFIELD("G/L Integration - Maintenance",TRUE);
        //                                                  END;
        //                                                  IF PurchLine."FA Posting Type" = PurchLine."FA Posting Type"::"Acquisition Cost" THEN BEGIN
        //                                                    PurchLine.TESTFIELD("Maintenance Code",'');
        //                                                    DeprBook.TESTFIELD("G/L Integration - Acq. Cost",TRUE);
        //                                          #572..619
        //                                                END;
        //
        //                                                IF ("Document Type" = "Document Type"::Invoice) AND (PurchLine."Receipt No." <> '') THEN BEGIN
        //                                                  PurchLine."Quantity Received" := PurchLine.Quantity;
        //                                                  PurchLine."Qty. Received (Base)" := PurchLine."Quantity (Base)";
        //                                                  PurchLine."Qty. to Receive" := 0;
        //                                                  PurchLine."Qty. to Receive (Base)" := 0;
        //                                          #627..1463
        //                                                REPEAT
        //                                                  IF PurchLine.Quantity <> 0 THEN BEGIN
        //                                                    IF Receive THEN BEGIN
        //                                                      PurchLine."Quantity Received" := PurchLine."Quantity Received" + PurchLine."Qty. to Receive";
        //                                                      PurchLine."Qty. Received (Base)" := PurchLine."Qty. Received (Base)" + PurchLine."Qty. to Receive (Base)";
        //                                                    END;
        //                                                    IF Ship THEN BEGIN
        //                                          #1471..1474
        //                                                    IF Invoice THEN BEGIN
        //                                                      IF "Document Type" = "Document Type"::Order THEN BEGIN
        //                                                        IF ABS(PurchLine."Quantity Invoiced" + PurchLine."Qty. to Invoice") >
        //                                                           ABS(PurchLine."Quantity Received")
        //                                                        THEN BEGIN
        //                                                          PurchLine.VALIDATE("Qty. to Invoice",
        //                                                            PurchLine."Quantity Received" - PurchLine."Quantity Invoiced");
        //                                                          PurchLine."Qty. to Invoice (Base)" :=
        //                                                            PurchLine."Qty. Received (Base)" - PurchLine."Qty. Invoiced (Base)";
        //                                                        END;
        //                                          #1485..1560
        //                                                            TempPurchLine."Quantity Invoiced" + PurchLine."Qty. to Invoice";
        //                                                          TempPurchLine."Qty. Invoiced (Base)" :=
        //                                                            TempPurchLine."Qty. Invoiced (Base)" + PurchLine."Qty. to Invoice (Base)";
        //                                                          IF ABS(TempPurchLine."Quantity Invoiced") > ABS(TempPurchLine."Quantity Received") THEN
        //                                                            ERROR(
        //                                                              Text017,
        //                                                              TempPurchLine."Document No.");
        //                                          #1568..1697
        //                                            UpdateAnalysisView.UpdateAll(0,TRUE);
        //                                            UpdateItemAnalysisView.UpdateAll(0,TRUE);
        //                                          END;
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          #1..115
        //                                                  Invoice := (PurchLine.l8 - PurchLine."Quantity Invoiced") <> 0;
        //                                          #117..190
        //                                                  IF ABS(PurchLine.l8 - PurchLine."Quantity Invoiced") <
        //                                                     ABS(PurchLine."Qty. to Invoice")
        //                                                  THEN BEGIN
        //                                                    PurchLine."Qty. to Invoice" := PurchLine.l8 - PurchLine."Quantity Invoiced";
        //                                          #195..568
        //
        //                                                  // Adding Custom 1 &2
        //                                                  IF PurchLine."FA Posting Type" = PurchLine."FA Posting Type"::"Custom 1" THEN BEGIN
        //                                                    PurchLine.TESTFIELD("Insurance No.",'');
        //                                                    PurchLine.TESTFIELD("Depr. until FA Posting Date",FALSE);
        //                                                    PurchLine.TESTFIELD("Depr. Acquisition Cost",FALSE);
        //                                                    DeprBook.TESTFIELD("G/L Integration - Custom 1",TRUE);
        //                                                  END;
        //                                                  IF PurchLine."FA Posting Type" = PurchLine."FA Posting Type"::"Custom 2" THEN BEGIN
        //                                                    PurchLine.TESTFIELD("Insurance No.",'');
        //                                                    PurchLine.TESTFIELD("Depr. until FA Posting Date",FALSE);
        //                                                    PurchLine.TESTFIELD("Depr. Acquisition Cost",FALSE);
        //                                                    DeprBook.TESTFIELD("G/L Integration - Custom 2",TRUE);
        //                                                  END;
        //                                                   //End Adding Custom 1 &2
        //
        //
        //                                          #569..622
        //                                                  PurchLine.l8 := PurchLine.Quantity;
        //                                          #624..1466
        //                                                      PurchLine.l8 := PurchLine.l8 + PurchLine."Qty. to Receive";
        //                                          #1468..1477
        //                                                           ABS(PurchLine.l8)
        //                                                        THEN BEGIN
        //                                                          PurchLine.VALIDATE("Qty. to Invoice",
        //                                                            PurchLine.l8 - PurchLine."Quantity Invoiced");
        //                                          #1482..1563
        //                                                          IF ABS(TempPurchLine."Quantity Invoiced") > ABS(TempPurchLine.l8) THEN
        //                                          #1565..1700
        //                                        END;
        //
        //                           Target=OnRun }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF PurchLine."Document Type" IN [PurchLine."Document Type"::"Return Order",PurchLine."Document Type"::"Credit Memo"] THEN
        //                                            EXIT;
        //                                          IF (PurchLine."Blanket Order No." <> '') AND (PurchLine."Blanket Order Line No." <> 0) AND
        //                                          #4..25
        //                                                IF BlanketOrderPurchLine."Qty. per Unit of Measure" =
        //                                                   PurchLine."Qty. per Unit of Measure"
        //                                                THEN
        //                                                  BlanketOrderPurchLine."Quantity Received" :=
        //                                                    BlanketOrderPurchLine."Quantity Received" + Sign * PurchLine."Qty. to Receive"
        //                                                ELSE
        //                                                  BlanketOrderPurchLine."Quantity Received" :=
        //                                                    BlanketOrderPurchLine."Quantity Received" +
        //                                                    Sign *
        //                                                    ROUND(
        //                                                      (PurchLine."Qty. per Unit of Measure" /
        //                                          #37..43
        //                                                IF BlanketOrderPurchLine."Qty. per Unit of Measure" =
        //                                                   PurchLine."Qty. per Unit of Measure"
        //                                                THEN
        //                                                  BlanketOrderPurchLine."Quantity Received" :=
        //                                                    BlanketOrderPurchLine."Quantity Received" + Sign * PurchLine."Return Qty. to Ship"
        //                                                ELSE
        //                                                  BlanketOrderPurchLine."Quantity Received" :=
        //                                                    BlanketOrderPurchLine."Quantity Received" +
        //                                                    Sign *
        //                                                    ROUND(
        //                                                      (PurchLine."Qty. per Unit of Measure" /
        //                                          #55..81
        //                                                BlanketOrderPurchLine.InitOutstanding;
        //
        //                                                IF (BlanketOrderPurchLine.Quantity *
        //                                                    BlanketOrderPurchLine."Quantity Received" < 0) OR
        //                                                   (ABS(BlanketOrderPurchLine.Quantity) <
        //                                                    ABS(BlanketOrderPurchLine."Quantity Received"))
        //                                                THEN
        //                                                  BlanketOrderPurchLine.FIELDERROR(
        //                                                    "Quantity Received",
        //                                                    STRSUBSTNO(
        //                                                      Text023,
        //                                                      BlanketOrderPurchLine.FIELDCAPTION(Quantity)));
        //                                          #94..100
        //                                                    "Qty. Received (Base)",
        //                                                    STRSUBSTNO(
        //                                                      Text023,
        //                                                      BlanketOrderPurchLine.FIELDCAPTION("Quantity Received")));
        //
        //                                                BlanketOrderPurchLine.CALCFIELDS("Reserved Qty. (Base)");
        //                                                IF ABS(BlanketOrderPurchLine."Outstanding Qty. (Base)") <
        //                                          #108..112
        //                                                BlanketOrderPurchLine."Qty. to Invoice" :=
        //                                                  BlanketOrderPurchLine.Quantity - BlanketOrderPurchLine."Quantity Invoiced";
        //                                                BlanketOrderPurchLine."Qty. to Receive" :=
        //                                                  BlanketOrderPurchLine.Quantity - BlanketOrderPurchLine."Quantity Received";
        //                                                BlanketOrderPurchLine."Qty. to Invoice (Base)" :=
        //                                                  BlanketOrderPurchLine."Quantity (Base)" - BlanketOrderPurchLine."Qty. Invoiced (Base)";
        //                                                BlanketOrderPurchLine."Qty. to Receive (Base)" :=
        //                                                  BlanketOrderPurchLine."Quantity (Base)" - BlanketOrderPurchLine."Qty. Received (Base)";
        //
        //                                                BlanketOrderPurchLine.MODIFY;
        //                                              END;
        //                                            END;
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          #1..28
        //                                                  BlanketOrderPurchLine.l8 :=
        //                                                    BlanketOrderPurchLine.l8 + Sign * PurchLine."Qty. to Receive"
        //                                                ELSE
        //                                                  BlanketOrderPurchLine.l8 :=
        //                                                    BlanketOrderPurchLine.l8 +
        //                                          #34..46
        //                                                  BlanketOrderPurchLine.l8 :=
        //                                                    BlanketOrderPurchLine.l8 + Sign * PurchLine."Return Qty. to Ship"
        //                                                ELSE
        //                                                  BlanketOrderPurchLine.l8 :=
        //                                                    BlanketOrderPurchLine.l8 +
        //                                          #52..84
        //                                                    BlanketOrderPurchLine.l8 < 0) OR
        //                                                   (ABS(BlanketOrderPurchLine.Quantity) <
        //                                                    ABS(BlanketOrderPurchLine.l8))
        //                                                THEN
        //                                                  BlanketOrderPurchLine.FIELDERROR(
        //                                                    l8,
        //                                          #91..103
        //                                                      BlanketOrderPurchLine.FIELDCAPTION(l8)));
        //                                          #105..115
        //                                                  BlanketOrderPurchLine.Quantity - BlanketOrderPurchLine.l8;
        //                                          #117..124
        //                                        END;
        //
        //                           Target=UpdateBlanketOrderLine(PROCEDURE 21) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          TempItemChargeAssgntPurch.RESET;
        //                                          TempItemChargeAssgntPurch.DELETEALL;
        //
        //                                          #4..38
        //                                              IF NOT PurchHeader.Ship THEN
        //                                                PurchLine2."Return Qty. to Ship" := 0;
        //                                              IF ABS(PurchLine2."Qty. to Invoice") >
        //                                                 ABS(PurchLine2."Quantity Received" + PurchLine2."Qty. to Receive" +
        //                                                   PurchLine2."Return Qty. Shipped" + PurchLine2."Return Qty. to Ship" -
        //                                                   PurchLine2."Quantity Invoiced")
        //                                              THEN
        //                                                PurchLine2."Qty. to Invoice" :=
        //                                                  PurchLine2."Quantity Received" + PurchLine2."Qty. to Receive" +
        //                                                  PurchLine2."Return Qty. Shipped (Base)" + PurchLine2."Return Qty. to Ship (Base)" -
        //                                                  PurchLine2."Quantity Invoiced";
        //
        //                                          #51..139
        //
        //                                          IF InvoiceEverything AND AssignError THEN
        //                                            ERROR(Text037);
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          #1..41
        //                                                 ABS(PurchLine2.l8 + PurchLine2."Qty. to Receive" +
        //                                          #43..46
        //                                                  PurchLine2.l8 + PurchLine2."Qty. to Receive" +
        //                                          #48..142
        //                                        END;
        //
        //                           Target=CopyAndCheckItemCharge(PROCEDURE 5806) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH TempItemChargeAssgntPurch DO BEGIN
        //                                            IF (ItemChargePurchLine."Document Type" <> "Document Type") OR
        //                                               (ItemChargePurchLine."Document No." <> "Document No.") OR
        //                                          #4..8
        //                                              IF NOT PurchHeader.Ship THEN
        //                                                PurchLine2."Return Qty. to Ship" := 0;
        //                                              IF ABS(PurchLine2."Qty. to Invoice") >
        //                                                 ABS(PurchLine2."Quantity Received" + PurchLine2."Qty. to Receive" +
        //                                                   PurchLine2."Return Qty. Shipped" + PurchLine2."Return Qty. to Ship" -
        //                                                   PurchLine2."Quantity Invoiced")
        //                                              THEN
        //                                                PurchLine2."Qty. to Invoice" :=
        //                                                  PurchLine2."Quantity Received" + PurchLine2."Qty. to Receive" +
        //                                                  PurchLine2."Return Qty. Shipped (Base)" + PurchLine2."Return Qty. to Ship (Base)" -
        //                                                  PurchLine2."Quantity Invoiced";
        //                                            END;
        //                                          END;
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          #1..11
        //                                                 ABS(PurchLine2.l8 + PurchLine2."Qty. to Receive" +
        //                                          #13..16
        //                                                  PurchLine2.l8 + PurchLine2."Qty. to Receive" +
        //                                          #18..21
        //                                        END;
        //
        //                           Target=GetItemChargeLine(PROCEDURE 5809) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          // if a PurchaseLine is posted with ItemTracking then the whole quantity of
        //                                          // the regarding PurchaseLine has to be post with Item-Tracking
        //
        //                                          #4..11
        //                                          PurchLineToCheck.COPY(PurchLine);
        //                                          PurchLineToCheck.SETRANGE(Type,PurchLineToCheck.Type::Item);
        //                                          IF PurchHeader.Receive THEN BEGIN
        //                                            PurchLineToCheck.SETFILTER("Quantity Received",'<>%1',0);
        //                                            ErrorFieldCaption := PurchLineToCheck.FIELDCAPTION("Qty. to Receive");
        //                                          END ELSE BEGIN
        //                                            PurchLineToCheck.SETFILTER("Return Qty. Shipped",'<>%1',0);
        //                                          #19..62
        //                                              END;
        //                                            UNTIL PurchLineToCheck.NEXT = 0;
        //                                          END;
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          #1..14
        //                                            PurchLineToCheck.SETFILTER(l8,'<>%1',0);
        //                                          #16..65
        //                                        END;
        //
        //                           Target=CheckTrackingSpecification(PROCEDURE 46) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          WITH PurchLine DO BEGIN
        //                                            IF "Job No." <> '' THEN BEGIN
        //                                              ItemJnlLine2."Entry Type" := ItemJnlLine2."Entry Type"::"Negative Adjmt.";
        //                                          #4..13
        //                                              END;
        //                                              ItemJnlLine2."Source Type" := ItemJnlLine2."Source Type"::Customer;
        //                                              ItemJnlLine2."Discount Amount" := 0;
        //                                              IF "Quantity Received" <> 0 THEN
        //                                                GetNextItemLedgEntryNo(ItemJnlLine2);
        //
        //                                              IF QtyToBeReceived <> 0 THEN BEGIN
        //                                          #21..56
        //                                              END;
        //                                            END;
        //                                          END;
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          #1..16
        //                                              IF l8 <> 0 THEN
        //                                          #18..59
        //                                        END;
        //
        //                           Target=PostItemJrnlLineJobConsumption(PROCEDURE 59) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF PurchHeader.Receive OR PurchHeader.Ship THEN
        //                                            // item ledger entry will be created during posting in this transaction
        //                                            HasItemLedgerEntry :=
        //                                              ((PurchLine2."Qty. to Receive" + PurchLine2."Quantity Received") <> 0) OR
        //                                              ((PurchLine2."Qty. to Invoice" + PurchLine2."Quantity Invoiced") <> 0) OR
        //                                              ((PurchLine2."Return Qty. to Ship" + PurchLine2."Return Qty. Shipped") <> 0)
        //                                          ELSE
        //                                            // item ledger entry must already exist
        //                                            HasItemLedgerEntry :=
        //                                              (PurchLine2."Quantity Received" <> 0) OR
        //                                              (PurchLine2."Return Qty. Shipped" <> 0);
        //
        //                                          EXIT(HasItemLedgerEntry);
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          #1..3
        //                                              ((PurchLine2."Qty. to Receive" + PurchLine2.l8) <> 0) OR
        //                                          #5..9
        //                                              (PurchLine2.l8 <> 0) OR
        //                                          #11..13
        //                                        END;
        //
        //                           Target=ItemLedgerEntryExist(PROCEDURE 7) }
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