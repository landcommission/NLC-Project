#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193705 "Prod. Order - Shortage List2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Prod. Order - Shortage List2.rdlc';
    Caption = 'Prod. Order - Shortage List';
    ApplicationArea = All;

    dataset
    {
        dataitem("Production Order"; "Production Order")
        {
            DataItemTableView = sorting(Status, "No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = Status, "No.", "Date Filter";
            column(ReportForNavId_4824; 4824) { }
            column(TodayFormatted; Format(Today, 0, 4)) { }
            column(CompanyName; CompanyName) { }
            column(Status_ProdOrder; "Production Order".Status)
            {
                IncludeCaption = false;
            }
            column(No_ProdOrder; "Production Order"."No.")
            {
                IncludeCaption = true;
            }
            column(Desc_ProdOrder; "Production Order".Description)
            {
                IncludeCaption = true;
            }
            column(DueDate_ProdOrder; Format("Production Order"."Due Date")) { }
            column(ShortageListCaption; ShortageListCaptionLbl) { }
            column(PageNoCaption; PageNoCaptionLbl) { }
            column(DueDateCaption; DueDateCaptionLbl) { }
            column(NeededQtyCaption; NeededQtyCaptionLbl) { }
            column(CompItemScheduledNeedQtyCaption; CompItemScheduledNeedQtyCaptionLbl) { }
            column(CompItemInventoryCaption; CompItemInventoryCaptionLbl) { }
            column(RemainingQtyBaseCaption; RemainingQtyBaseCaptionLbl) { }
            column(RemQtyBaseCaption; RemQtyBaseCaptionLbl) { }
            column(ReceiptQtyCaption; ReceiptQtyCaptionLbl) { }
            column(QtyonPurchOrderCaption; QtyonPurchOrderCaptionLbl) { }
            column(QtyonSalesOrderCaption; QtyonSalesOrderCaptionLbl) { }
            column(Quantity_ProductionOrder; "Production Order".Quantity) { }
            column(No_ProductionOrder; "Production Order"."No.") { }
            column(Description_ProductionOrder; "Production Order".Description) { }
            dataitem("Prod. Order Line"; "Prod. Order Line")
            {
                DataItemLink = Status = field(Status), "Prod. Order No." = field("No.");
                DataItemTableView = sorting(Status, "Prod. Order No.", "Line No.");
                PrintOnlyIfDetail = true;
                column(ReportForNavId_3581; 3581) { }
                column(LineNo_ProdOrderLine; "Prod. Order Line"."Line No.") { }
                dataitem("Prod. Order Component"; "Prod. Order Component")
                {
                    DataItemLink = Status = field(Status), "Prod. Order No." = field("Prod. Order No."), "Prod. Order Line No." = field("Line No.");
                    DataItemTableView = sorting(Status, "Prod. Order No.", "Prod. Order Line No.", "Line No.");
                    column(ReportForNavId_7771; 7771) { }
                    column(CompItemInventory; CompItem.Inventory)
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    column(CompItemSchdldNeedQty; CompItem."Scheduled Need (Qty.)")
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    column(NeededQuantity; NeededQty)
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    column(ItemNo_ProdOrderComp; "Prod. Order Component"."Item No.")
                    {
                        IncludeCaption = true;
                    }
                    column(CompItemInvRemQtyBase; QtyOnHandAfterProd)
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    column(Desc_ProdOrderComp; "Prod. Order Component".Description)
                    {
                        IncludeCaption = true;
                    }
                    column(CompItemSchdldRcptQty; CompItem."Scheduled Receipt (Qty.)")
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    column(CompItemQtyonPurchOrder; CompItem."Qty. on Purch. Order")
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    column(CompItemQtyonSalesOrder; CompItem."Qty. on Sales Order")
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    column(RemQtyBase_ProdOrderComp; RemainingQty)
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    dataitem(Item; Item)
                    {
                        DataItemLink = "No." = field("Item No.");
                        column(ReportForNavId_1102755000; 1102755000) { }
                        column(Base_UOM; Items."Base Unit of Measure") { }
                        dataitem("Production BOM Line"; "Production BOM Line")
                        {
                            DataItemLink = "Production BOM No." = field("Production BOM No.");
                            column(ReportForNavId_1102755001; 1102755001) { }
                            column(No_ProductionBOMLine; "Production BOM Line"."No.") { }
                            column(Description_ProductionBOMLine; "Production BOM Line".Description) { }
                            column(ItemsInventory; ItemsInventory) { }
                            column(UnitofMeasureCode_ProductionBOMLine; "Production BOM Line"."Unit of Measure Code") { }

                            trigger OnAfterGetRecord()
                            var
                                ItemsUOM: Record "Item Unit of Measure";
                            begin
                                Items.Reset();
                                Items.SetRange(Items."No.", "Production BOM Line"."No.");
                                Items.SetRange(Items."Location Filter", "Prod. Order Component"."Location Code");
                                Items.FindFirst();
                                Items.CalcFields(Inventory);
                                if Items."Base Unit of Measure" <> "Production BOM Line"."Unit of Measure Code" then begin
                                    ItemsUOM.Reset();
                                    ItemsUOM.SetRange(ItemsUOM."Item No.", Items."No.");
                                    ItemsUOM.SetRange(ItemsUOM.Code, "Production BOM Line"."Unit of Measure Code");
                                    ItemsUOM.FindFirst();
                                    ItemsInventory := Items.Inventory * 1 / ItemsUOM."Qty. per Unit of Measure";
                                end
                                else
                                    ItemsInventory := Items.Inventory;
                            end;
                        }
                    }

                    trigger OnAfterGetRecord()
                    var
                        TempProdOrderLine: Record "Prod. Order Line" temporary;
                        TempProdOrderComp: Record "Prod. Order Component" temporary;
                    begin
                        CompItem.Get("Prod. Order Component"."Item No.");
                        CompItem.SetRange("Variant Filter", "Prod. Order Component"."Variant Code");
                        CompItem.SetRange("Location Filter", "Prod. Order Component"."Location Code");
                        CompItem.SetRange(
                          "Date Filter", 0D, "Prod. Order Component"."Due Date" - 1);

                        CompItem.CalcFields(
                          Inventory, "Reserved Qty. on Inventory",
                          "Scheduled Receipt (Qty.)", "Reserved Qty. on Prod. Order",
                          "Scheduled Need (Qty.)", "Res. Qty. on Prod. Order Comp.");
                        CompItem.Inventory :=
                          CompItem.Inventory -
                          CompItem."Reserved Qty. on Inventory";
                        CompItem."Scheduled Receipt (Qty.)" :=
                          CompItem."Scheduled Receipt (Qty.)" -
                          CompItem."Reserved Qty. on Prod. Order";
                        CompItem."Scheduled Need (Qty.)" :=
                          CompItem."Scheduled Need (Qty.)" -
                          CompItem."Res. Qty. on Prod. Order Comp.";

                        CompItem.SetRange(
                          "Date Filter", 0D, "Prod. Order Component"."Due Date");
                        CompItem.CalcFields(
                          "Qty. on Sales Order", "Reserved Qty. on Sales Orders",
                          "Qty. on Purch. Order", "Reserved Qty. on Purch. Orders");
                        CompItem."Qty. on Sales Order" :=
                          CompItem."Qty. on Sales Order" -
                          CompItem."Reserved Qty. on Sales Orders";
                        CompItem."Qty. on Purch. Order" :=
                          CompItem."Qty. on Purch. Order" -
                          CompItem."Reserved Qty. on Purch. Orders";

                        TempProdOrderLine.SetCurrentKey(
                          "Item No.", "Variant Code", "Location Code", Status, "Ending Date");

                        TempProdOrderLine.SetRange(Status, TempProdOrderLine.Status::Planned, "Prod. Order Component".Status - 1);
                        TempProdOrderLine.SetRange("Item No.", "Prod. Order Component"."Item No.");
                        TempProdOrderLine.SetRange("Variant Code", "Prod. Order Component"."Variant Code");
                        TempProdOrderLine.SetRange("Location Code", "Prod. Order Component"."Location Code");
                        TempProdOrderLine.SetRange("Due Date", "Prod. Order Component"."Due Date");
                        CalcProdOrderLineFields(TempProdOrderLine);
                        CompItem."Scheduled Receipt (Qty.)" :=
                          CompItem."Scheduled Receipt (Qty.)" +
                          TempProdOrderLine."Remaining Qty. (Base)" -
                          TempProdOrderLine."Reserved Qty. (Base)";

                        TempProdOrderLine.SetRange(Status, "Prod. Order Component".Status);
                        TempProdOrderLine.SetRange("Prod. Order No.", "Prod. Order Component"."Prod. Order No.");
                        CalcProdOrderLineFields(TempProdOrderLine);
                        CompItem."Scheduled Receipt (Qty.)" :=
                          CompItem."Scheduled Receipt (Qty.)" +
                          TempProdOrderLine."Remaining Qty. (Base)" -
                          TempProdOrderLine."Reserved Qty. (Base)";

                        TempProdOrderComp.SetCurrentKey(
                          "Item No.", "Variant Code", "Location Code", Status, "Due Date");

                        TempProdOrderComp.SetRange(Status, TempProdOrderComp.Status::Planned, "Prod. Order Component".Status - 1);
                        TempProdOrderComp.SetRange("Item No.", "Prod. Order Component"."Item No.");
                        TempProdOrderComp.SetRange("Variant Code", "Prod. Order Component"."Variant Code");
                        TempProdOrderComp.SetRange("Location Code", "Prod. Order Component"."Location Code");
                        TempProdOrderComp.SetRange("Due Date", "Prod. Order Component"."Due Date");
                        CalcProdOrderCompFields(TempProdOrderComp);
                        CompItem."Scheduled Need (Qty.)" :=
                          CompItem."Scheduled Need (Qty.)" +
                          TempProdOrderComp."Remaining Qty. (Base)" -
                          TempProdOrderComp."Reserved Qty. (Base)";

                        TempProdOrderComp.SetRange(Status, "Prod. Order Component".Status);
                        TempProdOrderComp.SetFilter("Prod. Order No.", '<%1', "Prod. Order Component"."Prod. Order No.");
                        CalcProdOrderCompFields(TempProdOrderComp);
                        CompItem."Scheduled Need (Qty.)" :=
                          CompItem."Scheduled Need (Qty.)" +
                          TempProdOrderComp."Remaining Qty. (Base)" -
                          TempProdOrderComp."Reserved Qty. (Base)";

                        TempProdOrderComp.SetRange("Prod. Order No.", "Prod. Order Component"."Prod. Order No.");
                        TempProdOrderComp.SetRange("Prod. Order Line No.", 0, "Prod. Order Component"."Prod. Order Line No." - 1);
                        CalcProdOrderCompFields(TempProdOrderComp);
                        CompItem."Scheduled Need (Qty.)" :=
                          CompItem."Scheduled Need (Qty.)" +
                          TempProdOrderComp."Remaining Qty. (Base)" -
                          TempProdOrderComp."Reserved Qty. (Base)";

                        TempProdOrderComp.SetRange("Prod. Order Line No.", "Prod. Order Component"."Prod. Order Line No.");
                        TempProdOrderComp.SetRange("Line No.", 0, "Prod. Order Component"."Line No.");
                        CalcProdOrderCompFields(TempProdOrderComp);
                        CompItem."Scheduled Need (Qty.)" :=
                          CompItem."Scheduled Need (Qty.)" +
                          TempProdOrderComp."Remaining Qty. (Base)" -
                          TempProdOrderComp."Reserved Qty. (Base)";

                        RemainingQty :=
                          TempProdOrderComp."Remaining Qty. (Base)" -
                          TempProdOrderComp."Reserved Qty. (Base)";

                        QtyOnHandAfterProd :=
                          CompItem.Inventory -
                          TempProdOrderComp."Remaining Qty. (Base)" +
                          TempProdOrderComp."Reserved Qty. (Base)";

                        NeededQty :=
                          CompItem."Scheduled Need (Qty.)" +
                          CompItem."Qty. on Sales Order" -
                          CompItem."Qty. on Purch. Order" -
                          CompItem."Scheduled Receipt (Qty.)" -
                          CompItem.Inventory;

                        if NeededQty < 0 then
                            NeededQty := 0;

                        if (NeededQty = 0) and
                           (QtyOnHandAfterProd >= 0)
                        then
                            CurrReport.Skip();
                    end;

                    trigger OnPreDataItem()
                    begin
                        "Prod. Order Component".SetFilter("Prod. Order Component"."Due Date", "Production Order".GetFilter("Date Filter"));
                        "Prod. Order Component".SetFilter("Prod. Order Component"."Remaining Qty. (Base)", '>0');
                    end;
                }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels
    {
        Status_ProdOrderCaption = 'Status';
    }

    var
        CompItem: Record Item;
        RemainingQty: Decimal;
        NeededQty: Decimal;
        QtyOnHandAfterProd: Decimal;
        ShortageListCaptionLbl: Label 'Material Requirements-Shortage List';
        PageNoCaptionLbl: Label 'Page';
        DueDateCaptionLbl: Label 'Due Date';
        NeededQtyCaptionLbl: Label 'Needed Quantity';
        CompItemScheduledNeedQtyCaptionLbl: Label 'Scheduled Need';
        CompItemInventoryCaptionLbl: Label 'Quantity on Hand';
        RemainingQtyBaseCaptionLbl: Label 'Qty. on Hand after Production';
        RemQtyBaseCaptionLbl: Label 'Remaining Qty. (Base)';
        ReceiptQtyCaptionLbl: Label 'Scheduled Receipt';
        QtyonPurchOrderCaptionLbl: Label 'Qty. on Purch. Order';
        QtyonSalesOrderCaptionLbl: Label 'Qty. on Sales Order';
        Items: Record Item;
        ItemsInventory: Decimal;


    procedure CalcProdOrderLineFields(var ProdOrderLineFields: Record "Prod. Order Line")
    var
        ProdOrderLine: Record "Prod. Order Line";
        RemainingQtyBase: Decimal;
        ReservedQtyBase: Decimal;
    begin
        ProdOrderLine.Copy(ProdOrderLineFields);

        if ProdOrderLine.FindSet() then
            repeat
                ProdOrderLine.CalcFields("Reserved Qty. (Base)");
                RemainingQtyBase += ProdOrderLine."Remaining Qty. (Base)";
                ReservedQtyBase += ProdOrderLine."Reserved Qty. (Base)";
            until ProdOrderLine.Next() = 0;

        ProdOrderLineFields."Remaining Qty. (Base)" := RemainingQtyBase;
        ProdOrderLineFields."Reserved Qty. (Base)" := ReservedQtyBase;
    end;


    procedure CalcProdOrderCompFields(var ProdOrderCompFields: Record "Prod. Order Component")
    var
        ProdOrderComp: Record "Prod. Order Component";
        RemainingQtyBase: Decimal;
        ReservedQtyBase: Decimal;
    begin
        ProdOrderComp.Copy(ProdOrderCompFields);

        if ProdOrderComp.FindSet() then
            repeat
                ProdOrderComp.CalcFields("Reserved Qty. (Base)");
                RemainingQtyBase += ProdOrderComp."Remaining Qty. (Base)";
                ReservedQtyBase += ProdOrderComp."Reserved Qty. (Base)";
            until ProdOrderComp.Next() = 0;

        ProdOrderCompFields."Remaining Qty. (Base)" := RemainingQtyBase;
        ProdOrderCompFields."Reserved Qty. (Base)" := ReservedQtyBase;
    end;
}
