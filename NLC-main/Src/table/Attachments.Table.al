#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 50002 Attachments
{
    Caption = 'Attachments';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Document_No; Text[50])
        {
            Caption = 'Document_No';
        }
        field(2; Link; Text[250])
        {
            ExtendedDatatype = URL;
            Caption = 'Link';
        }
        field(3; Module; Text[100])
        {
            Caption = 'Module';
        }
        field(4; FileType; Text[50])
        {
            Caption = 'FileType';
        }
        field(5; User; Text[100])
        {
            Caption = 'User';
        }
        field(6; FileName; Text[250])
        {
            Caption = 'FileName';
        }
        field(7; DocumentID; Text[100])
        {
            Caption = 'DocumentID';
        }
        field(8; Order_No; Text[50])
        {
            Caption = 'Order_No';
        }
    }

    keys
    {
        key(Key1; Document_No)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
