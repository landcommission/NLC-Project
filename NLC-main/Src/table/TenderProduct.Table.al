#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193810 "Tender Product"
{
    Caption = 'Tender Product';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Tender No"; Code[20])
        {
            TableRelation = Tender."Tender ID";
            Caption = 'Tender No';
        }
        field(2; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,G/L Account,Item,Resource,Fixed Asset,Charge (Item)';
            OptionMembers = " ","G/L Account",Item,Resource,"Fixed Asset","Charge (Item)";
        }
        field(3; "Item Category"; Code[20])
        {
            Caption = 'Item Category';
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';

        }
        field(5; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(6; Quantity; Integer)
        {
            Caption = 'Quantity';
        }
        field(7; "Unit of Measure"; Code[20])
        {
            Caption = 'Unit of Measure';
        }
        field(8; "Created By"; Code[20])
        {
            Editable = false;
            Caption = 'Created By';
        }
        field(9; "Date Created"; Date)
        {
            Editable = false;
            Caption = 'Date Created';
        }
        field(10; Brand; Code[20])
        {
            Caption = 'Brand';
        }
        field(11; "Average Annual Consumptionn"; Decimal)
        {
            Caption = 'Average Annual Consumptionn';
        }
        field(12; "Trade Discount"; Decimal)
        {
            Caption = 'Trade Discount';
        }
        field(13; VAT; Decimal)
        {
            Caption = 'VAT';
        }
        field(14; "Net Price"; Decimal)
        {
            Caption = 'Net Price';
        }
        field(15; "Current Price"; Decimal)
        {
            Caption = 'Current Price';
        }
        field(16; "Pack Size"; Text[50])
        {
            Caption = 'Pack Size';
        }
        field(17; "Annual Consumption"; Decimal)
        {
            Caption = 'Annual Consumption';
        }
        field(18; Specifications; Text[250])
        {
            Caption = 'Specifications';
        }
    }

    keys
    {
        key(Key1; "Tender No", "No.")
        {
            Clustered = true;
        }
        key(Key2; "Item Category") { }
    }

    fieldgroups { }
}
