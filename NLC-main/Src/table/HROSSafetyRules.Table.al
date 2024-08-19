#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193481 "HR OSSafety Rules"
{
    Caption = 'HR OSSafety Rules';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Safety No"; Code[10])
        {
            Caption = 'Safety No';
        }
        field(2; "Safety Rules"; Text[200])
        {
            Caption = 'Safety Rules';
        }
        field(3; "Accident No."; Code[10])
        {
            TableRelation = "HR OSAccident"."Accident No";
            Caption = 'Accident No.';
        }
    }

    keys
    {
        key(Key1; "Safety No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
