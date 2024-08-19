#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193596 "Applicant Employment Details"
{
    Caption = 'Applicant Employment Details';
    DataClassification = CustomerContent;
    fields
    {
        field(10; No; Integer)
        {
            AutoIncrement = true;
            Caption = 'No';
        }
        field(20; ApplicantNo; Integer)
        {
            Caption = 'ApplicantNo';
        }
        field(30; Employer; Text[100])
        {
            Caption = 'Employer';
        }
        field(31; Contacts; Text[30])
        {
            Caption = 'Contacts';
        }
        field(32; "Current Salary"; Text[30])
        {
            Caption = 'Current Salary';
        }
        field(33; "Addtional Benefits"; Text[250])
        {
            Caption = 'Addtional Benefits';
        }
        field(34; "Acceptable Salary"; Text[30])
        {
            Caption = 'Acceptable Salary';
        }
        field(35; "Leaving Reason"; Text[250])
        {
            Caption = 'Leaving Reason';
        }
        field(36; "Contact Employer"; Option)
        {
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
            Caption = 'Contact Employer';
        }
        field(37; "Phone Number"; Code[20])
        {
            Caption = 'Phone Number';
        }
        field(38; Department; Text[100])
        {
            Caption = 'Department';
        }
        field(39; Position; Text[50])
        {
            Caption = 'Position';
        }
        field(40; "Type Of Position"; Text[50])
        {
            Caption = 'Type Of Position';
        }
        field(41; "Staff No"; Code[30])
        {
            Caption = 'Staff No';
        }
        field(42; "Date Employed"; Date)
        {
            Caption = 'Date Employed';
        }
        field(43; TypeOfPosCode; Code[10])
        {
            Caption = 'TypeOfPosCode';
        }
    }

    keys
    {
        key(Key1; ApplicantNo, Employer, No)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
