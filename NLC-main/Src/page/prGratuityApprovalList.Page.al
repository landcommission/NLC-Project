#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193562 "prGratuity Approval List"
{
    CardPageId = "prGratuity Approval";
    PageType = List;
    SourceTable = "prGratuity Approval";
    ApplicationArea = All;
    Caption = 'prGratuity Approval List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Employee Names"; Rec."Employee Names")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Names field.';
                }
            }
        }
    }

    actions { }
}
