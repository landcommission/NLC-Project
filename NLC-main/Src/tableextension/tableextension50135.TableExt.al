#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50135 tableextension50135 extends "Bank Account Statement"
{
    fields
    {
        field(50000; "Cash Book Balance"; Decimal)
        {
            Editable = false;
            Caption = 'Cash Book Balance';
            DataClassification = CustomerContent;
        }
    }
}
