#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193655 "Cshmgt Cashier Transfer"
{
    Caption = 'Cshmgt Cashier Transfer';
    DataClassification = CustomerContent;
    //DrillDownPageID = UnknownPage39006063;
    //LookupPageID = UnknownPage39006063;

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(2; "Transfer Code"; Code[20])
        {
            Caption = 'Transfer Code';
        }
        field(3; "Transfer Date"; Date)
        {
            Caption = 'Transfer Date';
        }
        field(4; "Transfer Time"; Time)
        {
            Caption = 'Transfer Time';
        }
        field(5; "Account No."; Code[20])
        {
            Caption = 'Account No.';
        }
        field(6; "Interim Account"; Code[20])
        {
            Caption = 'Interim Account';
        }
        field(7; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(8; "Transfer UserID"; Code[20])
        {
            Caption = 'Transfer UserID';
        }
        field(9; "Transfer Machine"; Text[30])
        {
            Caption = 'Transfer Machine';
        }
        field(10; "Amount Receipted"; Decimal)
        {
            CalcFormula = sum("CshMgt Cashier Receipts".Amount where("Transfer Code" = field("Transfer Code")));
            FieldClass = FlowField;
            Caption = 'Amount Receipted';
            Editable = false;
        }
        field(11; "To Account No."; Code[20])
        {
            TableRelation = "Bank Account"."No.";
            Caption = 'To Account No.';
        }
        field(12; Rejected; Boolean)
        {
            Caption = 'Rejected';
        }
        field(13; "Rejected Date"; Date)
        {
            Caption = 'Rejected Date';
        }
        field(14; "Rejected Time"; Time)
        {
            Caption = 'Rejected Time';
        }
        field(15; "Rejected Machine"; Text[30])
        {
            Caption = 'Rejected Machine';
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
