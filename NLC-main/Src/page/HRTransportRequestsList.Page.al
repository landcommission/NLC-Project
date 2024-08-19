#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194038 "HR Transport Requests List"
{
    CardPageId = "HR Staff Transport Requisition";
    Editable = false;
    PageType = List;
    SourceTable = "HR Transport Requisition";
    ApplicationArea = All;
    Caption = 'HR Transport Requests List';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Transport Request No"; Rec."Transport Request No")
                {
                    ApplicationArea = Basic;
                    Style = Strong;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Transport Request No field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field(Names; Rec.Names)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Names field.';
                }
                field("Job Tittle"; Rec."Job Tittle")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Tittle field.';
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Days Applied field.';
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1102755004; Outlook) { }
            systempart(Control1102755006; Notes) { }
        }
    }

    actions
    {
        area(Reporting)
        {
            action("Transport Requests")
            {
                ApplicationArea = Basic;
                Caption = 'Transport Requests';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = report "HR Transport Requisitions";
                ToolTip = 'Executes the Transport Requests action.';
            }
        }
    }
}
