#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69733 "Benefit Plan Line"
{

    fields
    {
        field(1; "Package ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Plan ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Benefit Plan Grade"."Plan ID";
        }
        field(3; Description; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "No. of Job Grades"; Integer)
        {
            CalcFormula = count("Benefit Plan Grade" where("Plan ID" = field("Plan ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Employment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer';
            OptionMembers = Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer;
        }
    }

    keys
    {
        key(Key1; "Package ID", "Plan ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

