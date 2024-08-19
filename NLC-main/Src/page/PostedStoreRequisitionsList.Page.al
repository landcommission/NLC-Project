#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193715 "Posted Store Requisitions List"
{
    CardPageId = "Store Requisition Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Approvals,Cancellation,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Store Requistion Header";
    SourceTableView = where(Status = const(Posted));
    ApplicationArea = All;
    Caption = 'Posted Store Requisitions List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Request date"; Rec."Request date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request date field.';
                }
                field("Request Description"; Rec."Request Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Description field.';
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requester ID field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(TotalAmount; Rec.TotalAmount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TotalAmount field.';
                }
                field("Issuing Store"; Rec."Issuing Store")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issuing Store field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1102755010; Notes) { }
            systempart(Control1102755011; MyNotes) { }
            systempart(Control1102755012; Links) { }
        }
    }

    actions
    {
        area(Processing)
        {
            group("<Action1102755026>")
            {
                Caption = '&Functions';
                action("<Action1102755028>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Store Requisition';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;
                    ToolTip = 'Executes the Post Store Requisition action.';
                    trigger OnAction()
                    begin
                        if not LinesExists() then
                            Error('There are no Lines created for this Document');

                        if Rec.Status = Rec.Status::Posted then
                            Error('The Document Has Already been Posted');

                        if Rec.Status <> Rec.Status::Released then
                            Error('The Document Has not yet been Approved');


                        Rec.TestField(Rec."Issuing Store");
                        ReqLine.Reset();
                        ReqLine.SetRange(ReqLine."Requistion No", Rec."No.");
                        Rec.TestField(Rec."Issuing Store");
                        if ReqLine.Find('-') then begin
                            repeat
                                //Issue
                                if InventorySetup.Get() then begin
                                    InventorySetup.TestField(InventorySetup."Item Jnl Template");
                                    InventorySetup.TestField(InventorySetup."Item Jnl Batch");
                                    GenJnline.Reset();
                                    GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                                    GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                                    if GenJnline.Find('-') then
                                        GenJnline.DeleteAll();
                                    LineNo := LineNo + 1000;
                                    GenJnline.Init();
                                    GenJnline."Journal Template Name" := InventorySetup."Item Jnl Template";
                                    GenJnline."Journal Batch Name" := InventorySetup."Item Jnl Batch";
                                    GenJnline."Line No." := LineNo;
                                    GenJnline."Entry Type" := GenJnline."Entry Type"::"Negative Adjmt.";
                                    GenJnline."Document No." := Rec."No.";
                                    GenJnline."Item No." := ReqLine."No.";
                                    GenJnline.Validate("Item No.");
                                    GenJnline."Location Code" := Rec."Issuing Store";
                                    GenJnline.Validate("Location Code");
                                    GenJnline."Posting Date" := Rec."Request date";
                                    GenJnline.Description := ReqLine.Description;
                                    GenJnline.Quantity := ReqLine.Quantity;
                                    GenJnline."Shortcut Dimension 1 Code" := Rec."Global Dimension 1 Code";
                                    GenJnline.Validate("Shortcut Dimension 1 Code");
                                    GenJnline."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                                    GenJnline.Validate("Shortcut Dimension 2 Code");
                                    GenJnline.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
                                    GenJnline.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");
                                    GenJnline.Validate(Quantity);
                                    GenJnline.Validate("Unit Amount");
                                    GenJnline."Reason Code" := '221';
                                    GenJnline.Validate("Reason Code");
                                    GenJnline.Insert(true);

                                    // ReqLine."Request Status":=ReqLine."request status"::"7";

                                end;
                            until ReqLine.Next() = 0;
                            //Post Entries
                            GenJnline.Reset();
                            GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                            GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                            Codeunit.Run(Codeunit::"Item Jnl.-Post", GenJnline);
                            //End Post entries

                            //Modify All
                            Post := false;
                            Post := JournlPosted.PostedSuccessfully();
                            // if Post then
                            //      ReqLine.ModifyAll(ReqLine."Request Status",ReqLine."request status"::"7");
                        end;
                    end;
                }
                separator(Action1102755018) { }
                action("<Action1102755032>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        DocumentType := DocumentType::Requisition;
                        ApprovalEntries.Setfilters(Database::"Store Requistion Header", DocumentType, Rec."No.");
                        ApprovalEntries.Run();
                    end;
                }
                action("<Action1102755030>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    begin
                        if not LinesExists() then
                            Error('There are no Lines created for this Document');

                        //Release the Imprest for Approval
                        // IF ApprovalMgt.SendSRequestApprovalRequest(Rec) THEN;
                    end;
                }
                action("<Action1102755031>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';

                }
                separator(Action1102755014) { }
                action("<Action1102755036>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Print/Preview';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Print/Preview action.';
                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.SetFilter(Rec."No.", Rec."No.");
                        Report.Run(39005887, true, true, Rec);
                        Rec.Reset();
                        /*
                        RESET;                                //ampath gatepass
                        SETFILTER("No.","No.");
                        REPORT.RUN(39003922,TRUE,TRUE,Rec);
                        RESET;
                         */

                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        /*
        IF UserMgt.GetPurchasesFilter() <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center" ,UserMgt.GetPurchasesFilter());
          FILTERGROUP(0);
        END;
        */
        if UserMgt.GetSetDimensions(UserId, 2) <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange(Rec."Shortcut Dimension 2 Code", UserMgt.GetSetDimensions(UserId, 2));
            Rec.FilterGroup(0);
        end;

    end;

    var
        UserMgt: Codeunit "User Setup Management BR";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        ReqLine: Record "Store Requistion Lines";
        InventorySetup: Record "Inventory Setup";
        GenJnline: Record "Item Journal Line";
        LineNo: Integer;
        Post: Boolean;
        JournlPosted: Codeunit "Journal Post Successful";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;


    procedure LinesExists(): Boolean
    var
        PayLines: Record "Store Requistion Lines";
    begin
        HasLines := false;
        PayLines.Reset();
        PayLines.SetRange(PayLines."Requistion No", Rec."No.");
        if PayLines.Find('-') then begin
            HasLines := true;
            exit(HasLines);
        end;
    end;
}
