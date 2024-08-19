#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50065 "Asset Receiving Requisition"
{
    Caption = 'Assets Receiving';
    DeleteAllowed = true;
    Editable = false;
    InsertAllowed = true;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Approvals,Cancellation,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Store Requistion Headers";
    SourceTableView = where("Document Type" = const(ASSET),
                            "Action Type" = const(Asset));

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
                field("Required Date"; "Required Date")
                {
                    ApplicationArea = Basic;
                    Editable = statuseditable;
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
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = statuseditable;
                }
                field("Requester ID"; "Requester ID")
                {
                    ApplicationArea = Basic;
                }
                field("Action Type"; "Action Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Purchasing Store"; "Purchasing Store")
                {
                    ApplicationArea = Basic;
                }
                field("Supplier No"; "Vendor No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Supplier No';
                }
                field("Supplier Name"; "Vendor Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Supplier Name';
                }
                field(Currency; Currency)
                {
                    ApplicationArea = Basic;
                }
                field("Order Date"; "Order Date")
                {
                    ApplicationArea = Basic;
                }
                field("No of Lines"; "No of Lines")
                {
                    ApplicationArea = Basic;
                }
                field(TotalAmount; TotalAmount)
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Order No"; "Purchase Order No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
            part("Asset Receiving Lines"; "Asset Receiving Lines")
            {
                Caption = 'Asset Receiving Lines';
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
                action("Receive Assets")
                {
                    ApplicationArea = Basic;
                    Caption = 'Receive Assets';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin

                        if not LinesExists then
                            Error('There are no Lines created for this Document');

                        if Status = Status::Posted then
                            Error('The Document Has Already been Posted');

                        //IF Status<>Status::Released    THEN
                        // ERROR('The Document Has not yet been Approved');

                        GenJnline.Reset;
                        GenJnline.SetRange(GenJnline."Journal Template Name", 'ASSETS');
                        GenJnline.SetRange(GenJnline."Journal Batch Name", 'ACQ');
                        if GenJnline.Find('-') then GenJnline.DeleteAll;

                        TestField("Purchasing Store");

                        ReqLine.Reset;
                        ReqLine.SetRange(ReqLine."Requistion No", "No.");
                        TestField("Purchasing Store");
                        if ReqLine.Find('-') then begin
                            repeat
                                //Purchase Fixed Assets
                                LineNo := LineNo + 1000;
                                GenJnline.Init;
                                GenJnline."Journal Template Name" := 'ASSETS';
                                GenJnline."Journal Batch Name" := 'ACQ';
                                GenJnline."Line No." := LineNo;
                                //GenJnline."Account Type":=GenJnline."Account Type"::"Fixed Asset";
                                GenJnline."Document No." := "No.";
                                GenJnline."FA No." := ReqLine."No.";
                                GenJnline.Validate("FA No.");
                                GenJnline."FA Posting Date" := "Request date";
                                GenJnline.Description := ReqLine.Description;
                                GenJnline.Amount := ReqLine."Line Amount";
                                GenJnline."External Document No." := "Order No";
                                GenJnline."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
                                GenJnline.Validate("Shortcut Dimension 1 Code");
                                GenJnline."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                                GenJnline.Validate("Shortcut Dimension 2 Code");
                                GenJnline.Insert(true);


                                fasset.Reset;
                                fasset.SetRange(fasset."No.", ReqLine."No.");
                                if fasset.Find('-') then
                                    // fasset."Asset Movement Status" := fasset."asset movement status"::Available;
                                    //fasset."Supplier Name":=
                                    //fasset."IFMIS Order No":=
                                    // fasset."IFMIS Code" := ReqLine."Approved Assset Code";
                                    fasset.Modify;
                                Status := Status::Posted;
                                Modify;


                            until ReqLine.Next = 0;

                            //Post Entries
                            GenJnline.Reset;
                            GenJnline.SetRange(GenJnline."Journal Template Name", FASetup."FA Jnl. Template Name");
                            GenJnline.SetRange(GenJnline."Journal Batch Name", FASetup."FA Jnl. Batch Name");
                            ////CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnline);
                            Codeunit.Run(Codeunit::"FA. Jnl.-Post", GenJnline);
                            //End Post entries

                            //Modify All
                            //Post:=FALSE;
                            //Post:=JournlPosted.PostedSuccessfully();
                            //IF Post THEN BEGIN

                            /*
                            ReqLineCopy.RESET;
                            ReqLineCopy.SETRANGE(ReqLineCopy."Approved Assset Code",ReqLine."Asset Code");
                            ReqLineCopy."Request Status":=ReqLineCopy."Request Status"::Posted;
                            MESSAGE(FORMAT(ReqLineCopy."Requistion No"));
                            */

                        end;
                        //END;

                    end;
                }
                separator(Action1102755029)
                {
                }
                separator(Action27)
                {
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        DocumentType := Documenttype::Requisition;
                        ApprovalEntries.Setfilters(Database::"Store Requistion Header", DocumentType, "No.");
                        ApprovalEntries.Run;
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

                    trigger OnAction()
                    begin
                        if not LinesExists then
                            Error('There are no Lines created for this Document');

                        //Release the Imprest for Approval
                        ///if ApprovalMgt.SendPRequestApprovalRequest(Rec) then;
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

                    trigger OnAction()
                    begin
                        // if ApprovalMgt.CancelPRRequestApprovalRequest(Rec, true, true) then;
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
                    Visible = false;

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
            }
            group(test)
            {
                Caption = 'Document Management';
                Description = 'Document Management';
                action("DMS Link")
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Documents';
                    Image = Web;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        if CompanyInfo.Get then begin
                            Link := CompanyInfo."Documents Attachment Link";
                            Hyperlink(Link);
                        end;
                    end;
                }
                // action("View Attached Documents")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'View Attached Documents';
                //     Image = Web;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     PromotedIsBig = true;
                //     RunObject = Page "Attachments View";
                //     RunPageLink = IFMIS_No = field("Purchase Order No");
                //     RunPageMode = View;
                //     Visible = false;
                // }
                action(Sign)
                {
                    ApplicationArea = Basic;
                    Caption = 'Sign';
                    Description = 'Digital Signature';
                    Image = Agreement;
                    Promoted = true;
                    Visible = false;

                    trigger OnAction()
                    begin


                        //WinSign:=WinSign.Sign();
                        //WinSign.Controls.Add(WinSign);
                        //WinSign.Show();
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //CurrPageUpdate;

        "Document Type" := "document type"::ASSET;
        "Action Type" := "action type"::Asset
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        "Action Type" := "action type"::Asset;
        "Document Type" := "document type"::ASSET;

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

        UpdateControls;


        "Document Type" := "document type"::ASSET;
        "Action Type" := "action type"::Asset;

        /*
        RequisitionHeader.RESET;
        RequisitionHeader.SETRANGE("User ID",USERID);
        RequisitionHeader.SETRANGE(Status,RequisitionHeader.Status::Open);
        RequisitionHeader.SETRANGE("Document Type",RequisitionHeader."Document Type"::PR);
        IF RequisitionHeader.FINDFIRST THEN
           ERROR('you cannot open another document when %1 is still %2',RequisitionHeader."No.",FORMAT(RequisitionHeader.Status));
         */

    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        //UpdateControls;
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

        "Document Type" := "document type"::ASSET

    end;

    var
        UserMgt: Codeunit 52193453;
        ApprovalMgt: Codeunit 439;
        ReqLine: Record "Store Requistion Line";
        InventorySetup: Record 313;
        GenJnline: Record 5621;
        LineNo: Integer;
        Post: Boolean;
        JournlPosted: Codeunit 52193452;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        ApprovalEntries: Page "Approval Entries";
        StatusEditable: Boolean;
        RequisitionHeader: Record "Store Requistion Header";
        FASetup: Record 5605;
        filemnt: Codeunit 419;
        selectedFile: Text;
        ToFile: Text;
        CompanyInfo: Record "Company Information";
        Link: Text[250];
        NVInStream: InStream;
        fasset: Record "Fixed Asset";
        ReqLineCopy: Record "Store Requistion Line";


    procedure LinesExists(): Boolean
    var
        PayLines: Record "Store Requistion Line";
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

    local procedure replaceString(String: Text[50]; FindWhat: Text[10]; ReplaceWith: Text[10]) NewString: Text
    begin
        while StrPos(String, FindWhat) > 0 do
            String := DelStr(String, StrPos(String, FindWhat)) + ReplaceWith + CopyStr(String, StrPos(String, FindWhat) + StrLen(FindWhat));
        NewString := String;
    end;
}

