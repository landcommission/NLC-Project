#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193611 "HR Staff Transport Card"
{
    PageType = Card;
    SourceTable = "HR Transport Requisition";
    ApplicationArea = All;
    Caption = 'HR Staff Transport Card';
    PromotedActionCategories = 'New,Process,Report,Workflow Process,Documents';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Transport Request No"; Rec."Transport Request No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transport Request No field.';
                }
                field("Trip Return Pickup From"; Rec."Trip Return Pickup From")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Trip Return Pickup From field.';
                }
                field("Job Tittle"; Rec."Job Tittle")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Tittle field.';
                }
                field(UserId; UserId)
                {
                    ApplicationArea = Basic;
                    Caption = 'User ID';
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Days Applied field.';
                }
                field("Number of Employees"; Rec."Number of Employees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Number of Employees field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Return Date field.';
                }
                field("Time of Trip"; Rec."Time of Trip")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time of Trip field.';
                }
                field("Time of Return"; Rec."Time of Return")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time of Return field.';
                }
                field("Trip From Destination"; Rec."Trip From Destination")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Trip From Destination field.';
                }
                field("Trip To Destination"; Rec."Trip To Destination")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Trip To Destination field.';
                }
                field("Purpose of Trip"; Rec."Purpose of Trip")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purpose of Trip field.';
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor field.';
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reference No. field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
            }
            part("Passenger List"; "Passenger Request List")
            {
                Caption = 'Passenger List';
                SubPageLink = "Requisition No" = field("Transport Request No");
                Visible = true;
            }
            group("After Approval")
            {
                Caption = 'After Approval';
                Visible = Rec.Status = Rec.Status::Approved;
                field(Taxi; Rec.Taxi)
                {
                    ApplicationArea = Basic;
                    Editable = Rec.Allocated = false;
                    ToolTip = 'Specifies the value of the Taxi field.';
                }
                field("Taxi Company"; Rec."Taxi Company")
                {
                    ApplicationArea = Basic;
                    Enabled = Rec.Taxi = true;
                    ToolTip = 'Specifies the value of the Taxi Company field.';
                }
                field("Vehicle Allocated"; Rec."Vehicle Allocated")
                {
                    ApplicationArea = Basic;
                    Editable = Rec.Allocated = false;
                    Enabled = Rec.Taxi = false;
                    ToolTip = 'Specifies the value of the Vehicle Allocated field.';
                }
                field("Vehicle Description"; Rec."Vehicle Description")
                {
                    ApplicationArea = Basic;
                    Editable = Rec.Allocated = false;
                    Enabled = Rec.Taxi = false;
                    ToolTip = 'Specifies the value of the Vehicle Description field.';
                }
                field(Driver; Rec.Driver)
                {
                    ApplicationArea = Basic;
                    Editable = Rec.Allocated = false;
                    Enabled = Rec.Taxi = false;
                    ToolTip = 'Specifies the value of the Driver field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                    Editable = Rec.Allocated = false;
                    Enabled = Rec.Taxi = false;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field(Allocated; Rec.Allocated)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Allocated field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';

                action("Send Approvals")
                {
                    ApplicationArea = Basic;
                    Caption = '&Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the &Send Approval Request action.';
                    trigger OnAction()
                    begin

                        TESTFIELDS();

                        if Confirm('Send this Application for Approval?', true) = false then
                            exit;
                        Rec.Selected := true;
                        Rec."User ID" := UserId;

                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        //ApprovalMgt.SendTransportReqApproval(Rec);
                    end;
                }
                action("Cancel Approval")
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    ToolTip = 'Executes the Cancel Approval action.';
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    trigger OnAction()
                    var
                        myInt: Integer;
                    begin
                        if Confirm('Do you want to cancell this Approval?') = true then begin
                            VarVariant := Rec;
                            CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        end;

                    end;

                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the &Approvals action.';
                    trigger OnAction()
                    var
                        ApprovMg: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovMg.OpenApprovalEntriesPage(rec.RecordId);


                    end;
                }
                separator(Action1102755018) { }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the Print action.';
                    trigger OnAction()
                    begin
                        HRLeaveApp.Reset();
                        HRLeaveApp.SetRange(HRLeaveApp."Transport Request No", Rec."Transport Request No");
                        if HRLeaveApp.Find('-') then
                            Report.Run(39003919, true, true, HRLeaveApp);
                    end;
                }
                action(Attachment)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attachment';
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the Attachment action.';
                    trigger OnAction()
                    begin
                        DMSInt.Reset();
                        DMSInt.SetRange(DMSInt."DMS Link Type", DMSInt."DMS Link Type"::Transport);
                        if DMSInt.Find('-') then
                            Hyperlink(DMSInt."DMS Link Path" + Rec."Transport Request No");
                    end;
                }
                action(Allocate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Allocate';
                    Image = IssueFinanceCharge;
                    Promoted = true;
                    PromotedIsBig = true;
                    Visible = Rec.Status = Rec.Status::Approved;
                    ToolTip = 'Executes the Allocate action.';
                    trigger OnAction()
                    begin
                        if Rec.Allocated then
                            Error('A vehicle has already been assigned and notification sent');
                        Rec.Allocated := true;
                        //SendEmail("Request No.");
                        //MESSAGE('Notification sent to %1',"User ID");
                        Message('Allocation Done successfully');
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        UpdateControls();

        //PASS VALUES TO VARIABLES ON THE FORM
        FillVariables();
        //GET LEAVE STATS FOR THIS EMPLOYEE FROM THE EMPLOYEE TABLE
        //GetLeaveStats("Leave Type");
        //TO PREVENT USER FROM SEEING OTHER PEOPLES LEAVE APPLICATIONS
        //SETFILTER("User ID",USERID);
        /*
         IF Status=Status::Approved THEN// or IF Status:=Status::"Pending Approval" THEN
         CurrForm.EDITABLE:=FALSE;

         IF Status=Status::"Pending Approval" THEN// or IF Status:=Status::"Pending Approval" THEN
         CurrForm.EDITABLE:=FALSE;
        */

    end;

    trigger OnOpenPage()
    begin
        //SETFILTER("User ID",USERID);
        /*IF "Employee No"<>'' THEN*/
        UpdateControls();

    end;

    var
        HREmp: Record "HR Employees";
        EmpJobDesc: Text[30];
        HRJobs: Record "HR Jobs";
        SupervisorName: Text[30];
        //SMTP: Codeunit "SMTP Mail";
        URL: Text[500];
        dAlloc: Decimal;
        dEarnd: Decimal;
        dTaken: Decimal;
        dLeft: Decimal;
        cReimbsd: Decimal;
        cPerDay: Decimal;
        cbf: Decimal;
        HRSetup: Record "HR Setup";
        EmpDept: Text[30];
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        HRLeaveApp: Record "HR Transport Requisition";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over";
        HRLeaveLedgerEntries: Record "HR Leave Ledger Entries";
        D: Date;
        EmpName: Text[70];
        DoclLink: Record "HR Company Attachments";
        ApprovalEntries: Page "Approval Entries";
        DMSInt: Record DMS;


    procedure FillVariables()
    begin
        //GET THE APPLICANT DETAILS

        HREmp.Reset();
        if HREmp.Get(Rec."Employee No") then begin
            EmpName := HREmp.FullName();
            EmpDept := HREmp."Global Dimension 2 Code";
        end else
            EmpDept := '';

        //GET THE JOB DESCRIPTION FRON THE HR JOBS TABLE AND PASS IT TO THE VARIABLE
        HRJobs.Reset();
        if HRJobs.Get(Rec."Job Tittle") then
            EmpJobDesc := HRJobs."Job Description"
        else
            EmpJobDesc := '';

        //GET THE APPROVER NAMES
        HREmp.Reset();
        HREmp.SetRange(HREmp."User ID", Rec.Supervisor);
        if HREmp.Find('-') then
            SupervisorName := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name"
        else
            SupervisorName := '';
    end;


    procedure GetLeaveStats(LeaveType: Text[50])
    begin

        dAlloc := 0;
        dEarnd := 0;
        dTaken := 0;
        dLeft := 0;
        cReimbsd := 0;
        cPerDay := 0;
        cbf := 0;
        if HREmp.Get(Rec."Employee No") then begin
            HREmp.SetFilter(HREmp."Leave Type Filter", LeaveType);
            HREmp.CalcFields(HREmp."Allocated Leave Days");
            dAlloc := HREmp."Allocated Leave Days";
            HREmp.Validate(HREmp."Allocated Leave Days");
            dEarnd := HREmp."Total (Leave Days)";
            HREmp.CalcFields(HREmp."Total Leave Taken");
            dTaken := HREmp."Total Leave Taken";
            dLeft := HREmp."Leave Balance";
            cReimbsd := HREmp."Cash - Leave Earned";
            cPerDay := HREmp."Cash per Leave Day";
            cbf := HREmp."Reimbursed Leave Days";
        end;
    end;


    procedure TESTFIELDS()
    begin
        //TESTFIELD("Leave Type");
        Rec.TestField(Rec."Days Applied");
        Rec.TestField(Rec."Start Date");
        //TESTFIELD(Reliever);
        //TESTFIELD(Supervisor);
    end;


    procedure UpdateControls()
    begin
        if Status = Status::New then
            CurrPage.Editable := true
        else
            CurrPage.Editable := false;
        /*
         IF Status<>Status::New THEN BEGIN
         CurrForm."Leave Type".EDITABLE:=FALSE;
         CurrForm."Days Applied".EDITABLE:=FALSE;
         CurrForm."Start Date".EDITABLE:=FALSE;
         CurrForm.Reliever.EDITABLE:=FALSE;
         CurrForm."Responsibility Center".EDITABLE:=FALSE;
         CurrForm.UPDATECONTROLS();
         END ELSE BEGIN
         CurrForm."Leave Type".EDITABLE:=TRUE;
         CurrForm."Days Applied".EDITABLE:=TRUE;
         CurrForm."Start Date".EDITABLE:=TRUE;
         CurrForm.Reliever.EDITABLE:=TRUE;
         CurrForm."Responsibility Center".EDITABLE:=TRUE;
         CurrForm.UPDATECONTROLS();
         END;

         IF Status<>Status::Approved THEN BEGIN
         CurrForm."Leave Type".EDITABLE:=TRUE;
         CurrForm."Days Applied".EDITABLE:=TRUE;
         CurrForm."Start Date".EDITABLE:=TRUE;
         CurrForm.Reliever.EDITABLE:=TRUE;
         CurrForm."Responsibility Center".EDITABLE:=TRUE;
         CurrForm.UPDATECONTROLS();
         END ELSE BEGIN
         CurrForm."Leave Type".EDITABLE:=FALSE;
         CurrForm."Days Applied".EDITABLE:=FALSE;
         CurrForm."Start Date".EDITABLE:=FALSE;
         CurrForm.Reliever.EDITABLE:=FALSE;
         CurrForm."Responsibility Center".EDITABLE:=FALSE;
         CurrForm.UPDATECONTROLS();
         END;
         */

    end;
}
