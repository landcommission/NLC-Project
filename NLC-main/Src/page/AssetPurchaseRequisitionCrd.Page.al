#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193905 "Asset Purchase Requisition Crd"
{
    DeleteAllowed = true;
    Editable = true;
    InsertAllowed = true;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Approvals,Cancellation,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Store Requistion Header";
    SourceTableView = where("Document Type" = const(PR),
                            "Action Type" = const(Asset));
    ApplicationArea = All;
    Caption = 'Asset Purchase Requisition Crd';
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
                field("Purchasing Store"; Rec."Purchasing Store")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchasing Store field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
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
                    Editable = false;
                    ToolTip = 'Specifies the value of the Action Type field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part("Asset Purchase Requisition Line"; "AssetPurchase Requisition Line")
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
                    ApplicationArea = Basic;
                    Caption = 'Post Purchase Requisition';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Post Purchase Requisition action.';
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
                }
                action("Send A&pproval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send A&pproval Request action.';
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

        //UpdateControls;


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
}
