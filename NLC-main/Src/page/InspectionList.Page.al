#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193890 "Inspection List"
{
    CardPageId = "Inspection Header";
    PageType = List;
    SourceTable = "Inspection Header";
    ApplicationArea = All;
    Caption = 'Inspection List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Purchase Order No."; Rec."Purchase Order No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Order No. field.';
                }
                field("Supplier No."; Rec."Supplier No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supplier No. field.';
                }
                field("Supplier Name"; Rec."Supplier Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supplier Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Caption = ' Receipt No.';
                    ToolTip = 'Specifies the value of the  Receipt No. field.';
                }
            }
        }
    }

    actions { }
}
