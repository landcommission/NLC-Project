#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193685 "Purchase Committments"
{
    Caption = 'Purchase Committments';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = false;
            Caption = 'Line No.';
        }
        field(2; Date; Date)
        {
            Caption = 'Date';
        }
        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(4; "Document Type"; Option)
        {
            OptionMembers = LPO,Requisition,Imprest,"Payment Voucher",PettyCash,PurchInvoice;
            Caption = 'Document Type';
        }
        field(5; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(6; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(7; "Month Budget"; Decimal)
        {
            Caption = 'Month Budget';
        }
        field(8; "Month Actual"; Decimal)
        {
            Caption = 'Month Actual';
        }
        field(9; Committed; Boolean)
        {
            Caption = 'Committed';
        }
        field(10; "Committed By"; Code[20])
        {
            Caption = 'Committed By';
        }
        field(11; "Committed Date"; Date)
        {
            Caption = 'Committed Date';
        }
        field(12; "Committed Time"; Time)
        {
            Caption = 'Committed Time';
        }
        field(13; "Committed Machine"; Text[100])
        {
            Caption = 'Committed Machine';
        }
        field(14; Cancelled; Boolean)
        {
            Caption = 'Cancelled';
        }
        field(15; "Cancelled By"; Code[20])
        {
            Caption = 'Cancelled By';
        }
        field(16; "Cancelled Date"; Date)
        {
            Caption = 'Cancelled Date';
        }
        field(17; "Cancelled Time"; Time)
        {
            Caption = 'Cancelled Time';
        }
        field(18; "Cancelled Machine"; Text[100])
        {
            Caption = 'Cancelled Machine';
        }
        field(19; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
        }
        field(20; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
        }
        field(21; "Shortcut Dimension 3 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 3 Code';
        }
        field(22; "Shortcut Dimension 4 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 4 Code';
        }
        field(23; "G/L Account No."; Code[20])
        {
            Caption = 'G/L Account No.';
        }
        field(24; Budget; Code[20])
        {
            Caption = 'Budget';
        }
        field(25; "Vendor/Cust No."; Code[20])
        {
            Caption = 'Vendor/Cust No.';
        }
        field(26; Type; Option)
        {
            OptionMembers = " ",Vendor,Customer;
            Caption = 'Type';
        }
        field(27; "Document Line No."; Integer)
        {
            Caption = 'Document Line No.';
        }
        field(28; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(29; "Item No."; Code[10])
        {
            Caption = 'Item No.';
        }
        field(30; Posted; Boolean)
        {
            Description = 'Has the entry been posted to the ledger??or for RFQ if it has been converted into an quote the order';
            Caption = 'Posted';
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
        key(Key2; Budget, "Item No.", Date, "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", Posted)
        {
            SumIndexFields = Quantity;
        }
    }

    fieldgroups { }
}
