#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194033 "Hr Back To Office Formss"
{
    PageType = Card;
    SourceTable = "HRBack To Office Form";
    ApplicationArea = All;
    Caption = 'Hr Back To Office Formss';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Title field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From Date field.';
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To Date field.';
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location field.';
                }
                field(Provider; Rec.Provider)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Provider field.';
                }
                field("Provider Name"; Rec."Provider Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Provider Name field.';
                }
                field("Purpose of Training"; Rec."Purpose of Training")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purpose of Training field.';
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
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    Caption = 'County';
                    ToolTip = 'Specifies the value of the County field.';
                }
                field("Directorate Name"; Rec."Directorate Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'County Name';
                    Visible = true;
                    ToolTip = 'Specifies the value of the County Name field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field(Station; Rec.Station)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Station field.';
                }
                field("Station Name"; Rec."Station Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Station Name field.';
                }
                field("Text 1"; Rec."Text 1")
                {
                    ApplicationArea = Basic;
                    Caption = '1.Please state how the course has benefited you and the organization';
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the 1.Please state how the course has benefited you and the organization field.';
                }
                field("Text 2"; Rec."Text 2")
                {
                    ApplicationArea = Basic;
                    Caption = '2.Which specific areas do you think need improvement in your area of operation?';
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the 2.Which specific areas do you think need improvement in your area of operation? field.';
                }
                field("Text 3"; Rec."Text 3")
                {
                    ApplicationArea = Basic;
                    Caption = '3.How will you use the skills acquired to address the problem?';
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the 3.How will you use the skills acquired to address the problem? field.';
                }
                field("Text 4"; Rec."Text 4")
                {
                    ApplicationArea = Basic;
                    Caption = '4.Provide timeline within which you will cascade the skills learned to others in your Department/organization';
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the 4.Provide timeline within which you will cascade the skills learned to others in your Department/organization field.';
                }
                field("Text 5"; Rec."Text 5")
                {
                    ApplicationArea = Basic;
                    Caption = '5.What skills did you acquire from the training attended.';
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the 5.What skills did you acquire from the training attended. field.';
                }
                field("Text 6"; Rec."Text 6")
                {
                    ApplicationArea = Basic;
                    Caption = '6.Target Group that can benefit from the skills acquired';
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the 6.Target Group that can benefit from the skills acquired field.';
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
                label(Control1)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Show")
            {
                Caption = '&Show';
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Comments';
                    Image = Comment;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Executes the Comments action.';

                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action(Approve)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approve';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Approve action.';
                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::Approved;
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Basic;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Reject action.';
                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::"Rejected.";
                    end;
                }
                action("&Approvals")
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Enabled = false;
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the &Approvals action.';
                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Store Requisition","Employee Requisition","Leave Application","Transport Requisition","Training Requisition","Job Approval","Induction Approval","Disciplinary Approvals","Activity Approval","Exit Approval","Medical Claim Approval",Jv,BackToOffice;
                        ApprovalEntries: Page "Approval Entries";
                    begin

                        DocumentType := DocumentType::BackToOffice;
                        ApprovalEntries.Setfilters(Database::"HRBack To Office Form", DocumentType, Rec."Document No");
                        ApprovalEntries.Run();
                    end;
                }
                action("&Send Approval &Request")
                {
                    ApplicationArea = Basic;
                    Caption = '&Send Approval &Request';
                    Enabled = true;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = true;
                    ToolTip = 'Executes the &Send Approval &Request action.';
                    trigger OnAction()
                    begin

                        //IF CONFIRM('Send this Application for Approval?',TRUE)=FALSE THEN EXIT;
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        //ApprovalMgt.SendBackOfficeAppApprovalRequest(Rec);
                    end;
                }
                action("&Cancel Approval request")
                {
                    ApplicationArea = Basic;
                    Caption = '&Cancel Approval request';
                    Enabled = false;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the &Cancel Approval request action.';

                }
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = report "Reconciliation - By Entry/Exit";
                    ToolTip = 'Executes the &Print action.';

                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Rec.Status = Rec.Status::Approved then
            CurrPage.Editable := false;
    end;

    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
    //ApprovalMgt: Codeunit "Export F/O Consolidation";
}
