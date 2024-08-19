#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193820 "Tender Header Specification"
{
    Caption = 'Tender Header Specification';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';

        }
        field(2; Specification; Text[100])
        {
            Editable = true;
            Caption = 'Specification';
        }
        field(3; Value; Decimal)
        {
            Caption = 'Value';
        }
        field(4; "Tender No."; Code[20])
        {
            Caption = 'Tender No.';
        }
        field(5; "PIN No."; Code[20])
        {
            Editable = false;
            Caption = 'PIN No.';
        }
        field(6; "Receipt No."; Code[20])
        {
            Editable = false;
            Caption = 'Receipt No.';
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
