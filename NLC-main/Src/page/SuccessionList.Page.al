#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194186 "Succession List"
{
    CardPageId = "HR Succession Planning";
    PageType = List;
    SourceTable = "HR Succession Employee";
    ApplicationArea = All;
    Caption = 'Succession List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Staff No."; Rec."Staff No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff No. field.';
                }
                field("Position to Succeed"; Rec."Position to Succeed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position to Succeed field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
            }
        }
    }

    actions { }
}
