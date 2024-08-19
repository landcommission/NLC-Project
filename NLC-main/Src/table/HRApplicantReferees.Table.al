#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193462 "HR Applicant Referees"
{
    Caption = 'HR Applicant Referees';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Job Application No"; Code[20])
        {
            TableRelation = "HR Job Applications"."Job Application No.";
            Caption = 'Job Application No';
        }
        field(2; Names; Text[250])
        {
            Caption = 'Names';
        }
        field(3; Designation; Text[250])
        {
            Caption = 'Designation';
        }
        field(4; Institution; Text[250])
        {
            Caption = 'Institution';
        }
        field(5; Address; Text[250])
        {
            Caption = 'Address';
        }
        field(6; "Telephone No"; Text[250])
        {
            Caption = 'Telephone No';
        }
        field(7; "E-Mail"; Text[100])
        {
            Caption = 'E-Mail';
        }
        field(8; "Employee No"; Integer)
        {
            Caption = 'Employee No';
        }
        field(9; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
    }

    keys
    {
        key(Key1; "Job Application No", "Telephone No", "E-Mail")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
