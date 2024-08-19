#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 52194073 "Approved Store Requisition Cr"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Approvals,Cancellation,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Store Requistion Headers";
    SourceTableView = where("Document Type" = const(SR));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field("Request date"; "Request date")
                {
                    ApplicationArea = Basic;
                    Editable = statuseditable;
                }
                field("Employee Code"; "Employee Code")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = statuseditable;
                }
                field("Function Name"; "Function Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    Editable = false;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = statuseditable;
                }
                field("Budget Center Name"; "Budget Center Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    Editable = false;
                }
                field("Request Description"; "Request Description")
                {
                    ApplicationArea = Basic;
                    Editable = statuseditable;
                }
                field("Required Date"; "Required Date")
                {
                    ApplicationArea = Basic;
                    Editable = statuseditable;
                }
                field("Issuing Store"; "Issuing Store")
                {
                    ApplicationArea = Basic;
                    Editable = statuseditable;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = statuseditable;
                }
                field(Received; Received)
                {
                    ApplicationArea = Basic;
                }
                field("Received By"; "Received By")
                {
                    ApplicationArea = Basic;
                }
                field("Received Date"; "Received Date")
                {
                    ApplicationArea = Basic;
                }
                field("Requester ID"; "Requester ID")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
            }
            part("Stores Requisition Lines"; "Store RequisitionLine")
            {
                Caption = 'Stores Requisition Lines';
                Editable = true;
                SubPageLink = "Requistion No" = field("No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        DocumentType := Documenttype::Requisition;
                        ApprovalEntries.Setfilters(Database::"Store Requistion Header", DocumentType, "No.");
                        ApprovalEntries.Run;
                    end;
                }
                separator(Action1102755035)
                {
                }
                action("Print/Preview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Print/Preview';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Reset;
                        SetFilter("No.", "No.");
                        Report.Run(39005887, true, true, Rec);
                        Reset;

                        /*
                        RESET;
                        SETFILTER("No.","No.");
                        REPORT.RUN(39003922,TRUE,TRUE,Rec);
                        RESET;
                         */

                    end;
                }
                separator(Action13)
                {
                }
                action("Post Store Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Store Requisition';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = true;

                    trigger OnAction()
                    begin
                        if not LinesExists then
                            Error('There are no Lines created for this Document');

                        if Status = Status::Posted then
                            Error('The Document Has Already been Posted');

                        if Status <> Status::Released then
                            Error('The Document Has not yet been Approved');

                        if InventorySetup.Get then begin
                            InventorySetup.TestField(InventorySetup."Item Jnl Template");
                            InventorySetup.TestField(InventorySetup."Item Jnl Batch");
                            GenJnline.Reset;
                            GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                            GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                            if GenJnline.Find('-') then GenJnline.DeleteAll;

                            TestField("Issuing Store");
                            ReqLine.Reset;
                            ReqLine.SetRange(ReqLine."Requistion No", "No.");
                            TestField("Issuing Store");
                            if ReqLine.Find('-') then begin
                                repeat
                                    //Issue
                                    LineNo := LineNo + 1000;
                                    GenJnline.Init;
                                    GenJnline."Journal Template Name" := InventorySetup."Item Jnl Template";
                                    GenJnline."Journal Batch Name" := InventorySetup."Item Jnl Batch";
                                    GenJnline."Line No." := LineNo;
                                    GenJnline."Entry Type" := GenJnline."entry type"::"Negative Adjmt.";
                                    GenJnline."Document No." := "No.";
                                    GenJnline."Item No." := ReqLine."No.";
                                    GenJnline.Validate("Item No.");
                                    GenJnline."Location Code" := ReqLine."Issuing Store";
                                    GenJnline."Bin Code" := ReqLine."Bin Code";
                                    GenJnline.Validate("Location Code");
                                    GenJnline."Posting Date" := "Request date";
                                    GenJnline.Description := ReqLine.Description;
                                    GenJnline.Quantity := ReqLine.Quantity;
                                    GenJnline."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                                    GenJnline.Validate("Shortcut Dimension 1 Code");
                                    GenJnline."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                                    GenJnline.Validate("Shortcut Dimension 2 Code");
                                    GenJnline.ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
                                    GenJnline.ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
                                    GenJnline.Validate(Quantity);
                                    GenJnline.Validate("Unit Amount");
                                    //GenJnline."Reason Code":='221';
                                    //GenJnline.VALIDATE("Reason Code");
                                    GenJnline.Insert(true);

                                    ReqLine."Request Status" := ReqLine."request status"::Posted;

                                until ReqLine.Next = 0;
                                //Post Entries
                                GenJnline.Reset;
                                GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                                GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                                Codeunit.Run(Codeunit::"Item Jnl.-Post", GenJnline);
                                //End Post entries

                                //Modify All
                                Post := false;
                                Post := JournlPosted.PostedSuccessfully();
                                if Post then begin
                                    ReqLine.ModifyAll(ReqLine."Request Status", ReqLine."request status"::Posted);
                                    Status := Status::Posted;
                                    Modify;
                                end
                            end;
                        end
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        CurrPageUpdate;

        "Document Type" := "document type"::SR
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        "Document Type" := "document type"::SR;

        RequisitionHeader.Reset;
        RequisitionHeader.SetRange("User ID", UserId);
        RequisitionHeader.SetRange(Status, RequisitionHeader.Status::Open);
        RequisitionHeader.SetRange("Document Type", RequisitionHeader."document type"::SR);
        if RequisitionHeader.FindFirst then
            Error('you cannot open another document when %1 is still %2', RequisitionHeader."No.", Format(RequisitionHeader.Status));
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        "Responsibility Center" := UserMgt.GetPurchasesFilter();
        //Add dimensions if set by default here
        "Global Dimension 1 Code" := UserMgt.GetSetDimensions(UserId, 1);
        Validate("Global Dimension 1 Code");
        "Shortcut Dimension 2 Code" := UserMgt.GetSetDimensions(UserId, 2);
        Validate("Shortcut Dimension 2 Code");
        "Shortcut Dimension 3 Code" := UserMgt.GetSetDimensions(UserId, 3);
        Validate("Shortcut Dimension 3 Code");
        "Shortcut Dimension 4 Code" := UserMgt.GetSetDimensions(UserId, 4);
        Validate("Shortcut Dimension 4 Code");

        UpdateControls;
        "Document Type" := "document type"::SR;

        RequisitionHeader.Reset;
        RequisitionHeader.SetRange("User ID", UserId);
        RequisitionHeader.SetRange(Status, RequisitionHeader.Status::Open);
        RequisitionHeader.SetRange("Document Type", RequisitionHeader."document type"::SR);
        if RequisitionHeader.FindFirst then
            Error('you cannot open another document when %1 is still %2', RequisitionHeader."No.", Format(RequisitionHeader.Status));
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin

        UpdateControls;
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

        "Document Type" := "document type"::SR

    end;

    var
        UserMgt: Codeunit 52193453;
        ApprovalMgt: Codeunit 439;
        ReqLine: Record "Store Requistion Lines";
        InventorySetup: Record 313;
        GenJnline: Record "Item Journal Line";
        LineNo: Integer;
        Post: Boolean;
        JournlPosted: Codeunit 52193452;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        ApprovalEntries: Page "Approval Entries";
        StatusEditable: Boolean;
        RequisitionHeader: Record "Store Requistion Header";


    procedure LinesExists(): Boolean
    var
        PayLines: Record "Store Requistion Lines";
    begin
        HasLines := false;
        PayLines.Reset;
        PayLines.SetRange(PayLines."Requistion No", "No.");
        if PayLines.Find('-') then begin
            HasLines := true;
            exit(HasLines);
        end;
    end;


    procedure UpdateControls()
    begin
        if Status = Status::Open then
            StatusEditable := true
        else
            StatusEditable := false;
    end;


    procedure CurrPageUpdate()
    begin
        xRec := Rec;
        UpdateControls;
        CurrPage.Update;
    end;
}

