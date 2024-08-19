#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50129 pageextension50129 extends "Check Availability"
{
    var
        SalesSetup: Record "Sales & Receivables Setup";
        OldItemNetChange: Decimal;
        OldSalesLine: Record "Sales Line";
        OldTransLine: Record "Transfer Line";
        UseOrderPromise: Boolean;
        ItemNo: Code[20];
        QtyPerUnitOfMeasure: Decimal;
        NewItemNetChange: Decimal;
        OldItemShipmentDate: Date;
        Item2: Record Item;
        InitialQtyAvailable: Decimal;
        ItemNetChange: Decimal;
        SetupDataIsPresent: Boolean;
        AvailToPromise: Codeunit "Available to Promise";
        CompanyInfo: Record "Company Information";
        AvailableQty: Decimal;

    procedure SalesLineShowWarning(SalesLine: Record "Sales Line"): Boolean
    begin
        if SalesLine."Drop Shipment" then
            exit(false);
        SalesSetup.Get();
        if not SalesSetup."Stockout Warning" then
            exit(false);
        OldItemNetChange := 0;
        OldSalesLine := SalesLine;
        if OldSalesLine.Find() then // Find previous quantity
            if (OldSalesLine."Document Type" = OldSalesLine."Document Type"::Order) and
               (OldSalesLine."No." = SalesLine."No.") and
               (OldSalesLine."Variant Code" = SalesLine."Variant Code") and
               (OldSalesLine."Location Code" = SalesLine."Location Code") and
               (OldSalesLine."Bin Code" = SalesLine."Bin Code") and
               not OldSalesLine."Drop Shipment"
            then
                OldItemNetChange := -OldSalesLine."Outstanding Qty. (Base)";

        if SalesLine."Document Type" = SalesLine."Document Type"::Order then
            UseOrderPromise := true;
        exit(
          ShowWarning(
            SalesLine."No.",
            SalesLine."Variant Code",
            SalesLine."Location Code",
            SalesLine."Unit of Measure Code",
            SalesLine."Qty. per Unit of Measure",
            -SalesLine."Outstanding Quantity",
            OldItemNetChange,
            SalesLine."Shipment Date",
            OldSalesLine."Shipment Date"));
    end;

    local procedure ShowWarning(ItemNo2: Code[20]; ItemVariantCode: Code[10]; ItemLocationCode: Code[10]; UnitOfMeasureCode2: Code[10]; QtyPerUnitOfMeasure2: Decimal; NewItemNetChange2: Decimal; OldItemNetChange2: Decimal; ShipmentDate: Date; OldShipmentDate: Date): Boolean
    begin
        ItemNo := ItemNo2;
        //UnitOfMeasureCode := UnitOfMeasureCode2;
        QtyPerUnitOfMeasure := QtyPerUnitOfMeasure2;
        NewItemNetChange := NewItemNetChange2;
        OldItemNetChange := ConvertQty(OldItemNetChange2);
        OldItemShipmentDate := OldShipmentDate;

        if NewItemNetChange >= 0 then
            exit(false);

        Rec.Get(ItemNo);
        Rec.SetRange(Rec."No.", Rec."No.");
        Rec.SetRange(Rec."Variant Filter", ItemVariantCode);
        Rec.SetRange(Rec."Location Filter", ItemLocationCode);
        Rec.SetRange(Rec."Drop Shipment Filter", false);

        if UseOrderPromise then
            Rec.SetRange(Rec."Date Filter", 0D, ShipmentDate)
        else
            Rec.SetRange(Rec."Date Filter", 0D, WorkDate());

        Item2.Copy(Rec);

        Calculate();
        exit(InitialQtyAvailable + ItemNetChange < 0);
    end;

    local procedure ConvertQty(Qty: Decimal): Decimal
    begin
        if QtyPerUnitOfMeasure = 0 then
            QtyPerUnitOfMeasure := 1;
        exit(Round(Qty / QtyPerUnitOfMeasure, 0.00001));
    end;

    local procedure Calculate()
    begin
        if not SetupDataIsPresent then
            GetSetupData();

        /* AvailToPromise.QtyAvailabletoPromise(
          Rec,GrossReq,SchedRcpt,Rec.GetRangemax(Rec."Date Filter"),
          CompanyInfo."Check-Avail. Time Bucket",CompanyInfo."Check-Avail. Period Calc.");

        EarliestAvailDate :=
          AvailToPromise.EarliestAvailabilityDate(
            Rec,-NewItemNetChange,Rec.GetRangemax(Rec."Date Filter"),-OldItemNetChange,OldItemShipmentDate,AvailableQty,
            CompanyInfo."Check-Avail. Time Bucket",CompanyInfo."Check-Avail. Period Calc.");

        if not UseOrderPromise then
          SchedRcpt := 0;

        Rec.CalcFields(Rec.Inventory,Rec."Reserved Qty. on Inventory");
        InventoryQty := ConvertQty(Rec.Inventory - Rec."Reserved Qty. on Inventory");
        GrossReq :=  ConvertQty(GrossReq);
        SchedRcpt := ConvertQty(SchedRcpt);

        ItemNetChange := 0;
        if Rec."No." = ItemNo then begin
          ItemNetChange := NewItemNetChange;
          GrossReq := GrossReq + OldItemNetChange;
        end;

        InitialQtyAvailable := InventoryQty + SchedRcpt - GrossReq; */
    end;

    procedure GetSetupData()
    begin
        CompanyInfo.Get();
        SetupDataIsPresent := true;
    end;
}
