#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50109 pageextension50109 extends "Item Card"
{
    layout
    {
        addafter("Application Wksh. User ID")
        {
            field("Item G/L Budget Account"; Rec."Item G/L Budget Account")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Item G/L Budget Account field.';
            }
        }
    }
}
