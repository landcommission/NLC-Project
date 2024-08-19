#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193847 "Internal Return Lines"
{
    Caption = 'Internal Return Lines';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(3; "Item No."; Code[10])
        {
            TableRelation = Item;
            Caption = 'Item No.';
            trigger OnValidate()
            begin
                Item.Reset();
                Item.SetRange(Item."No.", "Item No.");
                if Item.Find('-') then
                    Description := Item.Description;
            end;
        }
        field(4; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(5; Quantity; Integer)
        {
            Caption = 'Quantity';
        }
        field(6; "Serial Number"; Code[20])
        {
            Caption = 'Serial Number';
        }
        field(7; "Batch Number"; Code[10])
        {
            Caption = 'Batch Number';
        }
        field(8; "Expiry Date"; Date)
        {
            Caption = 'Expiry Date';
        }
        field(9; "Reason for Return"; Text[50])
        {
            Caption = 'Reason for Return';
        }
        field(10; "Global Dimension 1"; Code[10])
        {
            Caption = 'Global Dimension 1';
        }
        field(11; "Global Dimension 2"; Code[10])
        {
            Caption = 'Global Dimension 2';
        }
        field(12; "Shortcut Dimension 1"; Code[10])
        {
            Caption = 'Shortcut Dimension 1';
        }
        field(13; "Shortcut Dimension 2"; Code[10])
        {
            Caption = 'Shortcut Dimension 2';
        }
        field(14; "Destination Store"; Text[30])
        {
            Caption = 'Destination Store';
        }
        field(15; "Gen. Prod. Posting Group"; Code[10])
        {
            TableRelation = "Gen. Product Posting Group";
            Caption = 'Gen. Prod. Posting Group';
        }
        field(16; "Gen. Bus. Posting Group"; Code[10])
        {
            TableRelation = "Gen. Business Posting Group";
            Caption = 'Gen. Bus. Posting Group';
        }
        field(17; "Request Status"; Option)
        {
            OptionCaption = ' ,Closed';
            OptionMembers = " ",Closed;
            Caption = 'Request Status';
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        Item: Record Item;
}
