#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193653 "Cshmgt PV Audit"
{
    Caption = 'Cshmgt PV Audit';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "PV No."; Code[20])
        {
            Caption = 'PV No.';
        }
        field(2; "PV Date"; Date)
        {
            Caption = 'PV Date';
        }
        field(3; "PV Creator"; Code[20])
        {
            Caption = 'PV Creator';
        }
        field(4; Status; Code[20])
        {
            Caption = 'Status';
        }
        field(5; "Status Date"; Date)
        {
            Caption = 'Status Date';
        }
        field(6; "Status Time"; Time)
        {
            Caption = 'Status Time';
        }
        field(7; "Status Machine"; Text[30])
        {
            Caption = 'Status Machine';
        }
        field(8; "Status Effect User"; Code[20])
        {
            Caption = 'Status Effect User';
        }
        field(9; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
