#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194027 "Contract Milestone Entries"
{
    PageType = ListPart;
    SourceTable = "Contract Milestone Entry";
    ApplicationArea = All;
    Caption = 'Contract Milestone Entries';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Opportunity No."; Rec."Opportunity No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opportunity No. field.';
                }
                field("Contract Cycle Code>"; Rec."Sales Cycle Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Cycle Code';
                    ToolTip = 'Specifies the value of the Contract Cycle Code field.';
                }
                field("Contract Cycle Stage>"; Rec."Sales Cycle Stage")
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Cycle Stage';
                    ToolTip = 'Specifies the value of the Contract Cycle Stage field.';
                }
                field("Stage Description"; Rec."Stage Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stage Description field.';
                }
                field("Date of Change"; Rec."Date of Change")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Change field.';
                }
                field("Date Closed"; Rec."Date Closed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Closed field.';
                }
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Taken field.';
                }
                field("Completed %"; Rec."Completed %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Completed % field.';
                }
                field("Estimated Close Date"; Rec."Estimated Close Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimated Close Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Active field.';
                }
                field("Contact No."; Rec."Contact No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact No. field.';
                }
                field("Contact Company No."; Rec."Contact Company No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact Company No. field.';
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salesperson Code field.';
                }
                field("Campaign No."; Rec."Campaign No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Campaign No. field.';
                }
                field("Days Open"; Rec."Days Open")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Days Open field.';
                }
                field("Estimated Value (LCY)"; Rec."Estimated Value (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimated Value (LCY) field.';
                }
                field("Calcd. Current Value (LCY)"; Rec."Calcd. Current Value (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Calcd. Current Value (LCY) field.';
                }
                field("Chances of Success %"; Rec."Chances of Success %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chances of Success % field.';
                }
                field("Probability %"; Rec."Probability %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Probability % field.';
                }
                field("Close Opportunity Code"; Rec."Close Opportunity Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Close Opportunity Code field.';
                }
                field("Previous Contract Cycle Stage>"; Rec."Previous Sales Cycle Stage")
                {
                    ApplicationArea = Basic;
                    Caption = 'Previous Contract Cycle Stage';
                    ToolTip = 'Specifies the value of the Previous Contract Cycle Stage field.';
                }
            }
        }
    }

    actions { }
}
