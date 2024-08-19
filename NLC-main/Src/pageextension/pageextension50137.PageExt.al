#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50137 pageextension50137 extends "No. Series Lines"
{
    layout
    {
        addafter("Increment-by No.")
        {
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Line No. field.';
            }
        }
    }
}
