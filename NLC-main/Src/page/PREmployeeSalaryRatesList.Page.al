#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194204 "PR Employee Salary Rates List"
{
    ApplicationArea = Basic;
    CardPageId = "PR Employee Salary Rates Card";
    Editable = false;
    PageType = List;
    SourceTable = "PR Employees Salary Scale1";
    UsageCategory = Lists;
    Caption = 'PR Employee Salary Rates List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field("Basic Pay 1 - Minimum"; Rec."Basic Pay 1 - Minimum")
                {
                    ApplicationArea = Basic;
                    Caption = 'Minimum Basic Pay';
                    Style = AttentionAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Minimum Basic Pay field.';
                }
                field("Basic Pay 2"; Rec."Basic Pay 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Pay 2 field.';
                }
                field("Basic Pay 3"; Rec."Basic Pay 3")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Pay 3 field.';
                }
                field("Basic Pay 4"; Rec."Basic Pay 4")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Pay 4 field.';
                }
                field("Basic Pay 5"; Rec."Basic Pay 5")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Pay 5 field.';
                }
                field("Basic Pay 6"; Rec."Basic Pay 6")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Pay 6 field.';
                }
                field("Basic Pay 7"; Rec."Basic Pay 7")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Pay 7 field.';
                }
                field("Basic Pay 8"; Rec."Basic Pay 8")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Pay 8 field.';
                }
                field("Basic Pay 9"; Rec."Basic Pay 9")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Pay 9 field.';
                }
                field("Basic Pay 10"; Rec."Basic Pay 10")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Pay 10 field.';
                }
                field("Maximum Basic Pay"; Rec."Maximum Basic Pay")
                {
                    ApplicationArea = Basic;
                    Caption = 'Maximum Basic Pay';
                    Style = Attention;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Maximum Basic Pay field.';
                }
            }
            systempart(Control1102755004; Outlook) { }
        }
    }

    actions { }
}
