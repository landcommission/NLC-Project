#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193991 "Bidder Tender List"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Bidder Tender";
    UsageCategory = Lists;
    Caption = 'Bidder Tender List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Year; Rec.Year)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year field.';
                }
                field("Tender ID"; Rec."Tender ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender ID field.';
                }
                field("PIN No."; Rec."PIN No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PIN No. field.';
                }
                field("Receipt No."; Rec."Receipt No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt No. field.';
                }
                field("Non Refundable Fee"; Rec."Non Refundable Fee")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Non Refundable Fee field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Serial No"; Rec."Serial No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Serial No field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Tenderer Names"; Rec."Tenderer Names")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tenderer Names field.';
                }
                field("Telephone No"; Rec."Telephone No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Telephone No field.';
                }
                field("Witness Names"; Rec."Witness Names")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Witness Names field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Name field.';
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
