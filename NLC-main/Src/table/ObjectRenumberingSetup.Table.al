#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 70003 "Object Renumbering Setup"
{
    Caption = 'Object Renumbering Setup';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
        }
        field(2; "Database Name"; Text[30])
        {
            Caption = 'Database Name';
        }
        field(3; "Connnection String"; Text[250])
        {
            Caption = 'Connnection String';
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
