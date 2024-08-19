#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69725 "Referee Recomm Rating"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Vacancy ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Requisition Header" where ("Document Type"=filter("Job Vacancy"));
        }
        field(3;"Skills and Competency ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Req Requirement"."Line No." where ("Document No."=field("Vacancy ID"),
                                                                            "Qualification Category"=filter("Skills & Competencies"));

            trigger OnValidate()
            begin
                Requirement.Reset;
                Requirement.SetRange("Document No.","Vacancy ID");
                Requirement.SetRange("Line No.","Skills and Competency ID");
                if Requirement.FindFirst then begin
                  "Qualification Code":=Requirement."Qualification Code";
                  Description:=Requirement.Description;
                  end
            end;
        }
        field(4;"Qualification Code";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;Description;Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Rating of Candidate";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,1-VERY POOR,2-POOR,3-FAIR,4-GOOD,5-EXCELLENT ';
            OptionMembers = " ","1-VERY POOR","2-POOR","3-FAIR","4-GOOD","5-EXCELLENT ";
        }
        field(7;"Additional Comments";Text[300])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Vacancy ID","Skills and Competency ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Requirement: Record "Recruitment Req Requirement";
}

