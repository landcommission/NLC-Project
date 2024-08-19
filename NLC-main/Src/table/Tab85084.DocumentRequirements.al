#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85084 "Document Requirements"
{

    fields
    {
        field(1;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"HR Document Type";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Requirement Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Mandatory,Optional';
            OptionMembers = Mandatory,Optional;
        }
        field(5;Attached;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Application No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

