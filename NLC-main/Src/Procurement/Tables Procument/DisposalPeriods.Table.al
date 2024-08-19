#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50111 "Disposal Periods"
{
    DrillDownPageID = "Disposal Periods";
    LookupPageID = "Disposal Periods";

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; "From Date"; Date)
        {
        }
        field(3; "To Date"; Date)
        {
        }
        field(4; Description; Text[30])
        {
        }
        field(5; "Financial Year"; Code[10])
        {
        }
        field(6; "Previous Year"; Boolean)
        {
        }
        field(7; "Current Year"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

