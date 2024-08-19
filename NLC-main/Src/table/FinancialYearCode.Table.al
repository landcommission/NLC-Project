#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 65040 "Financial Year Code"
{
    DrillDownPageId = "Financial Year Code";
    LookupPageId = "Financial Year Code";
    Caption = 'Financial Year Code';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[50])
        {
            Caption = 'Code';
        }
        field(2; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(3; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
        }
        field(4; Active; Boolean)
        {
            Caption = 'Active';
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

