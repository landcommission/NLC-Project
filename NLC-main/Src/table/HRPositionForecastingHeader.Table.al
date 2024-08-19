#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193517 "HR Position Forecasting Header"
{
    Caption = 'HR Position Forecasting Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Region; Code[20])
        {
            Caption = 'Region';
        }
        field(2; Department; Code[20])
        {
            Caption = 'Department';
        }
    }

    keys
    {
        key(Key1; Region)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
