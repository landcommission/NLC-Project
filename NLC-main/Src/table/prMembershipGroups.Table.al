#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193549 "prMembership Groups"
{
    DrillDownPageId = "Imprest Details";
    LookupPageId = "Imprest Details";
    Caption = 'prMembership Groups';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Group No"; Code[10])
        {
            Caption = 'Group No';
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
        key(Key1; "Group No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
