#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 56094 "Case Witnesses"
{
    Caption = 'Case Witnesses';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Case No"; Code[20])
        {
            Caption = 'Case No';
        }
        field(2; "ID No"; Code[20])
        {
            Caption = 'ID No';
        }
        field(3; "First Name"; Text[250])
        {
            Caption = 'First Name';
        }
        field(4; "Middle Name"; Text[250])
        {
            Caption = 'Middle Name';
        }
        field(5; "Last Name"; Text[250])
        {
            Caption = 'Last Name';
        }
        field(6; "Phone No."; Code[50])
        {
            Caption = 'Phone No.';
        }
        field(7; Title; Option)
        {
            OptionCaption = ' ,Mr,Mrs,Ms';
            OptionMembers = " ",Mr,Mrs,Ms;
            Caption = 'Title';
        }
        field(8; Designation; Text[250])
        {
            Caption = 'Designation';
        }
        field(9; Remarks; Text[250])
        {
            Caption = 'Remarks';
        }
        field(10; Comments; Text[250])
        {
            Caption = 'Comments';
        }
        field(11; Relationship; Text[250])
        {
            Caption = 'Relationship';
        }
        field(12; Type; Option)
        {
            OptionCaption = 'Plantif,Defendant';
            OptionMembers = Plantif,Defendant;
            Caption = 'Type';
        }
        field(13; Email; Text[30])
        {
            Caption = 'Email';
        }
        field(14; Address; Text[30])
        {
            Caption = 'Address';
        }
    }

    keys
    {
        key(Key1; "Case No", "ID No", Type)
        {
            Clustered = true;
        }
        key(Key2; "First Name") { }
        key(Key3; Title) { }
    }

    fieldgroups { }
}

