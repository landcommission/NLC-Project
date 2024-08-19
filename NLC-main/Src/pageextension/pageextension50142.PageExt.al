#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50142 pageextension50142 extends "Dimension Values"
{
    layout
    {
        addafter("Map-to IC Dimension Value Code")
        {
            field("Dimension Code"; Rec."Dimension Code")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Dimension Code field.';
            }
            field("Transport Booking Period"; Rec."Transport Booking Period")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Transport Booking Period field.';
            }

            field("Transport Cancellation Period"; Rec."Transport Cancellation Period")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Transport Cancellation Period field.';
            }
        }
    }

    //Unsupported feature: Property Deletion (SaveValues).


    //Unsupported feature: Property Deletion (DelayedInsert).

}
