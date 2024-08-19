#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193608 "Clearance Certificate Card HR"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Clearance Certificate";
    PromotedActionCategories = 'New,Report,Process,Workflow Process';
    ApplicationArea = All;
    Caption = 'Clearance Certificate Card HR';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Clearance No."; Rec."Clearance No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Clearance No. field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
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
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("P/No"; Rec."P/No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the P/No field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field("USER ID"; Rec."USER ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the USER ID field.';
                }
                field("Date Of Leaving"; Rec."Date Of Leaving")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Leaving field.';
                }
                field("Reasons Of Leaving"; Rec."Reasons Of Leaving")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reasons Of Leaving field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            group(Finance)
            {
                field("Salary Advance"; Rec."Salary Advance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Advance field.';
                }
                field(Imprest; Rec.Imprest)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest field.';
                }
                field("Petty Cash"; Rec."Petty Cash")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Petty Cash field.';
                }
                field("Car Loan"; Rec."Car Loan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Car Loan field.';
                }
                field(Mortgage; Rec.Mortgage)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mortgage field.';
                }
                field("Working Tools"; Rec."Working Tools")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Working Tools field.';
                }
                field("Office & Desk Keys"; Rec."Office & Desk Keys")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Office & Desk Keys field.';
                }
                field("Car Keys"; Rec."Car Keys")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Car Keys field.';
                }
                field("Other Fin"; Rec."Other Fin")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Other Fin field.';
                }
                field("Comments Finance"; Rec."Comments Finance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments Finance field.';
                }
            }
            group("Human Resource")
            {
                field("NLC ID Card"; Rec."NLC ID Card")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NLC ID Card field.';
                }
                field("Medical Card"; Rec."Medical Card")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Medical Card field.';
                }
                field("Leave Balance"; Rec."Leave Balance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Balance field.';
                }
                field("Comments HR"; Rec."Comments HR")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments HR field.';
                }
            }
            group(ICT)
            {
                field("Specify HR"; Rec."Specify HR")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Specify HR field.';
                }
                field(Laptop; Rec.Laptop)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Laptop field.';
                }
                field("Ipad/Tablet"; Rec."Ipad/Tablet")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ipad/Tablet field.';
                }
                field("Mobile Phone"; Rec."Mobile Phone")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mobile Phone field.';
                }
                field("ICT & Security Clearance"; Rec."ICT & Security Clearance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT & Security Clearance field.';
                }
                field("Others ICT"; Rec."Others ICT")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Others ICT field.';
                }
            }
            group("Supply Chain Management")
            {
                field(Store; Rec.Store)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Store field.';
                }
                field("Other SCM"; Rec."Other SCM")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Other SCM field.';
                }
            }
            group(Communication)
            {
                field(Library; Rec.Library)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Library field.';
                }
                field("Other Comm"; Rec."Other Comm")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Other Comm field.';
                }
            }
            group("Land Administration")
            {
                field(LAdm; Rec.LAdm)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the LAdm field.';
                }
            }
            group(NLIMS1)
            {
                field(NLIMS; Rec.NLIMS)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NLIMS field.';
                }
                field("Comments NLIMS"; Rec."Comments NLIMS")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments NLIMS field.';
                }
            }
            group("Legal Affairs & Enforcement")
            {
                field(Legal; Rec.Legal)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Legal field.';
                }
                field("Comments LA"; Rec."Comments LA")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments LA field.';
                }
            }
            group("Research & Advocacy")
            {
                field("Research & Advocacy Comments"; Rec."Research & Advocacy")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research & Advocacy field.';
                }
            }
            group("Natural Resource1")
            {
                field("Natural Resource"; Rec."Natural Resource")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Natural Resource field.';
                }
            }
            group("Valuation & Taxation1")
            {
                field("Valuation & Taxation"; Rec."Valuation & Taxation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Valuation & Taxation field.';
                }
            }
            group("Survey Adjudication & Settleme")
            {
                field(Survey; Rec.Survey)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Survey field.';
                }
            }
            group("CLMB Coordination Office")
            {
                field(CLMB; Rec.CLMB)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CLMB field.';
                }
            }
            group("Audit & Risk Management")
            {
                field(Audit; Rec.Audit)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit field.';
                }
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
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &Approvals action.';
                    trigger OnAction()
                    var
                        ApprvalsMGt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprvalsMGt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = '&Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the &Send Approval Request action.';
                    trigger OnAction()
                    begin

                        //TESTFIELDS;
                        rec.TestField(Status, Status::New);

                        if Confirm('Send this Application for Approval?', true) = false then
                            exit;

                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        //ApprovalMgt.SendClearanceAppApprovalReq(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = '&Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = true;
                    ToolTip = 'Executes the &Cancel Approval Request action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Status::"Pending Approval");
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        //ApprovalMgt.CancelClearanceAppRequest(Rec,true,true);
                    end;
                }
            }
        }
    }

    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        ApprovalEntries: Page "Approval Entries";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,PV,"Petty Cash",Imp,Requisition,ImpSurr,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDetails,Qualified,Disc,Clear;
}
