#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194145 "HR Employee Separation"
{
    ApplicationArea = Basic;
    SourceTable = "HR Employee Separation";
    UsageCategory = Lists;
    Caption = 'HR Employee Separation';
    layout
    {
        area(Content)
        {
            field("Separation No."; Rec."Separation No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Separation No. field.';
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
            field(Department; Rec.Department)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Department field.';
            }
            field("Job Title"; Rec."Job Title")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Job Title field.';
            }
            field("Nature of Separation"; Rec."Nature of Separation")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Nature of Separation field.';
            }
            field("Reason for Separation"; Rec."Reason for Separation")
            {
                ApplicationArea = Basic;
                MultiLine = true;
                ToolTip = 'Specifies the value of the Reason for Separation field.';
            }
            field("Separation Date"; Rec."Separation Date")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Separation Date field.';
            }
            field("Reason for Retirement"; Rec."Reason for Retirement")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Reason for Retirement field.';
            }
            field(Illness; Rec.Illness)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Illness field.';
            }
            field(Justification; Rec.Justification)
            {
                ApplicationArea = Basic;
                MultiLine = true;
                ToolTip = 'Specifies the value of the Justification field.';
            }
            field(Status; Rec.Status)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Status field.';
            }
            field("End of contract Date"; Rec."End of contract Date")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the End of contract Date field.';
            }
            part(SF; "Misc. Articles")
            {
                Caption = 'Misc Articles';
                SubPageLink = Code = field("Employee No.");
            }
        }
        area(FactBoxes)
        {
            systempart(Control17; Outlook) { }
            systempart(Control16; Notes) { }
        }
    }

    actions
    {
        area(Creation)
        {
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                var
                    DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher",PettyCash,Imprest,Requisition,ImpSurrender,Interbank,Receipt,StaffClaim,"Staff Adv",AdvSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDetails,Disc,Separation;
                    ApprovalEntries: Page "Approval Entries";
                begin
                    DocumentType := DocumentType::Separation;
                    ApprovalEntries.Setfilters(Database::"HR Employee Separation", DocumentType, Rec."Separation No.");
                    ApprovalEntries.Run();
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin
                    /*TESTFIELD("No of Posts");
                    TESTFIELD("Responsibility Center");

                    CALCFIELDS("No. of Requirements");
                    IF "No. of Requirements" = 0 THEN  ERROR('Please Specify the Job Requirements');
                     CALCFIELDS("No. of Responsibilities");

                    IF "No. of Responsibilities" = 0 THEN ERROR('Please Specify the Job Responsibilities');
                      */
                    if Confirm('Send this Document for Approval?', true) = false then
                        exit;
                    //   AppMgmt.SendQualifiedAplicantApprovalReq(Rec);

                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Request';
                Image = CancelAllLines;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    if Confirm('Cancel Approval Request?', true) = false then
                        exit;
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    //AppMgmt.CancelEmpChangeDetailsRequest(Rec,TRUE,TRUE);
                end;
            }
        }
    }

    var
        HREmployees: Record "HR Employees";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
    //AppMgmt: Codeunit "Export F/O Consolidation";
}
