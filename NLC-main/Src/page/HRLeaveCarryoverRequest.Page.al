#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193463 "HR Leave Carryover Request"
{
    PageType = Card;
    SourceTable = "HR Leave Carry Allocation";
    ApplicationArea = All;
    Caption = 'HR Leave Carryover Request';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Code field.';
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Applicant Comments"; Rec."Applicant Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applicant Comments field.';
                }
                field(Names; Rec.Names)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Names field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Job Tittle"; Rec."Job Tittle")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Tittle field.';
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
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Approved days"; Rec."Approved days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved days field.';
                }
                field(Attachments; Rec.Attachments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attachments field.';
                }
            }
        }
    }

    actions
    {
        area(Creation)
        {
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
                    DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition",Job;
                    ApprovalEntries: Page "Approval Entries";
                begin
                    DocumentType := DocumentType::Job;
                    ApprovalEntries.Setfilters(Database::"Master Record Creation Header", DocumentType, Rec."Application Code");
                    ApprovalEntries.Run();
                end;
            }
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


                    if Confirm('Send this Carry over request for Approval?', true) = false then
                        exit;
                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    //AppMgmt.SendLeaveCarryoverApprovalReq(Rec);
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
                    if Confirm('Cancel Approval Request?', true) = false then
                        exit;
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    //AppMgmt.CancelLeaveCarryoverAreasRequest(Rec,TRUE,TRUE);
                end;
            }
        }
    }

    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
    //AppMgmt: Codeunit "Export F/O Consolidation";
}
