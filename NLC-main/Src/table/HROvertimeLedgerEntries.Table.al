#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193888 "HR Overtime Ledger Entries"
{
    Caption = 'Leave Ledger Entry';
    DrillDownPageId = "HR Leave Ledger Entries";
    LookupPageId = "HR Leave Ledger Entries";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
        field(2; "Staff No."; Code[20])
        {
            Caption = 'Staff No.';
        }
        field(3; "Staff Name"; Text[70])
        {
            Caption = 'Staff Name';
        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(7; Hours; Decimal)
        {
            Caption = 'Hours';
        }
        field(8; Posted; Boolean)
        {
            Caption = 'Posted';
        }
        field(9; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(10; "Date Approved"; Date)
        {
            Caption = 'Date Approved';
        }
        field(11; "Document No."; Code[10])
        {
            Caption = 'Document No.';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", "Staff No.", "Posting Date") { }
    }
}
