#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193691 "Sales Rep Transfer Order"
{
    Caption = 'Sales Rep Transfer Order';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Transfer Header";
    SourceTableView = where("Quantity Shipped" = const("2"));
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Transfer-from Code"; Rec."Transfer-from Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the code of the location that items are transferred from.';
                }
                field("Transfer-to Code"; Rec."Transfer-to Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the code of the location that the items are transferred to.';
                }
                field("In-Transit Code"; Rec."In-Transit Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the in-transit code for the transfer order, such as a shipping agent.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the posting date of the transfer order.';
                    trigger OnValidate()
                    begin
                        PostingDateOnAfterValidate();
                    end;
                }
                label(Control1102755000)
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the ID of the user who is responsible for the document.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies whether the transfer order is open or has been released for warehouse handling.';
                }
            }
            part(TransferLines; "Transfer Order Subform")
            {
                SubPageLink = "Document No." = field("No."),
                              "Derived From Line No." = const(0);
            }
            group("Transfer-from")
            {
                Caption = 'Transfer-from';
                field("Transfer-from Name"; Rec."Transfer-from Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the sender at the location that the items are transferred from.';
                }
                field("Transfer-from Name 2"; Rec."Transfer-from Name 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies an additional part of the name of the sender at the location that the items are transferred from.';
                }
                field("Transfer-from Address"; Rec."Transfer-from Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the address of the location that the items are transferred from.';
                }
                field("Transfer-from Address 2"; Rec."Transfer-from Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies an additional part of the address of the location that items are transferred from.';
                }
                field("Transfer-from Post Code"; Rec."Transfer-from Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the postal code of the location that the items are transferred from.';
                }
                field("Transfer-from City"; Rec."Transfer-from City")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the city of the location that the items are transferred from.';
                }
                field("Transfer-from Contact"; Rec."Transfer-from Contact")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the contact person at the location that the items are transferred from.';
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.';
                    trigger OnValidate()
                    begin
                        ShipmentDateOnAfterValidate();
                    end;
                }
                field("Outbound Whse. Handling Time"; Rec."Outbound Whse. Handling Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a date formula for the time it takes to get items ready to ship from this location. The time element is used in the calculation of the delivery date as follows: Shipment Date + Outbound Warehouse Handling Time = Planned Shipment Date + Shipping Time = Planned Delivery Date.';
                    trigger OnValidate()
                    begin
                        OutboundWhseHandlingTimeOnAfte();
                    end;
                }
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the delivery conditions of the related shipment, such as free on board (FOB).';
                }
                field("Shipping Agent Code"; Rec."Shipping Agent Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the code for the shipping agent who is transporting the items.';
                    trigger OnValidate()
                    begin
                        ShippingAgentCodeOnAfterValida();
                    end;
                }
                field("Shipping Agent Service Code"; Rec."Shipping Agent Service Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code for the service, such as a one-day delivery, that is offered by the shipping agent.';
                    trigger OnValidate()
                    begin
                        ShippingAgentServiceCodeOnAfte();
                    end;
                }
                field("Shipping Time"; Rec."Shipping Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies how long it takes from when the items are shipped from the warehouse to when they are delivered.';
                    trigger OnValidate()
                    begin
                        ShippingTimeOnAfterValidate();
                    end;
                }
                field("Shipping Advice"; Rec."Shipping Advice")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies an instruction to the warehouse that ships the items, for example, that it is acceptable to do partial shipment.';
                    trigger OnValidate()
                    begin
                        if Rec."Shipping Advice" <> xRec."Shipping Advice" then
                            if not Confirm(Text000, false, Rec.FieldCaption(Rec."Shipping Advice")) then
                                Error('');
                    end;
                }
            }
            group("Transfer-to")
            {
                Caption = 'Transfer-to';
                field("Transfer-to Name"; Rec."Transfer-to Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the recipient at the location that the items are transferred to.';
                }
                field("Transfer-to Name 2"; Rec."Transfer-to Name 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies an additional part of the name of the recipient at the location that the items are transferred to.';
                }
                field("Transfer-to Address"; Rec."Transfer-to Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the address of the location that the items are transferred to.';
                }
                field("Transfer-to Address 2"; Rec."Transfer-to Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies an additional part of the address of the location that the items are transferred to.';
                }
                field("Transfer-to Post Code"; Rec."Transfer-to Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the postal code of the location that the items are transferred to.';
                }
                field("Transfer-to City"; Rec."Transfer-to City")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the city of the location that items are transferred to.';
                }
                field("Transfer-to Contact"; Rec."Transfer-to Contact")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the contact person at the location that items are transferred to.';
                }
                field("Receipt Date"; Rec."Receipt Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date that you expect the transfer-to location to receive the shipment.';
                    trigger OnValidate()
                    begin
                        ReceiptDateOnAfterValidate();
                    end;
                }
                field("Inbound Whse. Handling Time"; Rec."Inbound Whse. Handling Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the time it takes to make items part of available inventory, after the items have been posted as received.';
                    trigger OnValidate()
                    begin
                        InboundWhseHandlingTimeOnAfter();
                    end;
                }
            }
            group("Foreign Trade")
            {
                Caption = 'Foreign Trade';
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the type of transaction that the document represents, for the purpose of reporting to INTRASTAT.';
                }
                field("Transaction Specification"; Rec."Transaction Specification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a specification of the document''s transaction, for the purpose of reporting to INTRASTAT.';
                }
                field("Transport Method"; Rec."Transport Method")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the transport method, for the purpose of reporting to INTRASTAT.';
                }
                field("Area"; Rec.Area)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the area of the customer or vendor, for the purpose of reporting to INTRASTAT.';
                }
                field("Entry/Exit Point"; Rec."Entry/Exit Point")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code of either the port of entry at which the items passed into your country/region, or the port of exit.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("O&rder")
            {
                Caption = 'O&rder';
                Image = "Order";
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = page "Transfer Statistics";
                    RunPageLink = "No." = field("No.");
                    ShortcutKey = 'F7';
                    ToolTip = 'Executes the Statistics action.';
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = page "Inventory Comment Sheet";
                    RunPageLink = "Document Type" = const("Transfer Order"),
                                  "No." = field("No.");
                    ToolTip = 'Executes the Co&mments action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortcutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                    trigger OnAction()
                    begin
                        Rec.ShowDocDim();
                        CurrPage.SaveRecord();
                    end;
                }
            }
            group(Documents)
            {
                Caption = 'Documents';
                Image = Documents;
                action("S&hipments")
                {
                    ApplicationArea = Basic;
                    Caption = 'S&hipments';
                    Image = Shipment;
                    RunObject = page "Posted Transfer Shipments";
                    RunPageLink = "Transfer Order No." = field("No.");
                    ToolTip = 'Executes the S&hipments action.';
                }
                action("Re&ceipts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&ceipts';
                    Image = PostedReceipts;
                    RunObject = page "Posted Transfer Receipts";
                    RunPageLink = "Transfer Order No." = field("No.");
                    ToolTip = 'Executes the Re&ceipts action.';
                }
            }
            group(Warehouse)
            {
                Caption = 'Warehouse';
                Image = Warehouse;
                action("Whse. Shi&pments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Whse. Shi&pments';
                    Image = Shipment;
                    RunObject = page "Whse. Shipment Lines";
                    RunPageLink = "Source Type" = const(5741),
                                  "Source Subtype" = const(0),
                                  "Source No." = field("No.");
                    RunPageView = sorting("Source Type", "Source Subtype", "Source No.", "Source Line No.");
                    ToolTip = 'Executes the Whse. Shi&pments action.';
                }
                action("&Whse. Receipts")
                {
                    ApplicationArea = Basic;
                    Caption = '&Whse. Receipts';
                    Image = Receipt;
                    RunObject = page "Whse. Receipt Lines";
                    RunPageLink = "Source Type" = const(5741),
                                  "Source Subtype" = const(1),
                                  "Source No." = field("No.");
                    RunPageView = sorting("Source Type", "Source Subtype", "Source No.", "Source Line No.");
                    ToolTip = 'Executes the &Whse. Receipts action.';
                }
                action("In&vt. Put-away/Pick Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'In&vt. Put-away/Pick Lines';
                    Image = PickLines;
                    RunObject = page "Warehouse Activity List";
                    RunPageLink = "Source Document" = filter("Inbound Transfer" | "Outbound Transfer"),
                                  "Source No." = field("No.");
                    RunPageView = sorting("Source Document", "Source No.", "Location Code");
                    ToolTip = 'Executes the In&vt. Put-away/Pick Lines action.';
                }
            }
        }
        area(Processing)
        {
            action("&Print")
            {
                ApplicationArea = Basic;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the &Print action.';
                trigger OnAction()
                var
                    DocPrint: Codeunit "Document-Print";
                begin
                    //DocPrint.PrintTransferHeader(Rec);
                    Rec.CalcFields(Rec."Quantity Shipped");
                    if Rec."Quantity Shipped" = 0 then
                        Error('The Transfer Has Not Been Posted, Please Post The Transfer First');

                    Rec.Reset();
                    Rec.SetRange(Rec."No.", Rec."No.");
                    Report.Run(Report::"Sales Rep Transfer Order mod", false, true, Rec);
                end;
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action("Re&lease")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = codeunit "Release Transfer Document";
                    ShortcutKey = 'Ctrl+F9';
                    Visible = false;
                    ToolTip = 'Executes the Re&lease action.';
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    begin
                        DocumentType := DocumentType::Requisition;
                        ApprovalEntries.Setfilters(Database::"Transfer Header", DocumentType, Rec."No.");
                        ApprovalEntries.Run();
                    end;
                }
                action("Send A&pproval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    begin
                        /*
                        IF NOT LinesExists THEN
                           ERROR('There are no Lines created for this Document');
                        */
                        //check if has exceeded the stock limit;
                        CheckStockLimit();
                        //Release the Imprest for Approval
                        // IF ApprovalMgt.SendTrRequestApprovalRequest(Rec) THEN;

                    end;
                }
                action("Cancel Approval Re&quest")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';

                }
                separator(Action1102755001) { }
                action("Reo&pen")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reo&pen';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Reo&pen action.';
                    trigger OnAction()
                    var
                        ReleaseTransferDoc: Codeunit "Release Transfer Document";
                    begin
                        ReleaseTransferDoc.Reopen(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Create Whse. S&hipment")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Whse. S&hipment';
                    Image = NewShipment;
                    ToolTip = 'Executes the Create Whse. S&hipment action.';
                    trigger OnAction()
                    var
                        GetSourceDocOutbound: Codeunit "Get Source Doc. Outbound";
                    begin
                        GetSourceDocOutbound.CreateFromOutbndTransferOrder(Rec);
                    end;
                }
                action("Create &Whse. Receipt")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create &Whse. Receipt';
                    Image = NewReceipt;
                    ToolTip = 'Executes the Create &Whse. Receipt action.';
                    trigger OnAction()
                    var
                        GetSourceDocInbound: Codeunit "Get Source Doc. Inbound";
                    begin
                        GetSourceDocInbound.CreateFromInbndTransferOrder(Rec);
                    end;
                }
                action("Create Inventor&y Put-away / Pick")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Inventor&y Put-away / Pick';
                    Ellipsis = true;
                    Image = CreateInventoryPickup;
                    ToolTip = 'Executes the Create Inventor&y Put-away / Pick action.';
                    trigger OnAction()
                    begin
                        Rec.CreateInvtPutAwayPick();
                    end;
                }
                action("Get Bin Content")
                {
                    ApplicationArea = Basic;
                    Caption = 'Get Bin Content';
                    Ellipsis = true;
                    Image = GetBinContent;
                    ToolTip = 'Executes the Get Bin Content action.';
                    trigger OnAction()
                    var
                        BinContent: Record "Bin Content";
                        GetBinContent: Report "Whse. Get Bin Content";
                    begin
                        BinContent.SetRange("Location Code", Rec."Transfer-from Code");
                        GetBinContent.SetTableView(BinContent);
                        GetBinContent.InitializeTransferHeader(Rec);
                        GetBinContent.RunModal();
                    end;
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action("P&ost")
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Ellipsis = true;
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = codeunit "TransferOrder-Post (Yes/No)";
                    ShortcutKey = 'F9';
                    ToolTip = 'Executes the P&ost action.';
                    trigger OnAction()
                    begin
                        CheckWarehouseAccess();
                    end;
                }
                action("Post and &Print")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post and &Print';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = codeunit "TransferOrder-Post + Print";
                    ShortcutKey = 'Shift+F9';
                    ToolTip = 'Executes the Post and &Print action.';
                    trigger OnAction()
                    begin
                        CheckWarehouseAccess();
                    end;
                }
            }
        }
        area(Reporting)
        {
            action("Inventory - Inbound Transfer")
            {
                ApplicationArea = Basic;
                Caption = 'Inventory - Inbound Transfer';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = report "Inventory - Inbound Transfer";
                ToolTip = 'Executes the Inventory - Inbound Transfer action.';
            }
        }
    }

    trigger OnDeleteRecord(): Boolean
    begin
        Rec.TestField(Rec.Status, Rec.Status::Open);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Quantity Shipped" := Rec."Quantity Shipped"::"1"
    end;

    var
        Text000: Label 'Do you want to change %1 in all related records in the warehouse?';
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition;
        ApprovalEntries: Page "Approval Entries";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
    //ApprovalMgt: Codeunit "Export F/O Consolidation";

    local procedure PostingDateOnAfterValidate()
    begin
        CurrPage.TransferLines.Page.UpdateForm(true);
    end;

    local procedure ShipmentDateOnAfterValidate()
    begin
        CurrPage.TransferLines.Page.UpdateForm(true);
    end;

    local procedure ShippingAgentServiceCodeOnAfte()
    begin
        CurrPage.TransferLines.Page.UpdateForm(true);
    end;

    local procedure ShippingAgentCodeOnAfterValida()
    begin
        CurrPage.TransferLines.Page.UpdateForm(true);
    end;

    local procedure ShippingTimeOnAfterValidate()
    begin
        CurrPage.TransferLines.Page.UpdateForm(true);
    end;

    local procedure OutboundWhseHandlingTimeOnAfte()
    begin
        CurrPage.TransferLines.Page.UpdateForm(true);
    end;

    local procedure ReceiptDateOnAfterValidate()
    begin
        CurrPage.TransferLines.Page.UpdateForm(true);
    end;

    local procedure InboundWhseHandlingTimeOnAfter()
    begin
        CurrPage.TransferLines.Page.UpdateForm(true);
    end;


    procedure CheckWarehouseAccess()
    var
        WareHouseEmployees: Record "Warehouse Employee";
        LocationCode: Code[20];
    begin
        Rec.CalcFields(Rec."Quantity Shipped");
        if Rec."Quantity Shipped" <= 0 then
            LocationCode := Rec."Transfer-from Code"
        else
            LocationCode := Rec."Transfer-to Code";

        WareHouseEmployees.Reset();
        WareHouseEmployees.SetRange(WareHouseEmployees."User ID", UserId);
        WareHouseEmployees.SetRange(WareHouseEmployees."Location Code", LocationCode);
        if not WareHouseEmployees.FindFirst() then
            Error('You Do Not Have Access To Location %1 , Contact System Admin.!', LocationCode);
    end;


    procedure CheckStockLimit(): Decimal
    var
        ItemLedger: Record "Item Ledger Entry";
        CurrentLocationStockPrice: Decimal;
        Item: Record Item;
        Location: Record Location;
        InventorySetup: Record "Inventory Setup";
        StockLimit: Decimal;
        TransferLines: Record "Transfer Line";
        CurrentCardStockPrice: Decimal;
    begin
        //check if has exceeded the stock limit;
        //get stock location
        ItemLedger.Reset();
        ItemLedger.SetRange(ItemLedger."Location Code", Rec."Transfer-to Code");
        ItemLedger.SetFilter(ItemLedger."Remaining Quantity", '>%1', 0);
        if ItemLedger.FindSet() then
            repeat
                Item.Get(ItemLedger."Item No.");
                CurrentLocationStockPrice += Item."Unit Price" * ItemLedger."Remaining Quantity";
            until ItemLedger.Next() = 0;

        Location.Get(Rec."Transfer-to Code");
        InventorySetup.Get();

        if Location."Stock Limit" <> 0 then
            StockLimit := Location."Stock Limit"
        else
            StockLimit := InventorySetup."Default Location Stock Limit";

        //calculate stock held by card
        TransferLines.Reset();
        TransferLines.SetRange(TransferLines."Document No.", Rec."No.");
        if TransferLines.FindSet() then
            repeat
                Item.Get(TransferLines."Item No.");
                CurrentCardStockPrice += TransferLines.Quantity * Item."Unit Price";
            until TransferLines.Next() = 0;

        //check if location stock and the card stock does not exceed stock limit
        if StockLimit <> 0 then
            if (CurrentCardStockPrice + CurrentLocationStockPrice) > StockLimit then
                Error('%1 Has Stock Worth %2, And Is Requesting For Stock Worth %3, Hence Will Exceeded The Stock Limit Of %3',
                Rec."Transfer-to Code", CurrentLocationStockPrice, CurrentCardStockPrice, StockLimit);
    end;
}
