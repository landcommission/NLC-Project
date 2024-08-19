#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193478 "HR OSAccident Line"
{
    Caption = 'HR OSAccident Line';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; "Accident No"; Code[10])
        {
            Caption = 'Accident No';
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Code", "Accident No")
        {
            Clustered = true;
        }
        key(Key2; "Accident No") { }
    }

    fieldgroups { }
}
