#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193909 "Vendor Category"
{
    PageType = List;
    SourceTable = "User Document Cancellation";
    ApplicationArea = All;
    Caption = 'Vendor Category';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Document Area"; Rec."Document Area")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Area field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control6; Outlook) { }
            systempart(Control7; Notes) { }
            systempart(Control8; MyNotes) { }
            systempart(Control9; Links) { }
        }
    }

    actions { }
}
