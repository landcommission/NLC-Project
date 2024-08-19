#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50104 pageextension50104 extends "G/L Account List"
{

    //Unsupported feature: Property Insertion (InsertAllowed) on ""G/L Account List"(Page 18)".

    layout
    {
        addafter("Direct Posting")
        {
            field("Grant Expense"; Rec."Grant Expense")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Grant Expense field.';
            }
        }
    }
}
