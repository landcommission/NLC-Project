#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194142 "HR Company Activities List"
{
    ApplicationArea = Basic;
    CardPageId = "HR Company Activities Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Company Activities";
    UsageCategory = Lists;
    Caption = 'HR Company Activities List';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                Editable = false;
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
                field(Costs; Rec.Costs)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Costs field.';
                }
                field("Employee Responsible"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field("Activity  Status>"; Rec."Activity Status")
                {
                    ApplicationArea = Basic;
                    Caption = 'Activity  Status';
                    Style = StrongAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Activity  Status field.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Control1102755004; "HR Company Activities Factbox")
            {
                SubPageLink = Code = field(Code);
            }
        }
    }

    actions { }
}
