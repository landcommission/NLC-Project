#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193774 "NLC Default"
{
    Caption = 'Role Center';
    PageType = RoleCenter;
    ApplicationArea = All;

    layout
    {
        area(rolecenter)
        {
            group(Control21) { }
            group(Control11)
            {
                systempart(Control4; Links) { }
                systempart(Control1; MyNotes) { }
            }
        }
    }

    actions
    {
        area(sections) { }
    }
}
