#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193737 "Sales Invoice - Rich"
{
    Caption = 'Sales Invoice';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Sales Header";
    SourceTableView = where("Document Type" = filter(Invoice),
                            "Status 2" = const("3"));
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
                    ToolTip = 'Specifies the number of the estimate.';
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the number of the customer who will receive the products and be billed by default.';
                    trigger OnValidate()
                    begin
                        SelltoCustomerNoOnAfterValidat();
                    end;
                }
                field("Sell-to Contact No."; Rec."Sell-to Contact No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the contact person at the customer.';
                    trigger OnValidate()
                    begin
                        if Rec.GetFilter(Rec."Sell-to Contact No.") = xRec."Sell-to Contact No." then
                            if Rec."Sell-to Contact No." <> xRec."Sell-to Contact No." then
                                Rec.SetRange(Rec."Sell-to Contact No.");
                    end;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the customer''s name.';
                }
                field("Sell-to Address"; Rec."Sell-to Address")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the address where the customer is located.';
                }
                field("Sell-to Address 2"; Rec."Sell-to Address 2")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies additional address information.';
                }
                field("Sell-to Post Code"; Rec."Sell-to Post Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the postal code.';
                }
                field("Sell-to City"; Rec."Sell-to City")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the address city.';
                }
                field("Sell-to Contact"; Rec."Sell-to Contact")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the contact person at the customer.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the date when the posting of the sales document will be recorded.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies when the sales invoice was created.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies a document number that refers to the customer''s or vendor''s numbering system.';
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the salesperson who is assigned to the customer.';
                    trigger OnValidate()
                    begin
                        SalespersonCodeOnAfterValidate();
                    end;
                }
                field("Campaign No."; Rec."Campaign No.")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the number of the campaign that the document is linked to.';
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
                    ToolTip = 'Specifies the status of a job queue entry or task that handles the posting of sales credit memos.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies whether the document is open, waiting to be approved, has been invoiced for prepayment, or has been released to the next stage of processing.';
                }
            }
            part(SalesLines; "Sales Invoice Subform")
            {
                SubPageLink = "Document No." = field("No.");
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the number of the customer that you send or sent the invoice or credit memo to.';
                    trigger OnValidate()
                    begin
                        BilltoCustomerNoOnAfterValidat();
                    end;
                }
                field("Bill-to Contact No."; Rec."Bill-to Contact No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the contact person at the billing address.';
                }
                field("Bill-to Name"; Rec."Bill-to Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the customer to whom you will send the invoice, when different from the customer that you are selling to.';
                }
                field("Bill-to Address"; Rec."Bill-to Address")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the address of the customer that you will send the invoice to.';
                }
                field("Bill-to Address 2"; Rec."Bill-to Address 2")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies an additional part of the billing address.';
                }
                field("Bill-to Post Code"; Rec."Bill-to Post Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the postal code of the billing address.';
                }
                field("Bill-to City"; Rec."Bill-to City")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the city of the billing address.';
                }
                field("Bill-to Contact"; Rec."Bill-to Contact")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the name of the contact person at the billing address';
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
                    ToolTip = 'Specifies when the sales invoice must be paid.';
                }
                field("Payment Discount %"; Rec."Payment Discount %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the payment discount percentage that is granted if the customer pays on or before the date entered in the Pmt. Discount Date field. The discount percentage is specified in the Payment Terms Code field.';
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
                /* field("Credit Card No."; Rec."Credit Card No.")
                {
                    ApplicationArea = Basic;
                }
                field(GetCreditcardNumber; Rec.GetCreditcardNumber)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cr. Card Number (Last 4 Digits)';
                } */
            }
            group(Shipping)
            {
                Caption = 'Shipping';
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the code for another shipment address than the customer''s own address, which is entered by default.';
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name that products on the sales document will be shipped to.';
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the address that products on the sales document will be shipped to. By default, the field is filled with the value in the Address field on the customer card or with the value in the Address field in the Ship-to Address window.';
                }
                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies an additional part of the shipping address.';
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the postal code of the shipping address.';
                }
                field("Ship-to City"; Rec."Ship-to City")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the city of the shipping address.';
                }
                field("Ship-to Contact"; Rec."Ship-to Contact")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the name of the contact person at the address that products on the sales document will be shipped to.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the location from where inventory items to the customer on the sales document are to be shipped by default.';
                }
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies how items on the sales document are shipped to the customer.';
                }
                field("Shipping Agent Code"; Rec."Shipping Agent Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies which shipping agent is used to transport the items on the sales document to the customer.';
                }
                field("Package Tracking No."; Rec."Package Tracking No.")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the shipping agent''s package number.';
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.';
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
                        CurrencyCodeOnAfterValidate();
                    end;
                }
                field("EU 3-Party Trade"; Rec."EU 3-Party Trade")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies if the transaction is related to trade with a third party within the EU.';
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
                field("Exit Point"; Rec."Exit Point")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the point of exit through which you ship the items out of your country/region, for reporting to Intrastat.';
                }
                field("Area"; Rec.Area)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the country or region of origin for the purpose of Intrastat reporting.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Control1903720907; "Sales Hist. Sell-to FactBox")
            {
                SubPageLink = "No." = field("Sell-to Customer No.");
                Visible = false;
            }
            part(Control1907234507; "Sales Hist. Bill-to FactBox")
            {
                SubPageLink = "No." = field("Bill-to Customer No.");
                Visible = false;
            }
            part(Control1902018507; "Customer Statistics FactBox")
            {
                SubPageLink = "No." = field("Bill-to Customer No.");
                Visible = true;
            }
            part(Control1900316107; "Customer Details FactBox")
            {
                SubPageLink = "No." = field("Sell-to Customer No.");
                Visible = true;
            }
            part(Control1906127307; "Sales Line FactBox")
            {
                Provider = SalesLines;
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Line No." = field("Line No.");
                Visible = false;
            }
            part(Control1901314507; "Item Invoicing FactBox")
            {
                Provider = SalesLines;
                SubPageLink = "No." = field("No.");
                Visible = true;
            }
            part(Control1906354007; "Approval FactBox")
            {
                SubPageLink = "Table ID" = const(36),
                              "Document Type" = field("Document Type"),
                              "Document No." = field("No.");
                Visible = false;
            }
            part(Control1907012907; "Resource Details FactBox")
            {
                Provider = SalesLines;
                SubPageLink = "No." = field("No.");
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
                        Page.RunModal(Page::"Sales Statistics", Rec);
                    end;
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
                action(Customer)
                {
                    ApplicationArea = Basic;
                    Caption = 'Customer';
                    Image = Customer;
                    RunObject = page "Customer Card";
                    RunPageLink = "No." = field("Sell-to Customer No.");
                    ShortcutKey = 'Shift+F7';
                    ToolTip = 'Executes the Customer action.';
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
                        ApprovalEntries.Setfilters(Database::"Sales Header", Rec."Document Type", Rec."No.");
                        ApprovalEntries.Run();
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = page "Sales Comment Sheet";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "No." = field("No."),
                                  "Document Line No." = const(0);
                    ToolTip = 'Executes the Co&mments action.';
                }
                separator(Action171) { }
            }
            group("Credit Card")
            {
                Caption = 'Credit Card';
                Image = CreditCardLog;
                /* action("Credit Cards Transaction Lo&g Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Credit Cards Transaction Lo&g Entries';
                    Image = CreditCardLog;
                    RunObject = Page "DO Payment Trans. Log Entries";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("No."),
                                  "Customer No." = field("Bill-to Customer No.");
                } */
            }
        }
        area(Processing)
        {
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
                    ShortcutKey = 'Ctrl+F9';
                    ToolTip = 'Executes the Re&lease action.';
                    trigger OnAction()
                    var
                        ReleaseSalesDoc: Codeunit "Release Sales Document";
                    begin
                        ReleaseSalesDoc.PerformManualRelease(Rec);
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
                        ReleaseSalesDoc: Codeunit "Release Sales Document";
                    begin
                        ReleaseSalesDoc.PerformManualReopen(Rec);
                    end;
                }
                separator(Action168) { }
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
                separator(Action142) { }
                action("Get St&d. Cust. Sales Codes")
                {
                    ApplicationArea = Basic;
                    Caption = 'Get St&d. Cust. Sales Codes';
                    Ellipsis = true;
                    Image = CustomerCode;
                    ToolTip = 'Executes the Get St&d. Cust. Sales Codes action.';
                    trigger OnAction()
                    var
                        StdCustSalesCode: Record "Standard Customer Sales Code";
                    begin
                        StdCustSalesCode.InsertSalesLines(Rec);
                    end;
                }
                separator(Action139) { }
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
                        CopySalesDoc.SetSalesHeader(Rec);
                        CopySalesDoc.RunModal();
                        Clear(CopySalesDoc);
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
                        Clear(MoveNegSalesLines);
                        MoveNegSalesLines.SetSalesHeader(Rec);
                        MoveNegSalesLines.RunModal();
                        MoveNegSalesLines.ShowDocument();
                    end;
                }
                separator(Action141) { }
                action("Send A&pproval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                    //ApprovalMgt: Codeunit "Export F/O Consolidation";
                    begin
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        //ApprovalMgt.SendSalesApprovalRequest(Rec) then;
                    end;
                }
                action("Cancel Approval Re&quest")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                    //ApprovalMgt: Codeunit "Export F/O Consolidation";
                    begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        //ApprovalMgt.CancelSalesApprovalRequest(Rec, true, true) then;
                    end;
                }
                separator(Action161) { }
            }
            group(ActionGroup11)
            {
                Caption = 'Credit Card';
                Image = AuthorizeCreditCard;
                action(Authorize)
                {
                    ApplicationArea = Basic;
                    Caption = 'Authorize';
                    Image = AuthorizeCreditCard;
                    ToolTip = 'Executes the Authorize action.';

                }
                action("Void A&uthorize")
                {
                    ApplicationArea = Basic;
                    Caption = 'Void A&uthorize';
                    Image = VoidCreditCard;
                    ToolTip = 'Executes the Void A&uthorize action.';

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
                        Post(Codeunit::"Sales-Post (Yes/No)");
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
                        ReportPrint.PrintSalesHeader(Rec);
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
                        Post(Codeunit::"Sales-Post + Print");
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
                        Report.RunModal(Report::"Batch Post Sales Invoices", true, true, Rec);
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

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Status 2" := Rec."Status 2"::"2"
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetSalesFilter();
    end;


    var
        ChangeExchangeRate: Page "Change Exchange Rate";
        CopySalesDoc: Report "Copy Sales Document";
        MoveNegSalesLines: Report "Move Negative Sales Lines";
        ReportPrint: Codeunit "Test Report-Print";
        UserMgt: Codeunit "User Setup Management";
        [InDataSet]
        JobQueueVisible: Boolean;

    local procedure Post(PostingCodeunitID: Integer)
    begin
        Rec.SendToPosting(PostingCodeunitID);
        if Rec."Job Queue Status" = Rec."Job Queue Status"::"Scheduled for Posting" then
            CurrPage.Close();
        CurrPage.Update(false);
    end;

    local procedure ApproveCalcInvDisc()
    begin
        CurrPage.SalesLines.Page.ApproveCalcInvDisc();
    end;

    local procedure SelltoCustomerNoOnAfterValidat()
    begin
        if Rec.GetFilter(Rec."Sell-to Customer No.") = xRec."Sell-to Customer No." then
            if Rec."Sell-to Customer No." <> xRec."Sell-to Customer No." then
                Rec.SetRange(Rec."Sell-to Customer No.");
        CurrPage.Update();
    end;

    local procedure SalespersonCodeOnAfterValidate()
    begin
        //CurrPage.SalesLines.Page.UpdateForm(true);
    end;

    local procedure BilltoCustomerNoOnAfterValidat()
    begin
        CurrPage.Update();
    end;

    local procedure ShortcutDimension1CodeOnAfterV()
    begin
        //CurrPage.SalesLines.Page.UpdateForm(true);
    end;

    local procedure ShortcutDimension2CodeOnAfterV()
    begin
        //CurrPage.SalesLines.Page.UpdateForm(true);
    end;

    local procedure PricesIncludingVATOnAfterValid()
    begin
        CurrPage.Update();
    end;

    local procedure CurrencyCodeOnAfterValidate()
    begin
        //CurrPage.SalesLines.Page.UpdateForm(true);
    end;
}
