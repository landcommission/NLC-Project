#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194040 "HR Staff Transport Requisition"
{
    PageType = Card;
    SourceTable = "HR Transport Requisition";
    ApplicationArea = All;
    Caption = 'HR Staff Transport Requisition';
    PromotedActionCategories = 'New, Report, Process,Workflow Process,Functions';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Editable = EditValues;
                field("Transport Request No"; Rec."Transport Request No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Transport Request No field.';
                }

                field("Reference No"; Rec."Reference No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reference No. field.';
                }

                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
                }

                field("County Description"; Rec."County Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County Description field.';
                }

                field(Destination; Rec."Trip To Destination")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Trip To Destination field.';
                }
                field("Vehicle Allocated"; "Vehicle Allocated")
                {
                    ApplicationArea = all;
                    Caption = 'Vehicle Type';
                    Visible = false;
                }
                field("Vehicle Description"; "Vehicle Description")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Visible = false;

                }

                field("Purpose of Trip"; Rec."Purpose of Trip")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purpose of Trip field.';
                }
                field("Travel Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Travel Start Date';
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Days Applied field.';
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
                    Visible = false;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    Editable = false;
                    OptionCaption = 'New,Pending Approval,Rejected,Approved,Released';
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
                    Caption = 'Department';
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Estimated Cost"; "Estimated Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'Spefifies the estimated Transport Cost';
                }
                field("Captured by"; "Captured by")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Last Modified By"; "Last Modified By")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Add Days ?"; "Add Days ?")
                {
                    ApplicationArea = all;
                }
                field("Days Added"; "Days Added")
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        rec.TestField("Add Days ?", true);
                    end;
                }
                field("Days Added By"; "Days Added By")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
            }
            part("Passenger List"; "Passenger Request List")
            {
                Caption = 'Passenger List';
                SubPageLink = "Requisition No" = field("Transport Request No");
                Visible = true;
                Editable = EditValues;
            }
            part("HR Transport Allocations List"; "HR Transport Allocations List")
            {
                Caption = 'Hr Transport Allocations';
                SubPageLink = "Transport Allocation No" = field("Transport Request No");
                Editable = EditValues;

            }

        }
    }

    actions
    {
        area(Processing)
        {
            group("Workflow Process")
            {
                Caption = 'Workflow Process';
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
                    var
                        Passngerline: Record "HR Transport Requisition Line";
                        TransportAloo: Record "HR Transport Allocations H";
                        Passngerrs: Integer;
                        Capacity: Integer;
                        HRTransportReq: Record "HR Transport Requisition";
                    begin

                        TESTFIELDS();
                        Rec.TestField(Status, Status::New);

                        if Confirm('Send this Application for Approval?', true) = false then
                            exit;
                        Rec.Selected := true;
                        Rec."User ID" := UserId;
                        HRTransportReq.Reset();
                        HRTransportReq.SetRange(HRTransportReq."Transport Request No", rec."Transport Request No");
                        if HRTransportReq.FindFirst() then begin
                            Passngerline.Reset();
                            Passngerline.SetRange(Passngerline."Requisition No", HRTransportReq."Transport Request No");
                            if Passngerline.FindFirst() then begin
                                Passngerrs := Passngerline.Count;
                                TransportAloo.Reset();
                                TransportAloo.SetRange(TransportAloo."Transport Allocation No", HRTransportReq."Transport Request No");
                                if TransportAloo.FindFirst() then begin
                                    TransportAloo.CalcSums(TransportAloo."Passenger Capacity");
                                    Capacity := TransportAloo."Passenger Capacity";
                                end;
                                if Passngerrs > Capacity then
                                    Error('Add another vehicle to be allocated');
                            end else
                                Error('Requests must have atleast one line');
                        end;
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                    end;
                }
                action("Cancel Approval")
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Image = CancelApprovalRequest;
                    ToolTip = 'Executes the Cancel Approval action.';
                    trigger OnAction()
                    var
                        myInt: Integer;
                    begin
                        Rec.TestField(Status, Status::"Pending Approval");
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action("Re-open Document")
                {
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    trigger OnAction()
                    var
                        myInt: Integer;
                    begin
                        // if rec."Approval Status" = rec."Approval Status"::"Pending approval" then
                        //     Error('cancell the approval Request');
                        if Confirm('Do you want to reopen this document?') = true then begin
                            rec.Status := rec.Status::New;
                            Rec.Modify();
                            Message('Document Reopened successfully');
                            CurrPage.Close();
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
                        Appprovalsmt: Codeunit "Approvals Mgmt.";
                    begin
                        Appprovalsmt.OpenApprovalEntriesPage(rec.RecordId);
                    end;
                }
                action(Approve)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approve';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = rec.Status = Status::"Pending Approval";
                    ToolTip = 'Executes the Approve action.';

                    trigger OnAction()
                    var
                        myInt: Integer;
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        if Confirm('Do you want approve this document?') = true then
                            ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                        CurrPage.Close();

                    end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
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
                action("Release Vehicle")
                {
                    ApplicationArea = all;
                    Caption = 'Release Vehicle';
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    trigger OnAction()
                    var
                        myInt: Integer;
                        CompanyVeh: Record "Company Vehicles";
                        TransporAllo: Record "HR Transport Allocations H";
                        HrEmployee: Record "HR Employees";
                    begin
                        if Confirm('Do you want to release this allocations?') = true then begin
                            TransporAllo.Reset();
                            TransporAllo.SetRange("Transport Allocation No", rec."Transport Request No");
                            if TransporAllo.FindFirst() then begin
                                repeat
                                    CompanyVeh.Reset();
                                    CompanyVeh.SetRange("Registration No.", TransporAllo."Vehicle Reg Number");
                                    if CompanyVeh.FindFirst() then begin
                                        CompanyVeh.Allocated := false;
                                        CompanyVeh.Modify();
                                    end;
                                    HrEmployee.Reset();
                                    HrEmployee.SetRange("No.", TransporAllo."Assigned Driver");
                                    if HrEmployee.FindFirst() then begin
                                        HrEmployee."Vehicle Allocated" := false;
                                        HrEmployee.Modify();
                                    end;
                                until TransporAllo.Next() = 0;
                            end;
                            Rec.Status := Rec.Status::Released;
                            rec.Released := true;
                            rec.Modify();
                            Message('Vehicle released successfully');
                            CurrPage.Close();
                        end;
                    end;

                }
                action("Modify Allocated Days")
                {
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Image = Calculate;
                    trigger OnAction()
                    var
                        myInt: Integer;
                    begin
                        if Confirm('Do you want to mdify the allocated days?') = true then begin
                            "Add Days ?" := true;
                            EditValues := true;
                            Rec.Modify();
                        end;

                    end;

                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        UpdateControls();
    end;

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
        // SMTP: Codeunit "SMTP Mail";
        URL: Text[500];
        dAlloc: Decimal;
        dEarnd: Decimal;
        dTaken: Decimal;
        dLeft: Decimal;
        cReimbsd: Decimal;
        cPerDay: Decimal;
        cbf: Decimal;
        DaysAdded: Boolean;
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
        if "Add Days ?" = false then
            if (rec.Status = Rec.Status::Approved) or (rec.Status = Rec.Status::Released) then
                EditValues := false
            else
                EditValues := true;

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

    var
        EditValues: Boolean;
}
