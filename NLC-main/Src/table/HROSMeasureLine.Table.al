#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193479 "HR OSMeasure Line"
{
    Caption = 'HR OSMeasure Line';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; "Measure No"; Code[10])
        {
            Caption = 'Measure No';
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Code", "Measure No")
        {
            Clustered = true;
        }
        key(Key2; "Measure No") { }
    }

    fieldgroups { }
}
