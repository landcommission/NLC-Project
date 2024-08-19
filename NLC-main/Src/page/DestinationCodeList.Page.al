#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193712 "Destination Code List"
{
    CardPageId = "Destination Code Card";
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Travel Destination";
    ApplicationArea = All;
    Caption = 'Destination Code List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Destination Code"; Rec."Destination Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination Code field.';
                }
                field("Destination Name"; Rec."Destination Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination Name field.';
                }
                field("Destination Type"; Rec."Destination Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination Type field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control7; Outlook) { }
            systempart(Control8; Notes) { }
            systempart(Control9; MyNotes) { }
            systempart(Control10; Links) { }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Destination Rate")
            {
                ApplicationArea = Basic;
                Caption = 'Destination Rate';
                Image = Travel;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = page "Destination Rate List";
                RunPageLink = "Destination Code" = field("Destination Code");
                ToolTip = 'Executes the Destination Rate action.';
            }
        }
    }
}
