#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 52194251 "Internal Memo Cards"
{
    DeleteAllowed = true;
    Editable = true;
    InsertAllowed = true;
    PageType = Document;
    SourceTable = "Store Requistion Headers";
    SourceTableView = where("Document Type" = const(MEMO));
    PromotedActionCategories = 'New,Report,Process,Workflow Process,Documents';

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
                    Editable = false;
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
                    Editable = false;
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
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                }
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Booking Type"; "Booking Type")
                {
                    ApplicationArea = Basic;
                }
            }
            part("Ticket Memo Requisition Line"; "Ticket Memo Requisition Line")
            {
                Caption = 'Ticket Memo Requisition Line';
                Editable = true;
                SubPageLink = "Requistion No" = field("No."),
                              "Booking Type" = const(Ticket);
                Visible = "Booking Type" = "Booking Type"::Ticket;
            }
            part("Hotel Memo Requisition Line"; "Hotel Memo Requisition Line")
            {
                Caption = 'Hotel Memo Requisition Line';
                Editable = true;
                SubPageLink = "Requistion No" = field("No."),
                              "Booking Type" = const(Hotel);
                Visible = "Booking Type" = "Booking Type"::Hotel;
            }
            part(Control18; "Hotel Allocation Lines")
            {
                Caption = 'Hotel Allocation Lines';
                Editable = true;
                SubPageLink = "Requistion No" = field("No."),
                              "Booking Type" = const(Hotel);
                Visible = "Status" = "Status"::"Released";
            }
        }
        area(factboxes)
        {
            part(Control15; "Approval Comments")
            {
                SubPageLink = "Document No." = field("No.");
            }
            systempart(Control6; Notes)
            {
            }
            systempart(Control4; MyNotes)
            {
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
                action("Send A&pproval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = Rec.Status = Status::Open;
                    trigger OnAction()
                    begin
                        if not LinesExists then
                            Error('There are no Lines created for this Document');
                        if Confirm('Send this Memo Request for Approval?', true) = false then exit;
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
                    Visible = rec.Status = Status::"Pending Approval";
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    trigger OnAction()
                    begin
                        if Confirm('Cancel this Memo Request Approval?', true) = false then exit;
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        CurrPage.Close();
                    end;
                }
                action(Approve)
                {
                    ApplicationArea = Basic;
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Caption = 'Approve Document';
                    Visible = rec.Status = Status::"Pending Approval";
                    PromotedOnly = true;
                    ToolTip = 'Executes the Approval of Document action.';
                    trigger OnAction()
                    var
                        myInt: Integer;
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        if Confirm('Do you want to approve this document?') = true then begin
                            ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                            CurrPage.Close();
                        end;
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    trigger OnAction()
                    var
                        ApprovalMGT: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalMGT.OpenApprovalEntriesPage(rec.RecordId);
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
                        Report.Run(50089, true, true, Rec);
                    end;
                }
                separator(Action13)
                {
                }
            }
            action(Allocate)
            {
                ApplicationArea = Basic;
                Caption = 'Allocate';
                Image = IssueFinanceCharge;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Visible = "Status" = "Status"::"Released";
                trigger OnAction()
                begin
                    if Allocated then
                        Error('A Hotel has already been allocated and notification sent to the staff');
                    Allocated := true;
                    Message('Email Notification sent to %1', "Requester ID");
                end;
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
                    PromotedCategory = Category5;
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
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    RunObject = Page Attachment;
                    //RunPageLink = IFMIS_No = field("No.");
                    RunPageMode = View;
                }
                action(Sign)
                {
                    ApplicationArea = Basic;
                    Caption = 'Sign';
                    Description = 'Digital Signature';
                    Image = Agreement;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
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

    trigger OnAfterGetCurrRecord()
    begin
        "Approval Status" := Status
    end;

    trigger OnAfterGetRecord()
    begin

        CurrPageUpdate;

        "Document Type" := "document type"::MEMO;
        "Approval Status" := Status
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        "Document Type" := "document type"::MEMO;

        /*
        RequisitionHeader.RESET;
        RequisitionHeader.SETRANGE("User ID",USERID);
        RequisitionHeader.SETRANGE(Status,RequisitionHeader.Status::Open);
        RequisitionHeader.SETRANGE("Document Type",RequisitionHeader."Document Type"::SR);
        IF RequisitionHeader.FINDFIRST THEN
           ERROR('you cannot open another document when %1 is still %2',RequisitionHeader."No.",FORMAT(RequisitionHeader.Status));
        */

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
        "Document Type" := "document type"::MEMO;


        /*
        RequisitionHeader.RESET;
        RequisitionHeader.SETRANGE("User ID",USERID);
        RequisitionHeader.SETRANGE(Status,RequisitionHeader.Status::Open);
        RequisitionHeader.SETRANGE("Document Type",RequisitionHeader."Document Type"::SR);
        IF RequisitionHeader.FINDFIRST THEN
           ERROR('you cannot open another document when %1 is still %2',RequisitionHeader."No.",FORMAT(RequisitionHeader.Status));
        */

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
        IsVisible := true;

        /* 
        IF UserMgt.GetPurchasesFilter() <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center" ,UserMgt.GetPurchasesFilter());
          FILTERGROUP(0);
        END;
        */

        "Document Type" := "document type"::MEMO;
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
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,"None",PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Staff Advance","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        ApprovalEntries: Page "Approval Entries";
        StatusEditable: Boolean;
        Varvariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        RequisitionHeader: Record "Store Requistion Headers";
        filemnt: Codeunit 419;
        selectedFile: Text;
        ToFile: Text;
        CompanyInfo: Record "Company Information";
        Link: Text[250];
        NVInStream: InStream;
        IsVisible: Boolean;


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

    local procedure SendEmail(No: Code[10])
    var
        CompSetup: Record "Company Information";
        UserSetup: Record "User Setup";
        applicantemail: Text;
        senderEmail: Text;
        subject: Text;
        body: Text;
        EmailBody: Text;
        dutiesbyemail: Text;
        applicantname: Text;
        dutiesbyname: Text;
        financeEmail: Text;
    begin
        /*
      IF CompSetup.GET THEN
        senderEmail:=CompSetup."Administrator Email";

      IF UserSetup.GET("Requester ID") THEN
        recepient:=UserSetup."E-Mail";

      {
      IF Hotel<>'' THEN BEGIN
      UserSetup.RESET;
      UserSetup.SETFILTER("Employee Code.",Driver);
      IF UserSetup.FIND('-') THEN
      ccemail:=UserSetup."E-Mail"
      ELSE
      ccemail:=CompSetup."Administrator Email";
      END;
      }

      subject:=STRSUBSTNO('Internal Memo No: %1 hotel booking has been allocated',No);
      EmailBody:='Hello, </br>This is to notify you that,</br>';

      EmailBody1:=STRSUBSTNO('Internal Memo No: %1 hotel booking has been allocated',No);
      EmailBody2:=STRSUBSTNO('Hotel is: %1',"Driver Name");
      EmailBody3:=STRSUBSTNO('Vehicle is: %1',"Vehicle Allocated");
      EmailBody4:=STRSUBSTNO('Start Date is: %1',"Start Date");
      EmailBody5:=STRSUBSTNO('Return Date is: %1',"Return Date");
      EmailBody6:=STRSUBSTNO('Destination is: %1',Destination);
      EmailBody7:=STRSUBSTNO('Employee is: %1',"Employee Name");

      IF Taxi THEN BEGIN
        EmailBody:=EmailBody+'Transport No: %1 has been approved. Taxi has been assigned</br>';
      END ELSE BEGIN
            EmailBody:=EmailBody1+ '-'+'-'+EmailBody2+'-'+'-'+EmailBody3+'-'+'-'+EmailBody4+'-'+'-'+EmailBody5+'-'+'-'+EmailBody6+'-'+'-'+EmailBody7;
          //EmailBody1:='Transport No: %1 has been approved.Driver is:%2. Vehicle is:%3.Trip Start Date is:%4.Trip End Date is:%5.Destination is:%6.</br>';
          //EmailBody:=EmailBody+'Transport No: %1 has been approved. Vehicle and driver have been assigned</br>';
      END;
      EmailBody:=EmailBody+'</br></br>--Notification from Dynamics NAV ERP--';
      //EmailBody:=EmailBody+'</br></br>--Notification from Dynamics NAV ERP--';

      body:=STRSUBSTNO(EmailBody,No);
      //body:=STRSUBSTNO(EmailBody1,No);
      smtp.CreateMessage(COMPANYNAME,senderEmail,recepient,subject,body,TRUE);
      IF Driver<>'' THEN
        smtp.AddCC(ccemail);
      smtp.Send;
      */

    end;
}

