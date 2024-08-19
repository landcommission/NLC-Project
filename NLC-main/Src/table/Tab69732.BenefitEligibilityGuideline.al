#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69732 "Benefit Eligibility Guideline"
{

    fields
    {
        field(1;"Benefit ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Entry Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Eligibility Criteria,General Guideline';
            OptionMembers = "Eligibility Criteria","General Guideline";
        }
        field(3;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[600])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Benefit ID","Entry Type","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

