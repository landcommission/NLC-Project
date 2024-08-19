#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 69140 "Disciplinary Cases"
{
    LookupPageId = "Disciplinary Cases";
    Caption = 'Disciplinary Cases';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
            Caption = 'Code';
        }
        field(2; Description; Text[200])
        {
            Caption = 'Description';
        }
        field(3; Rating; Code[50])
        {
            TableRelation = "Disciplinary Case Ratings".Code;
            Caption = 'Rating';
        }
        field(4; Comments; Text[200])
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

