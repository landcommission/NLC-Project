#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50119 pageextension50119 extends "Purchase Quote Subform"
{
    layout
    {
        addafter(Description)
        {
            field("Routing No."; Rec."Routing No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Routing No. field.';
            }
        }
        addafter("Direct Unit Cost")
        {
            field("Requisition No"; Rec."Requisition No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Requisition No field.';
            }
        }
    }
}
