#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69723 "Referee Recommendation"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Background Checks Invitation";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Background Checks Header";

            trigger OnValidate()
            begin
                BackgroundChecksHeader.Reset;
                BackgroundChecksHeader.SetRange("Document No.","Background Checks Invitation");
                if BackgroundChecksHeader.FindFirst then begin
                  "Application No.":=BackgroundChecksHeader."Application No.";
                  Description:='Background Check ';
                  "Document Date":=Today;
                  Validate("Application No.");
                end
            end;
        }
        field(3;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Job Applications";

            trigger OnValidate()
            begin
                JobApplications.Reset;
                JobApplications.SetRange("Application No.","Application No.");
                if JobApplications.FindFirst then begin
                  "Vacancy ID":=JobApplications."Vacancy Id";
                  "Candidate No.":=JobApplications."Candidate No.";
                  Validate("Candidate No.");

                  end
            end;
        }
        field(4;"Vacancy ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Lead HR Officer";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Officers";
        }
        field(6;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7;"Candidate No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Applicant;

            trigger OnValidate()
            begin
                Applicant.Reset;
                Applicant.SetRange("Candidate No.","Candidate No.");
                if Applicant.FindFirst then begin
                  "First Name":=Applicant."First Name";
                  "Middle Name":=Applicant."Middle Name";
                  "Last Name":=Applicant."Last Name";
                  end
            end;
        }
        field(8;"First Name";Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9;"Middle Name";Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"Last Name";Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;"Referee Id";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Application Referees"."Line No." where ("Application No."=field("Application No."));

            trigger OnValidate()
            begin
                ApplicationReferees.Reset;
                ApplicationReferees.SetRange("Application No.","Application No.");
                ApplicationReferees.SetRange("Line No.","Referee Id");
                if ApplicationReferees.FindFirst then begin

                  Name:=ApplicationReferees.Name;
                  "Title/Designation":=ApplicationReferees."Designation/Title";
                  Institution:=ApplicationReferees.Institution;
                  "Phone No.":=ApplicationReferees."Phone No.";
                  Email:=ApplicationReferees."E-Mail";
                  end
            end;
        }
        field(12;Name;Text[150])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13;"Title/Designation";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14;Institution;Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15;"Phone No.";Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16;Email;Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17;"Known From";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Known To";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Candidate Last Job Title";Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Staff Exit Reason Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Recommend For Hire";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22;Description;Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(23;"No. Series";Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        HumanResourcesSetup.Get;
          HumanResourcesSetup.TestField("Referee Recomm Nos.");
          if "Document No."='' then
          NoSeriesMgt.InitSeries(HumanResourcesSetup."Referee Recomm Nos.",xRec."No. Series",0D,"Document No.","No. Series");
    end;

    var
        JobApplications: Record "Job Applications";
        Applicant: Record Applicant;
        ApplicationReferees: Record "Application Referees";
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        BackgroundChecksHeader: Record "Background Checks Header";
}

