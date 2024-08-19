#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 50003 "Unused Purchase Order"
{
    Caption = 'Purchase Order';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = filter(Order),
                            "Archive Unused Doc" = filter(true));
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
                    Visible = DocNoVisible;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the number of the vendor who delivers the products.';
                    trigger OnValidate()
                    begin
                        BuyfromVendorNoOnAfterValidate();
                    end;
                }
                field("Buy-from Contact No."; Rec."Buy-from Contact No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of your contact at the vendor.';
                }
                field("Buy-from Vendor Name"; Rec."Buy-from Vendor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the vendor who delivers the products.';
                }
                field("Buy-from Address"; Rec."Buy-from Address")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the address of the vendor who ships the items.';
                }
                field("Buy-from Address 2"; Rec."Buy-from Address 2")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies additional address information.';
                }
                field("Buy-from Post Code"; Rec."Buy-from Post Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the postal code.';
                }
                field("Buy-from City"; Rec."Buy-from City")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the city of the vendor who ships the items.';
                }
                field("Buy-from Contact"; Rec."Buy-from Contact")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the name of the person to contact about shipment of the item from this vendor.';
                }
                field("No. of Archived Versions"; Rec."No. of Archived Versions")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the number of archived versions for this document.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when the posting of the purchase document will be recorded.';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the date when the order was created.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when the related document was created.';
                }
                field("Quote No."; Rec."Quote No.")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the quote number for the purchase order.';
                }
                field("Vendor Order No."; Rec."Vendor Order No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the vendor''s order number.';
                }
                field("Vendor Shipment No."; Rec."Vendor Shipment No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the vendor''s shipment number. It is inserted in the corresponding field on the source document during posting.';
                }
                field("Vendor Invoice No."; Rec."Vendor Invoice No.")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = VendorInvoiceNoMandatory;
                    ToolTip = 'Specifies the document number of the original document you received from the vendor. You can require the document number for posting, or let it be optional. By default, it''s required, so that this document references the original. Making document numbers optional removes a step from the posting process. For example, if you attach the original invoice as a PDF, you might not need to enter the document number. To specify whether document numbers are required, in the Purchases & Payables Setup window, select or clear the Ext. Doc. No. Mandatory field.';
                }
                field("Order Address Code"; Rec."Order Address Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the order address code linked to the relevant vendor''s order address.';
                }
                field("Purchaser Code"; Rec."Purchaser Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies which purchaser is assigned to the vendor.';
                    trigger OnValidate()
                    begin
                        PurchaserCodeOnAfterValidate();
                    end;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the code of the responsibility center, such as a distribution hub, that is associated with the involved user, company, customer, or vendor.';
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the ID of the user who is responsible for the document.';
                }
                field("Job Queue Status"; Rec."Job Queue Status")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the status of a job queue entry that handles the posting of purchase credit memos.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Manual LPO No."; Rec."Manual LPO No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Manual LPO No. field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies whether the record is open, waiting to be approved, invoiced for prepayment, or released to the next stage of processing.';
                }
            }
            part(PurchLines; "Purchase Order Subform")
            {
                SubPageLink = "Document No." = field("No.");
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Pay-to Vendor No."; Rec."Pay-to Vendor No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the number of the vendor that you received the invoice from.';
                    trigger OnValidate()
                    begin
                        PaytoVendorNoOnAfterValidate();
                    end;
                }
                field("Pay-to Contact No."; Rec."Pay-to Contact No.")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the number of the contact who sends the invoice.';
                }
                field("Pay-to Name"; Rec."Pay-to Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the vendor sending the invoice.';
                }
                field("Pay-to Address"; Rec."Pay-to Address")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the address of the vendor sending the invoice.';
                }
                field("Pay-to Address 2"; Rec."Pay-to Address 2")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies additional address information.';
                }
                field("Pay-to Post Code"; Rec."Pay-to Post Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the postal code.';
                }
                field("Pay-to City"; Rec."Pay-to City")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the city of the vendor sending the invoice.';
                }
                field("Pay-to Contact"; Rec."Pay-to Contact")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the name of the person to contact about an invoice from this vendor.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    trigger OnValidate()
                    begin
                        ShortcutDimension1CodeOnAfterV();
                    end;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    trigger OnValidate()
                    begin
                        ShortcutDimension2CodeOnAfterV();
                    end;
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies when the related sales invoice must be paid.';
                }
                field("Payment Discount %"; Rec."Payment Discount %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the payment discount percentage that is granted if you pay on or before the date entered in the Pmt. Discount Date field. The discount percentage is specified in the Payment Terms Code field.';
                }
                field("Pmt. Discount Date"; Rec."Pmt. Discount Date")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the date on which the amount in the entry must be paid for a payment discount to be granted.';
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies how to make payment, such as with bank transfer, cash, or check.';
                }
                field("Payment Reference"; Rec."Payment Reference")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the payment of the purchase invoice.';
                }
                field("Creditor No."; Rec."Creditor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the vendor who sent the purchase invoice.';
                }
                field("On Hold"; Rec."On Hold")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies that the related entry represents an unpaid invoice for which either a payment suggestion, a reminder, or a finance charge memo exists.';
                }
                field("Prices Including VAT"; Rec."Prices Including VAT")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies if the Unit Price and Line Amount fields on document lines should be shown with or without VAT.';
                    trigger OnValidate()
                    begin
                        PricesIncludingVATOnAfterValid();
                    end;
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                }
            }
            group(Shipping)
            {
                Caption = 'Shipping';
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the company at the address to which you want the items in the purchase order to be shipped.';
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the address that you want the items in the purchase order to be shipped to.';
                }
                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies additional address information.';
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the postal code.';
                }
                field("Ship-to City"; Rec."Ship-to City")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the city the items in the purchase order will be shipped to.';
                }
                field("Ship-to Contact"; Rec."Ship-to Contact")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of a contact person for the address where the items in the purchase order should be shipped.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies a code for the location where you want the items to be placed when they are received.';
                }
                field("Inbound Whse. Handling Time"; Rec."Inbound Whse. Handling Time")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the time it takes to make items part of available inventory, after the items have been posted as received.';
                }
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the delivery conditions of the related shipment, such as free on board (FOB).';
                }
                field("Lead Time Calculation"; Rec."Lead Time Calculation")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies a date formula for the amount of time it takes to replenish the item.';
                }
                field("Requested Receipt Date"; Rec."Requested Receipt Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date that you want the vendor to deliver your order. The field is used to calculate the latest date you can order, as follows: requested receipt date - lead time calculation = order date. If you do not need delivery on a specific date, you can leave the field blank.';
                }
                field("Promised Receipt Date"; Rec."Promised Receipt Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date that the vendor has promised to deliver the order.';
                }
                field("Expected Receipt Date"; Rec."Expected Receipt Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the date you expect the items to be available in your warehouse. If you leave the field blank, it will be calculated as follows: Planned Receipt Date + Safety Lead Time + Inbound Warehouse Handling Time = Expected Receipt Date.';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the customer that the items are shipped to directly from your vendor, as a drop shipment.';
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a code for an alternate shipment address if you want to ship to another address than the one that has been entered automatically. This field is also used in case of drop shipment.';
                }
            }
            group("Foreign Trade")
            {
                Caption = 'Foreign Trade';
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the currency that is used on the entry.';
                    trigger OnAssistEdit()
                    begin
                        Clear(ChangeExchangeRate);
                        if Rec."Posting Date" <> 0D then
                            ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", Rec."Posting Date")
                        else
                            ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", WorkDate());
                        if ChangeExchangeRate.RunModal() = Action::OK then begin
                            Rec.Validate(Rec."Currency Factor", ChangeExchangeRate.GetParameter());
                            CurrPage.Update();
                        end;
                        Clear(ChangeExchangeRate);
                    end;

                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                        PurchCalcDiscByType.ApplyDefaultInvoiceDiscount(0, Rec);
                    end;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = Basic;
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
                    ToolTip = 'Specifies the transport method, for the purpose of reporting to INTRASTAT.';
                }
                field("Entry Point"; Rec."Entry Point")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code of the port of entry where the items pass into your country/region, for reporting to Intrastat.';
                }
                field("Area"; Rec.Area)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the destination country or region for the purpose of Intrastat reporting.';
                }
            }
            group(Prepayment)
            {
                Caption = 'Prepayment';
                field("Prepayment %"; Rec."Prepayment %")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the prepayment percentage to use to calculate the prepayment for sales.';
                    trigger OnValidate()
                    begin
                        Prepayment37OnAfterValidate();
                    end;
                }
                field("Compress Prepayment"; Rec."Compress Prepayment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies that prepayments on the purchase order are combined if they have the same general ledger account for prepayments or the same dimensions.';
                }
                field("Prepmt. Payment Terms Code"; Rec."Prepmt. Payment Terms Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code that represents the payment terms for prepayment invoices related to the purchase document.';
                }
                field("Prepayment Due Date"; Rec."Prepayment Due Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies when the prepayment invoice for this purchase order is due.';
                }
                field("Prepmt. Payment Discount %"; Rec."Prepmt. Payment Discount %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the payment discount percent granted on the prepayment if the vendor pays on or before the date entered in the Prepmt. Pmt. Discount Date field.';
                }
                field("Prepmt. Pmt. Discount Date"; Rec."Prepmt. Pmt. Discount Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the last date the vendor can pay the prepayment invoice and still receive a payment discount on the prepayment amount.';
                }
                field("Vendor Cr. Memo No."; Rec."Vendor Cr. Memo No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the document number of the original document you received from the vendor. You can require the document number for posting, or let it be optional. By default, it''s required, so that this document references the original. Making document numbers optional removes a step from the posting process. For example, if you attach the original invoice as a PDF, you might not need to enter the document number. To specify whether document numbers are required, in the Purchases & Payables Setup window, select or clear the Ext. Doc. No. Mandatory field.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Control1903326807; "Item Replenishment FactBox")
            {
                Provider = PurchLines;
                SubPageLink = "No." = field("No.");
                Visible = false;
            }
            part(Control1906354007; "Approval FactBox")
            {
                SubPageLink = "Table ID" = const(38),
                              "Document Type" = field("Document Type"),
                              "Document No." = field("No.");
                Visible = false;
            }
            part(Control1901138007; "Vendor Details FactBox")
            {
                SubPageLink = "No." = field("Buy-from Vendor No.");
                Visible = false;
            }
            part(Control1904651607; "Vendor Statistics FactBox")
            {
                SubPageLink = "No." = field("Buy-from Vendor No.");
                Visible = true;
            }
            part(Control1903435607; "Vendor Hist. Buy-from FactBox")
            {
                SubPageLink = "No." = field("Buy-from Vendor No.");
                Visible = true;
            }
            part(Control1906949207; "Vendor Hist. Pay-to FactBox")
            {
                SubPageLink = "No." = field("Pay-to Vendor No.");
                Visible = false;
            }
            part(Control3; "Purchase Line FactBox")
            {
                Provider = PurchLines;
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Line No." = field("Line No.");
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
                    AccessByPermission = tabledata Dimension = R;
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
                        CurrPage.SaveRecord();
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
                        PurchCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
                    end;
                }
                action(Card)
                {
                    ApplicationArea = Basic;
                    Caption = 'Card';
                    Image = EditLines;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = page "Vendor Card";
                    RunPageLink = "No." = field("Buy-from Vendor No.");
                    ShortcutKey = 'Shift+F7';
                    ToolTip = 'Executes the Card action.';
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
            }
            group(Warehouse)
            {
                Caption = 'Warehouse';
                Image = Warehouse;
                separator(Action181) { }
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
                separator(Action182) { }
                group("Dr&op Shipment")
                {
                    Caption = 'Dr&op Shipment';
                    Image = Delivery;
                    action("Get &Sales Order")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Get &Sales Order';
                        Image = "Order";
                        RunObject = codeunit "Purch.-Get Drop Shpt.";
                        ToolTip = 'Executes the Get &Sales Order action.';
                    }
                }
                group("Speci&al Order")
                {
                    Caption = 'Speci&al Order';
                    Image = SpecialOrder;
                    action(Action228)
                    {
                        AccessByPermission = tabledata "Sales Shipment Header" = R;
                        ApplicationArea = Basic;
                        Caption = 'Get &Sales Order';
                        Image = "Order";
                        ToolTip = 'Executes the Get &Sales Order action.';
                        trigger OnAction()
                        var
                            PurchHeader: Record "Purchase Header";
                            DistIntegration: Codeunit "Dist. Integration";
                        begin
                            PurchHeader.Copy(Rec);
                            DistIntegration.GetSpecialOrders(PurchHeader);
                            Rec := PurchHeader;
                        end;
                    }
                }
            }
        }
        area(Processing)
        {
            group(ActionGroup13)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                separator(Action73) { }
                action(Release)
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
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
                    ToolTip = 'Executes the Re&open action.';
                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
                separator(Action611) { }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CalculateInvoiceDiscount)
                {
                    AccessByPermission = tabledata "Vendor Invoice Disc." = R;
                    ApplicationArea = Basic;
                    Caption = 'Calculate &Invoice Discount';
                    Image = CalculateInvoiceDiscount;
                    ToolTip = 'Executes the Calculate &Invoice Discount action.';
                    trigger OnAction()
                    begin
                        ApproveCalcInvDisc();
                        PurchCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
                    end;
                }
                action("Get St&d. Vend. Purchase Codes")
                {
                    ApplicationArea = Basic;
                    Caption = 'Get St&d. Vend. Purchase Codes';
                    Ellipsis = true;
                    Image = VendorCode;
                    ToolTip = 'Executes the Get St&d. Vend. Purchase Codes action.';
                    trigger OnAction()
                    var
                        StdVendPurchCode: Record "Standard Vendor Purchase Code";
                    begin
                        StdVendPurchCode.InsertPurchLines(Rec);
                    end;
                }
                action(CopyDocument)
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy Document';
                    Ellipsis = true;
                    Image = CopyDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Copy Document action.';
                    trigger OnAction()
                    begin
                        CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RunModal();
                        Clear(CopyPurchDoc);
                    end;
                }
                action("Move Negative Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Move Negative Lines';
                    Ellipsis = true;
                    Image = MoveNegativeLines;
                    ToolTip = 'Executes the Move Negative Lines action.';
                    trigger OnAction()
                    begin
                        Clear(MoveNegPurchLines);
                        MoveNegPurchLines.SetPurchHeader(Rec);
                        MoveNegPurchLines.RunModal();
                        MoveNegPurchLines.ShowDocument();
                    end;
                }
                action("Check Budget Committment")
                {
                    ApplicationArea = Basic;
                    Caption = 'Check Budget Committment';
                    Image = Balance;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Check Budget Committment action.';
                    trigger OnAction()
                    begin

                        BCSetup.Get();
                        if not BCSetup.Mandatory then
                            exit;

                        if not CheckforRequiredFields() then
                            Error('There might be some lines missing the key fields: [TYPE, NO.,AMOUNT] Please recheck your document lines');

                        if Rec.Status = Rec.Status::Released then
                            Error('This document has already been released. This functionality is available for open documents only');
                        if SomeLinesCommitted() then begin
                            if not Confirm('Some or All the Lines Are already Committed do you want to continue', true, Rec."Document Type") then
                                Error('Budget Availability Check and Commitment Aborted');
                            DeleteCommitment.Reset();
                            DeleteCommitment.SetRange(DeleteCommitment."Document Type", DeleteCommitment."Document Type"::LPO);
                            DeleteCommitment.SetRange(DeleteCommitment."Document No.", Rec."No.");
                            DeleteCommitment.DeleteAll();
                        end;
                        Commitment.CheckPurchase(Rec);

                        Message('Commitments done Successfully for Doc. No %1', Rec."No.");
                    end;
                }
                action("Cancel Budget Committment")
                {
                    ApplicationArea = Basic;
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Cancel Budget Committment action.';
                    trigger OnAction()
                    begin

                        if not Confirm('Are you sure you want to Cancel All Commitments Done for this document', true, Rec."Document Type") then
                            Error('Budget Availability Check and Commitment Aborted');

                        DeleteCommitment.Reset();
                        DeleteCommitment.SetRange(DeleteCommitment."Document Type", DeleteCommitment."Document Type"::LPO);
                        DeleteCommitment.SetRange(DeleteCommitment."Document No.", Rec."No.");
                        DeleteCommitment.DeleteAll();
                        //Tag all the Purchase Line entries as Uncommitted
                        PurchLine.Reset();
                        PurchLine.SetRange(PurchLine."Document Type", Rec."Document Type");
                        PurchLine.SetRange(PurchLine."Document No.", Rec."No.");
                        if PurchLine.Find('-') then
                            repeat
                                PurchLine.Committed := false;
                                PurchLine.Modify();
                            until PurchLine.Next() = 0;

                        Message('Commitments Cancelled Successfully for Doc. No %1', Rec."No.");
                    end;
                }
                group(ActionGroup225)
                {
                    Caption = 'Dr&op Shipment';
                    Image = Delivery;
                    action(Action184)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Get &Sales Order';
                        Image = "Order";
                        RunObject = codeunit "Purch.-Get Drop Shpt.";
                        ToolTip = 'Executes the Get &Sales Order action.';
                    }
                }
                group(ActionGroup186)
                {
                    Caption = 'Speci&al Order';
                    Image = SpecialOrder;
                    action(l8)
                    {
                        AccessByPermission = tabledata "Sales Shipment Header" = R;
                        ApplicationArea = Basic;
                        Caption = 'l8';
                        Image = "Order";
                        ToolTip = 'Executes the l8 action.';
                        trigger OnAction()
                        var
                            DistIntegration: Codeunit "Dist. Integration";
                            PurchHeader: Record "Purchase Header";
                        begin
                            PurchHeader.Copy(Rec);
                            DistIntegration.GetSpecialOrders(PurchHeader);
                            Rec := PurchHeader;
                        end;
                    }
                }
                action("Archive Document")
                {
                    ApplicationArea = Basic;
                    Caption = 'Archi&ve Document';
                    Image = Archive;
                    ToolTip = 'Executes the Archi&ve Document action.';
                    trigger OnAction()
                    begin
                        ArchiveManagement.ArchivePurchDocument(Rec);
                        CurrPage.Update(false);
                    end;
                }
                action("Send IC Purchase Order")
                {
                    AccessByPermission = tabledata "IC G/L Account" = R;
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
                        //IF ApprovalMgt.PrePostApprovalCheck(SalesHeader,Rec) then
                        ICInOutboxMgt.SendPurchDoc(Rec, false);
                    end;
                }
                separator(Action189) { }
            }
            group(Approval)
            {
                Caption = 'Approval';
                Image = Approval;
                group(ActionGroup21)
                {
                    Caption = 'Approval';
                    Image = Approval;
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
                }
            }
            group(ActionGroup17)
            {
                Caption = 'Warehouse';
                Image = Warehouse;
                action("Create &Whse. Receipt")
                {
                    AccessByPermission = tabledata "Warehouse Receipt Header" = R;
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
                    AccessByPermission = tabledata "Posted Invt. Put-away Header" = R;
                    ApplicationArea = Basic;
                    Caption = 'Create Inventor&y Put-away/Pick';
                    Ellipsis = true;
                    Image = CreateInventoryPickup;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Create Inventor&y Put-away/Pick action.';
                    trigger OnAction()
                    begin
                        Rec.CreateInvtPutAwayPick();

                        if not Rec.Find('=><') then
                            Rec.Init();
                    end;
                }
                separator(Action74) { }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action(Post)
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
                        Post(Codeunit::"Purch.-Post (Yes/No)");
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
                        Post(Codeunit::"Purch.-Post + Print");
                    end;
                }
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
                action("Post &Batch")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post &Batch';
                    Ellipsis = true;
                    Image = PostBatch;
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
                    Visible = JobQueueVisible;
                    ToolTip = 'Executes the Remove From Job Queue action.';
                    trigger OnAction()
                    begin
                        Rec.CancelBackgroundPosting();
                    end;
                }
                action(ArchiveUnusedDoc)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the ArchiveUnusedDoc action.';
                    trigger OnAction()
                    begin
                        UserSet.Reset();
                        UserSet.SetRange(UserSet."Archiving User", UserId);
                        if not UserSet.Find('-') then
                            Error('Sorry you have no permission to Arhchive Unused Order,');
                        Rec."Archive Unused Doc" := true;
                        Rec.Modify();
                    end;
                }
                separator(Action201) { }
                group("Prepa&yment")
                {
                    Caption = 'Prepa&yment';
                    Image = Prepayment;
                    action("Prepayment Test &Report")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Prepayment Test &Report';
                        Ellipsis = true;
                        Image = PrepaymentSimulation;
                        ToolTip = 'Executes the Prepayment Test &Report action.';
                        trigger OnAction()
                        begin
                            ReportPrint.PrintPurchHeaderPrepmt(Rec);
                        end;
                    }
                    action(PostPrepaymentInvoice)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Post Prepayment &Invoice';
                        Ellipsis = true;
                        Image = PrepaymentPost;
                        ToolTip = 'Executes the Post Prepayment &Invoice action.';
                        trigger OnAction()
                        var
                            SalesHeader: Record "Sales Header";
                            VarVariant: Variant;
                            CustomApprovals: Codeunit "Approvals Mgt";
                            //ApprovalMgt: Codeunit "Export F/O Consolidation";
                            PurchPostYNPrepmt: Codeunit "Purch.-Post Prepmt. (Yes/No)";
                        begin
                            //IF ApprovalMgt.PrePostApprovalCheck(SalesHeader,Rec) then
                            PurchPostYNPrepmt.PostPrepmtInvoiceYN(Rec, false);
                        end;
                    }
                    action("Post and Print Prepmt. Invoic&e")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Post and Print Prepmt. Invoic&e';
                        Ellipsis = true;
                        Image = PrepaymentPostPrint;
                        ToolTip = 'Executes the Post and Print Prepmt. Invoic&e action.';
                        trigger OnAction()
                        var
                            SalesHeader: Record "Sales Header";
                            VarVariant: Variant;
                            CustomApprovals: Codeunit "Approvals Mgt";
                            //ApprovalMgt: Codeunit "Export F/O Consolidation";
                            PurchPostYNPrepmt: Codeunit "Purch.-Post Prepmt. (Yes/No)";
                        begin
                            //IF ApprovalMgt.PrePostApprovalCheck(SalesHeader,Rec) then
                            PurchPostYNPrepmt.PostPrepmtInvoiceYN(Rec, true);
                        end;
                    }
                    action(PostPrepaymentCreditMemo)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Post Prepayment &Credit Memo';
                        Ellipsis = true;
                        Image = PrepaymentPost;
                        ToolTip = 'Executes the Post Prepayment &Credit Memo action.';
                        trigger OnAction()
                        var
                            SalesHeader: Record "Sales Header";
                            VarVariant: Variant;
                            CustomApprovals: Codeunit "Approvals Mgt";
                            //ApprovalMgt: Codeunit "Export F/O Consolidation";
                            PurchPostYNPrepmt: Codeunit "Purch.-Post Prepmt. (Yes/No)";
                        begin
                            //IF ApprovalMgt.PrePostApprovalCheck(SalesHeader,Rec) then
                            PurchPostYNPrepmt.PostPrepmtCrMemoYN(Rec, false);
                        end;
                    }
                    action("Post and Print Prepmt. Cr. Mem&o")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Post and Print Prepmt. Cr. Mem&o';
                        Ellipsis = true;
                        Image = PrepaymentPostPrint;
                        ToolTip = 'Executes the Post and Print Prepmt. Cr. Mem&o action.';
                        trigger OnAction()
                        var
                            SalesHeader: Record "Sales Header";
                            VarVariant: Variant;
                            CustomApprovals: Codeunit "Approvals Mgt";
                            //ApprovalMgt: Codeunit "Export F/O Consolidation";
                            PurchPostYNPrepmt: Codeunit "Purch.-Post Prepmt. (Yes/No)";
                        begin
                            //IF ApprovalMgt.PrePostApprovalCheck(SalesHeader,Rec) then
                            PurchPostYNPrepmt.PostPrepmtCrMemoYN(Rec, true);
                        end;
                    }
                }
            }
            group(Print)
            {
                Caption = 'Print';
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
                        DocPrint.PrintPurchHeader(Rec);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        JobQueueVisible := Rec."Job Queue Status" = Rec."Job Queue Status"::"Scheduled for Posting";
        SetExtDocNoMandatoryCondition();
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord();
        exit(Rec.ConfirmDeletion());
    end;

    trigger OnInit()
    begin
        SetExtDocNoMandatoryCondition();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter();
    end;

    trigger OnOpenPage()
    begin
        SetDocNoVisible();

        if UserMgt.GetPurchasesFilter() <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange(Rec."Responsibility Center", UserMgt.GetPurchasesFilter());
            Rec.FilterGroup(0);
        end;
    end;

    var
        ChangeExchangeRate: Page "Change Exchange Rate";
        CopyPurchDoc: Report "Copy Purchase Document";
        MoveNegPurchLines: Report "Move Negative Purchase Lines";
        ReportPrint: Codeunit "Test Report-Print";
        DocPrint: Codeunit "Document-Print";
        UserMgt: Codeunit "User Setup Management";
        ArchiveManagement: Codeunit ArchiveManagement;
        PurchCalcDiscByType: Codeunit "Purch - Calc Disc. By Type";
        [InDataSet]
        JobQueueVisible: Boolean;
        DocNoVisible: Boolean;
        VendorInvoiceNoMandatory: Boolean;
        BCSetup: Record "Budgetary Control Setup";
        AllFieldsEntered: Boolean;
        DeleteCommitment: Record Committment;
        Commitment: Codeunit "Budgetary Control";
        PurchLine: Record "Purchase Line";
        UserSet: Record "User Setup";

    local procedure Post(PostingCodeunitID: Integer)
    begin
        Rec.SendToPosting(PostingCodeunitID);
        if Rec."Job Queue Status" = Rec."Job Queue Status"::"Scheduled for Posting" then
            CurrPage.Close();
        CurrPage.Update(false);
    end;

    local procedure ApproveCalcInvDisc()
    begin
        CurrPage.PurchLines.Page.ApproveCalcInvDisc();
    end;

    local procedure BuyfromVendorNoOnAfterValidate()
    begin
        if Rec.GetFilter(Rec."Buy-from Vendor No.") = xRec."Buy-from Vendor No." then
            if Rec."Buy-from Vendor No." <> xRec."Buy-from Vendor No." then
                Rec.SetRange(Rec."Buy-from Vendor No.");
        CurrPage.Update();
    end;

    local procedure PurchaserCodeOnAfterValidate()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure PaytoVendorNoOnAfterValidate()
    begin
        CurrPage.Update();
    end;

    local procedure ShortcutDimension1CodeOnAfterV()
    begin
        CurrPage.Update();
    end;

    local procedure ShortcutDimension2CodeOnAfterV()
    begin
        CurrPage.Update();
    end;

    local procedure PricesIncludingVATOnAfterValid()
    begin
        CurrPage.Update();
    end;

    local procedure Prepayment37OnAfterValidate()
    begin
        CurrPage.Update();
    end;

    local procedure SetDocNoVisible()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Reminder,FinChMemo;
    begin
        DocNoVisible := DocumentNoVisibility.PurchaseDocumentNoIsVisible(DocType::Order, Rec."No.");
    end;

    local procedure SetExtDocNoMandatoryCondition()
    var
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
    begin
        PurchasesPayablesSetup.Get();
        VendorInvoiceNoMandatory := PurchasesPayablesSetup."Ext. Doc. No. Mandatory"
    end;


    procedure CheckforRequiredFields(): Boolean
    var
        PurchLine: Record "Purchase Line";
    begin
        AllFieldsEntered := true;
        PurchLine.Reset();
        PurchLine.SetRange(PurchLine."Document Type", Rec."Document Type");
        PurchLine.SetRange(PurchLine."Document No.", Rec."No.");
        if PurchLine.Find('-') then begin
            repeat
                if (PurchLine.Type = PurchLine.Type::" ") or (PurchLine."No." = '') or (PurchLine."Line Amount" = 0) then
                    AllFieldsEntered := false;
            until PurchLine.Next() = 0;
            exit(AllFieldsEntered)
        end;
    end;


    procedure SomeLinesCommitted() Exists: Boolean
    var
        PurchLines: Record "Purchase Line";
    begin
        if BCSetup.Get() then begin
            Exists := false;
            PurchLines.Reset();
            PurchLines.SetRange(PurchLines."Document Type", Rec."Document Type");
            PurchLines.SetRange(PurchLines."Document No.", Rec."No.");
            PurchLines.SetRange(PurchLines.Committed, true);
            if PurchLines.Find('-') then
                Exists := true
            else
                Exists := false;
        end;
    end;
}
