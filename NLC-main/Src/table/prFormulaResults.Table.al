#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193546 "prFormula Results"
{
    Caption = 'prFormula Results';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Result Figure"; Decimal)
        {
            Caption = 'Result Figure';
        }
    }

    keys
    {
        key(Key1; "Result Figure")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
