#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50111 pageextension50111 extends "Item Ledger Entries"
{
    layout
    {

        //Unsupported feature: Property Deletion (Visible) on ""Order No."(Control 54)".

        addafter("Applied Entry to Adjust")
        {
            field("Vendor No"; Rec."Vendor No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Vendor No field.';
            }
        }
        addafter("Order No.")
        {
            field("Vendor Name"; Rec."Vendor Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Vendor Name field.';
            }
        }
        addafter("Order Line No.")
        {
            field("Invoice No"; Rec."Invoice No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Invoice No field.';
            }
            field("Employee No"; Rec."Employee No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Employee No field.';
            }
            field("Employee Name"; Rec."Employee Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Employee Name field.';
            }
            field("User ID"; Rec."User ID")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the User ID field.';
            }
        }
    }
}
