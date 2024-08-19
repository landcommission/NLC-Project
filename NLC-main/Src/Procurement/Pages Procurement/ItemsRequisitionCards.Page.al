#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50124 "Items  Requisition Cards"
{
    Caption = 'Items PO Card';
    DeleteAllowed = true;
    Editable = true;
    InsertAllowed = true;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Approvals,Cancellation,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Store Requistion Headers";
    SourceTableView = where("Document Type" = const(PR));

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
                    Editable = false;
                }
                field("Request date"; "Request date")
                {
                    ApplicationArea = Basic;
                }
                field("Date Received"; "Date Received")
                {
                    ApplicationArea = Basic;
                    Visible = "Status" = "Status"::Released;
                }
                field("Employee Code"; "Employee Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Name"; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = statuseditable;
                }
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = all;

                }
                field("Function Name"; "Function Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'County';
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
                    Caption = 'Department';
                    Editable = false;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requester ID"; "Requester ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
                field(Store; "Issuing Store")
                {
                    ApplicationArea = Basic;
                    Caption = 'Receiving Store';
                    Editable = false;
                }
                field("Required Date"; "Required Date")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                }
                field("Supplier No."; "Vendor No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Supplier No.';
                    Editable = false;
                }
                field("Supplier Name"; "Vendor Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Supplier Name';
                    Editable = false;
                }
                field(Currency; Currency)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Order Date"; "Order Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Purchase Order No"; "Purchase Order No")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                }
                field(TotalAmount; TotalAmount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part("Items PO Lines"; "Items Requsition Lines")
            {
                Caption = 'Items PO Lines';
                Editable = true;
                SubPageLink = "Requistion No" = field("No.");
            }
        }
        area(factboxes)
        {
            systempart(Control29; Links)
            {
            }
            part(Control15; "Approval Comments")
            {
                SubPageLink = "Document No." = field("No.");
            }
            part(Control27; "Approval Comment Lines")
            {
                SubPageLink = "Application Code" = field("No.");
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
                action("Update Item Register")
                {
                    ApplicationArea = Basic;
                    Caption = 'Update Item Register';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin


                        if Status <> Status::Released then
                            Error('The PO has not yet been Approved');

                        if Status = Status::Posted then
                            Error('The Document Has Already been Posted');

                        ItemLedger.Reset;
                        ItemLedger.SetRange(ItemLedger."Order No.", "Purchase Order No");
                        if ItemLedger.Find('-') then begin
                            Error('This Order No.%1 has already been used for PO No. %2', "Purchase Order No", ItemLedger."Document No.");
                        end;

                        if not LinesExists then
                            Error('There are no Lines created for this Document');



                        if not EnterQuantityInspected then
                            Error('Some of the Key Fields on the Lines:[Quantity Inspected] Have not been Entered please RECHECK your entries');


                        if InventorySetup.Get then begin
                            InventorySetup.TestField(InventorySetup."Item Jnl Template");
                            InventorySetup.TestField(InventorySetup."Item Jnl Batch");
                            GenJnline.Reset;
                            GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                            GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                            if GenJnline.Find('-') then GenJnline.DeleteAll;

                            if "Issuing Store" = '' then
                                Error('Kindly select the Receiving Store');
                            ReqLine.Reset;
                            ReqLine.SetRange(ReqLine."Requistion No", "No.");
                            TestField("Issuing Store");
                            if ReqLine.Find('-') then begin
                                repeat
                                    //Receive
                                    ReqLine.CalcFields("Issuing Store");
                                    LineNo := LineNo + 1000;
                                    GenJnline.Init;
                                    GenJnline."Journal Template Name" := InventorySetup."Item Jnl Template";
                                    GenJnline."Journal Batch Name" := InventorySetup."Item Jnl Batch";
                                    GenJnline."Line No." := LineNo;
                                    GenJnline."Entry Type" := GenJnline."entry type"::"Positive Adjmt.";
                                    GenJnline."Document No." := "No.";
                                    GenJnline."Item No." := ReqLine."No.";
                                    GenJnline.Validate("Item No.");
                                    GenJnline."Location Code" := ReqLine."Issuing Store";
                                    GenJnline."Bin Code" := ReqLine."Bin Code";
                                    GenJnline.Validate("Location Code");
                                    GenJnline."Posting Date" := "Request date";
                                    GenJnline.Description := "Request Description";
                                    GenJnline.Quantity := ReqLine."Quantity Requested";
                                    GenJnline."Gen. Bus. Posting Group" := 'LOCAL';
                                    GenJnline."Gen. Prod. Posting Group" := 'GOODS';

                                    GenJnline."Order No." := "Purchase Order No";
                                    GenJnline."Invoice No." := "Invoice No";
                                    GenJnline."Vendor No" := "Vendor No.";
                                    GenJnline."Vendor Name" := "Vendor Name";
                                    GenJnline."Employee No" := "Employee Code";
                                    GenJnline."Employee Name" := "Employee Name";
                                    GenJnline."Order No" := "Order No";
                                    GenJnline."User ID" := "Requester ID";
                                    GenJnline."Unit Amount" := ReqLine."Unit Cost";
                                    GenJnline.Amount := ReqLine."Line Amount";

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

                                //ReqLine."Request Status":=ReqLine."Request Status"::Closed;

                                until ReqLine.Next = 0;

                                //Post Entries
                                GenJnline.Reset;
                                GenJnline.SetRange(GenJnline."Journal Template Name", InventorySetup."Item Jnl Template");
                                GenJnline.SetRange(GenJnline."Journal Batch Name", InventorySetup."Item Jnl Batch");
                                Codeunit.Run(Codeunit::"Item Jnl.-Post", GenJnline);
                                //End Post entries

                                //Modify All
                                //Post:=FALSE;
                                //Post:=JournlPosted.PostedSuccessfully();
                                //IF Post THEN BEGIN
                                //ReqLine.MODIFYALL(ReqLine."Request Status",ReqLine."Request Status"::Closed);
                                Status := Status::Posted;
                                Modify;
                            end;
                        end;
                        //END
                    end;
                }
                separator(Action1102755029)
                {
                }

                action("Send A&pproval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = StatusVisible;

                    trigger OnAction()
                    var
                        Appromgt: Codeunit "Custom Approvals Codeunit";
                    begin

                        //TESTFIELD("Vendor No.");
                        TestField("Purchase Order No");
                        //TESTFIELD("Issuing Store");

                        ItemLedger.Reset;
                        ItemLedger.SetRange(ItemLedger."Order No.", "Purchase Order No");
                        if ItemLedger.Find('-') then begin
                            Error('This Order No.%1 has already been used for Purchase Requsition No. %2', "Purchase Order No", ItemLedger."Document No.");
                        end;

                        if not LinesExists then
                            Error('There are no Lines created for this Document');

                        //Release the Requisition for Approval

                        if Confirm('Send this Purchase Request for Approval?', true) = false then exit;
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        CurrPage.Close();
                    end;
                }
                action("Cancel Approval Re&quest")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = StatusVisible;

                    trigger OnAction()
                    begin

                        if Confirm('Cancel this Purchase Request Approval?', true) = false then exit;
                        //ApprovalMgt.CancelPRRequestApprovalRequest(Rec, true, true)
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        CurrPage.Close();
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        Appromgt: Codeunit "Approvals Mgmt.";
                    begin
                        Appromgt.OpenApprovalEntriesPage(rec.RecordId);

                    end;
                }
                separator(Action1102755035)
                {
                }
                action("Purchase Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Requisition';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Reset;
                        SetFilter("No.", "No.");
                        Report.Run(50082, true, true, Rec);
                        Reset;
                    end;
                }
                action(GRN)
                {
                    ApplicationArea = Basic;
                    Caption = 'GRN';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Reset;
                        SetFilter("No.", "No.");
                        Report.Run(50083, true, true, Rec);
                        Reset;
                    end;
                }
                action("ReOpen for Editing")
                {
                    ApplicationArea = Basic;
                    Caption = 'ReOpen for Editing';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = IsReOpen;

                    trigger OnAction()
                    begin


                        //ReOpen the Requisition for Approval

                        if Confirm('ReOpen the Requisition for Approval?', true) = false then exit;
                        if (Status = Status::Rejected) or (Status = Status::Released) then begin
                            Status := Status::Open;
                            Modify;
                            Message('The Requisition %1 has been ReOpened', "No.")
                        end
                        else
                            Message('The record has not been updated')
                    end;
                }
            }
            group("Document Management")
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

                    trigger OnAction()
                    begin
                        if CompanyInfo.Get then begin
                            Link := CompanyInfo."Documents Attachment Link";
                            Hyperlink(Link);
                        end;
                    end;
                }
                action("View Attached Documents")
                {
                    ApplicationArea = Basic;
                    Caption = 'View Attached Documents';
                    Image = Web;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page Attachment;
                    // RunPageLink = IFMIS_No = field("No.");
                    RunPageMode = View;
                }
                action(Sign)
                {
                    ApplicationArea = Basic;
                    Caption = 'Sign';
                    Description = 'Digital Signature';
                    Image = Agreement;
                    Promoted = true;
                    Visible = true;

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

    trigger OnAfterGetCurrRecord()
    begin
        "Approval Status" := Status
    end;

    trigger OnAfterGetRecord()
    begin
        //CurrPageUpdate;

        "Document Type" := "document type"::PR;
        "Approval Status" := Status
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        "Document Type" := "document type"::PR;
        "Action Type" := "action type"::Item;

        RequisitionHeader.Reset;
        RequisitionHeader.SetRange("User ID", UserId);
        RequisitionHeader.SetRange(Status, RequisitionHeader.Status::Open);
        RequisitionHeader.SetRange("Document Type", RequisitionHeader."document type"::PR);
        if RequisitionHeader.FindFirst then
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

        UpdateControls;


        "Document Type" := "document type"::PR;
        "Action Type" := "action type"::Item;

        RequisitionHeader.Reset;
        RequisitionHeader.SetRange("User ID", UserId);
        RequisitionHeader.SetRange(Status, RequisitionHeader.Status::Open);
        RequisitionHeader.SetRange("Document Type", RequisitionHeader."document type"::PR);
        if RequisitionHeader.FindFirst then
            Error('you cannot open another document when %1 is still %2', RequisitionHeader."No.", Format(RequisitionHeader.Status));

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

        if Status <> Status::Open then
            StatusEditable := false
        else
            StatusEditable := true;



        if Status <> Status::Open then
            StatusVisible := false
        else
            StatusVisible := true;

        if (Status = Status::Rejected) or (Status = Status::Released) then
            IsReOpen := true
        else
            IsReOpen := false;



        "Document Type" := "document type"::PR;
        "Approval Status" := Status

    end;

    var
        UserMgt: Codeunit 52193453;
        ApprovalMgt: Codeunit 439;
        ReqLine: Record "Store Requistion Line";
        InventorySetup: Record 313;
        GenJnline: Record "Item Journal Line";
        LineNo: Integer;
        Post: Boolean;
        JournlPosted: Codeunit 52193452;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,"None",PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,GrantTask,"Concept Note",Proposal,"Job Approval",Discip,GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,CashP,LeaveReim,Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS,PReq,SReq;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        ApprovalEntries: Page "Approval Entries";
        StatusEditable: Boolean;
        RequisitionHeader: Record "Store Requistion Headers";
        ItemLedger: Record "Item Ledger Entry";
        filemnt: Codeunit 419;
        selectedFile: Text;
        Varvariant: Variant;
        ToFile: Text;
        AllQuantityInspectedEntered: Boolean;
        CompanyInfo: Record "Company Information";
        Link: Text[250];
        NVInStream: InStream;
        StatusVisible: Boolean;
        IsReOpen: Boolean;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";


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


    procedure EnterQuantityInspected(): Boolean
    var
        PayLines: Record 52193604;
    begin

        AllQuantityInspectedEntered := true;
        ReqLine.Reset;
        ReqLine.SetRange(ReqLine."Requistion No", "No.");
        if ReqLine.Find('-') then begin
            repeat
                if ReqLine."Quantity Requested" = 0 then
                    AllQuantityInspectedEntered := false;
            until ReqLine.Next = 0;
            exit(AllQuantityInspectedEntered);
        end;
    end;
}

