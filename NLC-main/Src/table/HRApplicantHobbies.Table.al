#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193463 "HR Applicant Hobbies"
{
    Caption = 'HR Applicant Hobbies';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Job Application No"; Code[20])
        {
            TableRelation = "HR Job Applications"."Job Application No.";
            Caption = 'Job Application No';
        }
        field(2; Hobby; Text[200])
        {
            Caption = 'Hobby';
        }
        field(3; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
        field(4; "Applicant No"; Text[30])
        {
            Caption = 'Applicant No';
        }
    }

    keys
    {
        key(Key1; "Job Application No", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
