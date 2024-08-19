#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193749 "Item/Cash Invoice"
{
    Caption = 'Item/Cash Invoice';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = filter(Invoice));
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
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
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
                field("Posting Description"; Rec."Posting Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies additional posting information for the document. After you post the document, the description can add detail to vendor and customer ledger entries.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the date when the posting of the purchase document will be recorded.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when the related document was created.';
                }
                field("Incoming Document Entry No."; Rec."Incoming Document Entry No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the number of the incoming document that this purchase document is created for.';
                }
                field("Vendor Invoice No."; Rec."Vendor Invoice No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the document number of the original document you received from the vendor. You can require the document number for posting, or let it be optional. By default, it''s required, so that this document references the original. Making document numbers optional removes a step from the posting process. For example, if you attach the original invoice as a PDF, you might not need to enter the document number. To specify whether document numbers are required, in the Purchases & Payables Setup window, select or clear the Ext. Doc. No. Mandatory field.';
                }
                field("Order Address Code"; Rec."Order Address Code")
                {
                    ApplicationArea = Basic;
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
                field("Campaign No."; Rec."Campaign No.")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the campaign number the document is linked to.';
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
                    ToolTip = 'Specifies the ID of the user who is responsible for the document.';
                }
                field("Job Queue Status"; Rec."Job Queue Status")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the status of a job queue entry that handles the posting of purchase credit memos.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies whether the record is open, waiting to be approved, invoiced for prepayment, or released to the next stage of processing.';
                }
            }
            part(PurchLines; "Purch. Invoice Subform")
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
                    ToolTip = 'Specifies the address that you want the items in the purchase order to be shipped to.';
                }
                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies additional address information.';
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ApplicationArea = Basic;
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
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the delivery conditions of the related shipment, such as free on board (FOB).';
                }
                field("Expected Receipt Date"; Rec."Expected Receipt Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the date you expect the items to be available in your warehouse. If you leave the field blank, it will be calculated as follows: Planned Receipt Date + Safety Lead Time + Inbound Warehouse Handling Time = Expected Receipt Date.';
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
        }
        area(FactBoxes)
        {
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
                Visible = false;
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
            group("&Invoice")
            {
                Caption = '&Invoice';
                Image = Invoice;
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortcutKey = 'F7';
                    ToolTip = 'Executes the Statistics action.';
                    trigger OnAction()
                    begin
                        Rec.CalcInvDiscForHeader();
                        Commit();
                        Page.RunModal(Page::"Purchase Statistics", Rec);
                    end;
                }
                action(Vendor)
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor';
                    Image = Vendor;
                    RunObject = page "Vendor Card";
                    RunPageLink = "No." = field("Buy-from Vendor No.");
                    ShortcutKey = 'Shift+F7';
                    ToolTip = 'Executes the Vendor action.';
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
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        ApprovalEntries.Setfilters(Database::"Purchase Header", Rec."Document Type", Rec."No.");
                        ApprovalEntries.Run();
                    end;
                }
            }
        }
        area(Processing)
        {
            group(Release)
            {
                Caption = 'Release';
                Image = Release;
                action("Re&lease")
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
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Calculate &Invoice Discount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Calculate &Invoice Discount';
                    Image = CalculateInvoiceDiscount;
                    ToolTip = 'Executes the Calculate &Invoice Discount action.';
                    trigger OnAction()
                    begin
                        ApproveCalcInvDisc();
                    end;
                }
                separator(Action133) { }
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
                separator(Action136) { }
                action("Copy Document")
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
                action(MoveNegativeLines)
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
                separator(Action137) { }
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
                separator(Action144) { }
            }
            group(Budget)
            {
                Caption = 'Budget';
                Image = Balance;
                action("Check Budget Availability")
                {
                    ApplicationArea = Basic;
                    Caption = 'Check Budget Availability';
                    Image = Balance;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Check Budget Availability action.';
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
                action("Cancel Budget Commitment")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Budget Commitment';
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Cancel Budget Commitment action.';
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
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
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
                action("Post and &Print")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post and &Print';
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
                action("Post &Batch")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post &Batch';
                    Ellipsis = true;
                    Image = PostBatch;
                    ToolTip = 'Executes the Post &Batch action.';
                    trigger OnAction()
                    begin
                        Report.RunModal(Report::"Batch Post Purchase Invoices", true, true, Rec);
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
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        JobQueueVisible := Rec."Job Queue Status" = Rec."Job Queue Status"::"Scheduled for Posting";
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord();
        exit(Rec.ConfirmDeletion());
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter();
    end;


    var
        ChangeExchangeRate: Page "Change Exchange Rate";
        CopyPurchDoc: Report "Copy Purchase Document";
        MoveNegPurchLines: Report "Move Negative Purchase Lines";
        ReportPrint: Codeunit "Test Report-Print";
        UserMgt: Codeunit "User Setup Management";
        [InDataSet]
        JobQueueVisible: Boolean;
        Commitment: Codeunit "Budgetary Control";
        BCSetup: Record "Budgetary Control Setup";
        DeleteCommitment: Record Committment;
        PurchLine: Record "Purchase Line";
        AllFieldsEntered: Boolean;
        ConfirmOrderNo: Boolean;

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


    procedure LinesCommitted() Exists: Boolean
    var
        PurchLines: Record "Purchase Line";
    begin
        if BCSetup.Get() then begin
            if not BCSetup.Mandatory then begin
                Exists := false;
                exit;
            end;
        end else begin
            Exists := false;
            exit;
        end;
        if BCSetup.Get() then begin
            Exists := false;
            PurchLines.Reset();
            PurchLines.SetRange(PurchLines."Document Type", Rec."Document Type");
            PurchLines.SetRange(PurchLines."Document No.", Rec."No.");
            PurchLines.SetRange(PurchLines.Committed, false);
            if PurchLines.Find('-') then
                Exists := true;
        end else
            Exists := false;
    end;


    procedure CheckforRequiredFields(): Boolean
    var
        PurchLines: Record "Purchase Line";
    begin
        AllFieldsEntered := true;
        PurchLines.Reset();
        PurchLines.SetRange(PurchLines."Document Type", Rec."Document Type");
        PurchLines.SetRange(PurchLines."Document No.", Rec."No.");
        if PurchLines.Find('-') then begin
            repeat
                if (PurchLines.Type = PurchLines.Type::" ") or (PurchLines."No." = '') or (PurchLines."Outstanding Amount (LCY)" = 0) then
                    AllFieldsEntered := false;
            until PurchLines.Next() = 0;
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
                Exists := true;
        end else
            Exists := false;
    end;


    procedure UpdateControls()
    begin

        /*IF Status<>Status::Open THEN BEGIN
          CurrPage.PurchLines.EDITABLE:=FALSE;
         END ELSE
           CurrPage.PurchLines.EDITABLE:=TRUE;*/

    end;
}
