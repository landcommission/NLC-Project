#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193738 "Sales Invoice List - Rich"
{
    Caption = 'Sales Invoices';
    CardPageId = "Sales Invoice - Rich";
    Editable = false;
    PageType = List;
    SourceTable = "Sales Header";
    SourceTableView = where("Document Type" = filter(Invoice),
                            "Status 2" = const("2"));
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
                    ToolTip = 'Specifies the number of the estimate.';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the customer who will receive the products and be billed by default.';
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the customer''s name.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a document number that refers to the customer''s or vendor''s numbering system.';
                }
                field("Sell-to Post Code"; Rec."Sell-to Post Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the postal code.';
                }
                field("Sell-to Country/Region Code"; Rec."Sell-to Country/Region Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the country or region of the address.';
                }
                field("Sell-to Contact"; Rec."Sell-to Contact")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the name of the contact person at the customer.';
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the number of the customer that you send or sent the invoice or credit memo to.';
                }
                field("Bill-to Name"; Rec."Bill-to Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the customer to whom you will send the invoice, when different from the customer that you are selling to.';
                }
                field("Bill-to Post Code"; Rec."Bill-to Post Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the postal code of the billing address.';
                }
                field("Bill-to Country/Region Code"; Rec."Bill-to Country/Region Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the country or region of the address.';
                }
                field("Bill-to Contact"; Rec."Bill-to Contact")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the name of the contact person at the billing address';
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the code for another shipment address than the customer''s own address, which is entered by default.';
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the name that products on the sales document will be shipped to.';
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the postal code of the shipping address.';
                }
                field("Ship-to Country/Region Code"; Rec."Ship-to Country/Region Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the country/region of the shipping address.';
                }
                field("Ship-to Contact"; Rec."Ship-to Contact")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the name of the contact person at the address that products on the sales document will be shipped to.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the date when the posting of the sales document will be recorded.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the location from where inventory items to the customer on the sales document are to be shipped by default.';
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the name of the salesperson who is assigned to the customer.';
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
                    ToolTip = 'Specifies when the sales invoice was created.';
                }
                field("Campaign No."; Rec."Campaign No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the number of the campaign that the document is linked to.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies whether the document is open, waiting to be approved, has been invoiced for prepayment, or has been released to the next stage of processing.';
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
                    ToolTip = 'Specifies when the sales invoice must be paid.';
                }
                field("Payment Discount %"; Rec."Payment Discount %")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the payment discount percentage that is granted if the customer pays on or before the date entered in the Pmt. Discount Date field. The discount percentage is specified in the Payment Terms Code field.';
                }
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies how items on the sales document are shipped to the customer.';
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.';
                }
                field("Job Queue Status"; Rec."Job Queue Status")
                {
                    ApplicationArea = Basic;
                    Visible = JobQueueActive;
                    ToolTip = 'Specifies the status of a job queue entry or task that handles the posting of sales credit memos.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Control1902018507; "Customer Statistics FactBox")
            {
                SubPageLink = "No." = field("Bill-to Customer No."),
                              "Date Filter" = field("Date Filter");
                Visible = true;
            }
            part(Control1900316107; "Customer Details FactBox")
            {
                SubPageLink = "No." = field("Bill-to Customer No."),
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
                        ApprovalEntries.Setfilters(Database::"Sales Header", Rec."Document Type", Rec."No.");
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
                separator(Action1102601016) { }
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
                        ReportPrint.PrintSalesHeader(Rec);
                    end;
                }
                action("P&ost")
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
                        Rec.SendToPosting(Codeunit::"Sales-Post (Yes/No)");
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
                        Rec.SendToPosting(Codeunit::"Sales-Post + Print");
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
                        Report.RunModal(Report::"Batch Post Sales Invoices", true, true, Rec);
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
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        Rec.SetSecurityFilterOnRespCenter();
        JobQueueActive := SalesSetup.JobQueueActive();
    end;

    var
        ReportPrint: Codeunit "Test Report-Print";
        [InDataSet]
        JobQueueActive: Boolean;
}
