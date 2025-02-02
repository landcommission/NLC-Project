#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69690 "Apptitude Question"
{

    fields
    {
        field(1; "Question ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Question; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Apptitude,Training Needs Request';
            OptionMembers = Apptitude,"Training Needs Request";
        }
    }

    keys
    {
        key(Key1; "Question ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

