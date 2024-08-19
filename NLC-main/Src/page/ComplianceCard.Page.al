#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193899 "Compliance Card"
{
    PageType = Card;
    SourceTable = "Grants Compliance";
    ApplicationArea = All;
    Caption = 'Compliance Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Grant No"; Rec."Grant No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grant No field.';
                }
                field("Compliance Code"; Rec."Compliance Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Compliance Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Compliance; Rec.Compliance)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Compliance field.';
                }
                field(User; Rec.User)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
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
