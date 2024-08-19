#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69724 "Referee Recommendation Line"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Referee Recommendation";
        }
        field(2;"Reference Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'General Remarks,Roles & Responsibilities,Strengths & Achievements,Weaknesses & Lowlights';
            OptionMembers = "General Remarks","Roles & Responsibilities","Strengths & Achievements","Weaknesses & Lowlights";
        }
        field(3;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Reference Category","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

