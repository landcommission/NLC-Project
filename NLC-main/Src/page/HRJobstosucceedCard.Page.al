#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194147 "HR Jobs to succeed Card"
{
    PageType = Card;
    SourceTable = "HR Jobs to Succeed";
    ApplicationArea = All;
    Caption = 'HR Jobs to succeed Card';
    PromotedActionCategories = 'New,Process,Report,Workflow Process';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Title';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department';
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(Availability; Rec.Availability)
                {
                    ApplicationArea = Basic;
                    Caption = 'Availability For Succession';
                    ToolTip = 'Specifies the value of the Availability For Succession field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    Caption = 'Comment On Availability';
                    ToolTip = 'Specifies the value of the Comment On Availability field.';
                }
                field("Incumbent No"; Rec."Incumbent No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Incumbent Staff No';
                    ToolTip = 'Specifies the value of the Incumbent Staff No field.';
                }
                field("Incumbent Name"; Rec."Incumbent Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incumbent Name field.';
                }
                field("Retirement Date"; Rec."Retirement Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Incumbent Retirement Date';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Incumbent Retirement Date field.';
                }
                field("Retirement Status"; Rec."Retirement Status")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Retirement Status field.';
                }
                field(Criticality; Rec.Criticality)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Criticality field.';
                }
                field("Number of Staff ready"; Rec."Number of Staff ready")
                {
                    ApplicationArea = Basic;
                    Caption = 'Number of Staff Qualified To Succeed';
                    ToolTip = 'Specifies the value of the Number of Staff Qualified To Succeed field.';
                }
                field("No of Posts"; Rec."No of Posts")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No of Posts field.';
                }
                field("Position Reporting to"; Rec."Position Reporting to")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Position Reporting to field.';
                }
                field("Occupied Position"; Rec."Occupied Position")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Occupied Position field.';
                }
                field("Vacant Positions"; Rec."Vacant Positions")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Vacant Positions field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
        area(Creation)
        {

            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                Enabled = Not OpenApprovalEntriesExist;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin
                    //TESTFIELDS;

                    if Confirm('Send this Application for Approval?', true) = false then
                        exit;

                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    //ApprovalMgt.SendJobsToSucceedApprovalReq(Rec);
                end;
            }
            action("Cancel Approvals")
            {
                ApplicationArea = Basic;
                Image = Cancel;
                Promoted = true;
                Enabled = OpenApprovalEntriesExist;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Cancel Approvals action.';
                trigger OnAction()
                begin
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    //ApprovalMgt.CancelJobsTosucceedApprovalReq(Rec,true,true);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                var
                    ApprovMgt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovMgt.OpenApprovalEntriesPage(rec.RecordId);

                end;
            }
            action(Attachment)
            {
                ApplicationArea = Basic;
                Caption = 'Attachment';
                Image = Attach;
                Promoted = true;
                ToolTip = 'Executes the Attachment action.';
                trigger OnAction()
                begin
                    DMSInt.Reset();
                    DMSInt.SetRange(DMSInt."DMS Link Type", DMSInt."DMS Link Type"::succeed);
                    if DMSInt.Find('-') then
                        Hyperlink(DMSInt."DMS Link Path" + Rec."Job ID");
                end;
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        Controlpage();

    end;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        Controlpage();

    end;

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        Controlpage();

    end;

    local procedure Controlpage()
    var
        myInt: Integer;
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);

    end;

    var
        HREmp: Record "HR Employees";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
        EmpJobDesc: Text[50];
        HRJobs: Record "HR Jobs";
        SupervisorName: Text[60];
        //SMTP: Codeunit "SMTP Mail";
        URL: Text[500];
        HRSetup: Record "HR Setup";
        EmpDept: Text[30];
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc;
        ApprovalEntries: Page "Approval Entries";
        HRLeaveLedgerEntries: Record "HR Leave Ledger Entries";
        EmpName: Text[70];
        ApprovalComments: Page "Approval Comments";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        varDaysApplied: Integer;
        ReturnDateLoop: Boolean;
        mSubject: Text[250];
        ApplicantsEmail: Text[30];
        "LineNo.": Integer;
        sDate: Record Date;
        Customized: Record "HR Calendar";
        HREmailParameters: Record "HR E-Mail Parameters";
        HRJournalBatch: Record "HR Leave Journal Batch";
        DMSInt: Record DMS;
}
