#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193564 "prBonus Recommendation Lines"
{
    PageType = ListPart;
    SourceTable = "Responsibility Center BR NEW";
    ApplicationArea = All;
    Caption = 'prBonus Recommendation Lines';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Name 2"; Rec."Name 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name 2 field.';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact field.';
                }
            }
        }
    }

    actions { }
}
