#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193782 "CshMgt Application"
{
    Caption = 'CshMgt Application';
    DataClassification = CustomerContent;
    //DrillDownPageID = UnknownPage39006025;
    //LookupPageID = UnknownPage39006025;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionMembers = PV,Receipt;
            Caption = 'Document Type';
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(5; "Amount Applied"; Decimal)
        {
            Caption = 'Amount Applied';
        }
        field(6; "Appl. Doc. Type"; Text[30])
        {
            Caption = 'Appl. Doc. Type';
        }
        field(7; "Appl. Doc. No"; Code[20])
        {
            Caption = 'Appl. Doc. No';
        }
        field(8; "Appl. Ext Doc. Ref"; Code[20])
        {
            Caption = 'Appl. Ext Doc. Ref';
        }
        field(9; "Appl. Description"; Text[100])
        {
            Caption = 'Appl. Description';
        }
        field(10; "Line Number"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line Number';
        }
        field(11; "Appl. Doc. Original Amount"; Decimal)
        {
            Caption = 'Appl. Doc. Original Amount';
        }
        field(12; "Appl. Doc. Amount"; Decimal)
        {
            Caption = 'Appl. Doc. Amount';
        }
        field(13; "Appl.Doc. Amount Including VAT"; Decimal)
        {
            Caption = 'Appl.Doc. Amount Including VAT';
        }
        field(14; "Appl. Doc. VAT Amount"; Decimal)
        {
            Caption = 'Appl. Doc. VAT Amount';
        }
        field(15; "Appl. Doc. VAT Rate"; Decimal)
        {
            Caption = 'Appl. Doc. VAT Rate';
        }
        field(16; "Appl. Doc. Remaining Amount"; Decimal)
        {
            Caption = 'Appl. Doc. Remaining Amount';
        }
        field(17; "Appl. Doc. VAT Paid"; Decimal)
        {
            Description = 'this is theoretical';
            Caption = 'Appl. Doc. VAT Paid';
        }
        field(18; "Appl. Doc. VAT To Pay"; Decimal)
        {
            Description = 'this is far-fetched but can work';
            Caption = 'Appl. Doc. VAT To Pay';
        }
        field(19; "Appl. Doc Date"; Date)
        {
            Caption = 'Appl. Doc Date';
        }
        field(20; "VAT Base Amount"; Decimal)
        {
            Caption = 'VAT Base Amount';
        }
    }

    keys
    {
        key(Key1; "Line Number")
        {
            Clustered = true;
        }
        key(Key2; "Appl. Doc. No", "Document Type", "Appl. Doc. Type")
        {
            SumIndexFields = "Amount Applied";
        }
    }

    fieldgroups { }
}
