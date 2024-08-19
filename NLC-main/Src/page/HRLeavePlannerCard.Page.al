#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 52193482 "HR Leave Planner Card"
{
    PageType = Card;
    SourceTable = "HR Leave Planner Header";
    PromotedActionCategories = 'New,Process,Report, Workflow Process';
    ApplicationArea = All;

    Caption = 'HR Leave Planner Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Editable = ValueEditab;
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
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Re-Opened By"; Rec."Re-Opened By")
                {
                    ApplicationArea = all;
                    Editable = false;
                }

            }

            part(LeavePlannerLines; "Leave Planner Lines")
            {
                SubPageLink = "Application Code" = field("Application Code"), "Employee No" = field("Employee No");
                Caption = 'Leave Planner Details';
                Editable = ValueEditab;
            }
        }

    }



    actions
    {
        area(Navigation)
        {
            group("Workflow Process")
            {
                Caption = 'Workflow Process';


                action("&Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = '&Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    Enabled = rec.Status = rec.Status::New;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the &Send Approval Request action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::New);
                        if Confirm('Send this Leave schedule for Approval?', true) = false then
                            exit;
                        Rec."User ID" := UserId;
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                    end;
                }
                action("&Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = '&Cancel Approval Request';
                    Image = Cancel;
                    Enabled = rec.Status = rec.Status::"Pending Approval";
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the &Cancel Approval Request action.';
                    trigger OnAction()
                    var
                        WebhookMgt: Record "Webhook Subscription";
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
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
                            Rec."Re-Opened By" := UserId;
                            Rec.Modify();
                            Message('Document Reopend successfully');
                            CurrPage.Close();
                        end;

                    end;
                }
                action(Approve)
                {
                    ApplicationArea = Basic;
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Caption = 'Approve Document';
                    Visible = rec.Status = rec.Status::"Pending Approval";
                    PromotedOnly = true;
                    ToolTip = 'Executes the Approval of Document action.';
                    trigger OnAction()
                    var
                        myInt: Integer;
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        if Confirm('Do you want to approve this document?') = true then begin
                            ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                            CurrPage.Close();
                        end;
                    end;
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
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Visible = false;
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
        ValueEditab: Boolean;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Type := Rec.Type::Functional;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Functional;
    end;

    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        Statuscontrol();

    end;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        Statuscontrol();
    end;

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        Statuscontrol();

    end;

    local procedure Statuscontrol()
    var
        myInt: Integer;
    begin
        if rec.Status = rec.Status::New then
            ValueEditab := true
        else
            ValueEditab := false;

    end;

}

#pragma implicitwith restore
