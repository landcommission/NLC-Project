#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193894 "Project areas of focus new"
{
    Caption = 'Select areas of focus that apply to yiour study';
    PageType = ListPart;
    SourceTable = "Project Study areas new";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Inv. code"; Rec."Inv. code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Inv. code field.';
                }
                field("Area of Focus"; Rec."Area of Focus")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Area of Focus field.';
                }
            }
        }
    }

    actions { }
}
