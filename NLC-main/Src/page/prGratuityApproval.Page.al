#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193561 "prGratuity Approval"
{
    PageType = Card;
    SourceTable = "prGratuity Approval";
    ApplicationArea = All;
    Caption = 'prGratuity Approval';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Employee ID"; Rec."Employee ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee ID field.';
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
                    ToolTip = 'Specifies the value of the Job Group field.';
                }
                field("Calculated Gratuity"; Rec."Calculated Gratuity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Calculated Gratuity field.';
                }
                field("Approval Date"; Rec."Approval Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
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
