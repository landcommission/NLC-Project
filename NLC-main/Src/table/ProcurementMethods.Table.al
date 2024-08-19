#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193540 "Procurement Methods"
{
    Caption = 'Procurement Methods';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
            Caption = 'Code';
        }
        field(2; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(3; "Invite/Advertise date"; Date)
        {
            Caption = 'Invite/Advertise date';
        }
        field(4; "Invite/Advertise period"; DateFormula)
        {
            Caption = 'Invite/Advertise period';
        }
        field(5; "Open tender period"; Integer)
        {
            Caption = 'Open tender period';
        }
        field(6; "Evaluate tender period"; Integer)
        {
            Caption = 'Evaluate tender period';
        }
        field(7; "Committee period"; Integer)
        {
            Caption = 'Committee period';
        }
        field(8; "Notification period"; Integer)
        {
            Caption = 'Notification period';
        }
        field(9; "Contract period"; Integer)
        {
            Caption = 'Contract period';
        }
        field(11; "Planned Date"; Date)
        {
            Caption = 'Planned Date';
        }
        field(12; "Planned Days"; DateFormula)
        {
            Caption = 'Planned Days';
        }
        field(13; "Actual Days"; DateFormula)
        {
            Caption = 'Actual Days';
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
