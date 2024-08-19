#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193682 "Quote Specifications"
{
    LookupPageId = "Quote Specifications List";
    Caption = 'Quote Specifications';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[60])
        {
            Caption = 'Description';
        }
        field(3; "Value/Weight"; Decimal)
        {
            Caption = 'Value/Weight';
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
