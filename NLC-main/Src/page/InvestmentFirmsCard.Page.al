#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193794 "Investment Firms Card"
{
    PageType = Card;
    SourceTable = "Investment Firms";
    ApplicationArea = All;
    Caption = 'Investment Firms Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Firm Code"; Rec."Firm Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Firm Code field.';
                }
                field("Firm Name"; Rec."Firm Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Firm Name field.';
                }
                field("Firm Branch Code"; Rec."Firm Branch Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Firm Branch Code field.';
                }
                field("Firm Branch Name"; Rec."Firm Branch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Firm Branch Name field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field(Telephone; Rec.Telephone)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Telephone field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the E-Mail field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control13; MyNotes) { }
            systempart(Control14; Links) { }
        }
    }

    actions { }
}
