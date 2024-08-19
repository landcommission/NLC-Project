#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193467 "HR Calendar"
{
    Caption = 'HR Calendar';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; "Created By"; Text[100])
        {
            Caption = 'Created By';
        }
        field(3; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(4; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(5; Current; Boolean)
        {
            Caption = 'Current';
        }
        field(6; Description; Text[100])
        {
            Caption = 'Description';
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
