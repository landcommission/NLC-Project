#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193692 "Sales Rep Transfer List"
{
    Caption = 'Sales Rep Transfer List';
    CardPageId = "Sales Rep Transfer Order";
    Editable = false;
    PageType = List;
    SourceTable = "Transfer Header";
    SourceTableView = where("Quantity Shipped" = const("3"));
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Transfer-from Code"; Rec."Transfer-from Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code of the location that items are transferred from.';
                }
                field("Transfer-to Code"; Rec."Transfer-to Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code of the location that the items are transferred to.';
                }
                field("In-Transit Code"; Rec."In-Transit Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the in-transit code for the transfer order, such as a shipping agent.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the transfer order is open or has been released for warehouse handling.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        DimMgt.LookupDimValueCodeNoUpdate(1);
                    end;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        DimMgt.LookupDimValueCodeNoUpdate(2);
                    end;
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the ID of the user who is responsible for the document.';
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.';
                }
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the delivery conditions of the related shipment, such as free on board (FOB).';
                }
                field("Shipping Agent Code"; Rec."Shipping Agent Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the code for the shipping agent who is transporting the items.';
                }
                field("Shipping Advice"; Rec."Shipping Advice")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies an instruction to the warehouse that ships the items, for example, that it is acceptable to do partial shipment.';
                }
                field("Receipt Date"; Rec."Receipt Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the date that you expect the transfer-to location to receive the shipment.';
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
                separator(Action1102755000) { }
                action("Reo&pen")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reo&pen';
                    Image = ReOpen;
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
                action("Create Inventor&y Put-away/Pick")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Inventor&y Put-away/Pick';
                    Ellipsis = true;
                    Image = CreatePutawayPick;
                    ToolTip = 'Executes the Create Inventor&y Put-away/Pick action.';
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
                        CheckWarehouseAccess()
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
                        CheckWarehouseAccess()
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

    var
        DimMgt: Codeunit DimensionManagement;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition;
        ApprovalEntries: Page "Approval Entries";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
    //ApprovalMgt: Codeunit "Export F/O Consolidation";


    procedure CheckWarehouseAccess()
    var
        WareHouseEmployees: Record "Warehouse Employee";
        LocationCode: Code[20];
    begin
        Rec.CalcFields(Rec."Quantity Shipped");
        if Rec."Quantity Shipped" < 0 then
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
