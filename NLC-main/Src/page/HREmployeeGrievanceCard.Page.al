#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193458 "HR Employee Grievance Card"
{
    PageType = Card;
    SourceTable = "HR Employee Grievance";
    ApplicationArea = All;
    Caption = 'HR Employee Grievance Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Employee First Name"; Rec."Employee First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee First Name field.';
                }
                field("Employee Last Name"; Rec."Employee Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Last Name field.';
                }
                field("Date Of Grievance"; Rec."Date Of Grievance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Grievance field.';
                }
                field("Release Date"; Rec."Release Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Release Date field.';
                }
                field("Follow Up Date"; Rec."Follow Up Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Follow Up Date field.';
                }
                field("Follow Up Completed"; Rec."Follow Up Completed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Follow Up Completed field.';
                }
                field("Follow Up Date (Actual Date)"; Rec."Follow Up Date (Actual Date)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Follow Up Date (Actual Date) field.';
                }
                field("Cause Of Grievance"; Rec."Cause Of Grievance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cause Of Grievance field.';
                }
                field("Outcome Of Grievance"; Rec."Outcome Of Grievance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Outcome Of Grievance field.';
                }
                field("Letter Sent To Employee"; Rec."Letter Sent To Employee")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Letter Sent To Employee field.';
                }
                field("Letter Sent By Whom"; Rec."Letter Sent By Whom")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Letter Sent By Whom field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin
                    Message('Send For Approval');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                begin
                    Message('Approvals');
                end;
            }
            action("Cancel Approvals Request")
            {
                ApplicationArea = Basic;
                Image = Cancel;
                Promoted = true;
                ToolTip = 'Executes the Cancel Approvals Request action.';
                trigger OnAction()
                begin
                    Message('Cancel Approval Request');
                end;
            }
        }
    }
}
