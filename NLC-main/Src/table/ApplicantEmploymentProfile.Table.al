#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193592 "Applicant Employment Profile"
{
    Caption = 'Applicant Employment Profile';
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
        field(3; Employer; Text[250])
        {
            Caption = 'Employer';
        }
        field(4; Contacts; Text[250])
        {
            Caption = 'Contacts';
        }
        field(5; Department; Text[250])
        {
            Caption = 'Department';
        }
        field(6; Position; Text[250])
        {
            Caption = 'Position';
        }
        field(7; StaffNumber; Text[250])
        {
            Caption = 'StaffNumber';
        }
        field(8; DateEmployed; Date)
        {
            Caption = 'DateEmployed';
        }
        field(9; DateLeft; Date)
        {
            Caption = 'DateLeft';
        }
        field(50001; "Position Type"; Text[100])
        {
            Caption = 'Position Type';
        }
        field(50002; "Current Salary"; Text[100])
        {
            Caption = 'Current Salary';
        }
        field(50003; "Description of Duties"; Text[250])
        {
            Caption = 'Description of Duties';
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
