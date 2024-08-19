#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193717 "Posted Purchase Requisitions"
{
    CardPageId = "Released Internal Requisitions";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Approvals,Budget,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = filter(Quote),
                            DocApprovalType = filter(Requisition),
                            Status = const(Released));
    ApplicationArea = All;
    Caption = 'Posted Purchase Requisitions';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Posting Description"; Rec."Posting Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies additional posting information for the document. After you post the document, the description can add detail to vendor and customer ledger entries.';
                }
                field("Requested Receipt Date"; Rec."Requested Receipt Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date that you want the vendor to deliver your order. The field is used to calculate the latest date you can order, as follows: requested receipt date - lead time calculation = order date. If you do not need delivery on a specific date, you can leave the field blank.';
                }
                field("Procurement Type Code"; Rec."Procurement Type Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Type Code field.';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when the order was created.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when the related document was created.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code of the responsibility center, such as a distribution hub, that is associated with the involved user, company, customer, or vendor.';
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the ID of the user who is responsible for the document.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the record is open, waiting to be approved, invoiced for prepayment, or released to the next stage of processing.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1102755012; Notes) { }
            systempart(Control1102755013; MyNotes) { }
            systempart(Control1102755014; Links) { }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("<Action59>")
            {
                Caption = '&Quote';
                action("<Action61>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Statistics';
                    Image = Statistics;
                    ShortcutKey = 'F7';
                    ToolTip = 'Executes the Statistics action.';
                    trigger OnAction()
                    begin
                        Rec.CalcInvDiscForHeader();
                        Commit();
                        Page.RunModal(Page::"Purchase Statistics", Rec);
                    end;
                }
                action("<Action62>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Card';
                    Image = EditLines;
                    RunObject = page "Vendor Card";
                    RunPageLink = "No." = field("Buy-from Vendor No.");
                    ShortcutKey = 'Shift+F7';
                    ToolTip = 'Executes the Card action.';
                }
                action("<Action63>")
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
                action("<Action111>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ToolTip = 'Executes the Dimensions action.';
                    trigger OnAction()
                    begin
                        Rec.ShowDocDim();
                    end;
                }
                action("<Action152>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    begin
                        ApprovalEntries.Setfilters(Database::"Purchase Header", Rec."Document Type", Rec."No.");
                        ApprovalEntries.Run();
                    end;
                }
            }
            group("<Action104>")
            {
                Caption = '&Line';
                group("<Action105>")
                {
                    Caption = 'Item Availability by';
                    action("<Action109>")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Variant';
                        ToolTip = 'Executes the Variant action.';
                    }
                    action("<Action106>")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Location';
                        ToolTip = 'Executes the Location action.';
                    }
                }
                action("<Action112>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortcutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                }
                action("<Action168>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    ToolTip = 'Executes the Co&mments action.';
                }
                action("<Action5800>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Item Charge &Assignment';
                    ToolTip = 'Executes the Item Charge &Assignment action.';
                }
                action("<Action6500>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    ShortcutKey = 'Shift+Ctrl+I';
                    ToolTip = 'Executes the Item &Tracking Lines action.';
                }
            }
        }
        area(Processing)
        {
            action("<Action69>")
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
                //ApprovalMgt: Codeunit "Export F/O Consolidation";
                begin
                    if LinesCommitted() then
                        Error('All Lines should be committed');

                    //PrePostApprovalCheck(SalesHeader, Rec) then
                    Codeunit.Run(Codeunit::"Purch.-Quote to Order (Yes/No)", Rec);
                end;
            }
            group("<Action64>")
            {
                Caption = 'F&unctions';
                action("<Action65>")
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
                separator(Action1102755037) { }
                action("<Action67>")
                {
                    ApplicationArea = Basic;
                    Caption = 'E&xplode BOM';
                    Image = ExplodeBOM;
                    ToolTip = 'Executes the E&xplode BOM action.';
                }
                action("<Action18>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Insert &Ext. Texts';
                    ToolTip = 'Executes the Insert &Ext. Texts action.';
                }
                separator(Action1102755034) { }
                action("<Action143>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Get St&d. Vend. Purchase Codes';
                    Ellipsis = true;
                    ToolTip = 'Executes the Get St&d. Vend. Purchase Codes action.';
                    trigger OnAction()
                    var
                        StdVendPurchCode: Record "Standard Vendor Purchase Code";
                    begin
                        StdVendPurchCode.InsertPurchLines(Rec);
                    end;
                }
                separator(Action1102755032) { }
                action("<Action66>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy Document';
                    Ellipsis = true;
                    Image = CopyDocument;
                    ToolTip = 'Executes the Copy Document action.';
                    trigger OnAction()
                    begin
                        CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RunModal();
                        Clear(CopyPurchDoc);
                    end;
                }
                action("<Action138>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Archi&ve Document';
                    ToolTip = 'Executes the Archi&ve Document action.';
                    trigger OnAction()
                    begin
                        ArchiveManagement.ArchivePurchDocument(Rec);
                        CurrPage.Update(false);
                    end;
                }
                separator(Action1102755029) { }
                action("<Action153>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                    //ApprovalMgt: Codeunit "Export F/O Consolidation";
                    begin
                        if LinesCommitted() then
                            Error('All Lines should be committed');

                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        //ApprovalMgt.SendPurchaseApprovalRequest(Rec) then;
                    end;
                }
                action("<Action154>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                    //ApprovalMgt: Codeunit "Export F/O Consolidation";
                    begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        //ApprovalMgt.CancelPurchaseApprovalRequest(Rec, true, true) then;
                    end;
                }
                separator(Action1102755026) { }
                action("<Action1102755002>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Check Budget Availability';
                    Image = Balance;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Check Budget Availability action.';
                    trigger OnAction()
                    var
                        BCSetup: Record "Budgetary Control Setup";
                    begin

                        BCSetup.Get();
                        if not BCSetup.Mandatory then
                            exit;

                        if Rec.Status = Rec.Status::Released then
                            Error('This document has already been released. This functionality is available for open documents only');
                        if not SomeLinesCommitted() then begin
                            if not Confirm('Some or All the Lines Are already Committed do you want to continue', true, Rec."Document Type") then
                                Error('Budget Availability Check and Commitment Aborted');
                            DeleteCommitment.Reset();
                            DeleteCommitment.SetRange(DeleteCommitment."Document Type", DeleteCommitment."Document Type"::LPO);
                            DeleteCommitment.SetRange(DeleteCommitment."Document No.", Rec."No.");
                            DeleteCommitment.DeleteAll();
                        end;
                        Commitment.CheckPurchase(Rec);
                        Message('Budget Availability Checking Complete');
                    end;
                }
                action("<Action1102755003>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Budget Commitment';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category5;
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
                separator(Action1102755023) { }
                action("<Action118>")
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
                        if LinesCommitted() then
                            Error('All Lines should be committed');

                        ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action("<Action119>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    ToolTip = 'Executes the Re&open action.';
                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        if LinesCommitted() then
                            Error('All Lines should be committed');

                        ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
                separator(Action1102755020) { }
                action("<Action135>")
                {
                    ApplicationArea = Basic;
                    Caption = '&Send BizTalk Rqst. for Purch. Quote';
                    ToolTip = 'Executes the &Send BizTalk Rqst. for Purch. Quote action.';

                }
            }
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
            action(PurchHistoryBtn)
            {
                ApplicationArea = Basic;
                Caption = 'Purchase H&istory';
                Visible = PurchHistoryBtnVisible;
                ToolTip = 'Executes the Purchase H&istory action.';

            }
            action("<Action158>")
            {
                ApplicationArea = Basic;
                Caption = '&Contacts';
                ToolTip = 'Executes the &Contacts action.';

            }
            action("<Action159>")
            {
                ApplicationArea = Basic;
                Caption = 'Order &Addresses';
                ToolTip = 'Executes the Order &Addresses action.';

            }
        }
    }

    var
        PurchSetup: Record "Purchases & Payables Setup";
        CopyPurchDoc: Report "Copy Purchase Document";
        DocPrint: Codeunit "Document-Print";
        UserMgt: Codeunit "User Setup Management BR";
        ArchiveManagement: Codeunit ArchiveManagement;
        PurchInfoPaneMgmt: Codeunit "Purchases Info-Pane Management";
        Commitment: Codeunit "Budgetary Control";
        BCSetup: Record "Budgetary Control Setup";
        DeleteCommitment: Record Committment;
        PurchLine: Record "Purchase Line";
        [InDataSet]
        PurchHistoryBtnVisible: Boolean;
        [InDataSet]
        PayToCommentPictVisible: Boolean;
        [InDataSet]
        PayToCommentBtnVisible: Boolean;
        [InDataSet]
        PurchHistoryBtn1Visible: Boolean;
        [InDataSet]
        PurchLinesEditable: Boolean;
        ApprovalEntries: Page "Approval Entries";

    local procedure ApproveCalcInvDisc()
    begin
    end;

    local procedure UpdateInfoPanel()
    var
        DifferBuyFromPayTo: Boolean;
    begin
        DifferBuyFromPayTo := Rec."Buy-from Vendor No." <> Rec."Pay-to Vendor No.";
        PurchHistoryBtnVisible := DifferBuyFromPayTo;
        PayToCommentPictVisible := DifferBuyFromPayTo;
        PayToCommentBtnVisible := DifferBuyFromPayTo;
        //PurchHistoryBtn1Visible := PurchInfoPaneMgmt.DocExist(Rec, Rec."Buy-from Vendor No.");
        //if DifferBuyFromPayTo then
        //  PurchHistoryBtnVisible := PurchInfoPaneMgmt.DocExist(Rec, Rec."Pay-to Vendor No.")
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
        if Rec.Status <> Rec.Status::Open then
            PurchLinesEditable := false
        else
            PurchLinesEditable := true;
    end;

    local procedure ShortcutDimension1CodeOnAfterV()
    begin
    end;

    local procedure ShortcutDimension2CodeOnAfterV()
    begin
    end;

    local procedure CurrencyCodeOnAfterValidate()
    begin
    end;

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;

        UpdateControls();
    end;
}
