#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193438 "hr job responsibilities card"
{
    PageType = Card;
    SourceTable = "HR Job Responsiblities";
    ApplicationArea = All;
    Caption = 'hr job responsibilities card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Responsibility Description"; Rec."Responsibility Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Description field.';
                }
                field("Responsibility Code"; Rec."Responsibility Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Code field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
            }
        }
    }

    actions { }
}
