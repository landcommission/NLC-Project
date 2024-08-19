#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69734 "Benefit Plan Grade"
{

    fields
    {
        field(1;"Package ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Benefit Package";
        }
        field(2;"Plan ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Job Grade ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salary Scales";
        }
    }

    keys
    {
        key(Key1;"Package ID","Plan ID","Job Grade ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

