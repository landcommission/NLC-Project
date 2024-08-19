#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50130 pageextension50130 extends "Bank Account Card"
{

    //Unsupported feature: Property Insertion (InsertAllowed) on ""Bank Account Card"(Page 370)".

    layout
    {
        addafter("Last Date Modified")
        {
            field("Responsibility Center"; Rec."Responsibility Center")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Responsibility Center field.';
            }
            field("Bank Type"; Rec."Bank Type")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Bank Type field.';
            }
        }
    }
}
