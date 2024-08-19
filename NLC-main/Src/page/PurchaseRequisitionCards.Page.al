#pragma implicitwith disable
page 52194169 "Purchase Requisition Cards"
{
    DeleteAllowed = true;
    Editable = true;
    InsertAllowed = true;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Approvals,Cancellation,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Store Requistion Headers";
    SourceTableView = where("Document Type" = const(PR));
    ApplicationArea = All;
    Caption = 'Purchase Requisition Cards';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Request date"; Rec."Request date")
                {
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Request date field.';
                }
                field("Date Received"; Rec."Date Received")
                {
                    ToolTip = 'Specifies the value of the Date Received field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
                field("Invoice No"; Rec."Invoice No")
                {
                    ToolTip = 'Specifies the value of the Invoice No field.';
                }
                field("Order No"; Rec."Order No")
                {
                    ToolTip = 'Specifies the value of the Order No field.';
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ToolTip = 'Specifies the value of the Employee Code field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Function Name"; Rec."Function Name")
                {
                    Caption = 'Description';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Budget Center Name"; Rec."Budget Center Name")
                {
                    Caption = 'Description';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Request Description"; Rec."Request Description")
                {
                    ToolTip = 'Specifies the value of the Request Description field.';
                }
                field("Required Date"; Rec."Required Date")
                {
                    ToolTip = 'Specifies the value of the Required Date field.';
                }
                field(Store; Rec."Issuing Store")
                {
                    Caption = 'Store';
                    ToolTip = 'Specifies the value of the Store field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ToolTip = 'Specifies the value of the Requester ID field.';
                }
                field("Action Type"; Rec."Action Type")
                {
                    ToolTip = 'Specifies the value of the Action Type field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(jj; "Purchase Requisition Lines")
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
                action("Post Purchase Requisition")
                {
                    Caption = 'Post Purchase Requisition';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Post Purchase Requisition action.';
                    trigger OnAction()
                    begin


                        ItemLedger.Reset();
                        ItemLedger.SetRange(ItemLedger."Order No.", Rec."Order No");
                        if ItemLedger.Find('-') then
                            Error('This Order No.%1 has already been used for Purchase Requsition No. %2', Rec."Order No", ItemLedger."Document No.");

                        if not LinesExists() then
                            Error('There are no Lines created for this Document');

                        if Rec.Status = Rec.Status::Posted then
                            Error('The Document Has Already been Posted');

                        if Rec.Status <> Rec.Status::Released then
                            Error('The Document Has not yet been Approved');

                        if not EnterQuantityInspected() then
                            Error('Some of the Key Fields on the Lines:[Quantity Inspected] Have not been Entered please RECHECK your entries');


                        if InventorySetup.Get() then begin
                            InventorySetup.TestField(InventorySetup."Item Jnl Template");
                            InventorySetup.TestField(InventorySetup."Item Jnl Batch");
                            GenJnline.Reset();
                            GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                            GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                            if GenJnline.Find('-') then
                                GenJnline.DeleteAll();

                            Rec.TestField("Issuing Store");
                            ReqLine.Reset();
                            ReqLine.SetRange(ReqLine."Requistion No", Rec."No.");
                            Rec.TestField("Issuing Store");
                            if ReqLine.Find('-') then begin
                                repeat
                                    //Receive
                                    LineNo := LineNo + 1000;
                                    GenJnline.Init();
                                    GenJnline."Journal Template Name" := InventorySetup."Item Jnl Template";
                                    GenJnline."Journal Batch Name" := InventorySetup."Item Jnl Batch";
                                    GenJnline."Line No." := LineNo;
                                    GenJnline."Entry Type" := GenJnline."Entry Type"::"Positive Adjmt.";
                                    GenJnline."Document No." := Rec."No.";
                                    GenJnline."Item No." := ReqLine."No.";
                                    GenJnline.Validate("Item No.");
                                    GenJnline."Location Code" := ReqLine."Issuing Store";
                                    GenJnline."Bin Code" := ReqLine."Bin Code";
                                    GenJnline.Validate("Location Code");
                                    GenJnline."Posting Date" := Rec."Request date";
                                    GenJnline.Description := Rec."Request Description";
                                    GenJnline.Quantity := ReqLine."Quantity Requested";

                                    GenJnline."Order No." := Rec."Order No";
                                    GenJnline."Invoice No." := Rec."Invoice No";
                                    GenJnline."Vendor No" := Rec."Vendor No.";
                                    GenJnline."Vendor Name" := Rec."Vendor Name";
                                    GenJnline."Employee No" := Rec."Employee Code";
                                    GenJnline."Employee Name" := Rec."Employee Name";
                                    GenJnline."Order No" := Rec."Order No";
                                    GenJnline."User ID" := Rec."Requester ID";
                                    GenJnline."Unit Amount" := ReqLine."Unit Cost";
                                    GenJnline.Amount := ReqLine."Line Amount";

                                    GenJnline."Shortcut Dimension 1 Code" := Rec."Global Dimension 1 Code";
                                    GenJnline.Validate("Shortcut Dimension 1 Code");
                                    GenJnline."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                                    GenJnline.Validate("Shortcut Dimension 2 Code");
                                    GenJnline.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
                                    GenJnline.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");
                                    GenJnline.Validate(Quantity);
                                    GenJnline.Validate("Unit Amount");

                                    //GenJnline."Reason Code":='221';
                                    //GenJnline.VALIDATE("Reason Code");
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
                                //Post:=FALSE;
                                //Post:=JournlPosted.PostedSuccessfully();
                                //IF Post THEN BEGIN
                                //ReqLine.MODIFYALL(ReqLine."Request Status",ReqLine."Request Status"::Closed);
                                Rec.Status := Rec.Status::Posted;
                                Rec.Modify();
                            end;
                        end;
                        //END
                    end;
                }

                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    begin
                        DocumentType := DocumentType::GRN;
                        ApprovalEntries.Setfilters(Database::"Store Requistion Headers", DocumentType, Rec."No.");
                        ApprovalEntries.Run();
                    end;
                }
                action("Send A&pproval Request")
                {
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    begin

                        Rec.TestField("Vendor No.");
                        Rec.TestField("Order No");
                        Rec.TestField("Issuing Store");

                        ItemLedger.Reset();
                        ItemLedger.SetRange(ItemLedger."Order No.", Rec."Order No");
                        if ItemLedger.Find('-') then
                            Error('This Order No.%1 has already been used for Purchase Requsition No. %2', Rec."Order No", ItemLedger."Document No.");

                        if not LinesExists() then
                            Error('There are no Lines created for this Document');

                        //Release the Requisition for Approval

                        if Confirm('Send this Purchase Request for Approval?', true) = false then
                            exit;
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        //ApprovalMgt.SendPRequestApprovalRequest(Rec)
                    end;
                }
                action("Cancel Approval Re&quest")
                {
                    Caption = 'Cancel Approval Re&quest';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    begin

                        if Confirm('Cancel this Purchase Request Approval?', true) = false then
                            exit;
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        //ApprovalMgt.CancelPRRequestApprovalRequest(Rec, TRUE, TRUE)
                    end;
                }

                action("Purchase Requisition")
                {
                    Caption = 'Purchase Requisition';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Purchase Requisition action.';
                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.SetFilter("No.", Rec."No.");
                        Report.Run(Report::"Purchase Requisitions", true, true, Rec);
                        Rec.Reset();
                    end;
                }
                action(GRN)
                {
                    Caption = 'GRN';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the GRN action.';
                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.SetFilter("No.", Rec."No.");
                        Report.Run(Report::"Goods Received Note", true, true, Rec);
                        Rec.Reset();
                    end;
                }
            }
            group("Document Management")
            {
                Caption = 'Document Management';
                Description = 'Document Management';
                action("DMS Link")
                {
                    Caption = 'Attach Documents';
                    Image = Web;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Attach Documents action.';
                    trigger OnAction()
                    begin
                        if CompanyInfo.Get() then begin
                            Link := CompanyInfo."Documents Attachment Link";
                            Hyperlink(Link);
                        end;
                    end;
                }
                action("View Attached Documents")
                {
                    Caption = 'View Attached Documents';
                    Image = Web;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    //RunObject = Page 50010;
                    //RunPageLink = Field1 = FIELD ("No.");
                    RunPageMode = View;
                    ToolTip = 'Executes the View Attached Documents action.';
                }
                action(Sign)
                {
                    Caption = 'Sign';
                    Description = 'Digital Signature';
                    Image = Agreement;
                    Promoted = true;
                    Visible = true;
                    ToolTip = 'Executes the Sign action.';

                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //CurrPageUpdate;

        Rec."Document Type" := Rec."Document Type"::PR
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        Rec."Document Type" := Rec."Document Type"::PR;
        Rec."Action Type" := Rec."Action Type"::Item;

        RequisitionHeader.Reset();
        RequisitionHeader.SetRange("User ID", UserId);
        RequisitionHeader.SetRange(Status, RequisitionHeader.Status::Open);
        RequisitionHeader.SetRange("Document Type", RequisitionHeader."Document Type"::PR);
        if RequisitionHeader.FindFirst() then
            Error('you cannot open another document when %1 is still %2', RequisitionHeader."No.", Format(RequisitionHeader.Status));
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        /*
        "Responsibility Center" := UserMgt.GetPurchasesFilter();
         //Add dimensions if set by default here
         "Global Dimension 1 Code":=UserMgt.GetSetDimensions(USERID,1);
         VALIDATE("Global Dimension 1 Code");
         "Shortcut Dimension 2 Code":=UserMgt.GetSetDimensions(USERID,2);
         VALIDATE("Shortcut Dimension 2 Code");
         "Shortcut Dimension 3 Code":=UserMgt.GetSetDimensions(USERID,3);
         VALIDATE("Shortcut Dimension 3 Code");
         "Shortcut Dimension 4 Code":=UserMgt.GetSetDimensions(USERID,4);
         VALIDATE("Shortcut Dimension 4 Code");
        */

        UpdateControls();


        Rec."Document Type" := Rec."Document Type"::PR;
        Rec."Action Type" := Rec."Action Type"::Item;

        RequisitionHeader.Reset();
        RequisitionHeader.SetRange("User ID", UserId);
        RequisitionHeader.SetRange(Status, RequisitionHeader.Status::Open);
        RequisitionHeader.SetRange("Document Type", RequisitionHeader."Document Type"::PR);
        if RequisitionHeader.FindFirst() then
            Error('you cannot open another document when %1 is still %2', RequisitionHeader."No.", Format(RequisitionHeader.Status));

    end;


    trigger OnOpenPage()
    begin
        /*
        IF UserMgt.GetPurchasesFilter() <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center" ,UserMgt.GetPurchasesFilter());
          FILTERGROUP(0);
        END;
        */

        Rec."Document Type" := Rec."Document Type"::PR

    end;

    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit 439;
        ReqLine: Record "Store Requistion Line";
        InventorySetup: Record "Inventory Setup";
        GenJnline: Record "Item Journal Line";
        LineNo: Integer;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,None,PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,GrantTask,"Concept Note",Proposal,"Job Approval",Discip,GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,CashP,LeaveReim,Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS,PReq,SReq;
        HasLines: Boolean;
        ApprovalEntries: Page "Approval Entries";
        StatusEditable: Boolean;
        RequisitionHeader: Record "Store Requistion Headers";
        ItemLedger: Record "Item Ledger Entry";
        AllQuantityInspectedEntered: Boolean;
        CompanyInfo: Record "Company Information";
        Link: Text[250];

    [Scope('Internal')]
    procedure LinesExists(): Boolean
    var
        PayLines: Record "Store Requistion Line";
    begin
        HasLines := false;
        PayLines.Reset();
        PayLines.SetRange(PayLines."Requistion No", Rec."No.");
        if PayLines.Find('-') then begin
            HasLines := true;
            exit(HasLines);
        end;
    end;

    [Scope('Internal')]
    procedure UpdateControls()
    begin
        if Rec.Status = Rec.Status::Open then
            StatusEditable := true
        else
            StatusEditable := false;
    end;

    [Scope('Internal')]
    procedure CurrPageUpdate()
    begin
        xRec := Rec;
        UpdateControls();
        CurrPage.Update();
    end;

    local procedure replaceString(String: Text[50]; FindWhat: Text[10]; ReplaceWith: Text[10]) NewString: Text
    begin
        while StrPos(String, FindWhat) > 0 do
            String := DelStr(String, StrPos(String, FindWhat)) + ReplaceWith + CopyStr(String, StrPos(String, FindWhat) + StrLen(FindWhat));
        NewString := String;
    end;

    [Scope('Internal')]
    procedure EnterQuantityInspected(): Boolean
    begin

        AllQuantityInspectedEntered := true;
        ReqLine.Reset();
        ReqLine.SetRange(ReqLine."Requistion No", Rec."No.");
        if ReqLine.Find('-') then begin
            repeat
                if ReqLine."Quantity Requested" = 0 then
                    AllQuantityInspectedEntered := false;
            until ReqLine.Next() = 0;
            exit(AllQuantityInspectedEntered);
        end;
    end;
}

#pragma implicitwith restore

