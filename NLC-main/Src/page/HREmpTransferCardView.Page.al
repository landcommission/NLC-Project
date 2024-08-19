#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194165 "HR Emp Transfer Card View"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "HR Employee Transfer Header";
    ApplicationArea = All;
    Caption = 'HR Emp Transfer Card View';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Request No"; Rec."Request No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Request No field.';
                }
                field("Date Requested"; Rec."Date Requested")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Requested field.';
                }
                field("Date Approved"; Rec."Date Approved")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Approved field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                    Caption = 'Transfer Reason';
                    ToolTip = 'Specifies the value of the Transfer Reason field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Transfer details Updated"; Rec."Transfer details Updated")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Transfer details Updated field.';
                }
            }
            part(Control1000000021; "HR Employee Transfer Line")
            {
                Caption = 'Employee Transfer Lines';
                SubPageLink = "Request No" = field("Request No");
            }
            part(Control6; "HR New Employee Transfer Lines")
            {
                Caption = 'New Employee Transfer Lines';
                SubPageLink = "Request No" = field("Request No");
            }
            part(Control5; "Employee Transfer Allowance")
            {
                Caption = 'Employee Transfer Allowances';
                SubPageLink = "Request No" = field("Request No");
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Show")
            {
                Caption = '&Show';
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Comments';
                    Image = Comment;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Comments action.';
                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Store Requisition","Employee Requisition","Leave Application","Transport Requisition","Training Requisition","Job Approval","Induction Approval","Disciplinary Approvals","Activity Approval","Exit Approval","Medical Claim Approval",Jv,"BackToOffice ","Training Needs",EmpTransfer;
                    begin
                        DocumentType := DocumentType::EmpTransfer;

                        ApprovalComments.Setfilters(Database::"HR Employee Transfer Header", DocumentType, Rec."Request No");
                        ApprovalComments.SetUpLine(Database::"HR Employee Transfer Header", DocumentType, Rec."Request No");
                        ApprovalComments.Run();
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("&Approvals")
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the &Approvals action.';
                    trigger OnAction()
                    var
                        DocumentType: Enum "Approval Document Type";
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        DocumentType := DocumentType::EmpTrans;
                        ApprovalEntries.SetRecordFilters(Database::"HR Employee Transfer Header", DocumentType, Rec."Request No");
                        ApprovalEntries.Run();
                    end;
                }
                action("&Send Approval &Request")
                {
                    ApplicationArea = Basic;
                    Caption = '&Send Approval &Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;
                    ToolTip = 'Executes the &Send Approval &Request action.';
                    trigger OnAction()
                    begin

                        if not LinesExists() then
                            Error('There are no Lines created for this Document');

                        if not AllFieldsEntered() then
                            Error('Some of the Key Fields on the Lines:[Employee No,New Grade,New Job ID,New County,New Directorate,New Responsibility,From Payroll Period,Reason] Have not been Entered please RECHECK your entries');

                        if Rec.Status <> Rec.Status::New then
                            exit;

                        if Confirm('Send this Application for Approval?', true) = false then
                            exit;
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        //ApprovalMgt.SendEmpTranspprovalReq(Rec);
                    end;
                }
                action("&Cancel Approval request")
                {
                    ApplicationArea = Basic;
                    Caption = '&Cancel Approval request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;
                    ToolTip = 'Executes the &Cancel Approval request action.';
                    trigger OnAction()
                    begin

                        if Confirm('Are you sure you want to cancel the approval request', true) = false then
                            exit;
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        //ApprovalMgt.CancelEmpTransAppRequest(Rec,true,true)
                    end;
                }
                action("&Post")
                {
                    ApplicationArea = Basic;
                    Caption = '&Post';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = false;
                    Visible = false;
                    ToolTip = 'Executes the &Post action.';
                    trigger OnAction()
                    begin
                        Message('Post these changes?');
                    end;
                }
            }
        }
    }

    trigger OnDeleteRecord(): Boolean
    begin

        if Rec.Status <> Rec.Status::New then
            Error('You are not allowed to delete at this level')
    end;

    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        ApprovalComments: Page "Approval Comments";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,PV,"Petty Cash",Imp,Rn,ImpS,InterB,Receipt,Staff,"Staff Adv",AdvSurr,Bank,Grant,"Grant Surr",EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC;
        ApprovalEntries: Page "Approval Entries";
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;


    procedure LinesExists(): Boolean
    var
        PayLines: Record "HR Employee Transfer Lines";
    begin

        HasLines := false;
        PayLines.Reset();
        PayLines.SetRange(PayLines."Request No", Rec."Request No");
        if PayLines.Find('-') then begin
            HasLines := true;
            exit(HasLines);
        end;
    end;


    procedure AllFieldsEntered(): Boolean
    var
        PayLines: Record "HR Employee Transfer Lines";
    begin

        AllKeyFieldsEntered := true;
        PayLines.Reset();
        PayLines.SetRange(PayLines."Request No", Rec."Request No");
        if PayLines.Find('-') then begin
            repeat
                if (PayLines."Employee No" = '') or (PayLines."New Grade" = '') or (PayLines."New Designation" = '') or (PayLines."New Global Dimension 1 Code" = '')
                  or (PayLines."New Global Dimension 2 Code" = '') or (PayLines."New Responsibility Center" = '') or (PayLines."From payroll Period" = 0D) or (PayLines.Reason = '') then
                    AllKeyFieldsEntered := false;
            until PayLines.Next() = 0;
            exit(AllKeyFieldsEntered);
        end;
    end;
}
