#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193689 "Depreciation Tb Header Output"
{
    Caption = 'Depreciation Tb Header Output';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Depreciation Table"; Code[10])
        {
            Caption = 'Depreciation Table';
        }
        field(2; "Line Output"; Code[10])
        {
            Caption = 'Line Output';
            //TableRelation = Table50105;
        }
    }

    keys
    {
        key(Key1; "Depreciation Table", "Line Output")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
