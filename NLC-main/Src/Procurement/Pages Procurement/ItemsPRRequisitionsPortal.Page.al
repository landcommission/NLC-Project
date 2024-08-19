#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50001 "Items PR Requisitions Portal"
{
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
                }
                field("Request date"; "Request date")
                {
                    ApplicationArea = Basic;
                }
                field("Required Date"; "Required Date")
                {
                    ApplicationArea = Basic;
                }
                field("Requester ID"; "Requester ID")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Request Description"; "Request Description")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; "No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(Supplier; Supplier)
                {
                    ApplicationArea = Basic;
                }
                field("Action Type"; "Action Type")
                {
                    ApplicationArea = Basic;
                }
                field(Justification; Justification)
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; "User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Function Name"; "Function Name")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Center Name"; "Budget Center Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 3 Code"; "Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 4 Code"; "Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Dim3; Dim3)
                {
                    ApplicationArea = Basic;
                }
                field(Dim4; Dim4)
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field(TotalAmount; TotalAmount)
                {
                    ApplicationArea = Basic;
                }
                field("Issuing Store"; "Issuing Store")
                {
                    ApplicationArea = Basic;
                }
                field("Job No"; "Job No")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("No. Printed"; "No. Printed")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID"; "Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Code"; "Employee Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Employee Name"; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = true;
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
                field("Invoice No"; "Invoice No")
                {
                    ApplicationArea = Basic;
                }
                field("Order No"; "Order No")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; "Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Name"; "Vendor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Purchasing Store"; "Purchasing Store")
                {
                    ApplicationArea = Basic;
                }
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
                action("Post Purchase Requisition")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Purchase Requisition';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin


                        ItemLedger.Reset;
                        ItemLedger.SetRange(ItemLedger."Order No.", "Order No");
                        if ItemLedger.Find('-') then begin
                            Error('This Order No.%1 has already been used for Purchase Requsition No. %2', "Order No", ItemLedger."Document No.");
                        end;

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
                                    //Receive
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

                                    GenJnline."Order No." := "Order No";
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
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        DocumentType := Documenttype::GRN;
                        ApprovalEntries.Setfilters(Database::"Store Requistion Headers", DocumentType, "No.");
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

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgt";
                        Varvariant: Variant;
                    begin

                        TestField("Vendor No.");
                        TestField("Order No");
                        TestField("Issuing Store");

                        ItemLedger.Reset;
                        ItemLedger.SetRange(ItemLedger."Order No.", "Order No");
                        if ItemLedger.Find('-') then begin
                            Error('This Order No.%1 has already been used for Purchase Requsition No. %2', "Order No", ItemLedger."Document No.");
                        end;

                        if not LinesExists then
                            Error('There are no Lines created for this Document');

                        //Release the Requisition for Approval

                        if Confirm('Send this Purchase Request for Approval?', true) = false then exit;
                        Varvariant := Rec;
                        ApprovalMgt.OnSendDocForApproval(Varvariant);
                    end;
                }
                action("Cancel Approval Re&quest")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgt";
                        Varvariant: Variant;
                    begin

                        if Confirm('Cancel this Purchase Request Approval?', true) = false then exit;
                        Varvariant := Rec;

                        ApprovalMgt.OnCancelDocApprovalRequest(Varvariant);
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
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        "Document Type" := "document type"::PR
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        "Document Type" := "document type"::PR;
        "Action Type" := "action type"::Item;


        /*
        RequisitionHeader.RESET;
        RequisitionHeader.SETRANGE("User ID",USERID);
        RequisitionHeader.SETRANGE(Status,RequisitionHeader.Status::Open);
        RequisitionHeader.SETRANGE("Document Type",RequisitionHeader."Document Type"::PR);
        IF RequisitionHeader.FINDFIRST THEN
         //  ERROR('you cannot open another document when %1 is still %2',RequisitionHeader."No.",FORMAT(RequisitionHeader.Status));
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


        "Document Type" := "document type"::PR;
        "Action Type" := "action type"::Item;

        /*
        RequisitionHeader.RESET;
        RequisitionHeader.SETRANGE("User ID",USERID);
        RequisitionHeader.SETRANGE(Status,RequisitionHeader.Status::Open);
        RequisitionHeader.SETRANGE("Document Type",RequisitionHeader."Document Type"::PR);
        IF RequisitionHeader.FINDFIRST THEN
          // ERROR('you cannot open another document when %1 is still %2',RequisitionHeader."No.",FORMAT(RequisitionHeader.Status));
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

        "Document Type" := "document type"::PR

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
}

