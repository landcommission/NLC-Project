#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194137 "HR Employee Confirmation List"
{
    ApplicationArea = Basic;
    CardPageId = "HR Employee confirmation";
    PageType = List;
    SourceTable = "HR Employee Confirmation";
    UsageCategory = Lists;
    Caption = 'HR Employee Confirmation List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Employee Number"; Rec."Employee Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Number field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }
                field("Shortcut Dimension code1"; Rec."Shortcut Dimension code1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension code1 field.';
                }
                field("Shortcut Dimension code2"; Rec."Shortcut Dimension code2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension code2 field.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason field.';
                }
                field("Probation Start Date"; Rec."Probation Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Probation Start Date field.';
                }
                field("Probation End Date"; Rec."Probation End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Probation End Date field.';
                }
                field("Confirmation Date"; Rec."Confirmation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Confirmation Date field.';
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(User; Rec.User)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User field.';
                }
            }
        }
    }

    actions { }
}
