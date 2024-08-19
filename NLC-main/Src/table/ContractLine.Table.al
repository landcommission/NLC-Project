#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193845 "Contract Line"
{
    Caption = 'Contract Line';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Document No."; Code[10])
        {
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; Detail; Text[30])
        {
            Caption = 'Detail';
        }
        field(4; Description; Text[200])
        {
            Caption = 'Description';
        }
        field(5; "Amount Awarded"; Decimal)
        {
            Caption = 'Amount Awarded';
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.", Detail, Description)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
