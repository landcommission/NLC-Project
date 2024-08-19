#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194179 "HR Emp Details Change Request"
{
    Caption = 'HR Employee Details Change Request';
    PageType = List;
    SourceTable = prPayChange;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Request No."; Rec."Request No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Field To Change"; Rec."Field To Change")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Field To Change field.';
                }
                field("Old Detail"; Rec."Old Detail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Old Detail field.';
                }
                field("New Detail"; Rec."New Detail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Detail field.';
                }
                field("Reason For Change"; Rec."Reason For Change")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason For Change field.';
                }
                field("Previous Basic Pay"; Rec."Previous Basic Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Previous Basic Pay field.';
                }
                field("New Basic Pay"; Rec."New Basic Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Basic Pay field.';
                }
                field("Date Changed"; Rec."Date Changed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Changed field.';
                }
                field("Time Changed"; Rec."Time Changed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Changed field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(UserId; UserId)
                {
                    ApplicationArea = Basic;
                    Caption = 'UserID';
                    ToolTip = 'Specifies the value of the UserID field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Changed By"; Rec."Changed By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Changed By field.';
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
                    DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer;
                    ApprovalEntries: Page "Approval Entries";
                begin

                    DocumentType := DocumentType::"Job Approval";
                    ApprovalEntries.Setfilters(Database::prPayChange, DocumentType, Rec."Request No.");
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


                    if Confirm('Send this Change Request for Approval?', true) = false then
                        exit;
                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    //AppMgmt.SendEmpChangeDetailsApprovalReq(Rec);
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
                    // AppMgmt.CancelEmpChangeDetailsRequest(Rec,true,true);
                end;
            }
        }
    }

    var
        HREmployees: Record "HR Employees";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
    //AppMgmt: Codeunit "Export F/O Consolidation";
}
