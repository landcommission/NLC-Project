#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193556 "prSalary Review Header"
{
    PageType = Card;
    SourceTable = "prSalary Review Header";
    ApplicationArea = All;
    Caption = 'prSalary Review Header';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Proposal No."; Rec."Proposal No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Proposal No. field.';
                }
                field("Proposal Date"; Rec."Proposal Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proposal Date field.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control6; "prSalary Review Lines")
            {
                SubPageLink = "Proposal No." = field("Proposal No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send Approval Request action.';

                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Request action.';

                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Approvals action.';

                }
            }
        }
    }
}
