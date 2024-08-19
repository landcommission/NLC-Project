#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193984 "Tender Product List"
{
    PageType = ListPart;
    SourceTable = "Tender Product";
    ApplicationArea = All;
    Caption = 'Tender Product List';
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Current Price"; Rec."Current Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Price field.';
                }
                field("Annual Consumption"; Rec."Annual Consumption")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Consumption field.';
                }
                field(Specifications; Rec.Specifications)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Specifications field.';
                }
                field("Tender No"; Rec."Tender No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender No field.';
                }
            }
        }
    }

    actions { }
}
