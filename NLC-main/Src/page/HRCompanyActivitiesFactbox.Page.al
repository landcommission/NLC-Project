#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194143 "HR Company Activities Factbox"
{
    PageType = CardPart;
    SourceTable = "HR Company Activities";
    ApplicationArea = All;
    Caption = 'HR Company Activities Factbox';
    layout
    {
        area(Content)
        {
            group(Control1102755018)
            {
                label(Control1102755019)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text1;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Venue field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Responsible';
                    ToolTip = 'Specifies the value of the Employee Responsible field.';
                }
                field("Email Message"; Rec."Email Message")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email Message field.';
                }
                label(Control1102755020)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text2;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field(Costs; Rec.Costs)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Costs field.';
                }
                field("Contribution Amount (If Any)"; Rec."Contribution Amount (If Any)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contribution Amount (If Any) field.';
                }
                field("G/L Account No"; Rec."G/L Account No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the G/L Account No field.';
                }
                field("G/L Account Name"; Rec."G/L Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the G/L Account Name field.';
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bal. Account Type field.';
                }
                field("Bal. Account No"; Rec."Bal. Account No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bal. Account No field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                label(Control1102755012)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text3;
                    Style = StrongAccent;
                    StyleExpr = true;
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field("Activity Status"; Rec."Activity Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Status field.';
                }
            }
        }
    }

    actions { }

    var
        Text1: Label 'Activity Description';
        Text2: Label 'Activity Cost';
        Text3: Label 'Activity Status';
}
