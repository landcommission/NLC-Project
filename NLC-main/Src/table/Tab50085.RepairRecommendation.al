#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50085 "Repair Recommendation"
{

    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Repair No"; Code[20])
        {
        }
        field(3; "Vehicle No"; Code[20])
        {
        }
        field(4; "Recommendation by officer"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Line No", "Repair No", "Vehicle No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
