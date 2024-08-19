#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194087 "HR Professional bodies"
{
    ApplicationArea = Basic;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Functions,Professional';
    SourceTable = "HR Professional body Header";
    UsageCategory = Tasks;
    Caption = 'HR Professional bodies';
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
                field(UserID; Rec.UserID)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the UserID field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Shortcut Dimension code1"; Rec."Shortcut Dimension code1")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region';
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field("Shortcut Dimension code2"; Rec."Shortcut Dimension code2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department';
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Professional Body Applying"; Rec."Professional Body Applying")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Professional Body Applying field.';
                }
                field("Body relevant"; Rec."Body relevant")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Body relevant field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control12; "HR Professional Body Lines")
            {
                SubPageLink = No = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = '&Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the &Approvals action.';
                trigger OnAction()
                begin
                    DocumentType := DocumentType::EmpPromotion;
                    ApprovalEntries.Setfilters(Database::"HR Promo. Recommend Header", DocumentType, Rec."No.");
                    ApprovalEntries.Run();
                end;
            }
            action(SendRequestApproval)
            {
                ApplicationArea = Basic;
                Caption = '&Send Request Approval';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the &Send Request Approval action.';
                trigger OnAction()
                begin

                    if Confirm('Send this Request for Approval?', true) = false then
                        exit;

                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    //ApprovalMgt.SendProffessionalBodyApprovalReq(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = '&Cancel Approval Request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 's';

                trigger OnAction()
                begin
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    //ApprovalMgt.CancelProffessionalBodyAppRequest(Rec,true,true);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.UserID := Rec.UserID;
    end;

    var
        HREmp: Record "FA Budget Entry";
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
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer,EmpConfirmation,EmpPromotion;
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
