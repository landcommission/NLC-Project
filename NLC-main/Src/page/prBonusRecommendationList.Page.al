#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193565 "prBonus Recommendation List"
{
    CardPageId = "prBonus Recommendation Header";
    PageType = List;
    SourceTable = "prBonus Recommendation Header";
    ApplicationArea = All;
    Caption = 'prBonus Recommendation List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Recommendation No."; Rec."Recommendation No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommendation No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Employee ID."; Rec."Employee ID.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee ID. field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions { }
}
