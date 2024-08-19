#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193780 "Grants Lookup Values"
{
    DrillDownPageId = "Grants Lookup Values List";
    LookupPageId = "Grants Lookup Values List";
    Caption = 'Grants Lookup Values';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Type; Option)
        {
            OptionCaption = 'Sub Contractor Close Out Checklist,,Close Out Checklist';
            OptionMembers = "Sub Contractor Close Out Checklist",,"Close Out Checklist";
            Caption = 'Type';
        }
        field(2; "Code"; Code[70])
        {
            Caption = 'Code';
        }
        field(3; Description; Text[80])
        {
            Caption = 'Description';
        }
        field(4; Remarks; Text[250])
        {
            Caption = 'Remarks';
        }
        field(6; Closed; Boolean)
        {
            Caption = 'Closed';
        }
        field(7; "Order"; Integer)
        {
            Caption = 'Order';
        }
    }

    keys
    {
        key(Key1; "Order", Type, "Code")
        {
            Clustered = true;
        }

    }

    fieldgroups { }

}

