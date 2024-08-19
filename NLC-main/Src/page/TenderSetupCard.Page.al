#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193983 "Tender Setup Card"
{
    PageType = Card;
    SourceTable = "Tender Setup";
    ApplicationArea = All;
    Caption = 'Tender Setup Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Non Refundable Fee"; Rec."Non Refundable Fee")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Non Refundable Fee field.';
                }
                field("From Time"; Rec."From Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From Time field.';
                }
                field("To Time"; Rec."To Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To Time field.';
                }
                field(Period; Rec.Period)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Period field.';
                }
                field("Opening Date"; Rec."Opening Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opening Date field.';
                }
            }
        }
    }

    actions { }
}
