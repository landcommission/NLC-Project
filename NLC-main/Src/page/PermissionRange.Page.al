#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 70016 "Permission Range"
{
    PageType = List;
    SourceTable = "Permission Range";
    SourceTableView = sorting("Object Type", Index)
                      where("Object Type" = const(Table),
                            From = filter(> 52193423));
    ApplicationArea = All;
    Caption = 'Permission Range';
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
                field(From; Rec.From)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From field.';
                }
                field("To"; Rec."To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To field.';
                }
                field("Read Permission"; Rec."Read Permission")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Read Permission field.';
                }
                field("Insert Permission"; Rec."Insert Permission")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insert Permission field.';
                }
                field("Modify Permission"; Rec."Modify Permission")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Modify Permission field.';
                }
                field("Delete Permission"; Rec."Delete Permission")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Delete Permission field.';
                }
                field("Execute Permission"; Rec."Execute Permission")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Execute Permission field.';
                }
            }
        }
    }

    actions { }
}
