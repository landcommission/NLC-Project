#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193798 "Contract Types"
{
    DrillDownPageId = "Contract Type";
    LookupPageId = "Contract Type";
    Caption = 'Contract Types';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Contract Code"; Code[50])
        {
            Caption = 'Contract Code';
        }
        field(2; "Contract Name"; Text[100])
        {
            Caption = 'Contract Name';
        }
        field(3; "Contract Cycle"; Code[50])
        {
            TableRelation = "Contract Cycle".Code;
            Caption = 'Contract Cycle';
        }
    }

    keys
    {
        key(Key1; "Contract Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
