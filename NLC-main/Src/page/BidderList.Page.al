#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193990 "Bidder List"
{
    ApplicationArea = Basic;
    CardPageId = "Bidder Card";
    PageType = List;
    SourceTable = Bidder;
    UsageCategory = Lists;
    Caption = 'Bidder List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("PIN No"; Rec."PIN No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PIN No field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Password; Rec.Password)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Password field.';
                }
                field("Tenderer Name"; Rec."Tenderer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tenderer Name field.';
                }
                field("Changed Password"; Rec."Changed Password")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Changed Password field.';
                }
                field("Procurement Officer"; Rec."Procurement Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Officer field.';
                }
                field("Posted To Portal"; Rec."Posted To Portal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted To Portal field.';
                }
            }
        }
    }

    actions { }
}
