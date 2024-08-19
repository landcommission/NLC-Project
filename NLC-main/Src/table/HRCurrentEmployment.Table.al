#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193864 "HR Current Employment"
{
    Caption = 'HR Current Employment';
    DataClassification = CustomerContent;
    fields
    {
        field(1; JobID; Code[30])
        {
            Caption = 'JobID';
        }
        field(2; "Current Employer"; Text[250])
        {
            NotBlank = false;
            Caption = 'Current Employer';
        }
        field(3; Contacts; Text[200])
        {
            NotBlank = false;
            Caption = 'Contacts';
        }
        field(4; Department; Text[50])
        {
            NotBlank = false;
            Caption = 'Department';
        }
        field(5; "Position Held"; Text[150])
        {
            NotBlank = false;
            Caption = 'Position Held';
        }
        field(6; "Type Of Position"; Text[50])
        {
            Caption = 'Type Of Position';
        }
        field(7; Salary; Text[40])
        {
            Caption = 'Salary';
        }
        field(8; "Additional Benefits"; Text[150])
        {
            Caption = 'Additional Benefits';
        }
        field(9; "Acceptable Salary"; Text[40])
        {
            Caption = 'Acceptable Salary';
        }
        field(10; "Reason For Leaving"; Text[250])
        {
            Caption = 'Reason For Leaving';
        }
        field(11; "Contact Employer"; Boolean)
        {
            Caption = 'Contact Employer';
        }
        field(12; "Applicant No"; Integer)
        {
            Caption = 'Applicant No';
        }
        field(13; "Date Employed"; Date)
        {
            Caption = 'Date Employed';
        }
    }

    keys
    {
        key(Key1; JobID)
        {
            Clustered = true;
        }
        key(Key2; "Current Employer") { }
        key(Key3; Contacts) { }
        key(Key4; "Applicant No") { }
    }

    fieldgroups { }
}
