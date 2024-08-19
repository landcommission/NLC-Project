#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 69138 "Disciplinary Case Ratings"
{
    LookupPageId = "Overtime Subpage";
    Caption = 'Disciplinary Case Ratings';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[50])
        {
            NotBlank = true;
            Caption = 'Code';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; Comments; Text[200])
        {
            Caption = 'Comments';
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

