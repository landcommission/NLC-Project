#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50156 pageextension50156 extends "Fixed Asset Setup"
{
    layout
    {
        addafter("Insurance Nos.")
        {
            field("Asset Transfer Nos."; Rec."Asset Transfer Nos.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Asset Transfer Nos. field.';
            }
            field(FixedAssetNos; "Fixed Asset Nos.")
            {
                ApplicationArea = Basic;
            }
            field(InsuranceNos; "Insurance Nos.")
            {
                ApplicationArea = Basic;
            }
        }
    }
}
