#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194049 "HR Emp Transfer Card"
{
    PageType = Card;
    SourceTable = "HR Employee Transfer Header";
    PromotedActionCategories = 'New,Process,Report,Workflow Process,Print,Update Transfer,Comments';
    ApplicationArea = All;
    Caption = 'HR Emp Transfer Card';
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
                    Visible = false;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Captured By"; "Captured By")
                {
                    ApplicationArea = all;
                    Editable = false;
                    ToolTip = 'specifies the userid captured the infomation';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                    Caption = 'Transfer Reason';
                    Visible = false;
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
                Visible = false;
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

            group("Workflow Process")
            {
                Caption = 'Workflow Process';

                action("&Send Approval &Request")
                {
                    ApplicationArea = Basic;
                    Caption = '&Send Approval &Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    Enabled = NOT OpenApprovalEntriesExist;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the &Send Approval &Request action.';
                    trigger OnAction()
                    var
                        Reasonav: Boolean;
                        Translines: Record "HR Employee Transfer Lines";
                        Transliness: Record "HR Employee Transfer Lines";
                    begin
                        Rec.TestField(Status, Status::New);
                        Reasonav := false;
                        if not LinesExists() then
                            Error('There are no Lines created for this Document');
                        Translines.Reset();
                        Translines.SetRange(Translines."Request No", Rec."Request No");
                        if Translines.Find('-') then begin
                            repeat
                                Reasonav := false;
                                Transliness.Reset();
                                Transliness.SetRange("Request No", Translines."Request No");
                                Transliness.SetRange("Employee No", Translines."Employee No");
                                if Transliness.FindFirst() then
                                    if (Transliness.Reason <> '') and (Translines."From payroll Period" <> 0D) then
                                        Reasonav := true;
                                if Reasonav = false then
                                    Error('every line should have a reason and payperiod must have a value');
                            until Translines.Next() = 0;
                        end;
                        if Confirm('Send this Application for Approval?', true) = false then
                            exit;
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        //ApprovalMgt.SendEmpTranspprovalReq(Rec);
                        CurrPage.Close();
                    end;
                }
                action("&Cancel Approval request")
                {
                    ApplicationArea = Basic;
                    Caption = '&Cancel Approval request';
                    Image = Cancel;
                    Promoted = true;
                    Enabled = OpenApprovalEntriesExist;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &Cancel Approval request action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Status::"Pending Approval");
                        if Confirm('Are you sure you want to cancel the approval request', true) = false then
                            exit;
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        //ApprovalMgt.CancelEmpTransAppRequest(Rec,true,true)
                        CurrPage.Close();
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
                            rec.Status := rec.Status::new;
                            Rec.Modify();
                            Message('Document Reopend successfully');
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
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &Approvals action.';
                    trigger OnAction()
                    var
                        DocumentType: Enum "Approval Document Type";
                        ApprovalEntries: Page "Approval Entries";
                        approvalMGT: Codeunit "Approvals Mgmt.";
                    begin
                        approvalMGT.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
            group("&Show")
            {
                Caption = '';
                action("Appraisal Comments")
                {
                    ApplicationArea = Basic, Suite;
                    Image = ViewComments;
                    Caption = 'Comments';
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    RunObject = Page "Hr Appraisal Comments";
                    RunPageLink = "Sal No." = field("Request No");
                }
            }
            group("Update Changes")
            {
                action("&Post")
                {
                    ApplicationArea = Basic;
                    Caption = '&Post';
                    Image = Post;
                    Promoted = true;
                    Visible = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = false;
                    ToolTip = 'Executes the &Post action.';
                    trigger OnAction()
                    var
                        HRRec: Record "HR Employees";
                        TransferLines: Record "HR Employee Transfer Lines";
                        PRSalary: Record "PR Employee Transactions";
                    begin
                        Rec.TestField(Status, Status::Approved);
                        Rec.TestField("Transfer details Updated", false);
                        if Confirm('Do you want to update the member details?') then begin
                            TransferLines.Reset();
                            TransferLines.SetRange("Request No", rec."Request No");
                            if TransferLines.FindFirst() then begin
                                repeat
                                    HRRec.Reset();
                                    HRRec.SetRange("No.", TransferLines."Employee No");
                                    if HRRec.FindFirst() then begin
                                        HRRec.Grade := TransferLines."Current Grade";
                                        HRRec."Job ID" := TransferLines."New Designation";
                                        HRRec.Validate("Job ID");
                                        // HRRec."Job Title" := TransferLines."New Job ID Name";
                                        HRRec."Current Duty Station" := TransferLines."New Global Dimension 1 Code";
                                        HRRec.County := TransferLines."New Global Dimension 1 Code";
                                        HRRec."Global Dimension 1 Code" := TransferLines."New Global Dimension 2 Code";
                                        HRRec."Responsibility Center" := TransferLines."New Responsibility Center";
                                        HRRec."Department Name" := TransferLines."New Department Name";
                                        HRRec."County Name" := TransferLines."New Region Name";
                                        HRRec."Salary Grade" := TransferLines."New Grade";
                                        HRRec."Last Date Modified" := Today;
                                        PRSalary.Reset();
                                        PRSalary.SetRange(PRSalary."Employee Code", TransferLines."Employee No");
                                        PRSalary.SetRange(PRSalary."Transaction Code", TransferLines."Transaction Code");
                                        if not PRSalary.Find('-') then begin
                                            PRSalary.Init();
                                            PRSalary."Employee Code" := TransferLines."Employee No";
                                            PRSalary."Payroll Period" := TransferLines."From payroll Period";
                                            PRSalary."Transaction Code" := TransferLines."Transaction Code";
                                            PRSalary."Transaction Name" := TransferLines."Transaction Name";
                                            PRSalary.Amount := TransferLines.Amount;
                                            PRSalary."Period Month" := TransferLines."Period Month";
                                            PRSalary."Period Year" := TransferLines."Period Year";
                                            PRSalary.Insert();
                                        end else begin
                                            PRSalary."Employee Code" := TransferLines."Employee No";
                                            PRSalary."Payroll Period" := TransferLines."From payroll Period";
                                            PRSalary."Transaction Code" := TransferLines."Transaction Code";
                                            PRSalary."Transaction Name" := TransferLines."Transaction Name";
                                            PRSalary.Amount := TransferLines.Amount;
                                            PRSalary."Period Month" := TransferLines."Period Month";
                                            PRSalary."Period Year" := TransferLines."Period Year";
                                            PRSalary.Modify();
                                        end;
                                        HRRec.Modify();
                                    end;
                                until HRRec.Next() = 0;
                            end;
                        end;
                        Rec."Transfer details Updated" := true;
                        rec.Modify();

                        Message('Employee details Updated successfully');
                        CurrPage.Close();
                    end;
                }
            }

        }
    }
    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        SetAppearance();

    end;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        SetAppearance();

    end;

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        SetAppearance();

    end;

    trigger OnDeleteRecord(): Boolean
    begin

        if Rec.Status <> Rec.Status::New then
            Error('You are not allowed to delete at this level')
    end;

    local procedure SetAppearance()
    var
        myInt: Integer;
    begin
        if Rec.Status = Status::New then
            CurrPage.Editable := true
        else
            CurrPage.Editable := false;
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);

    end;

    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        ApprovalComments: Page "Approval Comments";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,PV,"Petty Cash",Imp,Rn,ImpS,InterB,Receipt,Staff,"Staff Adv",AdvSurr,Bank,Grant,"Grant Surr",EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC;
        ApprovalEntries: Page "Approval Entries";
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;


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
