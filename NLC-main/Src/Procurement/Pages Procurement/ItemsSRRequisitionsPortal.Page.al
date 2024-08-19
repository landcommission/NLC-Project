#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50002 "Items SR Requisitions Portal"
{
    DeleteAllowed = true;
    Editable = true;
    InsertAllowed = true;
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
                    Editable = true;
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
                        DocumentType := Documenttype::Rn;
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
                    begin
                        if not LinesExists then
                            Error('There are no Lines created for this Document');

                        //Release the Imprest for Approval
                        if Confirm('Send this Stores Request for Approval?', true) = false then exit;
                        // ApprovalMgt.SendSRequestApprovalRequest(Rec)
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
                    begin

                        if Confirm('Cancel this Stores Request Approval?', true) = false then exit;
                        //  ApprovalMgt.CancelSRRequestApprovalRequest(Rec, true, true)
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

        /*
       RequisitionHeader.RESET;
       RequisitionHeader.SETRANGE("User ID",USERID);
       RequisitionHeader.SETRANGE(Status,RequisitionHeader.Status::Posted);
       RequisitionHeader.SETRANGE(RequisitionHeader.Received,FALSE);
       RequisitionHeader.SETRANGE("Document Type",RequisitionHeader."Document Type"::SR);
       IF RequisitionHeader.FINDFIRST THEN
          ERROR('you cannot create a new record when you have not Received Requisition No:%1',RequisitionHeader."No.");
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

        //UpdateControls;
        "Document Type" := "document type"::SR;


        RequisitionHeader.Reset;
        RequisitionHeader.SetRange("User ID", UserId);
        RequisitionHeader.SetRange(Status, RequisitionHeader.Status::Open);
        RequisitionHeader.SetRange("Document Type", RequisitionHeader."document type"::SR);
        if RequisitionHeader.FindFirst then
            Error('you cannot open another document when %1 is still %2', RequisitionHeader."No.", Format(RequisitionHeader.Status));

        /*
        RequisitionHeader.RESET;
        RequisitionHeader.SETRANGE("User ID",USERID);
        RequisitionHeader.SETRANGE(Status,RequisitionHeader.Status::Posted);
        RequisitionHeader.SETRANGE(RequisitionHeader.Received,FALSE);
        RequisitionHeader.SETRANGE("Document Type",RequisitionHeader."Document Type"::SR);
        IF RequisitionHeader.FINDFIRST THEN
           ERROR('you cannot create a new record when you have not Received Requisition No:%1',RequisitionHeader."No.");
          */

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
        ReqLine: Record "Store Requistion Line";
        InventorySetup: Record 313;
        GenJnline: Record "Item Journal Line";
        LineNo: Integer;
        Post: Boolean;
        JournlPosted: Codeunit 52193452;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,"None",PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Staff Advance","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS;
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

