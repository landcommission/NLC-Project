#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50133 pageextension50133 extends "Bank Acc. Reconciliation Lines"
{
    Editable = false;
    layout
    {

        //Unsupported feature: Property Modification (Visible) on ""Check No."(Control 21)".

        modify(TotalBalance)
        {
            Caption = 'Cash Book Balance';
        }
        addafter("Applied Amount")
        {
            field(Reconciled; Rec.Reconciled)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Reconciled field.';
            }
        }
    }
}
