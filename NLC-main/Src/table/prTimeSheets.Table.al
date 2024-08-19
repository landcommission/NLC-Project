#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193548 prTimeSheets
{
    Caption = 'prTimeSheets';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Schedule Code"; Text[30])
        {
            Caption = 'Schedule Code';
        }
        field(2; "Primary File Path"; Text[150])
        {
            Caption = 'Primary File Path';
        }
        field(3; "Secondary File Path"; Text[150])
        {
            Caption = 'Secondary File Path';
        }
        field(4; "Delete After Import"; Boolean)
        {
            Caption = 'Delete After Import';
        }
    }

    keys
    {
        key(Key1; "Schedule Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
