#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193836 "Vendor Criteria"
{
    Caption = 'Vendor Criteria';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Year; Code[20])
        {
            Caption = 'Year';
        }
        field(2; "Vendor No."; Code[20])
        {
            TableRelation = Vendor;
            Caption = 'Vendor No.';
        }
    }

    keys
    {
        key(Key1; Year)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
