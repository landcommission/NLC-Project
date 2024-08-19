#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 69512 "Case Types"
{
    DrillDownPageId = "Case Types";
    LookupPageId = "Case Types";
    Caption = 'Case Types';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Case Nature"; Code[50])
        {
            TableRelation = "Nature of Cases".Code;
            Caption = 'Case Nature';
        }
        field(2; "Case Type"; Code[50])
        {
            Caption = 'Case Type';
        }
    }

    keys
    {
        key(Key1; "Case Nature", "Case Type")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}

