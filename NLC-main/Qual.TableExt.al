#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50100 tableextension50100 extends Qualification
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Code(Field 1)".

        field(4; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Educational,Professional,Body;
        }
        field(69600; "Qualification Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Academic,Professional,Skills & Competencies,Experience,Ethics & Integrity,Physical Attributes,Professional Body';
            OptionMembers = ,Academic,Professional,"Skills & Competencies",Experience,"Ethics & Integrity","Physical Attributes","Professional Body";
        }
        field(69601; "Academic Hierachy Code"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(69602; "No. of Active Employees"; Integer)
        {
            CalcFormula = count("Employee Qualification" where("Qualification Code" = field(Code)));
            FieldClass = FlowField;
        }
        field(69603; "No. of Qualified Applicants"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(69604; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
}

