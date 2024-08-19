#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50145 "Disposal Plans Card View"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    SourceTable = "Disposal Plan Table Headers";

    layout
    {
        area(content)
        {
            group(Control21)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                    Caption = 'Document Date';
                }
                field("Disposal Year"; "Disposal Year")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Disposal Description"; "Disposal Description")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Date"; "Planned Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(Department; "Shortcut dimension 1 code")
                {
                    ApplicationArea = Basic;
                    Caption = 'County';
                }
                field(County; "Shortcut dimension 2 code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department';
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control18; "Disposal Plan Table Lines")
            {
                SubPageLink = "Ref. No." = field("No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Send For Approval")
            {
                ApplicationArea = Basic;
                Caption = 'Send For Approval';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    if Status <> Status::Open then exit;
                    if Confirm('Send this Application for Approval?', true) = false then exit;
                    // ApprovalMgt.SendPoolApprovalReq(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Request';
                Image = Reject;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    if Confirm('Cancel  Approval for this Application?', true) = false then exit;
                    //ApprovalMgt.CancelPoolAppRequest(Rec, true, true);
                end;
            }
            action(Action9)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                    DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender",JV,"Employee Requisition","Leave Application","Training Requisition","Transport Requisition","Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer,Contract,Project;
                begin
                    DocType := Doctype::Pool;
                    // ApprovalEntries.Setfilters(Database::Table50019, DocType, "No.");
                    ApprovalEntries.Run;
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Reset;
                    SetFilter("No.", "Ref No");
                    Report.Run(50010, true, true, Rec);
                    Reset;
                end;
            }
            group("Document Management")
            {
                Caption = 'Document Management';
                Description = 'Document Management';
                action("DMS Link")
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Documents';
                    Image = Web;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        if CompanyInfo.Get then begin
                            Link := CompanyInfo."Documents Attachment Link";
                            Hyperlink(Link);
                        end;
                    end;
                }
                action("View Attached Documents")
                {
                    ApplicationArea = Basic;
                    Caption = 'View Attached Documents';
                    Image = Web;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Sharepoint Information";
                    RunPageLink = "Primary Key" = field("No.");
                    RunPageMode = View;
                }
            }
        }
    }

    var
        ApprovalMgt: Codeunit 439;
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,"None",PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Staff Advance","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS;
        CompanyInfo: Record "Company Information";
        Link: Text;
}

