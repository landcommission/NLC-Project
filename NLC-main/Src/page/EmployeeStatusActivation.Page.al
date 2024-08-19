#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194162 "Employee Status Activation"
{
    PageType = Card;
    SourceTable = "Payroll Changes";
    SourceTableView = where(Type = const("Staff Status"));
    ApplicationArea = All;
    Caption = 'Employee Status Activation';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Payroll Change No"; Rec."Payroll Change No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Change No field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Period Month"; Rec."Period Month")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Period Month field.';
                }
                field("Period Year"; Rec."Period Year")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Period Year field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Date Requested"; Rec."Date Requested")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Requested field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Status Updated"; Rec."Payroll Updated")
                {
                    ApplicationArea = Basic;
                    Caption = 'Status Updated';
                    ToolTip = 'Specifies the value of the Status Updated field.';
                }
            }
            part("Employee Status Activation Lines"; "Employee Status Active Lines")
            {
                Caption = 'Employee Status Activation Lines';
                SubPageLink = "Payroll Change No" = field("Payroll Change No");
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
                Caption = '&Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the &Approvals action.';
                trigger OnAction()
                begin
                    DocumentType := DocumentType::PC;
                    ApprovalEntries.SetRecordFilters(Database::"Payroll Changes", DocumentType, Rec."Payroll Change No");
                    ApprovalEntries.Run();
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = '&Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the &Send Approval Request action.';
                trigger OnAction()
                begin

                    if not LinesExists() then
                        Error('There are no Lines created for this Document');

                    if not AllFieldsEntered() then
                        Error('Some of the Key Fields on the Lines:[Employee No,Reason] Have not been Entered please RECHECK your entries');

                    if Rec.Status <> Rec.Status::New then
                        exit;

                    if Confirm('Send this Employee for Approval?', true) = false then
                        exit;
                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    //ApprovalMgt.SendEmpChangeAppApprovalReq(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = '&Cancel Approval Request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the &Cancel Approval Request action.';
                trigger OnAction()
                begin
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    // ApprovalMgt.CancelEmpChangeAppRequest(Rec,true,true);
                end;
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        Rec.Type := Rec.Type::"Staff Status"
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        Rec.Type := Rec.Type::"Staff Status"
    end;

    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        //DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",PV,"Petty Cash",Imp,Rn,ImpS,InterB,Receipt,Staff,"Staff Adv",AdvSurr,Bank,Grant,"Grant Surr",EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Salary Advance","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC;
        ApprovalEntries: Page "Approval Entries";
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        DocumentType: Enum "Approval Document Type";

    procedure LinesExists(): Boolean
    var
        PayLines: Record "Payroll Change Request Line";
    begin

        HasLines := false;
        PayLines.Reset();
        PayLines.SetRange(PayLines."Payroll Change No", Rec."Payroll Change No");
        if PayLines.Find('-') then begin
            HasLines := true;
            exit(HasLines);
        end;
    end;


    procedure AllFieldsEntered(): Boolean
    var
        PayLines: Record "Payroll Change Request Line";
    begin

        AllKeyFieldsEntered := true;
        PayLines.Reset();
        PayLines.SetRange(PayLines."Payroll Change No", Rec."Payroll Change No");
        if PayLines.Find('-') then begin
            repeat
                if (PayLines."Employee Code" = '') or (PayLines.Reason = '-') or (PayLines."Date Of Leaving" = 0D) then
                    AllKeyFieldsEntered := false;
            until PayLines.Next() = 0;
            exit(AllKeyFieldsEntered);
        end;
    end;
}
