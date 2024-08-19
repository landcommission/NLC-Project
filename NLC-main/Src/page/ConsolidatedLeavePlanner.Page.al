page 50030 "Consolidated Leave Planner"
{
    PageType = Card;
    SourceTable = "HR Leave Planner Header";
    ApplicationArea = All;
    Caption = 'HR Leave Planner Card';
    DeleteAllowed = false;
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
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field(Names; Rec.Names)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Names field.';
                }
                field("Job Tittle"; Rec."Job Tittle")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Tittle field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }



            }


            part(HRLeaveRelievers; "HR Leave Relievers")
            {
                SubPageLink = "Document No" = field("Application Code");
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
            }
            action("&Approvals")
            {
                ApplicationArea = Basic;
                Caption = '&Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the &Approvals action.';
                trigger OnAction()
                var
                    ApprovalsMgt: codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgt.OpenApprovalEntriesPage(Rec.Recordid);
                end;
            }
            action("&Send Approval Request")
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


                    if Confirm('Send this Leave schedule for Approval?', true) = false then
                        exit;
                    Rec."User ID" := UserId;
                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    //ApprovalMgt.SendLeavePlannerAppApprovalReq(Rec);
                end;
            }
            action("&Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Caption = '&Cancel Approval Request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the &Cancel Approval Request action.';
                trigger OnAction()
                begin
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    //ApprovalMgt.CancelLeavePlannerAppRequest(Rec,TRUE,TRUE);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = PrintForm;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Print action.';
            }
        }
    }

    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Store Requisition","Employee Requisition","Leave Application","Transport Requisition","Training Requisition","Job Approval","Induction Approval","Disciplinary Approvals","Activity Approval","Exit Approval","Medical Claim Approval",Jv,"BackToOffice ","Training Needs",EmpTransfer,LeavePlanner;
        ApprovalEntries: Page "Approval Entries";

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Type := Rec.Type::Consolidated;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Consolidated;
    end;
}

#pragma implicitwith restore


