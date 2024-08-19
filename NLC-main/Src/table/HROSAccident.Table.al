#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193477 "HR OSAccident"
{
    Caption = 'HR OSAccident';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Accident No"; Code[10])
        {
            Caption = 'Accident No';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Accident No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
