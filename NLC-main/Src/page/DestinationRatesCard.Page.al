#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193757 "Destination Rates Card"
{
    PageType = Card;
    SourceTable = "Destination Rate Entry";
    ApplicationArea = All;
    Caption = 'Destination Rates Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Advance Code"; Rec."Advance Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advance Code field.';
                }
                field("Destination Code"; Rec."Destination Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination Code field.';
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency field.';
                }
                field("Destination Type"; Rec."Destination Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination Type field.';
                }
                field("Daily Rate (Amount)"; Rec."Daily Rate (Amount)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Daily Rate (Amount) field.';
                }
                field("Employee Job Group"; Rec."Employee Job Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Job Group field.';
                }
                field("Destination Name"; Rec."Destination Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination Name field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control11; Outlook) { }
            systempart(Control12; Notes) { }
            systempart(Control13; MyNotes) { }
            systempart(Control14; Links) { }
        }
    }

    actions { }
}
