#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69722 "Background Checks Reference"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Applications" where ("Vacancy Id"=field("Vacancy Id"));
        }
        field(3;"Referee Id";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Application Referees"."Line No." where ("Application No."=field("Application No."));

            trigger OnValidate()
            begin
                ApplicationReferees.Reset;
                ApplicationReferees.SetRange("Application No.","Application No.");
                ApplicationReferees.SetRange("Line No.","Referee Id");
                if ApplicationReferees.FindFirst then begin
                  "Referee Type":=ApplicationReferees."Rererence Type";
                  Name:=ApplicationReferees.Name;
                  "Title/Designation":=ApplicationReferees."Designation/Title";
                  Institution:=ApplicationReferees.Institution;
                  "Phone No.":=ApplicationReferees."Phone No.";
                  Email:=ApplicationReferees."E-Mail";
                  end
            end;
        }
        field(4;"Referee Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Previous Employer,Current Employer,Other Referee';
            OptionMembers = " ","Previous Employer","Current Employer","Other Referee";
        }
        field(5;Name;Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Title/Designation";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Institution;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Phone No.";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Email;Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"Lead HR Officer";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No.";
        }
        field(11;"Invited for Detailed Recommend";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Invited On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Referee Recomm Report ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Referee Recommendation";
        }
        field(14;"Recommended for Hire";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Vacancy Id";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Requisition Header";
        }
        field(16;"No. Series";Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Application No.","Referee Id","Vacancy Id")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ApplicationReferees: Record "Application Referees";
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

