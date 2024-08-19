#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 70009 "Key Virtual Table"
{
    PageType = List;
    SourceTable = "Key";
    SourceTableView = where(TableNo = filter(39003900 .. 80000000),
                            "No." = const(1));
    ApplicationArea = All;
    Caption = 'Key Virtual Table';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(TableNo; Rec.TableNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TableNo field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(TableName; Rec.TableName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TableName field.';
                }
                field("Key"; Rec.Key)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Key field.';
                }
                field(Enabled; Rec.Enabled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Enabled field.';
                }
            }
        }
    }

    actions { }
}
