#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193776 "PI Master"
{
    DrillDownPageId = "PI List";
    LookupPageId = "PI List";
    Caption = 'PI Master';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "PI Code"; Code[50])
        {
            Caption = 'PI Code';
        }
        field(2; "PI Name"; Text[100])
        {
            Caption = 'PI Name';
        }
        field(3; "Colabotative Institution"; Text[100])
        {
            Caption = 'Colabotative Institution';
        }
        field(4; "PI Address"; Text[30])
        {
            Caption = 'PI Address';
        }
        field(5; "PI Telephone"; Text[30])
        {
            ExtendedDatatype = PhoneNo;
            Caption = 'PI Telephone';
        }
        field(6; "PI EMail"; Text[30])
        {
            ExtendedDatatype = EMail;
            Caption = 'PI EMail';
        }
    }

    keys
    {
        key(Key1; "PI Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "PI Code", "PI Name", "Colabotative Institution") { }
    }
}
