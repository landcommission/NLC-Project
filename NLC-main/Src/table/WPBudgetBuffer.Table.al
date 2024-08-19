#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193649 "W/P Budget Buffer"
{
    Caption = 'W/P Budget Buffer';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Workplan Code"; Code[20])
        {
            TableRelation = "G/L Account";
            Caption = 'Workplan Code';
        }
        field(2; "Dimension Value Code 1"; Code[20])
        {
            Caption = 'Dimension Value Code 1';
        }
        field(3; "Dimension Value Code 2"; Code[20])
        {
            Caption = 'Dimension Value Code 2';
        }
        field(4; "Dimension Value Code 3"; Code[20])
        {
            Caption = 'Dimension Value Code 3';
        }
        field(5; "Dimension Value Code 4"; Code[20])
        {
            Caption = 'Dimension Value Code 4';
        }
        field(6; "Dimension Value Code 5"; Code[20])
        {
            Caption = 'Dimension Value Code 5';
        }
        field(7; "Dimension Value Code 6"; Code[20])
        {
            Caption = 'Dimension Value Code 6';
        }
        field(8; "Dimension Value Code 7"; Code[20])
        {
            Caption = 'Dimension Value Code 7';
        }
        field(9; "Dimension Value Code 8"; Code[20])
        {
            Caption = 'Dimension Value Code 8';
        }
        field(10; Date; Date)
        {
            Caption = 'Date';
        }
        field(11; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';
        }
    }

    keys
    {
        key(Key1; "Workplan Code", "Dimension Value Code 1", "Dimension Value Code 2", "Dimension Value Code 3", "Dimension Value Code 4", "Dimension Value Code 5", "Dimension Value Code 6", "Dimension Value Code 7", "Dimension Value Code 8", Date)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
