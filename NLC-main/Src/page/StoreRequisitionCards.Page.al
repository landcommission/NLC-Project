page 52194157 "Store Requisition Cards"
{
    DeleteAllowed = true;
    Editable = true;
    InsertAllowed = true;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Approvals,Cancellation,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Store Requistion Headers";
    SourceTableView = where("Document Type" = const(SR));
    ApplicationArea = All;
    Caption = 'Store Requisition Cards';
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
                field("Issuing Store"; Rec."Issuing Store")
                {
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Issuing Store field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Received; Rec.Received)
                {
                    ToolTip = 'Specifies the value of the Received field.';
                }
                field("Received By"; Rec."Received By")
                {
                    ToolTip = 'Specifies the value of the Received By field.';
                }
                field("Received Date"; Rec."Received Date")
                {
                    ToolTip = 'Specifies the value of the Received Date field.';
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ToolTip = 'Specifies the value of the Requester ID field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(req; "Store RequisitionLine")
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


                action("Send A&pproval Request")
                {
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                        CustomApp: Codeunit "Custom Approvals Codeunit";
                    begin
                        if not LinesExists() then
                            Error('There are no Lines created for this Document');

                        //Release the Imprest for Approval
                        if Confirm('Send this Stores Request for Approval?', true) = false then
                            exit;
                        VarVariant := Rec;
                        if CustomApp.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApp.OnSendDocForApproval(VarVariant);
                        CurrPage.Close();
                        //ApprovalMgt.SendSRequestApprovalRequest(Rec)
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
                    var
                        CustomApp: Codeunit "Custom Approvals Codeunit";
                    begin

                        if Confirm('Cancel this Stores Request Approval?', true) = false then
                            exit;
                        VarVariant := Rec;
                        CustomApp.OnCancelDocApprovalRequest(VarVariant);
                        CurrPage.Close();
                        //ApprovalMgt.CancelSRRequestApprovalRequest(Rec, TRUE, TRUE)
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
                    var
                        Appromg: Codeunit "Approvals Mgmt.";
                    begin
                        Appromg.OpenApprovalEntriesPage(rec.RecordId);
                    end;
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
                        Report.Run(Report::"Store Requisitions", true, true, Rec);
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
                    //RunPageLink = Field1 = FIELD (No.);
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

        CurrPageUpdate();

        Rec."Document Type" := Rec."Document Type"::SR
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        Rec."Document Type" := Rec."Document Type"::SR;


        RequisitionHeader.Reset();
        RequisitionHeader.SetRange("User ID", UserId);
        RequisitionHeader.SetRange(Status, RequisitionHeader.Status::Open);
        RequisitionHeader.SetRange("Document Type", RequisitionHeader."Document Type"::SR);
        if RequisitionHeader.FindFirst() then
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
        Rec."Document Type" := Rec."Document Type"::SR;


        RequisitionHeader.Reset();
        RequisitionHeader.SetRange("User ID", UserId);
        RequisitionHeader.SetRange(Status, RequisitionHeader.Status::Open);
        RequisitionHeader.SetRange("Document Type", RequisitionHeader."Document Type"::SR);
        if RequisitionHeader.FindFirst() then
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

        UpdateControls();
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

        Rec."Document Type" := Rec."Document Type"::SR

    end;

    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,None,PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Staff Advance","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS;
        HasLines: Boolean;
        ApprovalEntries: Page "Approval Entries";
        StatusEditable: Boolean;
        RequisitionHeader: Record "Store Requistion Headers";
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

