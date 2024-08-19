#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 56104 "Case Types"
{
    PageType = List;
    SourceTable = "Case Types";
    UsageCategory = Administration;
    ApplicationArea = All;
    Caption = 'Case Types';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Case Nature"; Rec."Case Nature")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Nature field.';
                }
                field("Case Type"; Rec."Case Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Type field.';
                }
            }
        }
    }

    actions { }
}

#pragma implicitwith restore

