#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193618 "Internal Requisitions"
{
    Caption = 'Internal Requisitions';
    DeleteAllowed = false;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = const(Quote),
                            DocApprovalType = const(Requisition),
                            Status = filter(Open | "Pending Approval"));
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = StatusEditable;
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
                field("Requested Receipt Date"; Rec."Requested Receipt Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date that you want the vendor to deliver your order. The field is used to calculate the latest date you can order, as follows: requested receipt date - lead time calculation = order date. If you do not need delivery on a specific date, you can leave the field blank.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the code of the responsibility center, such as a distribution hub, that is associated with the involved user, company, customer, or vendor.';
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
                field("Posting Description"; Rec."Posting Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies additional posting information for the document. After you post the document, the description can add detail to vendor and customer ledger entries.';
                }
                field("No. of Archived Versions"; Rec."No. of Archived Versions")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the number of archived versions for this document.';
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
                field("Responsible Officer"; Rec."Responsible Officer")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Responsible Officer field.';
                }
                field("Procurement Type Code"; Rec."Procurement Type Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Procurement Type Code field.';
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                    ToolTip = 'Specifies the ID of the user who is responsible for the document.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies whether the record is open, waiting to be approved, invoiced for prepayment, or released to the next stage of processing.';
                }
            }
            part(PurchLines; "Purchase Quote Subform")
            {
                Editable = StatusEditable;
                SubPageLink = "Document No." = field("No.");
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
            part(Control1906354007; "Approval FactBox")
            {
                SubPageLink = "Table ID" = const(38),
                              "Document Type" = field("Document Type"),
                              "Document No." = field("No.");
                Visible = false;
            }
            part(Control5; "Purchase Line FactBox")
            {
                Provider = PurchLines;
                SubPageLink = "Document Type" = field("Document Type"),
                              "No." = field("No."),
                              "Line No." = field("Line No.");
            }
            systempart(Control1900383207; Links)
            {
                Visible = true;
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
            group("&Quote")
            {
                Caption = '&Quote';
                Image = Quote;
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
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
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


                    if LinesCommitted() then
                        Error('All Lines should be committed');
                    Rec.Reset();
                    Rec.SetRange(Rec."No.", Rec."No.");
                    Report.Run(39005984, true, true, Rec);
                    Rec.Reset();
                    //DocPrint.PrintPurchHeader(Rec);
                end;
            }
            group(ActionGroup3)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                separator(Action148) { }
                action(Release)
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortcutKey = 'Ctrl+F9';
                    Visible = false;
                    ToolTip = 'Executes the Re&lease action.';
                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Award Schedule")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Award Schedule action.';
                    //RunObject = Page UnknownPage39005947;
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
                separator(Action144) { }
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
                separator(Action146) { }
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
                separator(Action147) { }
                action("Send A&pproval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                    //ApprovalMgt: Codeunit "Export F/O Consolidation";
                    begin
                        if LinesCommitted() then
                            Error('All Lines should be committed');

                        Rec.TestField(Rec.Status, Rec.Status::Open);
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        //ApprovalMgt.SendPurchaseApprovalRequest(Rec);
                    end;
                }
                action("Cancel Approval Re&quest")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                    //ApprovalMgt: Codeunit "Export F/O Consolidation";
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::"Pending Approval");
                        //if ApprovalMgt.CancelPurchaseApprovalRequest(Rec,true,true) then;
                    end;
                }
                separator(Action10) { }
                action("Check Budget Availability")
                {
                    ApplicationArea = Basic;
                    Image = Balance;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Check Budget Availability action.';
                    trigger OnAction()
                    begin

                        BCSetup.Get();
                        if not BCSetup.Mandatory then
                            exit;

                        if Rec.Status = Rec.Status::Released then
                            Error('This document has already been released. This functionality is available for open documents only');
                        if SomeLinesCommitted() then begin
                            if not Confirm('Some or All the Lines Are already Committed do you want to continue', true, Rec."Document Type") then
                                Error('Budget Availability Check and Commitment Aborted');
                            DeleteCommitment.Reset();
                            DeleteCommitment.SetRange(DeleteCommitment."Document Type", DeleteCommitment."Document Type"::Requisition);
                            DeleteCommitment.SetRange(DeleteCommitment."Document No.", Rec."No.");
                            DeleteCommitment.DeleteAll();
                        end;
                        Commitment.CheckPurchase(Rec);
                        Message('Budget Availability Checking Complete');
                    end;
                }
                action("Cancel Budget Commitment")
                {
                    ApplicationArea = Basic;
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Cancel Budget Commitment action.';
                    trigger OnAction()
                    begin

                        if not Confirm('Are you sure you want to Cancel All Commitments Done for this document', true, Rec."Document Type") then
                            Error('Budget Availability Check and Commitment Aborted');

                        DeleteCommitment.Reset();
                        DeleteCommitment.SetRange(DeleteCommitment."Document Type", DeleteCommitment."Document Type"::Requisition);
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
            group("Make Order1")
            {
                Caption = 'Make Order';
                Image = MakeOrder;
                action("Make Order")
                {
                    ApplicationArea = Basic;
                    Caption = 'Make &Order';
                    Image = MakeOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;
                    ToolTip = 'Executes the Make &Order action.';
                    trigger OnAction()
                    var
                        SalesHeader: Record "Sales Header";
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                    //ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        //if ApprovalMgt.PrePostApprovalCheck(SalesHeader,Rec) then
                        Codeunit.Run(Codeunit::"Purch.-Quote to Order (Yes/No)", Rec);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        UpdateControls();
    end;

    trigger OnAfterGetRecord()
    begin
        CurrPageUpdate();
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord();
        exit(Rec.ConfirmDeletion());
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.DocApprovalType := Rec.DocApprovalType::Requisition;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter();
        Rec."Assigned User ID" := UserId;
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        UpdateControls();
    end;


    var
        ChangeExchangeRate: Page "Change Exchange Rate";
        CopyPurchDoc: Report "Copy Purchase Document";
        DocPrint: Codeunit "Document-Print";
        UserMgt: Codeunit "User Setup Management";
        ArchiveManagement: Codeunit ArchiveManagement;
        Commitment: Codeunit "Budgetary Control";
        BCSetup: Record "Budgetary Control Setup";
        DeleteCommitment: Record Committment;
        PurchLine: Record "Purchase Line";
        StatusEditable: Boolean;

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
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure ShortcutDimension2CodeOnAfterV()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure PricesIncludingVATOnAfterValid()
    begin
        CurrPage.Update();
    end;

    local procedure CurrencyCodeOnAfterValidate()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
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
        if Rec.Status = Rec.Status::Open then
            StatusEditable := true
        else
            StatusEditable := false;
    end;


    procedure CurrPageUpdate()
    begin
        xRec := Rec;
        UpdateControls();
        CurrPage.Update();
    end;
}
