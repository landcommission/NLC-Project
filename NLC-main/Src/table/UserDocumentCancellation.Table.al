#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193657 "User Document Cancellation"
{
    Caption = 'User Document Cancellation';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Document Area"; Option)
        {
            NotBlank = true;
            OptionMembers = " ",Purchase,Sale,Transfers;
            Caption = 'Document Area';
        }
        field(2; "Document Type"; Option)
        {
            NotBlank = true;
            OptionMembers = " ","Order",Invoice,"Cash Sale","Credit Memo","Return Order","Transfer Order";
            Caption = 'Document Type';
        }
    }

    keys
    {
        key(Key1; "Document Area", "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
