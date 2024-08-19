#pragma implicitwith disable
page 52194075 "Asset Purchase Requisition Cr"
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
    Caption = 'Asset Purchase Requisition Cr';
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
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Request Description field.';
                }
                field("Required Date"; Rec."Required Date")
                {
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Required Date field.';
                }
                field("Purchasing Store"; Rec."Purchasing Store")
                {
                    ToolTip = 'Specifies the value of the Purchasing Store field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ToolTip = 'Specifies the value of the Requester ID field.';
                }
                field("Action Type"; Rec."Action Type")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Action Type field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part("Asset Purchase Requisition Line"; "AssetPurchase Requisition Lin")
            {
                Caption = 'Asset Purchase Requisition Line';
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

                        Rec.TestField("Purchasing Store");

                        ReqLine.Reset();
                        ReqLine.SetRange(ReqLine."Requistion No", Rec."No.");
                        Rec.TestField("Purchasing Store");
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
                                GenJnline.Validate(GenJnline."FA No.");
                                GenJnline."FA Posting Date" := Rec."Request date";
                                GenJnline.Description := ReqLine.Description;
                                GenJnline.Amount := ReqLine."Line Amount";
                                GenJnline."External Document No." := Rec."Order No";
                                GenJnline."Shortcut Dimension 1 Code" := Rec."Global Dimension 1 Code";
                                GenJnline.Validate(GenJnline."Shortcut Dimension 1 Code");
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

                action(Approvals)
                {
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
                        // IF ApprovalMgt.SendPRequestApprovalRequest(Rec) THEN;
                    end;
                }
                action("Cancel Approval Re&quest")
                {
                    Caption = 'Cancel Approval Re&quest';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';

                }

                action("Print/Preview")
                {
                    Caption = 'Print/Preview';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Print/Preview action.';
                    trigger OnAction()
                    begin
                        Rec.Reset();
                        Rec.SetFilter("No.", Rec."No.");
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
            group(DM)
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
                    // RunObject = Page 50010;
                    //                 RunPageLink = Field1=FIELD("No.");
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
        //ApprovalMgt: Codeunit 439;
        ReqLine: Record "Store Requistion Lines";
        GenJnline: Record "FA Journal Line";
        LineNo: Integer;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition;
        HasLines: Boolean;
        ApprovalEntries: Page "Approval Entries";
        StatusEditable: Boolean;
        FASetup: Record "FA Journal Setup";
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
}

#pragma implicitwith restore

