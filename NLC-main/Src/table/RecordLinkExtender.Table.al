table 50004 "RecordLink Extender"
{
    Caption = 'RecordLink Extender';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Link ID"; Integer)
        {
            Caption = 'Link ID';
        }
        field(2; "Document No"; Code[50])
        {
            Caption = 'Document No';
        }

    }

    keys
    {
        key(PK; "Link ID")
        {
            Clustered = true;
        }
    }

}
