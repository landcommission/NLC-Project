#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193532 "PR Bank Branches"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "PR Bank Branches";
    UsageCategory = Lists;
    Caption = 'PR Bank Branches';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Branch Code"; Rec."Branch Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch Code field.';
                }
                field("Branch Name"; Rec."Branch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch Name field.';
                }
            }
        }
    }

    actions { }
}
