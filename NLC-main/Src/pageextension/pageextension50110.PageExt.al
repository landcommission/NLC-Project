#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50110 pageextension50110 extends "Item List"
{
    layout
    {

        //Unsupported feature: Property Insertion (Visible) on ""Substitutes Exist"(Control 97)".


        //Unsupported feature: Property Insertion (Visible) on ""Assembly BOM"(Control 8)".


        //Unsupported feature: Property Insertion (Visible) on ""Production BOM No."(Control 99)".


        //Unsupported feature: Property Insertion (Visible) on ""Routing No."(Control 101)".


        //Unsupported feature: Property Insertion (Visible) on ""Cost is Adjusted"(Control 122)".

        addafter("Last Direct Cost")
        {
            field(Inventory; Rec.Inventory)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the total quantity of the item that is currently in inventory at all locations.';
            }
        }
    }
}
