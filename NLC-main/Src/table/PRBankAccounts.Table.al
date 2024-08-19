#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193526 "PR Bank Accounts"
{
    DrillDownPageId = "PR Bank Accounts";
    LookupPageId = "PR Bank Accounts";
    Caption = 'PR Bank Accounts';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Bank Code"; Code[20])
        {
            Caption = 'Bank Code';
        }
        field(2; "Bank Name"; Text[100])
        {
            Caption = 'Bank Name';
        }
    }

    keys
    {
        key(Key1; "Bank Code")
        {
            Clustered = true;
        }
        key(Key2; "Bank Name") { }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Bank Code", "Bank Name") { }
    }
}
