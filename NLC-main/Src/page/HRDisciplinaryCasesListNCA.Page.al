#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194152 "HR Disciplinary Cases List NCA"
{
    ApplicationArea = Basic;
    Caption = 'Employee Disciplinary Cases ';
    CardPageId = "HR Disciplinary Cases SF";
    Editable = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Functions,Case Status,Show';
    SourceTable = "HR Disciplinary Cases NCA";

    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Document No."; "Document No.")
                {
                    ApplicationArea = all;
                    Editable = false;
                    ToolTip = 'Specifies the document number';
                }
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Speifies the value of the Case Number field.';
                }
                field("Accused Employee"; Rec."Accused Employee")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accused Employee field.';
                }
                field("Accused Employee Name"; "Accused Employee Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'specifies the employee name';
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date of Offence';
                    ToolTip = 'Specifies the value of the Date of Offence field.';
                }
                field("Type Complaint"; Rec."Type Complaint")
                {
                    ApplicationArea = Basic;
                    Caption = 'Type Of Offence';
                    ToolTip = 'Specifies the value of the Type Of Offence field.';
                }
                field(Accuser; Rec.Accuser)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accuser field.';
                }

                field("Description of Complaint"; Rec."Description of Complaint")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description Of Offence';
                    ToolTip = 'Specifies the value of the Description Of Offence field.';
                }
                field("Disciplinary Stage Status"; Rec."Disciplinary Stage Status")
                {
                    ApplicationArea = Basic;
                    // Style = StandardAccent;
                    StyleExpr = true;
                    OptionCaption = ' ,Reported,Under Review,Inprogress,Closed,Appealled';
                    ToolTip = 'Specifies the value of the Disciplinary Stage Status field.';
                }
                field("Response"; Rec.Response)
                {
                    ApplicationArea = Basic;
                    Caption = 'Response';
                    ToolTip = 'Specifies the value of the Response field.';
                }
                field(Appealed; Appealed)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Disciplinary Remarks"; "Disciplinary Remarks")
                {
                    ApplicationArea = all;
                    Visible = false;
                }


            }
        }
        area(FactBoxes)
        {
            part(Control1102755006; "HR Disciplinary Cases Factbox")
            {
                Caption = 'HR Disciplinary Cases Factbox';
                SubPageLink = "Case Number" = field("Case Number");
            }
            systempart(Control1102755009; Outlook) { }
        }
    }

    actions
    {
        area(Navigation)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action("Send Case Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Case Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = false;
                    ToolTip = 'Executes the Send Case Approval Request action.';

                }
                action("Cancel Case Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Case Approval Request';
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the Cancel Case Approval Request action.';

                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the Approvals action.';
                }
            }
            group("Case Status")
            {
                action("Under Investigation")
                {
                    ApplicationArea = Basic;
                    Caption = 'Under Investigation';
                    Image = OpenWorksheet;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Under Investigation action.';

                }
                action("In Progress")
                {
                    ApplicationArea = Basic;
                    Caption = 'In Progress';
                    Image = CarryOutActionMessage;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the In Progress action.';

                }
                action(Close)
                {
                    ApplicationArea = Basic;
                    Caption = ' Close';
                    Image = Closed;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the  Close action.';

                }
                action(Appeal)
                {
                    ApplicationArea = Basic;
                    Caption = ' Appeal';
                    Image = ReopenCancelled;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the  Appeal action.';

                }
            }
        }
    }

    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Approvals Mgt";
        //AppMgmt: Codeunit "Export F/O Consolidation";
        "Document Type": Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Store Requisition","Employee Requisition","Leave Application","Transport Requisition","Training Requisition","Job Approval","Induction Approval","Leave Journal","Medical Claims","Activity Approval","Disciplinary Approvals";
}
