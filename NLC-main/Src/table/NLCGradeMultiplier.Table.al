table 50010 "NLC Grade Multiplier"
{
    Caption = 'NLC Grade Multiplier';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(2; Multiplier; Decimal)
        {
            Caption = 'Multiplier';
        }
        field(3; "Entry No"; Integer)
        {
            Caption = 'Entry No';
            AutoIncrement = true;
        }
    }
    keys
    {
        key(PK; "Entry No")
        {
            Clustered = true;
        }
    }
}
