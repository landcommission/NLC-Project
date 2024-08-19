#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194083 "HR Succession Planning"
{
    PageType = Card;
    SourceTable = "HR Succession Employee";
    ApplicationArea = All;
    Caption = 'HR Succession Planning';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Staff No."; Rec."Staff No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff No. field.';
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
                field("ID No."; Rec."ID No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID No. field.';
                }
                field("Date of Join"; Rec."Date of Join")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Join field.';
                }
                field("Date Marked"; Rec."Date Marked")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Marked field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Position to Succeed"; Rec."Position to Succeed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position to Succeed field.';
                }
                field("Succession Date"; Rec."Succession Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Succession Date field.';
                }
                field(Readiness; Rec.Readiness)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Readiness field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control15; "HR Succession Gaps")
            {
                Caption = 'Requirement Gaps';
                Visible = false;
            }
            part(Control16; "HR Training Application List")
            {
                Caption = 'Succession Training & Development Requirements';
            }
            part(Control17; "HR Succession Comments")
            {
                Caption = ' Succession Comments';
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
                Caption = '&Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the &Approvals action.';
                trigger OnAction()
                begin

                    DocumentType := DocumentType::SuccessionPlanning;
                    ApprovalEntries.Setfilters(Database::"HR Succession Employee", DocumentType, Rec."Staff No.");
                    ApprovalEntries.Run();
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = '&Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the &Send Approval Request action.';
                trigger OnAction()
                begin
                    //TESTFIELDS;

                    if Confirm('Send this Application for Approval?', true) = false then
                        exit;

                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    //ApprovalMgt.SendEmpConfirmationApprovalRequest(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = '&CancelApprovalRequest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the &CancelApprovalRequest action.';
                trigger OnAction()
                begin
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    //ApprovalMgt.CancelEmpConfirmationApprovalRequest(Rec,TRUE,TRUE);
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
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer,EmpConfirmation,SuccessionPlanning;
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
