#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194062 "HR Training Needs List"
{
    ApplicationArea = Basic;
    CardPageId = "HR Training Needs Card";
    DeleteAllowed = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Functions';
    SourceTable = "HR Training Needs";
    UsageCategory = Lists;
    Caption = 'HR Training Needs List';
    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
            {
                Editable = false;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Need Source"; Rec."Need Source")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Need Source field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Costs; Rec.Costs)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Costs field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1102755003; Outlook) { }
            systempart(Control1102755005; Notes) { }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("Training Needs")
            {
                Caption = 'Training Needs';
                action("&Card")
                {
                    ApplicationArea = Basic;
                    Caption = '&Card';
                    Image = Card;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = page "HR Training Needs List";
                    RunPageLink = Code = field(Code);
                    ToolTip = 'Executes the &Card action.';
                }
            }
        }
        area(Reporting)
        {
            action(Action1102755006)
            {
                ApplicationArea = Basic;
                Caption = 'Training Needs';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = report "HR Training Needs1";
                ToolTip = 'Executes the Training Needs action.';
            }
            group(Functions)
            {
                Caption = 'Functions';
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
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer,"Exit Requisition","Training Need";
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        DocumentType := DocumentType::"Training Need";
                        ApprovalEntries.Setfilters(Database::"HR Training Needs", DocumentType, Rec.Code);
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
                        if Confirm('Send Approval Request?', true) = false then
                            exit;
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        //AppMgmt.SendTrainingApprovalRequest(Rec);
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
                        //AppMgmt.CancelTrainingApprovalRequest(Rec,TRUE,TRUE);
                    end;
                }
            }
        }
    }

    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
    //AppMgmt: Codeunit "Export F/O Consolidation";
}
