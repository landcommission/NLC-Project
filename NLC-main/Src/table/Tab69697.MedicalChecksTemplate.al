#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69697 "Medical Checks Template"
{

    fields
    {
        field(1;"Template ID";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Template ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

