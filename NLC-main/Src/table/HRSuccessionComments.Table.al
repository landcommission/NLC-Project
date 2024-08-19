#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193515 "HR Succession Comments"
{
    Caption = 'HR Succession Comments';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Position to Succed"; Code[10])
        {
            Caption = 'Position to Succed';
        }
        field(3; Comment; Text[200])
        {
            Caption = 'Comment';
        }
        field(4; Description; Text[200])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
