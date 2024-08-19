#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 50005 "Asset PR Requisition Portal"
{
    DeleteAllowed = true;
    Editable = true;
    InsertAllowed = true;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Approvals,Cancellation,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Store Requistion Headers";
    SourceTableView = where("Document Type" = const(PR),
                            "Action Type" = const(Asset));
    ApplicationArea = All;
    Caption = 'Asset PR Requisition Portal';
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
                    ToolTip = 'Specifies the value of the Request date field.';
                }
                field("Required Date"; Rec."Required Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Required Date field.';
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requester ID field.';
                }
                field("Request Description"; Rec."Request Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Description field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Supplier; Rec.Supplier)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supplier field.';
                }
                field("Action Type"; Rec."Action Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Type field.';
                }
                field(Justification; Rec.Justification)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Justification field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Function Name"; Rec."Function Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Function Name field.';
                }
                field("Budget Center Name"; Rec."Budget Center Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Center Name field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                }
                field(Dim3; Rec.Dim3)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dim3 field.';
                }
                field(Dim4; Rec.Dim4)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dim4 field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
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
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job No field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("No. Printed"; Rec."No. Printed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Printed field.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
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
                field(Received; Rec.Received)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received field.';
                }
                field("Received By"; Rec."Received By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received By field.';
                }
                field("Received Date"; Rec."Received Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received Date field.';
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
                field("Purchasing Store"; Rec."Purchasing Store")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchasing Store field.';
                }
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
                    ToolTip = 'Executes the Post Purchase Requisition action.';
                    trigger OnAction()
                    begin

                        if not LinesExists() then
                            Error('There are no Lines created for this Document');

                        if Rec.Status = Rec.Status::Posted then
                            Error('The Document Has Already been Posted');

                        //IF Status<>Status::Released    THEN
                        // ERROR('The Document Has not yet been Approved');

                        GenJnline.Reset();
                        GenJnline.SetRange(GenJnline."Journal Template Name", 'ASSETS');
                        GenJnline.SetRange(GenJnline."Journal Batch Name", 'ACQ');
                        if GenJnline.Find('-') then
                            GenJnline.DeleteAll();

                        Rec.TestField(Rec."Purchasing Store");

                        ReqLine.Reset();
                        ReqLine.SetRange(ReqLine."Requistion No", Rec."No.");
                        Rec.TestField(Rec."Purchasing Store");
                        if ReqLine.Find('-') then begin
                            repeat
                                //Purchase Fixed Assets
                                LineNo := LineNo + 1000;
                                GenJnline.Init();
                                GenJnline."Journal Template Name" := 'ASSETS';
                                GenJnline."Journal Batch Name" := 'ACQ';
                                GenJnline."Line No." := LineNo;
                                //GenJnline."Account Type":=GenJnline."Account Type"::"Fixed Asset";
                                GenJnline."Document No." := Rec."No.";
                                GenJnline."FA No." := ReqLine."No.";
                                GenJnline.Validate("FA No.");
                                GenJnline."FA Posting Date" := Rec."Request date";
                                GenJnline.Description := ReqLine.Description;
                                GenJnline.Amount := ReqLine."Line Amount";
                                GenJnline."External Document No." := Rec."Order No";
                                GenJnline."Shortcut Dimension 1 Code" := Rec."Global Dimension 1 Code";
                                GenJnline.Validate("Shortcut Dimension 1 Code");
                                GenJnline."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                                GenJnline.Validate("Shortcut Dimension 2 Code");
                                GenJnline.Insert(true);
                            until ReqLine.Next() = 0;

                            //Post Entries
                            GenJnline.Reset();
                            GenJnline.SetRange(GenJnline."Journal Template Name", FASetup."FA Jnl. Template Name");
                            GenJnline.SetRange(GenJnline."Journal Batch Name", FASetup."FA Jnl. Batch Name");
                            ////CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnline);
                            Codeunit.Run(Codeunit::"FA. Jnl.-Post", GenJnline);
                            //End Post entries

                            //Modify All
                            //Post:=FALSE;
                            //Post:=JournlPosted.PostedSuccessfully();
                            //IF Post THEN BEGIN
                            //ReqLine.MODIFYALL(ReqLine."Request Status",ReqLine."Request Status"::Closed);
                            ////Status:=Status::Posted;
                            Rec.Modify();
                        end;
                        //END;
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
                        DocumentType := DocumentType::Requisition;
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

                        //Release the Imprest for Approval
                        // if ApprovalMgt.SendPRequestApprovalRequest(Rec) then;
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
                        Rec.Reset();
                        Rec.SetFilter(Rec."No.", Rec."No.");
                        Report.Run(39005887, true, true, Rec);
                        Rec.Reset();

                        /*
                        RESET;
                        SETFILTER("No.","No.");
                        REPORT.RUN(39003922,TRUE,TRUE,Rec);
                        RESET;
                         */

                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //CurrPageUpdate;

        Rec."Document Type" := Rec."Document Type"::PR;
        Rec."Action Type" := Rec."Action Type"::Asset
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        Rec."Action Type" := Rec."Action Type"::Asset;
        Rec."Document Type" := Rec."Document Type"::PR;

        /*
        RequisitionHeader.RESET;
        RequisitionHeader.SETRANGE("User ID",USERID);
        RequisitionHeader.SETRANGE(Status,RequisitionHeader.Status::Open);
        RequisitionHeader.SETRANGE("Document Type",RequisitionHeader."Document Type"::PR);
        IF RequisitionHeader.FINDFIRST THEN
           ERROR('you cannot open another document when %1 is still %2',RequisitionHeader."No.",FORMAT(RequisitionHeader.Status));

        */

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
        Rec."Action Type" := Rec."Action Type"::Asset;

        /*
        RequisitionHeader.RESET;
        RequisitionHeader.SETRANGE("User ID",USERID);
        RequisitionHeader.SETRANGE(Status,RequisitionHeader.Status::Open);
        RequisitionHeader.SETRANGE("Document Type",RequisitionHeader."Document Type"::PR);
        IF RequisitionHeader.FINDFIRST THEN
           ERROR('you cannot open another document when %1 is still %2',RequisitionHeader."No.",FORMAT(RequisitionHeader.Status));
         */

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
        ReqLine: Record "Store Requistion Lines";
        InventorySetup: Record "Inventory Setup";
        GenJnline: Record "FA Journal Line";
        LineNo: Integer;
        Post: Boolean;
        JournlPosted: Codeunit "Journal Post Successful";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        ApprovalEntries: Page "Approval Entries";
        StatusEditable: Boolean;
        RequisitionHeader: Record "Store Requistion Header";
        FASetup: Record "FA Journal Setup";


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
