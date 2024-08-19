#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193488 "HR OSSafety Rules Card"
{
    PageType = Card;
    SourceTable = "HR OSSafety Rules";
    ApplicationArea = All;
    Caption = 'HR OSSafety Rules Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Safety No"; Rec."Safety No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Safety No field.';
                }
                field("Safety Rules"; Rec."Safety Rules")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Safety Rules field.';
                }
                field("Accident No."; Rec."Accident No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accident No. field.';
                }
            }
        }
    }

    actions { }
}
