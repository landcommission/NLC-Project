#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193833 "Ampath Data Source Forms"
{
    Caption = 'Ampath Data Source Forms';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(2; "Inv. code"; Code[10])
        {
            Caption = 'Inv. code';
        }
        field(3; "Ampath Source Form"; Text[100])
        {
            Caption = 'Ampath Source Form';
        }
    }

    keys
    {
        key(Key1; "Line No.", "Inv. code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
