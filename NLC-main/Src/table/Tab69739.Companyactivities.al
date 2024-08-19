#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69739 "Company activities"
{

    fields
    {
        field(1;"Code";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Day;Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;Venue;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Department;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Cost;Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

