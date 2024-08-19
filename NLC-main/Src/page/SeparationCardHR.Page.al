#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193606 "Separation Card HR"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Employee Separation Header";
    ApplicationArea = All;
    Caption = 'Separation Card HR';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Separation No."; Rec."Separation No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Separation No. field.';
                }
                field("Staff Code"; Rec."Staff Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Code field.';
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Staff Name field.';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }
                field(Details; Rec.Details)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Details field.';
                }
                field("Date of Leaving"; Rec."Date of Leaving")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Leaving field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("HOD Comments"; Rec."HOD Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HOD Comments field.';
                }
                field("Director Comments"; Rec."Director Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Director Comments field.';
                }
                field("Reason for Separation"; Rec."Reason for Separation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason for Separation field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Cleared; Rec.Cleared)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cleared field.';
                }
            }
            part(Control23; "Employee Separation Lines")
            {
                Caption = 'Separation Lines';
                Enabled = true;
                SubPageLink = "Separation No." = field("Separation No.");
                Visible = false;
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
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                var
                    DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,Staff,"Staff Adv",AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep;
                    ApprovalEntries: Page "Approval Entries";
                begin

                    DocumentType := DocumentType::Sep;
                    ApprovalEntries.Setfilters(Database::"Employee Separation Header", DocumentType, Rec."Separation No.");
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
                Visible = false;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin

                    if Rec.Status <> Rec.Status::New then
                        Error('This Document has already been sent for Approval');

                    if Confirm('Send this Separation  for Approval?', true) = false then
                        exit;
                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    //AppMgmt.SendSeparationApprovalReq(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Request';
                Image = CancelAllLines;
                Promoted = true;
                PromotedCategory = Category4;
                Visible = false;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    if Confirm('Cancel Approval Request?', true) = false then
                        exit;
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    //AppMgmt.CancelSeparationAppRequest(Rec,true,true);
                end;
            }
        }
    }

    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
    //AppMgmt: Codeunit "Export F/O Consolidation";
}
