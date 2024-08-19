#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69682 "Template Questn Option"
{

    fields
    {
        field(1;"Template ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Pre-Screen Template";
        }
        field(2;"Question ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Pre-Screen Template Line"."Question Id";
        }
        field(3;"Option Code";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Template ID","Question ID","Option Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

