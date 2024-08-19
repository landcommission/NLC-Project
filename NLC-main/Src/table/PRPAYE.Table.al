#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193525 "PR PAYE"
{
    Caption = 'PR PAYE';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Tier Code"; Code[10])
        {
            Caption = 'Tier Code';
        }
        field(2; "PAYE Tier"; Decimal)
        {
            MinValue = 0;
            Caption = 'PAYE Tier';
        }
        field(3; Rate; Decimal)
        {
            MinValue = 0;
            Caption = 'Rate';
        }
    }

    keys
    {
        key(Key1; "Tier Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
