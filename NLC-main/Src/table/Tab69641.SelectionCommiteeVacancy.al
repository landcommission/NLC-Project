#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69641 "Selection Commitee Vacancy"
{
    // DrillDownPageID = "Selection Committee Vacancy";
    // LookupPageID = "Selection Committee Vacancy";

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Appointment,Termination';
            OptionMembers = Appointment,Termination;
        }
        field(3; "Vacancy ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Requisition Header" where("Document Type" = filter("Job Vacancy"));

            trigger OnValidate()
            begin
                if RecruitmentRequisitionHeader.Get("Vacancy ID") then begin
                    "Position ID" := RecruitmentRequisitionHeader."Position ID";
                    "Job Title/Designation" := RecruitmentRequisitionHeader."Job Title/Designation";
                    "Duty Station ID" := RecruitmentRequisitionHeader."Duty Station ID";
                    "Work Location Details" := RecruitmentRequisitionHeader."Work Location Details";
                    "No. of Openings" := RecruitmentRequisitionHeader."No of Openings";
                end
            end;
        }
        field(4; "Position ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Job Title/Designation"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Duty Station ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Work Location Details"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "No. of Openings"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RecruitmentRequisitionHeader: Record "Recruitment Requisition Header";
}

