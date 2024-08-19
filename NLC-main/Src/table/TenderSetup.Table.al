#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193824 "Tender Setup"
{
    DrillDownPageId = "Tender Setup List";
    LookupPageId = "Tender Setup List";
    Caption = 'Tender Setup';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Setup; Code[20])
        {
            Caption = 'Setup';
        }
        field(2; "Non Refundable Fee"; Decimal)
        {
            Caption = 'Non Refundable Fee';
        }
        field(3; "From Time"; DateTime)
        {
            Caption = 'From Time';
        }
        field(4; "To Time"; DateTime)
        {
            Caption = 'To Time';
        }
        field(5; Period; Text[100])
        {
            Caption = 'Period';
        }
        field(6; "Opening Date"; Text[100])
        {
            Caption = 'Opening Date';
        }
    }

    keys
    {
        key(Key1; Setup)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
