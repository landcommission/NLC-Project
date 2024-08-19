#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50139 tableextension50139 extends "Sales & Receivables Setup"
{
    fields
    {
        field(39003900; "Donor Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Donor Nos';
            DataClassification = CustomerContent;
        }
    }
}
