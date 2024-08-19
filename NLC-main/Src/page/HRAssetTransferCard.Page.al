#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194053 "HR Asset Transfer Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "HR Asset Transfer Header";
    SourceTableView = where(Status = filter(<> Approved));
    ApplicationArea = All;
    Caption = 'HR Asset Transfer Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = Edit;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = Edit;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control9; "HR Asset Transfer Lines")
            {
                Editable = Line;
                SubPageLink = "No." = field("No.");
            }
        }
        area(FactBoxes)
        {
            systempart(Control16; Links)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Cancel;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                begin


                    DocumentType := DocumentType::HrAssetTransfer;

                    ApprovalEntries.Setfilters(Database::"HR Asset Transfer Header", DocumentType, Rec."No.");
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
                PromotedIsBig = true;
                ToolTip = 'Executes the Send Approval Request action.';

            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Cancel Approval Request action.';

            }
            action("Print Review")
            {
                ApplicationArea = Basic;
                Caption = 'Print Review';
                ToolTip = 'Executes the Print Review action.';
                trigger OnAction()
                begin

                    RecHeader.Reset();
                    RecHeader.SetFilter(RecHeader."No.", xRec."No.");
                    Report.Run(39004371, true, true, RecHeader);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        Updatecontrol();
    end;

    trigger OnAfterGetRecord()
    begin
        Updatecontrol();
    end;

    trigger OnInit()
    begin
        Edit := true;
        Line := true;
    end;

    var
        RecHeader: Record "HR Asset Transfer Header";
        ApprovalEntries: Page "Approval Entries";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over",EmpTransfer,LeavePlanner,HrAssetTransfer;
        Edit: Boolean;
        Line: Boolean;


    procedure Updatecontrol()
    begin
        /*
        IF Status=Status::Open THEN BEGIN
        Edit:=TRUE;
        Line:=TRUE;
        END ELSE IF Status=Status::"Pending Approval" THEN BEGIN
        Edit:=FALSE;
        Line:=FALSE;
        END ELSE IF Status=Status::Approved THEN BEGIN
        Edit:=FALSE;
        Line:=FALSE;
        END
         */

    end;
}
