#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194086 "HR Appraissal Appeal"
{
    PageType = Card;
    SourceTable = "HR Appraissal Appeal";
    ApplicationArea = All;
    Caption = 'HR Appraissal Appeal';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Appraisser No."; Rec."Appraisser No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisser No. field.';
                }
                field("Appraiser Name"; Rec."Appraiser Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraiser Name field.';
                }
                field("Appraissal Period"; Rec."Appraissal Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraissal Period field.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Reason field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                begin
                    DocumentType := DocumentType::EmpPromotion;
                    ApprovalEntries.Setfilters(Database::"HR Promo. Recommend Header", DocumentType, Rec."No.");
                    ApprovalEntries.Run();
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin

                    if Confirm('Send this Recommendation for Approval?', true) = false then
                        exit;
                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    //ApprovalMgt.SendappealApprovalRequest(Rec);
                end;
            }
            action("Cancel approval")
            {
                ApplicationArea = Basic;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Cancel approval action.';
                trigger OnAction()
                begin
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    //ApprovalMgt.CancelAppealApprovalRequest(Rec,TRUE,TRUE);
                end;
            }
        }
    }

    var
        HREmp: Record "HR Employees";
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
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer,EmpConfirmation,EmpPromotion,Appraissalappeal;
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
}
