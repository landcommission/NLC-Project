#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193837 "Criteria Line"
{
    Caption = 'Criteria Line';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Vendor; Code[20])
        {
            Caption = 'Vendor';
        }
        field(2; Year; Integer)
        {
            Caption = 'Year';
        }
        field(3; "Minimum Scores"; Decimal)
        {
            Caption = 'Minimum Scores';
        }
        field(4; "Maximum Scores"; Decimal)
        {
            Caption = 'Maximum Scores';
        }
        field(5; "Assigned Weight"; Decimal)
        {
            Caption = 'Assigned Weight';
        }
        field(6; "Actual Scores"; Decimal)
        {
            Caption = 'Actual Scores';
        }
    }

    keys
    {
        key(Key1; Vendor)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
