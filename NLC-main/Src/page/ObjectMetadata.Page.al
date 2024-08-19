#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 70006 "Object Metadata"
{
    PageType = List;
    SourceTable = "Object Metadata";
    ApplicationArea = All;
    Caption = 'Object Metadata';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Object Type"; Rec."Object Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Object Type field.';
                }
                field("Object ID"; Rec."Object ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Object ID field.';
                }
            }
        }
    }

    actions { }
}
