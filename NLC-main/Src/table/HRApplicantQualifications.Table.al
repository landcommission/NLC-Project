#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193461 "HR Applicant Qualifications"
{
    Caption = 'HR Applicant Qualifications';
    DataCaptionFields = "Employee No.";
    DrillDownPageId = "HR Leave Documents";
    LookupPageId = "HR Leave Documents";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Application No"; Code[20])
        {
            Caption = 'Application No';
            TableRelation = "HR Job Applications"."Job Application No.";
        }
        field(2; "Employee No."; Integer)
        {
            Caption = 'Employee No.';
            NotBlank = true;
        }
        field(3; "Qualification Description"; Code[250])
        {
            Caption = 'Qualification Description';
            NotBlank = true;

        }
        field(4; "Start Date"; Date)
        {
            Caption = 'From Date';
        }
        field(5; "End Date"; Date)
        {
            Caption = 'To Date';
        }
        field(7; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(8; "Institution/Company"; Text[250])
        {
            Caption = 'Institution/Company';
        }
        field(10; "Course Grade"; Text[250])
        {
            Caption = 'Course Grade';
        }
        field(11; "Employee Status"; Option)
        {
            Caption = 'Employee Status';
            Editable = false;
            OptionCaption = 'Active,Inactive,Terminated';
            OptionMembers = Active,Inactive,Terminated;
        }
        field(13; "Expiration Date"; Date)
        {
            Caption = 'Expiration Date';
        }
        field(14; "Qualification Type"; Code[250])
        {
            NotBlank = false;
            TableRelation = "HR Lookup Values".Code where(Type = filter("Qualification Type"));
            Caption = 'Qualification Type';
        }
        field(15; "Qualification Code"; Text[30])
        {
            NotBlank = true;
            TableRelation = "HR Job Qualifications".Code where("Qualification Type" = field("Qualification Type"));
            Caption = 'Qualification Code';
            trigger OnValidate()
            begin
                if HRQualifications.Get("Qualification Type", "Qualification Code") then
                    "Qualification Description" := HRQualifications.Description;
            end;
        }
        field(16; "Score ID"; Decimal)
        {
            Caption = 'Score ID';
        }
        field(17; "Qualification Grade"; Code[50])
        {
            Caption = 'Qualification Grade';
        }
        field(18; JobID; Code[100])
        {
            Caption = 'JobID';
        }
        field(19; RenewableDate; Date)
        {
            Caption = 'RenewableDate';
        }
        field(20; Category; Option)
        {
            //CalcFormula = lookup("HR Job Qualifications".Category where(Code = field("Qualification Code")));
            Editable = false;
            // FieldClass = FlowField;
            Caption = 'Category';
            OptionCaption = ',Academic,Professional,Skills & Competencies,Experience,Ethics & Integrity,Physical Attributes,Proffessional Bodies';
            OptionMembers = ,Academic,Professional,"Skills & Competencies",Experience,"Ethics & Integrity","Physical Attributes","Proffessional Bodies";
        }
        field(21; RenewalDate; Date)
        {
            Caption = 'RenewalDate';
        }
        field(22; "Qualification Type Description"; Text[100])
        {
            CalcFormula = lookup("HR Lookup Values".Description where(Code = field("Qualification Type")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Qualification Type Description';
        }
        field(23; "Brief Description Of The Group"; Text[100])
        {
            Caption = 'Brief Description Of The Group';
        }
        field(24; "Other Grade"; Boolean)
        {
            Caption = 'Other Grade';
        }
        field(25; "Country Code"; Text[250])
        {
            Caption = 'Country Code';
        }
        field(26; Status; Text[50])
        {
            Caption = 'Status';
        }
    }

    keys
    {
        key(Key1; "Application No", "Qualification Type", "Qualification Code", "Employee No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        HRQualifications: Record "HR Job Qualifications";
        Applicant: Record "HR Job Applications";
        Position: Code[20];
        JobReq: Record "HR Job Requirements";
}
