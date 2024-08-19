#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193823 "New Tender Items"
{
    Caption = 'New Tender Items';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Item No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Item No.';
            Editable = false;
            NotBlank = false;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Currency Code"; Code[20])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(4; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(5; "Direct Unit Cost"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 2;
            Caption = 'Direct Unit Cost';
            MinValue = 0;
        }
        field(6; "Questionaire No"; Integer)
        {
            Editable = false;
            Caption = 'Questionaire No';
        }
        field(7; "Tender No."; Code[20])
        {
            TableRelation = Tender;
            Caption = 'Tender No.';
        }
        field(8; "PIN No."; Code[20])
        {
            Editable = true;
            TableRelation = Bidder;
            Caption = 'PIN No.';
        }
        field(9; "Receipt No."; Code[20])
        {
            Editable = false;
            Caption = 'Receipt No.';
        }
        field(14; "Minimum Quantity"; Integer)
        {
            Caption = 'Minimum Quantity';
            MinValue = 0;
        }
        field(15; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
        }
        field(5400; "Unit of Measure Code"; Code[200])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = "Item Unit of Measure".Code /* where ("Item No."=field("Item No.")) */;
        }
        field(5401; Brand; Text[250])
        {
            Caption = 'Brand';
        }
        field(5402; Formulation; Text[250])
        {
            Caption = 'Formulation';
        }
        field(5403; "Unit Size"; Text[250])
        {
            Caption = 'Unit Size';
        }
        field(5404; "Unit Trade/ W/Sale Price"; Decimal)
        {
            Caption = 'Unit Trade/ W/Sale Price';
        }
        field(5405; Discount; Decimal)
        {
            Editable = false;
            Caption = 'Discount';
        }
        field(5406; VAT; Decimal)
        {
            Caption = 'VAT';
        }
        field(5407; "Final Tender"; Decimal)
        {
            Editable = false;
            Caption = 'Final Tender';
        }
        field(5408; "Recommended Unit Retail Price"; Decimal)
        {
            Caption = 'Recommended Unit Retail Price';
        }
        field(5409; Supplier; Text[250])
        {
            Caption = 'Supplier';
        }
        field(5410; Manufacturer; Text[250])
        {
            Caption = 'Manufacturer';
        }
        field(5411; "Pack Size"; Text[250])
        {
            Caption = 'Pack Size';
        }
        field(5412; Remarks; Text[250])
        {
            Caption = 'Remarks';
        }
        field(5413; "Tender Result"; Text[250])
        {
            Caption = 'Tender Result';
        }
        field(5414; Country; Code[20])
        {
            TableRelation = "Country/Region".Code;
            Caption = 'Country';
        }
        field(5415; "Sample Required"; Boolean)
        {
            Caption = 'Sample Required';
        }
        field(5416; "Sample Size"; Decimal)
        {
            Caption = 'Sample Size';
        }
        field(5417; Company; Text[250])
        {
            Caption = 'Company';
        }
        field(5418; "Current Price"; Decimal)
        {
            Caption = 'Current Price';
            trigger OnValidate()
            begin
                Variance := "Current Price" - "Final Tender";
            end;
        }
        field(5419; Variance; Decimal)
        {
            Caption = 'Variance';
        }
        field(5420; Prefered; Integer)
        {
            Caption = 'Prefered';
        }
        field(5421; "Description 2"; Text[250])
        {
            Caption = 'Description 2';
        }
    }

    keys
    {
        key(Key1; "Item No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
