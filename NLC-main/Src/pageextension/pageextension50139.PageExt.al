#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50139 pageextension50139 extends "Inventory Setup"
{
    layout
    {
        addafter("Internal Movement Nos.")
        {
            field("Item Jnl Template"; Rec."Item Jnl Template")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Item Jnl Template field.';
            }
            field("Item Jnl Batch"; Rec."Item Jnl Batch")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Item Jnl Batch field.';
            }
        }
    }
}
