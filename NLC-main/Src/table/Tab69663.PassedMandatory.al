#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69663 "Passed Mandatory"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Vacancy ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Qualification Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Academic,Professional,Skills & Competencies,Experience,Ethics & Integrity,Physical Attributes,Proffessional Bodies';
            OptionMembers = ,Academic,Professional,"Skills & Competencies",Experience,"Ethics & Integrity","Physical Attributes","Proffessional Bodies";
        }
        field(6;"Qualification Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Qualification;
        }
        field(7;"Specialized Domain Area";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

