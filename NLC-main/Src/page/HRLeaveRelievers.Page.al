#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193481 "HR Leave Relievers"
{
    PageType = ListPart;
    SourceTable = "HR Leave Relievers";
    ApplicationArea = All;
    Caption = 'HR Leave Relievers';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Reliever No"; Rec."Reliever No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reliever No field.';
                }
                field("Reliever Name"; Rec."Reliever Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reliever Name field.';
                }
                field("Pending Assignment"; Rec."Pending Assignment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pending Assignment field.';
                }
            }
        }

    }

    actions { }
}
