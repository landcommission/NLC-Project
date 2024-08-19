#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193838 "HR Comment Lines"
{
    Caption = 'HR Comment Lines';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
        field(2; "Application Code"; Code[20])
        {
            Caption = 'Application Code';
        }
        field(3; "Applicant Comments"; Text[250])
        {
            Caption = 'Applicant Comments';
        }
        field(4; "Approver Comments"; Text[250])
        {
            Caption = 'Approver Comments';
        }
        field(5; "User ID"; Text[30])
        {
            Caption = 'User ID';
        }
        field(6; "Employee No"; Text[30])
        {
            Caption = 'Employee No';
        }
        field(7; "Date Modified"; DateTime)
        {
            Caption = 'Date Modified';
        }
        field(8; "Approver Name"; Text[250])
        {
            Caption = 'Approver Name';
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
