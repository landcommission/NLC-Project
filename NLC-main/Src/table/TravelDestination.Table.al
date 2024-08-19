#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193617 "Travel Destination"
{
    DrillDownPageId = "Destination Code List";
    LookupPageId = "Destination Code List";
    Caption = 'Travel Destination';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Destination Code"; Code[20])
        {
            NotBlank = true;
            Caption = 'Destination Code';
        }
        field(2; "Destination Name"; Text[50])
        {
            Caption = 'Destination Name';
        }
        field(3; "Destination Type"; Option)
        {
            OptionMembers = "Local",Foreign;
            Caption = 'Destination Type';
        }
        field(4; Currency; Code[10])
        {
            CalcFormula = lookup("Destination Rate Entry".Currency where("Destination Code" = field("Destination Code")));
            FieldClass = FlowField;
            Caption = 'Currency';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Destination Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
