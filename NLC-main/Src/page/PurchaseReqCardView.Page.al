#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194185 "Purchase Req Card View"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Approvals,Cancellation,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Store Requistion Headers";
    SourceTableView = where("Document Type" = const(PR));
    ApplicationArea = All;
    Caption = 'Purchase Req Card View';
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
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
                field("Invoice No"; Rec."Invoice No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invoice No field.';
                }
                field("Order No"; Rec."Order No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Order No field.';
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Code field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
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
                field("Request Description"; Rec."Request Description")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Request Description field.';
                }
                field("Required Date"; Rec."Required Date")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Required Date field.';
                }
                field(Store; Rec."Issuing Store")
                {
                    ApplicationArea = Basic;
                    Caption = 'Store';
                    ToolTip = 'Specifies the value of the Store field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requester ID field.';
                }
                field("Action Type"; Rec."Action Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Type field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control1102755015; "Purchase Requisition Lines")
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
                    ApplicationArea = Basic;
                    Caption = 'Post Purchase Requisition';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;
                    ToolTip = 'Executes the Post Purchase Requisition action.';
                    trigger OnAction()
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

                            Rec.TestField(Rec."Purchasing Store");
                            ReqLine.Reset();
                            ReqLine.SetRange(ReqLine."Requistion No", Rec."No.");
                            Rec.TestField(Rec."Purchasing Store");
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
                                    GenJnline."Location Code" := ReqLine."Purchasing Store";
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
                        DocumentType := DocumentType::GRN;
                        ApprovalEntries.Setfilters(Database::"Store Requistion Headers", DocumentType, Rec."No.");
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
                    Visible = false;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    begin

                        Rec.TestField(Rec."Vendor No.");
                        Rec.TestField(Rec."Order No");
                        Rec.TestField(Rec."Issuing Store");


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
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    begin

                        if Confirm('Cancel this Purchase Request Approval?', true) = false then
                            exit;
                        // ApprovalMgt.CancelPRRequestApprovalRequest(Rec,true,true)
                    end;
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
                        Rec.Reset();
                        Rec.SetFilter(Rec."No.", Rec."No.");
                        Report.Run(Report::"Purchase Requisitions", true, true, Rec);
                        Rec.Reset();
                    end;
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
        UserMgt: Codeunit "User Setup Management BR";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        ReqLine: Record "Store Requistion Line";
        InventorySetup: Record "Inventory Setup";
        GenJnline: Record "Item Journal Line";
        LineNo: Integer;
        Post: Boolean;
        JournlPosted: Codeunit "Journal Post Successful";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,None,PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,GrantTask,"Concept Note",Proposal,"Job Approval",Discip,GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,CashP,LeaveReim,Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS,PReq,SReq;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        ApprovalEntries: Page "Approval Entries";
        StatusEditable: Boolean;
        RequisitionHeader: Record "Store Requistion Headers";


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
