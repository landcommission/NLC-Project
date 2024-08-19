#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193661 "NAV Applicant Relevant Docs"
{
    Caption = 'NAV Applicant Relevant Docs';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Applicant No"; Integer)
        {
            Caption = 'Applicant No';
        }
        field(2; "Job Application No"; Code[100])
        {
            Caption = 'Job Application No';
        }
        field(3; "Helb Certificate"; Boolean)
        {
            Caption = 'Helb Certificate';
        }
        field(4; "Good Conduct Certificate"; Boolean)
        {
            Caption = 'Good Conduct Certificate';
        }
        field(5; "CRB Certificate"; Boolean)
        {
            Caption = 'CRB Certificate';
        }
        field(6; "EACC Certificate"; Boolean)
        {
            Caption = 'EACC Certificate';
        }
        field(7; "KRA Pin Certificate"; Boolean)
        {
            Caption = 'KRA Pin Certificate';
        }
        field(8; "Date Modified"; Date)
        {
            Caption = 'Date Modified';
        }
        field(9; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
    }

    keys
    {
        key(Key1; "Job Application No", "Applicant No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
