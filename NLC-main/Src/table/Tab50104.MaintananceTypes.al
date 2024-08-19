#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50104 "Maintanance Types"
{
    DrillDownPageID = "Maintanance Type";
    LookupPageID = "Maintanance Type";

    fields
    {
        field(1; "Maintanance Code"; Code[30])
        {
        }
        field(2; "Maintanance Description"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Maintanance Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
