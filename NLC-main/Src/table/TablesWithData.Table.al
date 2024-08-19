#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 70001 "Tables With Data"
{
    Caption = 'Tables With Data';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Names; Text[100])
        {
            Caption = 'Names';
        }
    }

    keys
    {
        key(Key1; Names)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
