#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193892 "PR Trans Codes Groups"
{
    Caption = 'PR Transaction Code Groups';
    DrillDownPageId = "PR Trans Codes Groups - List";
    LookupPageId = "PR Trans Codes Groups - List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Group Code"; Code[20])
        {
            Caption = 'Group Code';
        }
        field(2; "Group Description"; Text[100])
        {
            Caption = 'Group Description';
        }
    }

    keys
    {
        key(Key1; "Group Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        PRTransCode: Record "Bank Bal. Alert Buffer";
}
