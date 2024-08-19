#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193844 "Inspection Line"
{
    Caption = 'Inspection Line';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Document No."; Code[10])
        {
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = false;
            Caption = 'Line No.';
        }
        field(3; "Delivery Note"; Code[10])
        {
            Caption = 'Delivery Note';
        }
        field(4; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(5; "Receipt Voucher No."; Code[10])
        {
            Caption = 'Receipt Voucher No.';
        }
        field(6; "Quantity Ordered"; Integer)
        {
            Caption = 'Quantity Ordered';
        }
        field(7; "Quantity Accepted"; Integer)
        {
            Caption = 'Quantity Accepted';
            trigger OnValidate()
            begin
                "Quantity Rejected" := "Quantity Ordered" - "Quantity Accepted";
            end;
        }
        field(8; "Quantity Rejected"; Integer)
        {
            Caption = 'Quantity Rejected';
            trigger OnValidate()
            begin
                "Quantity Accepted" := "Quantity Ordered" - "Quantity Rejected";
            end;
        }
        field(9; "Reason for Rejection"; Text[250])
        {
            Caption = 'Reason for Rejection';
        }
        field(10; "Rejection No."; Code[10])
        {
            Caption = 'Rejection No.';
        }
        field(11; "Purchase Order No."; Code[20])
        {
            Caption = 'Purchase Order No.';
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.", "Purchase Order No.", "Receipt Voucher No.")
        {
            Clustered = true;
        }

    }

    fieldgroups { }
}

