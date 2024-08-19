#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193742 "PR Store Requisition"
{
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Approvals,Cancellation,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Store Requistion Header";
    SourceTableView = where(Status = filter(<> Posted));
    ApplicationArea = All;
    Caption = 'PR Store Requisition';
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
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Request date"; Rec."Request date")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Request date field.';
                }
                field("Required Date"; Rec."Required Date")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Required Date field.';
                }
                field("Request Description"; Rec."Request Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Description field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Function Name"; Rec."Function Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Budget Center Name"; Rec."Budget Center Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field(Dim3; Rec.Dim3)
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                }
                field(Dim4; Rec.Dim4)
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Issuing Store"; Rec."Issuing Store")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Issuing Store field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
            }
            part(Control1102755015; "Staff Grant Subform")
            {
                Editable = true;
                SubPageLink = "Requistion No" = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action("Post Store Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Store Requisition';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortcutKey = 'F9';
                    ToolTip = 'Executes the Post Store Requisition action.';
                    trigger OnAction()
                    var
                        ItemLedger: Record "Item Ledger Entry";
                    begin
                        if not LinesExists() then
                            Error('There are no Lines created for this Document');

                        if Rec.Status = Rec.Status::Posted then
                            Error('The Document Has Already been Posted');

                        if Rec.Status <> Rec.Status::Released then
                            Error('The Document Has not yet been Approved');
                        if InventorySetup.Get() then begin
                            InventorySetup.TestField(InventorySetup."Item Jnl Template");
                            InventorySetup.TestField(InventorySetup."Item Jnl Batch");
                            GenJnline.Reset();
                            GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                            GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                            if GenJnline.Find('-') then
                                GenJnline.DeleteAll();

                            Rec.TestField(Rec."Issuing Store");
                            ReqLine.Reset();
                            ReqLine.SetRange(ReqLine."Requistion No", Rec."No.");
                            Rec.TestField(Rec."Issuing Store");
                            if ReqLine.Find('-') then begin
                                repeat
                                    //Issue
                                    LineNo := LineNo + 1000;
                                    GenJnline.Init();
                                    GenJnline."Journal Template Name" := InventorySetup."Item Jnl Template";
                                    GenJnline."Journal Batch Name" := InventorySetup."Item Jnl Batch";
                                    GenJnline."Line No." := LineNo;
                                    GenJnline."Entry Type" := GenJnline."Entry Type"::"Negative Adjmt.";
                                    GenJnline."Document No." := Rec."No.";
                                    GenJnline."Item No." := ReqLine."No.";
                                    GenJnline.Validate("Item No.");
                                    GenJnline."Location Code" := ReqLine."Issuing Store";
                                    GenJnline."Bin Code" := ReqLine."Bin Code";
                                    GenJnline.Validate("Location Code");
                                    GenJnline."Posting Date" := Rec."Posting Date";
                                    GenJnline.Description := ReqLine.Description;
                                    ItemLedger.Reset();
                                    ItemLedger.SetRange(ItemLedger."Item No.", ReqLine."No.");
                                    ItemLedger.SetRange(ItemLedger."Location Code", ReqLine."Issuing Store");
                                    ItemLedger.CalcSums(Quantity);
                                    if ItemLedger.Quantity <= 0 then
                                        Error('Item %1 is out of stock in store %2', ReqLine.Description, ReqLine."Issuing Store");
                                    GenJnline.Quantity := ReqLine.Quantity;
                                    GenJnline."Shortcut Dimension 1 Code" := ReqLine."Shortcut Dimension 1 Code";
                                    GenJnline.Validate("Shortcut Dimension 1 Code");
                                    GenJnline."Shortcut Dimension 2 Code" := ReqLine."Shortcut Dimension 2 Code";
                                    GenJnline.Validate("Shortcut Dimension 2 Code");
                                    GenJnline.ValidateShortcutDimCode(3, ReqLine."Shortcut Dimension 3 Code");
                                    GenJnline.ValidateShortcutDimCode(4, ReqLine."Shortcut Dimension 4 Code");
                                    GenJnline.Validate(Quantity);
                                    GenJnline.Validate("Unit Amount");
                                    GenJnline."Reason Code" := '221';
                                    GenJnline.Validate("Reason Code");
                                    if ReqLine."Gen. Prod. Posting Group" <> '' then
                                        GenJnline."Gen. Prod. Posting Group" := ReqLine."Gen. Prod. Posting Group";
                                    if ReqLine."Gen. Bus. Posting Group" <> '' then
                                        GenJnline."Gen. Bus. Posting Group" := ReqLine."Gen. Bus. Posting Group";
                                    GenJnline.Insert(true);

                                //ReqLine."Request Status":=ReqLine."Request Status"::Closed;

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
                                if Post then begin
                                    //ReqLine.MODIFYALL(ReqLine."Request Status",ReqLine."Request Status"::Closed);
                                    Rec.Status := Rec.Status::Posted;
                                    Rec.Modify();
                                end
                            end;
                        end
                    end;
                }
                action("Post & Print Store Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post & Print Store Requisition';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortcutKey = 'Shift+F9';
                    ToolTip = 'Executes the Post & Print Store Requisition action.';
                    trigger OnAction()
                    var
                        ItemLedger: Record "Item Ledger Entry";
                    begin
                        if not LinesExists() then
                            Error('There are no Lines created for this Document');

                        if Rec.Status = Rec.Status::Posted then
                            Error('The Document Has Already been Posted');

                        if Rec.Status <> Rec.Status::Released then
                            Error('The Document Has not yet been Approved');
                        if InventorySetup.Get() then begin
                            InventorySetup.TestField(InventorySetup."Item Jnl Template");
                            InventorySetup.TestField(InventorySetup."Item Jnl Batch");
                            GenJnline.Reset();
                            GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                            GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                            if GenJnline.Find('-') then
                                GenJnline.DeleteAll();

                            Rec.TestField(Rec."Issuing Store");
                            ReqLine.Reset();
                            ReqLine.SetRange(ReqLine."Requistion No", Rec."No.");
                            Rec.TestField(Rec."Issuing Store");
                            if ReqLine.Find('-') then begin
                                repeat
                                    //Issue
                                    LineNo := LineNo + 1000;
                                    GenJnline.Init();
                                    GenJnline."Journal Template Name" := InventorySetup."Item Jnl Template";
                                    GenJnline."Journal Batch Name" := InventorySetup."Item Jnl Batch";
                                    GenJnline."Line No." := LineNo;
                                    GenJnline."Entry Type" := GenJnline."Entry Type"::"Negative Adjmt.";
                                    GenJnline."Document No." := Rec."No.";
                                    GenJnline."Item No." := ReqLine."No.";
                                    GenJnline.Validate("Item No.");
                                    GenJnline."Location Code" := ReqLine."Issuing Store";
                                    GenJnline."Bin Code" := ReqLine."Bin Code";
                                    GenJnline.Validate("Location Code");
                                    GenJnline."Posting Date" := Rec."Posting Date";
                                    GenJnline.Description := ReqLine.Description;
                                    ItemLedger.Reset();
                                    ItemLedger.SetRange(ItemLedger."Item No.", ReqLine."No.");
                                    ItemLedger.SetRange(ItemLedger."Location Code", ReqLine."Issuing Store");
                                    ItemLedger.CalcSums(Quantity);
                                    if ItemLedger.Quantity <= 0 then
                                        Error('Item %1 is out of stock in store %2', ReqLine.Description, ReqLine."Issuing Store");
                                    GenJnline.Quantity := ReqLine.Quantity;
                                    GenJnline."Shortcut Dimension 1 Code" := ReqLine."Shortcut Dimension 1 Code";
                                    GenJnline.Validate("Shortcut Dimension 1 Code");
                                    GenJnline."Shortcut Dimension 2 Code" := ReqLine."Shortcut Dimension 2 Code";
                                    GenJnline.Validate("Shortcut Dimension 2 Code");
                                    GenJnline.ValidateShortcutDimCode(3, ReqLine."Shortcut Dimension 3 Code");
                                    GenJnline.ValidateShortcutDimCode(4, ReqLine."Shortcut Dimension 4 Code");
                                    GenJnline.Validate(Quantity);
                                    GenJnline.Validate("Unit Amount");
                                    GenJnline."Reason Code" := '221';
                                    GenJnline.Validate("Reason Code");
                                    if ReqLine."Gen. Prod. Posting Group" <> '' then
                                        GenJnline."Gen. Prod. Posting Group" := ReqLine."Gen. Prod. Posting Group";
                                    if ReqLine."Gen. Bus. Posting Group" <> '' then
                                        GenJnline."Gen. Bus. Posting Group" := ReqLine."Gen. Bus. Posting Group";
                                    GenJnline.Insert(true);

                                //ReqLine."Request Status":=ReqLine."Request Status"::Closed;

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
                                if Post then begin
                                    //ReqLine.MODIFYALL(ReqLine."Request Status",ReqLine."Request Status"::Closed);
                                    Rec.Status := Rec.Status::Posted;
                                    Rec.Modify();
                                end
                            end;
                        end;
                        Commit();
                        Rec.SetRange(Rec."No.", Rec."No.");
                        Report.Run(39005887, false, true, Rec);
                    end;
                }
                action(ReOpen)
                {
                    ApplicationArea = Basic;
                    Caption = 'ReOpen';
                    Image = ReOpen;
                    ToolTip = 'Executes the ReOpen action.';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        if not Confirm('Are you sure you want to Reopen the document') then
                            exit;
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify();
                    end;
                }
                separator(Action1102755029) { }
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
                        DocumentType := DocumentType::Grant;
                        ApprovalEntries.Setfilters(Database::"Store Requistion Header", DocumentType, Rec."No.");
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
                        if not LinesExists() then
                            Error('There are no Lines created for this Document');
                        Rec.TestField(Rec."Issuing Store");
                        /*
                        Status:=Status::Released;
                        MODIFY;
                        */
                        //Release the Imprest for Approval
                        // IF ApprovalMgt.SendSRequestApprovalRequest(Rec) THEN;

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
                separator(Action1102755035) { }
                action("Print/Preview")
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
                        Rec.TestField(Rec.Status, Rec.Status::Released);
                        Rec.Reset();
                        Rec.SetFilter(Rec."No.", Rec."No.");
                        Report.Run(39005895, true, true, Rec);
                        Rec.Reset();
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        CurrPageUpdate();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Document Type" := Rec."Document Type"::SR;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter();
        //Add dimensions if set by default here
        Rec."Global Dimension 1 Code" := UserMgt.GetSetDimensions(UserId, 1);
        Rec.Validate(Rec."Global Dimension 1 Code");
        Rec."Shortcut Dimension 2 Code" := UserMgt.GetSetDimensions(UserId, 2);
        Rec.Validate(Rec."Shortcut Dimension 2 Code");
        Rec."Shortcut Dimension 3 Code" := UserMgt.GetSetDimensions(UserId, 3);
        Rec.Validate(Rec."Shortcut Dimension 3 Code");
        Rec."Shortcut Dimension 4 Code" := UserMgt.GetSetDimensions(UserId, 4);
        Rec.Validate(Rec."Shortcut Dimension 4 Code");

        UpdateControls();
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        UpdateControls();
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
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Express Pv",JV,Capex,"Employee Requisition","Leave Application","Transport Requisition","Training Requisition","Job Approval","Disciplinary Approvals",Lease,Grant,PR;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        ApprovalEntries: Page "Approval Entries";
        StatusEditable: Boolean;


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
