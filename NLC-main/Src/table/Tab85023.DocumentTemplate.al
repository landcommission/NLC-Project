#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85023 "Document Template"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Examination ID"; Code[100])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = Courses;
        }
        field(6; "Examination Description"; Text[200])
        {
            //CalcFormula = lookup(Courses.Description where (Code=field("Examination ID")));
            //FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

