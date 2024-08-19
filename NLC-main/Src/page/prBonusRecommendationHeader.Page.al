#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193563 "prBonus Recommendation Header"
{
    PageType = Card;
    SourceTable = "prBonus Recommendation Header";
    ApplicationArea = All;
    Caption = 'prBonus Recommendation Header';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Recommendation No."; Rec."Recommendation No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Recommendation No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Employee ID."; Rec."Employee ID.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee ID. field.';
                }
                field("Employee Names"; Rec."Employee Names")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Names field.';
                }
                field("Job Group"; Rec."Job Group")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Group field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Project field.';
                }
                field("Proposed Bonus"; Rec."Proposed Bonus")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proposed Bonus field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control12; "prBonus Recommendation Lines")
            {
                SubPageLink = City = field("Recommendation No.");
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
