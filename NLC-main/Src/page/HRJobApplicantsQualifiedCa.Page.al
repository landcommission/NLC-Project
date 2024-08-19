#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194131 "HR Job Applicants Qualified Ca"
{
    Caption = 'HR Job Applicants Qualified Card';
    DeleteAllowed = false;
    Description = 'HR Job Applicants Qualified Card';
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "HR Job Applications";
    PromotedActionCategories = 'New,Report,Process,Workflow Process';
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Job Application No."; Rec."Job Application No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Application No. field.';
                }
                field(Qualified; Rec.Qualified)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Style = AttentionAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Qualified field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the E-Mail field.';
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Age field.';
                }
                field("Date Applied"; Rec."Date Applied")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Applied field.';
                }
                field("Job Applied for Description"; Rec."Job Applied for Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Title';
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                label("Interview Details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Interview Details';
                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field("Date of Interview"; Rec."Date of Interview")
                {
                    ApplicationArea = Basic;
                    Style = StandardAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Date of Interview field.';
                }
                field("From Time"; Rec."From Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From Time field.';
                }
                field("To Time"; Rec."To Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To Time field.';
                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Venue field.';
                }
                field("Total Score After Interview"; Rec."Total Score After Interview")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Score After Interview field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
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
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin
                    rec.TestField("Approval Status", Rec."Approval Status"::New);
                    if Confirm('Send this Job Applicant for Approval?', true) = false then
                        exit;
                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    //AppMgmt.SendQualifiedAplicantApprovalReq(Rec);

                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Request';
                Image = CancelAllLines;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    rec.TestField("Approval Status", rec."Approval Status"::"Pending Approval");
                    if Confirm('Cancel Approval Request?', true) = false then
                        exit;
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    //AppMgmt.CancelEmpChangeDetailsRequest(Rec,TRUE,TRUE);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                var
                    ApprovalMG: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalMG.OpenApprovalEntriesPage(rec.RecordId);

                end;
            }
        }
    }

    var
        HRJobApplicants: Record "HR Job Applications";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
    //AppMgmt: Codeunit "Export F/O Consolidation";
}
