#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50014 "Disposal Reasons"
{
    // DrillDownPageID = 50059;
    // LookupPageID = 50059;

    fields
    {
        field(1; "Code"; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(2; Description; Text[150])
        {
        }
    }

    keys
    {
        key(Key1; "Code", Description)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

