#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193639 "Pending Voucher Entry"
{
    DrillDownPageId = "Item/Cash Requisition Card";
    LookupPageId = "Item/Cash Requisition Card";
    Caption = 'Pending Voucher Entry';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Pending Voucher No."; Code[20])
        {
            Caption = 'Pending Voucher No.';

        }
        field(2; "Pending Voucher Date"; Date)
        {
            Caption = 'Pending Voucher Date';
        }
        field(3; "Pending Voucher Type"; Option)
        {
            OptionMembers = Issued,Surrendered;
            Caption = 'Pending Voucher Type';
        }
        field(4; "Employee No."; Code[20])
        {
            TableRelation = "HR Job Responsiblities";
            Caption = 'Employee No.';
        }
        field(5; "Pending Voucher Amount"; Decimal)
        {
            Caption = 'Pending Voucher Amount';
        }
        field(6; User; Code[20])
        {
            Caption = 'User';
        }
        field(11; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
        field(24; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(25; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(26; "Amount Due"; Decimal)
        {
            CalcFormula = sum("Pending Voucher Entry"."Pending Voucher Amount" where("Pending Voucher No." = field("Pending Voucher No."),
                                                                                      "Employee No." = field("Employee No.")));
            FieldClass = FlowField;
            Caption = 'Amount Due';
            Editable = false;
        }
        field(27; "Bank Code"; Code[20])
        {
            Editable = false;
            Caption = 'Bank Code';
        }
    }

    keys
    {
        key(Key1; "Pending Voucher No.", "Entry No", "Employee No.", "Bank Code")
        {
            Clustered = true;
            SumIndexFields = "Pending Voucher Amount";
        }
    }

    fieldgroups { }


    var
        GenLedgerSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
