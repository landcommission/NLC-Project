#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193479 "HR Leave Applications History"
{
    CardPageId = "HR Leave Application Card";
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Leave Application";
    SourceTableView = where(Status = const("Pending Approval"));
    ApplicationArea = All;
    Caption = 'HR Leave Applications History';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                Editable = false;
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Application No';
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Application No field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Job Tittle"; Rec."Job Tittle")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Tittle field.';
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Date field.';
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Leave Type field.';
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Days Applied field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Return Date field.';
                }
                field("Approved days"; Rec."Approved days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved days field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Style = StrongAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Reliever Name"; Rec."Reliever Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reliever Name field.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Control1102755006; "HR Leave Applicaitons Factbox")
            {
                SubPageLink = "No." = field("Employee No");
            }
            systempart(Control1102755004; Outlook) { }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("&Approvals")
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &Approvals action.';
                    trigger OnAction()
                    begin
                        DocumentType := DocumentType::"Leave Application";
                        ApprovalEntries.Setfilters(Database::"HR Leave Application", DocumentType, Rec."Application Code");
                        ApprovalEntries.Run();
                    end;
                }
                action("&Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = '&Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &Send Approval Request action.';
                    trigger OnAction()
                    begin

                        TESTFIELDS();
                        TestLeaveFamily();

                        if Confirm('Send this Application for Approval?', true) = false then
                            exit;
                        Rec.Selected := true;
                        Rec."User ID" := UserId;

                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        //ApprovalMgt.SendLeaveAppApprovalReq(Rec);
                    end;
                }
                action("&Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = '&Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &Cancel Approval Request action.';
                    trigger OnAction()
                    begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        //ApprovalMgt.CancelLeaveAppRequest(Rec,TRUE,TRUE);
                    end;
                }
                action("Re-Open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re-Open';
                    Image = ReopenCancelled;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Re-Open action.';
                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::New;
                        Rec.Modify();
                    end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print';
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Print action.';
                    trigger OnAction()
                    begin
                        HRLeaveApp.Reset();
                        HRLeaveApp.SetRange(HRLeaveApp."Application Code", Rec."Application Code");
                        if HRLeaveApp.Find('-') then
                            Report.Run(39003919, true, true, HRLeaveApp);
                    end;
                }
                action("Create Leave Ledger Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Leave Ledger Entries';
                    Image = CreateLinesFromJob;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the Create Leave Ledger Entries action.';
                    trigger OnAction()
                    begin
                        Rec.CreateLeaveLedgerEntries();
                        Rec.Reset();
                    end;
                }
            }
        }
        area(Reporting)
        {
            action("Leave Application")
            {
                ApplicationArea = Basic;
                Caption = 'Leave Application';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = report "PR E-Mail Individual Payslip";
                ToolTip = 'Executes the Leave Application action.';
            }
            action("Leave Reimbursements")
            {
                ApplicationArea = Basic;
                Caption = 'Leave Reimbursements';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                ToolTip = 'Executes the Leave Reimbursements action.';
                //RunObject = Report 39005601;
            }
            action("Leave Applications List")
            {
                ApplicationArea = Basic;
                Caption = 'Leave Applications List';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                ToolTip = 'Executes the Leave Applications List action.';
                //RunObject = Report 39005604;
            }
            action("Leave Statement")
            {
                ApplicationArea = Basic;
                Caption = 'Leave Statement';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = report "HR Leave Statement";
                ToolTip = 'Executes the Leave Statement action.';
            }
            action("&Post Leave Application")
            {
                ApplicationArea = Basic;
                Caption = '&Post Leave Application';
                Image = Post;
                ToolTip = 'Executes the &Post Leave Application action.';
                trigger OnAction()
                begin
                    if Rec.Status = Rec.Status::Posted then
                        Error('This Leave application has already been posted');
                    if Rec.Status <> Rec.Status::"Pending Approval" then
                        Error('The Leave Status must be Approved')
                    else
                        HRLeaveApp.Reset();
                    HRLeaveApp.SetRange(HRLeaveApp."Application Code", Rec."Application Code");
                    if HRLeaveApp.Find('-') then
                        HRLeaveApp.CreateLeaveLedgerEntries();
                    //Dave---To notify leave applicant

                    HREmp.Get(Rec."Employee No");
                    HREmp.TestField(HREmp."Company E-Mail");

                    //GET E-MAIL PARAMETERS FOR GENERAL E-MAILS
                    HREmailParameters.Reset();
                    HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."Associate With"::"Interview Invitations");
                    if HREmailParameters.Find('-') then begin


                        HREmp.TestField(HREmp."Company E-Mail");
                        EmailMessage.Create(HREmp."Company E-Mail",
                        HREmailParameters.Subject, 'Dear' + ' ' + HREmp."First Name" + ' ' +
                        HREmailParameters.Body + ' ' + Rec."Application Code" + ' ' + HREmailParameters."Body 2", true);
                        Email.Send(EmailMessage);


                        Message('Leave applicant has been notified successfully');
                    end;
                end;
            }
        }
    }


    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        ApprovalEntries: Page "Approval Entries";
        ApprovalComments: Page "Approval Comments";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application";
        HRLeaveApp: Record "HR Leave Application";
        HREmp: Record "HR Employees";
        EmpJobDesc: Text[50];
        HRJobs: Record "HR Jobs";
        SupervisorName: Text[60];
        //SMTP: Codeunit "SMTP Mail";
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
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
        HRLeaveLedgerEntries: Record "HR Leave Ledger Entries";
        EmpName: Text[70];
        [InDataSet]
        "Application CodeEditable": Boolean;
        [InDataSet]
        "Leave TypeEditable": Boolean;
        [InDataSet]
        "Days AppliedEditable": Boolean;
        [InDataSet]
        "Responsibility CenterEditable": Boolean;
        [InDataSet]
        "Start DateEditable": Boolean;
        [InDataSet]
        "Leave Allowance AmountEditable": Boolean;
        [InDataSet]
        RelieverEditable: Boolean;
        [InDataSet]
        RequestLeaveAllowanceEditable: Boolean;
        [InDataSet]
        SupervisorEditable: Boolean;
        [InDataSet]
        "Cell Phone NumberEditable": Boolean;
        [InDataSet]
        "Details of ExaminationEditable": Boolean;
        [InDataSet]
        "Date of ExamEditable": Boolean;
        [InDataSet]
        NumberofPreviousAttemptsEditab: Boolean;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        varDaysApplied: Integer;
        HRLeaveTypes: Record "HR Leave Types";
        BaseCalendarChange: Record "Base Calendar Change";
        ReturnDateLoop: Boolean;
        mSubject: Text[250];
        ApplicantsEmail: Text[30];
        LeaveGjline: Record "HR Leave Journal Line";
        "LineNo.": Integer;
        sDate: Record Date;
        Customized: Record "HR Calendar List";
        HREmailParameters: Record "HR E-Mail Parameters";
        HRLeavePeriods: Record "HR Leave Periods";
        HRJournalBatch: Record "HR Leave Journal Batch";
        Text19010232: Label 'Leave Statistics';
        Text1: Label 'Reliver Details';


    procedure TESTFIELDS()
    begin
        Rec.TestField(Rec."Leave Type");
        Rec.TestField(Rec."Days Applied");
        Rec.TestField(Rec."Start Date");
        Rec.TestField(Rec.Reliever);
        Rec.TestField(Rec.Supervisor);
    end;


    procedure TestLeaveFamily()
    var
        LeaveFamily: Record "HR Leave Family Groups";
        LeaveFamilyEmployees: Record "HR Leave Family Employees";
        Employees: Record "HR Employees";
    begin
        LeaveFamilyEmployees.SetRange(LeaveFamilyEmployees."Employee No", Rec."Employee No");
        if LeaveFamilyEmployees.FindSet() then //find the leave family employee is associated with
            repeat
                LeaveFamily.SetRange(LeaveFamily.Code, LeaveFamilyEmployees.Family);
                LeaveFamily.SetFilter(LeaveFamily."Max Employees On Leave", '>0');
                if LeaveFamily.FindSet() then //find the status other employees on the same leave family
                  begin
                    Employees.SetRange(Employees."No.", LeaveFamilyEmployees."Employee No");
                    Employees.SetRange(Employees."Leave Status", Employees."Leave Status"::" ");
                    if Employees.Count > LeaveFamily."Max Employees On Leave" then
                        Error('The Maximum number of employees on leave for this family has been exceeded, Contact th HR manager for more information');
                end
            until LeaveFamilyEmployees.Next() = 0;
    end;


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
            //HREmp.SETFILTER(HREmp."Leave Type Filter",LeaveType);
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


    procedure Updatecontrols()
    begin

        if Rec.Status = Rec.Status::New then begin
            "Application CodeEditable" := true;
            "Leave TypeEditable" := true;
            "Days AppliedEditable" := true;
            "Responsibility CenterEditable" := true;
            "Start DateEditable" := true;
            "Leave Allowance AmountEditable" := true;
            RelieverEditable := true;
            RequestLeaveAllowanceEditable := true;
            SupervisorEditable := true;
            "Cell Phone NumberEditable" := true;
            //CurrForm."E-mail Address".EDITABLE:=TRUE;
            "Details of ExaminationEditable" := true;
            "Date of ExamEditable" := true;
            NumberofPreviousAttemptsEditab := true;
        end else begin
            "Application CodeEditable" := false;
            "Leave TypeEditable" := false;
            "Days AppliedEditable" := false;
            "Responsibility CenterEditable" := false;
            "Start DateEditable" := false;
            "Leave Allowance AmountEditable" := false;
            RelieverEditable := false;
            RequestLeaveAllowanceEditable := false;
            SupervisorEditable := false;
            "Cell Phone NumberEditable" := false;
            //CurrForm."E-mail Address".EDITABLE:=FALSE;
            "Details of ExaminationEditable" := false;
            "Date of ExamEditable" := false;
            NumberofPreviousAttemptsEditab := false;
        end;
    end;


    procedure DetermineLeaveReturnDate(var fBeginDate: Date; var fDays: Decimal) fReturnDate: Date
    begin
        varDaysApplied := fDays;
        fReturnDate := fBeginDate;
        repeat
            if Rec.DetermineIfIncludesNonWorking(Rec."Leave Type") = false then begin
                fReturnDate := CalcDate('1D', fReturnDate);
                if Rec.DetermineIfIsNonWorking(fReturnDate) then
                    varDaysApplied := varDaysApplied + 1
                else
                    varDaysApplied := varDaysApplied;
                varDaysApplied := varDaysApplied - 1
            end
            else begin
                fReturnDate := CalcDate('1D', fReturnDate);
                varDaysApplied := varDaysApplied - 1;
            end;
        until varDaysApplied = 0;
        exit(fReturnDate);
    end;


    procedure DetermineIfIncludesNonWorking(var fLeaveCode: Code[10]): Boolean
    begin
        if HRLeaveTypes.Get(fLeaveCode) then
            if HRLeaveTypes."Inclusive of Non Working Days" = true then
                exit(true);
    end;


    procedure DetermineIfIsNonWorking(var bcDate: Date) Isnonworking: Boolean
    begin

        HRSetup.Find('-');
        HRSetup.TestField(HRSetup."Base Calendar");
        BaseCalendarChange.SetFilter(BaseCalendarChange."Base Calendar Code", HRSetup."Base Calendar");
        //BaseCalendarChange.SETRANGE(BaseCalendarChange.Date,bcDate);

        if BaseCalendarChange.Find('-') then begin
            if BaseCalendarChange.Nonworking = true then
                Error('Start date can only be a Working Day Date');
            exit(true);
        end;

        /*
        Customized.RESET;
        Customized.SETRANGE(Customized.Date,bcDate);
        IF Customized.FIND('-') THEN BEGIN
            IF Customized."Non Working" = TRUE THEN
            EXIT(TRUE)
            ELSE
            EXIT(FALSE);
        END;
         */

    end;


    procedure DeterminethisLeaveEndDate(var fDate: Date) fEndDate: Date
    begin
        ReturnDateLoop := true;
        fEndDate := fDate;
        if fEndDate <> 0D then begin
            fEndDate := CalcDate('-1D', fEndDate);
            while (ReturnDateLoop) do
                if Rec.DetermineIfIsNonWorking(fEndDate) then
                    fEndDate := CalcDate('-1D', fEndDate)
                else
                    ReturnDateLoop := false;
        end;
        exit(fEndDate);
    end;


    procedure CreateLeaveLedgerEntries()
    begin
        Rec.TestField(Rec."Approved days");
        HRSetup.Reset();
        if HRSetup.Find('-') then begin

            LeaveGjline.Reset();
            LeaveGjline.SetRange("Journal Template Name", HRSetup."Leave Template");
            LeaveGjline.SetRange("Journal Batch Name", HRSetup."Leave Batch");
            LeaveGjline.DeleteAll();
            //Dave
            //HRSetup.TESTFIELD(HRSetup."Leave Template");
            //HRSetup.TESTFIELD(HRSetup."Leave Batch");

            HREmp.Get(Rec."Employee No");
            HREmp.TestField(HREmp."Company E-Mail");

            //POPULATE JOURNAL LINES

            "LineNo." := 10000;
            LeaveGjline.Init();
            LeaveGjline."Journal Template Name" := HRSetup."Leave Template";
            LeaveGjline."Journal Batch Name" := HRSetup."Leave Batch";
            LeaveGjline."Line No." := "LineNo.";
            LeaveGjline."Leave Period" := '2013';
            LeaveGjline."Document No." := Rec."Application Code";
            LeaveGjline."Staff No." := Rec."Employee No";
            LeaveGjline.Validate(LeaveGjline."Staff No.");
            LeaveGjline."Posting Date" := Today;
            LeaveGjline."Leave Entry Type" := LeaveGjline."Leave Entry Type"::Negative;
            LeaveGjline."Leave Approval Date" := Today;
            LeaveGjline.Description := 'Leave Taken';
            LeaveGjline."Leave Type" := Rec."Leave Type";
            //------------------------------------------------------------
            //HRSetup.RESET;
            //HRSetup.FIND('-');
            HRSetup.TestField(HRSetup."Leave Posting Period[FROM]");
            HRSetup.TestField(HRSetup."Leave Posting Period[TO]");
            //------------------------------------------------------------
            LeaveGjline."Leave Period Start Date" := HRSetup."Leave Posting Period[FROM]";
            LeaveGjline."Leave Period End Date" := HRSetup."Leave Posting Period[TO]";
            LeaveGjline."No. of Days" := Rec."Approved days";
            if LeaveGjline."No. of Days" <> 0 then
                LeaveGjline.Insert(true);


            //Post Journal
            LeaveGjline.Reset();
            LeaveGjline.SetRange("Journal Template Name", HRSetup."Leave Template");
            LeaveGjline.SetRange("Journal Batch Name", HRSetup."Leave Batch");
            if LeaveGjline.Find('-') then;
            //Codeunit.Run(Codeunit::Codeunit39005560,LeaveGjline);
            Rec.Status := Rec.Status::Posted;
            Rec.Modify();

            /*END ELSE BEGIN
            ERROR('You must specify no of days');
            END;
            END;*/
            //NotifyApplicant;
        end;

    end;


    procedure NotifyApplicant()
    begin
        HREmp.Get(Rec."Employee No");
        HREmp.TestField(HREmp."Company E-Mail");

        //GET E-MAIL PARAMETERS FOR GENERAL E-MAILS
        HREmailParameters.Reset();
        HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."Associate With"::"Interview Invitations");
        if HREmailParameters.Find('-') then begin


            HREmp.TestField(HREmp."Company E-Mail");
            EmailMessage.Create(HREmp."Company E-Mail",
            HREmailParameters.Subject, 'Dear' + ' ' + HREmp."First Name" + ' ' +
            HREmailParameters.Body + ' ' + Rec."Application Code" + ' ' + HREmailParameters."Body 2", true);
            Email.Send(EmailMessage);


            Message('Leave applicant has been notified successfully');
        end;
    end;
}
