#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194203 "PR Trans Codes Groups - List"
{
    ApplicationArea = Basic;
    Caption = 'PR Transaction Codes Groups';
    CardPageId = "PR Trans Codes Groups - Card";
    Editable = false;
    PageType = List;
    SourceTable = "PR Trans Codes Groups";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Control1102756000)
            {
                field("Group Code"; Rec."Group Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Group Code field.';
                }
                field("Group Description"; Rec."Group Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Group Description field.';
                }
            }
        }
    }

    actions { }
}
