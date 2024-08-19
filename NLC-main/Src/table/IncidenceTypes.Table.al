#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50117 "Incidence Types"
{
    Caption = 'Incidence Types';
    // DrillDownPageID = 50084;
    // LookupPageID = 50084;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Editable = true;
        }
        field(2; Description; Text[250])
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

