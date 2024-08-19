#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193497 "Separation Card"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = Card;
    SourceTable = "Employee Separation Header";
    ApplicationArea = All;
    Caption = 'Separation Card';
    PromotedActionCategories = 'New,Report,Process,Workflow Process,Exit comments';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Editable = controlled;
                field("Separation No."; Rec."Separation No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Separation No. field.';
                }
                field("Staff Code"; Rec."Staff Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff No.';
                    ToolTip = 'Specifies the value of the Staff Code field.';
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Staff Name field.';
                }
                field("Job ID"; "Job ID")
                {
                    ApplicationArea = all;
                    Editable = false;
                    ToolTip = 'Specifies the value job id';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }
                field(Details; Rec.Details)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Details field.';
                }
                field("Date of Leaving"; Rec."Date of Leaving")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Leaving field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Override Exit Process"; "Override Exit Process")
                {
                    ApplicationArea = all;
                    ToolTip = 'specifies that the member status will be diactivated when the card is approved';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    // Visible = false;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Department Name"; "department Name")
                {
                    ApplicationArea = all;
                    Caption = 'Department Name';
                }
                field("HOD Comments"; Rec."HOD Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HOD Comments field.';
                }
                field("Director Comments"; Rec."Director Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Director Comments field.';
                }
                field("Reason for Separation"; Rec."Reason for Separation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason for Separation field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Cleared; Rec.Cleared)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cleared field.';
                }
            }
            part(Control23; "Employee Separation Lines")
            {
                Caption = 'Separation Lines';
                Enabled = true;
                SubPageLink = "Separation No." = field("Separation No.");
                Visible = false;
            }
        }
    }

    actions
    {
        area(Navigation)
        {

            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Enabled = not OpenApprovalEntriesExist;
                PromotedOnly = true;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin
                    rec.TestField(Status, rec.Status::New);
                    Rec.TestField("Date of Leaving");
                    rec.TestField("Reason for Separation");
                    if Confirm('Send this Separation  for Approval?', true) = false then
                        exit;
                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    //AppMgmt.SendSeparationApprovalReq(Rec);
                    CurrPage.Close();
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Request';
                Image = CancelAllLines;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Enabled = OpenApprovalEntriesExist;
                PromotedOnly = true;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    if Confirm('Cancel Approval Request?', true) = false then
                        exit;
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    CurrPage.Close();
                end;
            }
            action("Reject Approval")
            {
                Caption = 'Reject';
                Image = Reject;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    rec.Status := rec.Status::Rejected;
                    rec.Modify();
                    CurrPage.Close();
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
                        Message('Document Reopend successfully');
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
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                var
                    Approvalmgt: Codeunit "Approvals Mgmt.";
                begin
                    Approvalmgt.OpenApprovalEntriesPage(rec.RecordId);
                end;
            }
            action("Exit Comments")
            {
                ApplicationArea = Basic, Suite;
                Image = ViewComments;
                Caption = 'Exit Comments';
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page "Hr Appraisal Comments";
                RunPageLink = "Sal No." = field("Separation No.");
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        ControlPage();

    end;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        ControlPage();

    end;

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        ControlPage();
    end;

    local procedure ControlPage()
    var
        myInt: Integer;
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        if rec.Status <> rec.Status::New then
            controlled := false
        else
            controlled := true;
    end;

    var
        VarVariant: Variant;
        controlled: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        CustomApprovals: Codeunit "Approvals Mgt";
    //AppMgmt: Codeunit "Export F/O Consolidation";
}
