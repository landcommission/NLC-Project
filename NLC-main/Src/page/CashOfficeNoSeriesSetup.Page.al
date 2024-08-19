#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193735 "Cash Office No. Series Setup"
{
    Caption = 'Cash Office No. Series Setup';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = ListPlus;
    SourceTable = "Cash Office Setup";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                Caption = 'Numbering';
                InstructionalText = 'To fill the Document No. field automatically, you must set up a number series.';
                field("Normal Payments No"; Rec."Normal Payments No")
                {
                    ApplicationArea = Basic;
                    Visible = PVNosVisible;
                    ToolTip = 'Specifies the value of the Receipts No field.';
                }
                field("Petty Cash Payments No"; Rec."Petty Cash Payments No")
                {
                    ApplicationArea = Basic;
                    Visible = PCVNosVisible;
                    ToolTip = 'Specifies the value of the Petty Cash Payments No field.';
                }
                field("Receipts No"; Rec."Receipts No")
                {
                    ApplicationArea = Basic;
                    Visible = ReceiptNosVisible;
                    ToolTip = 'Specifies the value of the Receipts No field.';
                }
                field("Imprest Req No"; Rec."Imprest Req No")
                {
                    ApplicationArea = Basic;
                    Visible = ImprestNosVisible;
                    ToolTip = 'Specifies the value of the Receipts No field.';
                }
                field("Imprest Surrender No"; Rec."Imprest Surrender No")
                {
                    ApplicationArea = Basic;
                    Visible = ImprestSurrNosVisible;
                    ToolTip = 'Specifies the value of the Imprest Surrender No field.';
                }
                field("InterBank Transfer No."; Rec."InterBank Transfer No.")
                {
                    ApplicationArea = Basic;
                    Visible = InterbankNosVisible;
                    ToolTip = 'Specifies the value of the InterBank Transfer No. field.';
                }
                field("Staff Claim No."; Rec."Staff Claim No.")
                {
                    ApplicationArea = Basic;
                    Visible = StaffClaimNosVisible;
                    ToolTip = 'Specifies the value of the Staff Claim No field.';
                }
                field("Other Staff Advance No."; Rec."Other Staff Advance No.")
                {
                    ApplicationArea = Basic;
                    Visible = StaffAdvNosVisible;
                    ToolTip = 'Specifies the value of the Other Staff Advance No field.';
                }
                field("Staff Advance Surrender No."; Rec."Staff Advance Surrender No.")
                {
                    ApplicationArea = Basic;
                    Visible = StaffAdvSurrNosVisible;
                    ToolTip = 'Specifies the value of the Staff Adv. Surrender No field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Setup)
            {
                ApplicationArea = Basic;
                Caption = 'Sales & Receivables Setup';
                Image = Setup;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = page "Sales & Receivables Setup";
                ToolTip = 'Executes the Sales & Receivables Setup action.';
            }
        }
    }

    var
        PVNosVisible: Boolean;
        PCVNosVisible: Boolean;
        ReceiptNosVisible: Boolean;
        ImprestNosVisible: Boolean;
        ImprestSurrNosVisible: Boolean;
        StaffClaimNosVisible: Boolean;
        StaffAdvNosVisible: Boolean;
        StaffAdvSurrNosVisible: Boolean;
        InterbankNosVisible: Boolean;


    procedure SetFieldsVisibility(DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer)
    begin
        PVNosVisible := (DocType = DocType::"Payment Voucher");
        PCVNosVisible := (DocType = DocType::"Petty Cash");
        ReceiptNosVisible := (DocType = DocType::Receipt);
        ImprestNosVisible := (DocType = DocType::Imprest);
        ImprestSurrNosVisible := (DocType = DocType::ImprestSurrender);
        StaffClaimNosVisible := (DocType = DocType::"Staff Claim");
        StaffAdvNosVisible := (DocType = DocType::"Staff Advance");
        StaffAdvSurrNosVisible := (DocType = DocType::AdvanceSurrender);
        InterbankNosVisible := (DocType = DocType::Interbank);
    end;
}
