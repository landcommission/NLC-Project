#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193651 "Loader Group"
{
    DrillDownPageId = "Tender Plan Header";
    LookupPageId = "Tender Plan Header";
    Caption = 'Loader Group';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Loader Group Code"; Code[20])
        {
            NotBlank = true;
            Caption = 'Loader Group Code';
        }
        field(2; "Group Name"; Text[30])
        {
            Caption = 'Group Name';
        }
    }

    keys
    {
        key(Key1; "Loader Group Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
