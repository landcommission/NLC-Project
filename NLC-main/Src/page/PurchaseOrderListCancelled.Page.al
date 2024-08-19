#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193698 "Purchase Order List Cancelled"
{
    Caption = 'Purchase Orders';
    CardPageId = "Purchase Order";
    Editable = false;
    PageType = List;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = const(Order),
                            Status = const(4));
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
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the vendor who delivers the products.';
                }
                field("Order Address Code"; Rec."Order Address Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the order address code linked to the relevant vendor''s order address.';
                }
                field("Buy-from Vendor Name"; Rec."Buy-from Vendor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the vendor who delivers the products.';
                }
                field("Vendor Authorization No."; Rec."Vendor Authorization No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the compensation agreement identification number, sometimes referred to as the RMA No. (Returns Materials Authorization).';
                }
                field("Buy-from Post Code"; Rec."Buy-from Post Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the postal code.';
                }
                field("Buy-from Country/Region Code"; Rec."Buy-from Country/Region Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the country or region of the address.';
                }
                field("Buy-from Contact"; Rec."Buy-from Contact")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the name of the person to contact about shipment of the item from this vendor.';
                }
                field("Pay-to Vendor No."; Rec."Pay-to Vendor No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the number of the vendor that you received the invoice from.';
                }
                field("Pay-to Name"; Rec."Pay-to Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the name of the vendor sending the invoice.';
                }
                field("Pay-to Post Code"; Rec."Pay-to Post Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the postal code.';
                }
                field("Pay-to Country/Region Code"; Rec."Pay-to Country/Region Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the country/region code of the vendor on the purchase document.';
                }
                field("Pay-to Contact"; Rec."Pay-to Contact")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the name of the person to contact about an invoice from this vendor.';
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies a code for an alternate shipment address if you want to ship to another address than the one that has been entered automatically. This field is also used in case of drop shipment.';
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the name of the company at the address to which you want the items in the purchase order to be shipped.';
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the postal code.';
                }
                field("Ship-to Country/Region Code"; Rec."Ship-to Country/Region Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the country/region code of the address that you want the items on the purchase document to be shipped to.';
                }
                field("Ship-to Contact"; Rec."Ship-to Contact")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the name of a contact person for the address where the items in the purchase order should be shipped.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the date when the posting of the purchase document will be recorded.';
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
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies a code for the location where you want the items to be placed when they are received.';
                }
                field("Purchaser Code"; Rec."Purchaser Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies which purchaser is assigned to the vendor.';
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the ID of the user who is responsible for the document.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the currency that is used on the entry.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the date when the related document was created.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies whether the record is open, waiting to be approved, invoiced for prepayment, or released to the next stage of processing.';
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies when the related sales invoice must be paid.';
                }
                field("Payment Discount %"; Rec."Payment Discount %")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the payment discount percentage that is granted if you pay on or before the date entered in the Pmt. Discount Date field. The discount percentage is specified in the Payment Terms Code field.';
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies how to make payment, such as with bank transfer, cash, or check.';
                }
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the delivery conditions of the related shipment, such as free on board (FOB).';
                }
                field("Requested Receipt Date"; Rec."Requested Receipt Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the date that you want the vendor to deliver your order. The field is used to calculate the latest date you can order, as follows: requested receipt date - lead time calculation = order date. If you do not need delivery on a specific date, you can leave the field blank.';
                }
                field("Job Queue Status"; Rec."Job Queue Status")
                {
                    ApplicationArea = Basic;
                    Visible = JobQueueActive;
                    ToolTip = 'Specifies the status of a job queue entry that handles the posting of purchase credit memos.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Control1901138007; "Vendor Details FactBox")
            {
                SubPageLink = "No." = field("Buy-from Vendor No."),
                              "Date Filter" = field("Date Filter");
                Visible = true;
            }
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
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    ShortcutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                    trigger OnAction()
                    begin
                        Rec.ShowDocDim();
                    end;
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortcutKey = 'F7';
                    ToolTip = 'Executes the Statistics action.';
                    trigger OnAction()
                    begin
                        Rec.CalcInvDiscForHeader();
                        Commit();
                        Page.RunModal(Page::"Purchase Order Statistics", Rec);
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = false;
                    ToolTip = 'Executes the Approvals action.';
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        ApprovalEntries.Setfilters(Database::"Purchase Header", Rec."Document Type", Rec."No.");
                        ApprovalEntries.Run();
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = page "Purch. Comment Sheet";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "No." = field("No."),
                                  "Document Line No." = const(0);
                    ToolTip = 'Executes the Co&mments action.';
                }
            }
            group(Documents)
            {
                Caption = 'Documents';
                Image = Documents;
                action(Receipts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Receipts';
                    Image = PostedReceipts;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = page "Posted Purchase Receipts";
                    RunPageLink = "Order No." = field("No.");
                    RunPageView = sorting("Order No.");
                    ToolTip = 'Executes the Receipts action.';
                }
                action(Invoices)
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoices';
                    Image = Invoice;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = page "Posted Purchase Invoices";
                    RunPageLink = "Order No." = field("No.");
                    RunPageView = sorting("Order No.");
                    ToolTip = 'Executes the Invoices action.';
                }
                action("Prepa&yment Invoices")
                {
                    ApplicationArea = Basic;
                    Caption = 'Prepa&yment Invoices';
                    Image = PrepaymentInvoice;
                    RunObject = page "Posted Purchase Invoices";
                    RunPageLink = "Prepayment Order No." = field("No.");
                    RunPageView = sorting("Prepayment Order No.");
                    ToolTip = 'Executes the Prepa&yment Invoices action.';
                }
                action("Prepayment Credi&t Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Prepayment Credi&t Memos';
                    Image = PrepaymentCreditMemo;
                    RunObject = page "Posted Purchase Credit Memos";
                    RunPageLink = "Prepayment Order No." = field("No.");
                    RunPageView = sorting("Prepayment Order No.");
                    ToolTip = 'Executes the Prepayment Credi&t Memos action.';
                }
                separator(Action1102601037) { }
            }
            group(Warehouse)
            {
                Caption = 'Warehouse';
                Image = Warehouse;
                action("In&vt. Put-away/Pick Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'In&vt. Put-away/Pick Lines';
                    Image = PickLines;
                    RunObject = page "Warehouse Activity List";
                    RunPageLink = "Source Document" = const("Purchase Order"),
                                  "Source No." = field("No.");
                    RunPageView = sorting("Source Document", "Source No.", "Location Code");
                    ToolTip = 'Executes the In&vt. Put-away/Pick Lines action.';
                }
                action("Whse. Receipt Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Whse. Receipt Lines';
                    Image = ReceiptLines;
                    RunObject = page "Whse. Receipt Lines";
                    RunPageLink = "Source Type" = const(39),
                                  "Source Subtype" = field("Document Type"),
                                  "Source No." = field("No.");
                    RunPageView = sorting("Source Type", "Source Subtype", "Source No.", "Source Line No.");
                    ToolTip = 'Executes the Whse. Receipt Lines action.';
                }
                separator(Action1102601040) { }
            }
        }
        area(Processing)
        {
            group(General)
            {
                Caption = 'General';
                Image = Print;
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
                    begin
                        if Rec.Status <> Rec.Status::Released then
                            Error('The Order has not been approved');
                        DocPrint.PrintPurchHeader(Rec);
                    end;
                }
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
                    ShortcutKey = 'Ctrl+F9';
                    ToolTip = 'Executes the Re&lease action.';
                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    Visible = false;
                    ToolTip = 'Executes the Re&open action.';
                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
                separator(Action1102601023) { }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Send A&pproval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    ToolTip = 'Executes the Send A&pproval Request action.';

                }
                action("Cancel Approval Re&quest")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';

                }
                separator(Action1102601020) { }
                action("Send IC Purchase Order")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send IC Purchase Order';
                    Image = IntercompanyOrder;
                    ToolTip = 'Executes the Send IC Purchase Order action.';
                    trigger OnAction()
                    var
                        ICInOutboxMgt: Codeunit ICInboxOutboxMgt;
                        SalesHeader: Record "Sales Header";
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                    //ApprovalMgt: Codeunit "Export F/O Consolidation";
                    begin
                        //if ApprovalMgt.PrePostApprovalCheck(SalesHeader,Rec) then
                        ICInOutboxMgt.SendPurchDoc(Rec, false);
                    end;
                }
            }
            group(ActionGroup12)
            {
                Caption = 'Warehouse';
                Image = Warehouse;
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
                        GetSourceDocInbound.CreateFromPurchOrder(Rec);

                        if not Rec.Find('=><') then
                            Rec.Init();
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

                        if not Rec.Find('=><') then
                            Rec.Init();
                    end;
                }
                separator(Action1102601017) { }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action("Test Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Test Report';
                    Ellipsis = true;
                    Image = TestReport;
                    ToolTip = 'Executes the Test Report action.';
                    trigger OnAction()
                    begin
                        ReportPrint.PrintPurchHeader(Rec);
                    end;
                }
                action("P&ost")
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Ellipsis = true;
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortcutKey = 'F9';
                    ToolTip = 'Executes the P&ost action.';
                    trigger OnAction()
                    begin
                        Rec.SendToPosting(Codeunit::"Purch.-Post (Yes/No)");
                    end;
                }
                action("Post and &Print")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post and &Print';
                    Ellipsis = true;
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortcutKey = 'Shift+F9';
                    ToolTip = 'Executes the Post and &Print action.';
                    trigger OnAction()
                    begin
                        Rec.SendToPosting(Codeunit::"Purch.-Post + Print");
                    end;
                }
                action("Post &Batch")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post &Batch';
                    Ellipsis = true;
                    Image = PostBatch;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Post &Batch action.';
                    trigger OnAction()
                    begin
                        Report.RunModal(Report::"Batch Post Purchase Orders", true, true, Rec);
                        CurrPage.Update(false);
                    end;
                }
                action("Remove From Job Queue")
                {
                    ApplicationArea = Basic;
                    Caption = 'Remove From Job Queue';
                    Image = RemoveLine;
                    Visible = JobQueueActive;
                    ToolTip = 'Executes the Remove From Job Queue action.';
                    trigger OnAction()
                    begin
                        Rec.CancelBackgroundPosting();
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
    begin
        //SetSecurityFilterOnRespCenter;
        //SetSecurityFilterOnDimension;
        JobQueueActive := PurchasesPayablesSetup.JobQueueActive();
    end;

    var
        DimMgt: Codeunit DimensionManagement;
        ReportPrint: Codeunit "Test Report-Print";
        DocPrint: Codeunit "Document-Print";
        [InDataSet]
        JobQueueActive: Boolean;
}
