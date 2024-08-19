#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193944 "Inspection Header"
{
    PageType = Card;
    SourceTable = "Inspection Header";
    ApplicationArea = All;
    Caption = 'Inspection Header';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Purchase Order No."; Rec."Purchase Order No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Order No. field.';
                }
                field("Supplier No."; Rec."Supplier No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supplier No. field.';
                }
                field("Supplier Name"; Rec."Supplier Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supplier Name field.';
                }
                field("Date Received"; Rec."Date Received")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Received field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Time In"; Rec."Time In")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time In field.';
                }
                field("Time Out."; Rec."Time Out.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Out. field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            group(Lines)
            {
                part(Control12; "Inspection Lines")
                {
                    SubPageLink = "Document No." = field("No.");
                }
            }
        }
    }

    actions
    {
        area(Creation)
        {
            separator(Action14) { }
        }
        area(Processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    InspectionHeader.Reset();
                    InspectionHeader.SetRange(InspectionHeader."No.", Rec."No.");
                    Report.Run(39003912, true, false, InspectionHeader);
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    Post(Codeunit::"Purch.-Post (Yes/No)");
                end;
            }
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
                    DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection;
                    ApprovalEntries: Page "Approval Entries";
                begin
                    DocumentType := DocumentType::Inspection;
                    ApprovalEntries.Setfilters(Database::"Inspection Header", DocumentType, Rec."No.");
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
                    if Confirm('Send this inspection for Approval?', true) = false then
                        exit;

                    //TESTFIELDS;
                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    //AppMgmt.SendjobpprovalReq(Rec);
                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    //AppMgmt.SendInspectionApprovalReq(Rec);
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
                    if Confirm('Cancel inspection Approval Request?', true) = false then
                        exit;
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    //AppMgmt.CancelInspectionRequest(Rec,true,true);
                end;
            }
        }
    }

    var
        InspectionHeader: Record "Inspection Header";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
    //AppMgmt: Codeunit "Export F/O Consolidation";

    local procedure Post(PostingCodeunitID: Integer)
    begin
        CurrPage.Update(false);
    end;
}
