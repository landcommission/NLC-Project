#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69698 "Medical Checks Template Line"
{

    fields
    {
        field(1;"Template Id";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Medical History Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,General Health Question,Individual History,Family History,Vaccination History,Medical Examination,Lab Test';
            OptionMembers = " ","General Health Question","Individual History","Family History","Vaccination History","Medical Examination","Lab Test";
        }
        field(4;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Template Id","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

