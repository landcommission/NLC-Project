#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 56097 "Company Judges"
{
    Caption = 'Company Judges';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; "ID No"; Code[20])
        {
            Caption = 'ID No';
        }
        field(3; "First Name"; Text[100])
        {
            Caption = 'First Name';
        }
        field(4; "Middle Name"; Text[100])
        {
            Caption = 'Middle Name';
        }
        field(5; "Last Name"; Text[100])
        {
            Caption = 'Last Name';
        }
        field(6; Gender; Option)
        {
            OptionCaption = 'Female,Male';
            OptionMembers = Female,Male;
            Caption = 'Gender';
        }
        field(7; Contact; Code[20])
        {
            Caption = 'Contact';
        }
        field(8; Designation; Code[20])
        {
            Caption = 'Designation';
        }
        field(9; Comments; Text[30])
        {
            Caption = 'Comments';
        }
        field(10; Remarks; Text[30])
        {
            Caption = 'Remarks';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}

