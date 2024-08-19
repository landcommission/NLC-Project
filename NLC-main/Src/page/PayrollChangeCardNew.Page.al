#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193789 "Payroll Change Card New"
{
    PageType = Card;
    SourceTable = "Payroll Change";
    ApplicationArea = All;
    Caption = 'Payroll Change Card New';
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
                field("Period Month"; Rec."Period Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Period Month field.';
                }
                field("Period Year"; Rec."Period Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Period Year field.';
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
                field("Date Requested"; Rec."Date Requested")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Requested field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Payroll Updated"; Rec."Payroll Updated")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Updated field.';
                }
            }
            part(Control11; "Payroll Change Request Lines")
            {
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
                PromotedCategory = Category4;
                ToolTip = 'Executes the &Approvals action.';
                trigger OnAction()
                begin
                    DocumentType := DocumentType::PC;
                    ApprovalEntries.Setfilters(Database::"Payroll Change", DocumentType, Rec."Payroll Change No");
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
                ToolTip = 'Executes the &Send Approval Request action.';
                trigger OnAction()
                begin

                    //TESTFIELDS;

                    if Rec.Status <> Rec.Status::New then
                        Error('This Document has already been sent for Approval');

                    if Confirm('Send this Employee for Approval?', true) = false then
                        exit;

                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    //ApprovalMgt.SendPayChangeAppApprovalReq(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = '&Cancel Approval Request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the &Cancel Approval Request action.';
                trigger OnAction()
                begin
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    //ApprovalMgt.CancelPayChangeAppRequest(Rec,TRUE,TRUE);
                end;
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        Rec.Type := Rec.Type::"New Staff"
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        Rec.Type := Rec.Type::"New Staff"
    end;

    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,PV,"Petty Cash",Imp,Rn,ImpS,InterB,Receipt,Staff,"Staff Adv",AdvSurr,Bank,Grant,"Grant Surr",EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Salary Advance","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC;
        ApprovalEntries: Page "Approval Entries";
}
