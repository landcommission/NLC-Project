#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69629 "Recruitment Req Substitute"
{
    // DrillDownPageID = "Position Substitutes";
    // LookupPageID = "Position Substitutes";

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Requirement ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4; "Qualification Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Academic,Professional,Skills & Competencies,Experience,Ethics & Integrity,Physical Attributes';
            OptionMembers = ,Academic,Professional,"Skills & Competencies",Experience,"Ethics & Integrity","Physical Attributes";
        }
        field(5; Description; Text[600])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Requirement Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Mandatory,Added Advantage';
            OptionMembers = Mandatory,"Added Advantage";
        }
        field(7; "Substitute Qualification"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Qualification Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Qualification where("Qualification Category" = field("Qualification Category"));
        }
    }

    keys
    {
        key(Key1; "Document No.", "Requirement ID", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

