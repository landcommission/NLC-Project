#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193591 "Applicant Education Background"
{
    Caption = 'Applicant Education Background';
    DataClassification = CustomerContent;
    fields
    {
        field(1; ID; Integer)
        {
            AutoIncrement = true;
            Caption = 'ID';
        }
        field(2; ApplicantNo; Integer)
        {
            Caption = 'ApplicantNo';
        }
        field(3; InstitutionName; Text[250])
        {
            Caption = 'InstitutionName';
        }
        field(4; StartDate; Date)
        {
            Caption = 'StartDate';
        }
        field(5; EndDate; Date)
        {
            Caption = 'EndDate';
        }
        field(6; Qualifications; Text[250])
        {
            Caption = 'Qualifications';
        }
        field(7; QualificationDescr; Text[200])
        {
            Caption = 'QualificationDescr';
        }
        field(8; QualificationType; Text[150])
        {
            Caption = 'QualificationType';
        }
        field(9; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(10; QualificationsCode; Code[150])
        {
            Caption = 'QualificationsCode';
        }
        field(11; QualificationTypeCode; Code[150])
        {
            Caption = 'QualificationTypeCode';
        }
        field(12; Category; Option)
        {
            Caption = 'Category';
            OptionCaption = ',Academic,Professional,Skills & Competencies,Experience,Ethics & Integrity,Physical Attributes,Proffessional Bodies';
            OptionMembers = ,Academic,Professional,"Skills & Competencies",Experience,"Ethics & Integrity","Physical Attributes","Proffessional Bodies";
        }
        field(50000; RandomMapperEduBackGr; Text[250])
        {
            Caption = 'RandomMapperEduBackGr';
        }
        field(50001; QualificationGrade; Code[50])
        {
            Caption = 'QualificationGrade';
        }
        field(50002; RenewalDate; Date)
        {
            Caption = 'RenewalDate';
        }
        field(50003; "Other Grade"; Boolean)
        {
            Caption = 'Other Grade';
        }
        field(50004; "Country Code"; Text[250])
        {
            Caption = 'Country Code';
        }
        field(50005; Status; Text[50])
        {
            Caption = 'Status';
        }
        field(50006; FileUrl; Text[250])
        {
            Caption = 'FileUrl';
        }
    }

    keys
    {
        key(Key1; ID)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
