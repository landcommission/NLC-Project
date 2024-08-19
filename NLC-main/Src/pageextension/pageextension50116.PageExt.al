#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50116 pageextension50116 extends "Purchase Order Subform"
{
    layout
    {

        //Unsupported feature: Property Modification (SourceExpr) on ""Quantity Received"(Control 20)".


        //Unsupported feature: Property Modification (Name) on ""Quantity Received"(Control 20)".

        addafter("No.")
        {
            field("Requisition No"; Rec."Requisition No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Requisition No field.';
            }
        }
    }
}
