#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194092 "HR Employee confirmation"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Functions';
    SourceTable = "HR Employee Confirmation";
    ApplicationArea = All;
    Caption = 'HR Employee confirmation';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Employee Number"; Rec."Employee Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Number field.';
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
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }
                field("Probation Start Date"; Rec."Probation Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Probation Start Date field.';
                }
                field("Probation End Date"; Rec."Probation End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Probation End Date field.';
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
                    Editable = false;
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
            group("F&unctions")
            {
                Caption = 'F&unctions';
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
                        DocumentType := DocumentType::EmpConfirmation;
                        ApprovalEntries.Setfilters(Database::"HR Employee Confirmation", DocumentType, Rec.No);
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
                        //ApprovalMgt.SendEmpConfirmationApprovalReq(Rec);
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
                        //ApprovalMgt.CancelEmpConfirmationAppRequest(Rec,true,true);
                    end;
                }
                group("&Show")
                {
                    Caption = '&Show';
                    action("Confirmation documents")
                    {
                        ApplicationArea = Basic;
                        Caption = '&&Attachments';
                        ToolTip = 'Executes the &&Attachments action.';
                        trigger OnAction()
                        begin
                            Message('Do this');
                        end;
                    }
                    action("Confirmation Report")
                    {
                        ApplicationArea = Basic;
                        Image = "Report";
                        Promoted = true;
                        PromotedCategory = "Report";
                        PromotedIsBig = true;
                        ToolTip = 'Executes the Confirmation Report action.';
                        trigger OnAction()
                        begin
                            Message('Do this');
                        end;
                    }
                }
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
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer,EmpConfirmation;
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
