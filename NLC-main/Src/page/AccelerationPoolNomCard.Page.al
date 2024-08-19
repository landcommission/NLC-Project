#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193767 "Acceleration Pool Nom. Card"
{
    PageType = Card;
    SourceTable = "Acceleration Pool Nomination";
    ApplicationArea = All;
    Caption = 'Acceleration Pool Nom. Card';
    PromotedActionCategories = 'New,Process,Report,Workflow Process';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Pool No."; Rec."Pool No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pool No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Nominee No."; Rec."Nominee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nominee No. field.';
                }
                field("Nominee Name"; Rec."Nominee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nominee Name field.';
                }
                field("Nominated By"; Rec."Nominated By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nominated By field.';
                }
                field("Nominated By Name"; Rec."Nominated By Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nominated By Name field.';
                }
                field("Incumbent No."; Rec."Incumbent No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incumbent No. field.';
                }
                field("Incumbent Name"; Rec."Incumbent Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incumbent Name field.';
                }
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Name field.';
                }
                field("Job to Succeed"; Rec."Job to Succeed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job to Succeed field.';
                }
                field("Job to Succeed Name"; Rec."Job to Succeed Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job to Succeed Name field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Criticality; Rec.Criticality)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Criticality field.';
                }
                field("Retirement Status"; Rec."Retirement Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retirement Status field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            group("Support of Commission Values")
            {
                Caption = 'Support of Commission Values';
                field("Behaves  Consistently"; Rec."Behaves  Consistently")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Behaves  Consistently field.';
                }
                field("Displays Respect"; Rec."Displays Respect")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Displays Respect field.';
                }
                field("Good Team Player"; Rec."Good Team Player")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Good Team Player field.';
                }
                field("Identifies Management"; Rec."Identifies Management")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Identifies Management field.';
                }
                field("Supports Commision Values"; Rec."Supports Commision Values")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supports Commision Values field.';
                }
            }
            group("Leadership Promises")
            {
                //Caption = 'Leadership Promises';
                field("Motivated to Lead"; Rec."Motivated to Lead")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Motivated to Lead field.';
                }
                field("Accepts Leadership"; Rec."Accepts Leadership")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accepts Leadership field.';
                }
                field("Mobilizes resources/People"; Rec."Mobilizes resources/People")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mobilizes resources/People field.';
                }
                field("Leads Team"; Rec."Leads Team")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leads Team field.';
                }
                field("Leadership Promise"; Rec."Leadership Promise")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leadership Promise field.';
                }
            }
            group("Interpersonal skills")
            {
                Caption = 'Interpersonal Skills';
                field(Communicates; Rec.Communicates)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Communicates field.';
                }
                field("Effective Presentations"; Rec."Effective Presentations")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Presentations field.';
                }
                field("Demonstrates diplomacy"; Rec."Demonstrates diplomacy")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Demonstrates diplomacy field.';
                }
                field("Trusted & Respected"; Rec."Trusted & Respected")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Trusted & Respected field.';
                }
                field("Interpersonal Skills1"; Rec."Interpersonal Skills")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interpersonal Skills field.';
                }
            }
            group("Demonstration of Result")
            {
                Caption = 'Demonstration of Result';
                field("Positive unit results"; Rec."Positive unit results")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Positive unit results field.';
                }
                field("Accomplishes Assignments"; Rec."Accomplishes Assignments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accomplishes Assignments field.';
                }
                field("Demonstration of Results"; Rec."Demonstration of Results")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Demonstration of Results field.';
                }
            }
            group("Developmental Orientations")
            {
                Caption = 'Developmental Orientation';
                field("Accurate self-Insight"; Rec."Accurate self-Insight")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accurate self-Insight field.';
                }
                field(Coachable; Rec.Coachable)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Coachable field.';
                }
                field("Learns from Experience"; Rec."Learns from Experience")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Learns from Experience field.';
                }
                field("Quick Learner"; Rec."Quick Learner")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quick Learner field.';
                }
                field(Initiative; Rec.Initiative)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Initiative field.';
                }
                field("Developmental Orientation"; Rec."Developmental Orientation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Developmental Orientation field.';
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
                PromotedCategory = Category4;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin
                    rec.TestField(Status, Status::New);
                    if Confirm('Send this Acceleration Pool Nomination  for Approval?', true) = false then
                        exit;
                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    //AppMgmt.SendPoolApprovalReq(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Request';
                Image = CancelAllLines;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    rec.TestField(Status, rec.Status::"Pending Approval");
                    if Confirm('Cancel Approval Request?', true) = false then
                        exit;
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    //AppMgmt.CancelPoolAppRequest(Rec,true,true);
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
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                var
                    approvmg: Codeunit "Approvals Mgmt.";
                begin
                    approvmg.OpenApprovalEntriesPage(rec.RecordId);

                end;
            }
        }
    }

    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
}
