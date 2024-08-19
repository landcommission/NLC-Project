#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50135 "Disposal Method"
{
    DrillDownPageID = 50035;
    LookupPageID = 50035;

    fields
    {
        field(1; "Disposal Methods"; Code[20])
        {
        }
        field(2; "Disposal Description"; Text[30])
        {
        }
        field(3; Date; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Disposal Methods", "Disposal Description")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

