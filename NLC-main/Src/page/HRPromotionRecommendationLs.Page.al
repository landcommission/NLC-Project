#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194088 "HR Promotion Recommendation Ls"
{
    PageType = ListPart;
    SourceTable = "HR Promo. Recommend Lines";
    ApplicationArea = All;
    Caption = 'HR Promotion Recommendation Ls';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Employee Abilities"; Rec."Employee Abilities")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Abilities field.';
                }
                field(Experience; Rec.Experience)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Experience field.';
                }
            }
        }
    }

    actions { }
}
