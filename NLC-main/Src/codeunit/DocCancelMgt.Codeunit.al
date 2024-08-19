#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
codeunit 52193448 "Doc CancelMgt"
{



    procedure CanceSalesDoc(var Rec: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
        ReleaseDoc: Codeunit "Release Sales Document";
        ArchiveManagement: Codeunit ArchiveManagement;
    begin
        //This function cancels a sales document irrespective of the type
        //Author:Obara Jackson Odhiambo
        //Date:10th Dec 2008
        //COPYRIGHT:KOGELO DEVELOPERS
        Rec.TestField(Rec.Status, Rec.Status::Released);
        Rec.TestField(Rec.Cancelled, false);
        Rec.Mark := true;

        //new addition
        ArchiveManagement.ArchSalesDocumentNoConfirm(Rec);

        ReleaseDoc.PerformManualReopen(Rec);
        begin

            SalesLine.Reset();
            SalesLine.SetRange(SalesLine."Document Type", Rec."Document Type");
            SalesLine.SetRange(SalesLine."Document No.", Rec."No.");
            if SalesLine.Count > 0 then begin
                SalesLine.FindFirst();
                repeat
                    //check qty shipped
                    if SalesLine."Quantity Shipped" <> 0 then
                        SalesLine.Quantity := SalesLine."Quantity Shipped"
                    else begin
                        SalesLine.Quantity := 0;
                        SalesLine.Validate(SalesLine.Quantity);
                    end;
                    SalesLine."Qty. to Ship" := 0;
                    SalesLine."Qty. to Invoice" := 0;
                    SalesLine.Modify();
                until SalesLine.Next() = 0;
            end;
            //update the document to show that it was cancelled
            Rec.Cancelled := true;
            Rec."Cancelled By" := UserId;
            Rec."Cancelled Date" := Today;
            Rec.Modify();
        end;

        //ReleaseDoc.PerformManualRelease(Rec);
    end;


    procedure CancelPurchaseDoc(var Rec: Record "Purchase Header")
    var
        PurchLine: Record "Purchase Line";
        ReleaseDoc: Codeunit "Release Purchase Document";
        ArchiveManagement: Codeunit ArchiveManagement;
    begin
        //This function cancels a sales document irrespective of the type
        //Author:Obara Jackson Odhiambo
        //Date:10th Dec 2008
        //COPYRIGHT:KOGELO DEVELOPERS

        Rec.TestField(Rec.Status, Rec.Status::Released);
        Rec.TestField(Rec.Cancelled, false);

        Rec.Mark := true;

        //ReleaseDoc.PerformManualRelease(Rec);
        ArchiveManagement.ArchPurchDocumentNoConfirm(Rec);

        ReleaseDoc.PerformManualReopen(Rec);
        begin

            PurchLine.Reset();
            PurchLine.SetRange(PurchLine."Document Type", Rec."Document Type");
            PurchLine.SetRange(PurchLine."Document No.", Rec."No.");
            if PurchLine.Count > 0 then begin
                PurchLine.FindFirst();
                repeat
                    //check qty shipped
                    if PurchLine."Quantity Received" <> 0 then
                        PurchLine.Quantity := PurchLine."Quantity Received"
                    else
                        PurchLine.Quantity := 0;
                    PurchLine."Qty. to Receive" := 0;
                    PurchLine."Qty. to Invoice" := 0;
                    PurchLine.Modify();
                until PurchLine.Next() = 0;
            end;
            Rec.Cancelled := true;
            Rec."Cancelled By" := UserId;
            Rec."Cancelled Date" := Today;
            Rec.Modify();
        end;
    end;
}
