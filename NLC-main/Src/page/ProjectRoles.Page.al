#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193874 "Project Roles"
{
    DelayedInsert = true;
    PageType = Card;
    SourceTable = "Project Roles";
    ApplicationArea = All;
    Caption = 'Project Roles';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field(Role; Rec.Role)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role field.';
                }
                field("Role Description"; Rec."Role Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role Description field.';
                }
            }
        }
    }

    actions { }
}
