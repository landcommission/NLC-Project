#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193444 "HR Employee Course of Study"
{
    Caption = 'HR Employee Course of Study';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[50])
        {
            Description = 'Code';
            Caption = 'Code';
        }
        field(2; Description; Text[75])
        {
            Description = 'Description';
            Caption = 'Description';
        }
        field(3; "Years of Study"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Description = 'Years of Study';
            Caption = 'Years of Study';
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
