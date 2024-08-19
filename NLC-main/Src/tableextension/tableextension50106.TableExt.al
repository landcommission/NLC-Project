#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50106 tableextension50106 extends Item
{
    fields
    {

        //Unsupported feature: Code Modification on ""Inventory Posting Group"(Field 11).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF "Inventory Posting Group" <> '' THEN
          TESTFIELD(Type,Type::Inventory);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
         ItemLedEntry.RESET;
         ItemLedEntry.SETRANGE(ItemLedEntry."Item No.","No.");
         IF ItemLedEntry.FINDFIRST THEN BEGIN
            IF ("Inventory Posting Group")<>(xRec."Inventory Posting Group") THEN
               ERROR('There are already entries for Item '+"No."+', Cannot change the Posting Group');
         END;

        IF "Inventory Posting Group" <> '' THEN
          TESTFIELD(Type,Type::Inventory);
        */
        //end;
        field(50000; "Item G/L Budget Account"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'Item G/L Budget Account';
            DataClassification = CustomerContent;
        }
        field(50001; "Supplier Name"; Text[150])
        {
            Caption = 'Supplier Name';
            DataClassification = CustomerContent;
        }
        field(50002; "Delivery Date"; Date)
        {
            Caption = 'Delivery Date';
            DataClassification = CustomerContent;
        }
        field(50003; "Financial Year"; Text[50])
        {
            Caption = 'Financial Year';
            DataClassification = CustomerContent;
        }
        field(50004; "Order No"; Text[50])
        {
            Caption = 'Order No';
            DataClassification = CustomerContent;
        }
        field(50005; "Invoice No"; Text[50])
        {
            Caption = 'Invoice No';
            DataClassification = CustomerContent;
        }
        field(50006; "Delivery Note"; Text[50])
        {
            Caption = 'Delivery Note';
            DataClassification = CustomerContent;
        }
        field(600108; "Alert Send"; Boolean)
        {
            Caption = '';
            DataClassification = ToBeClassified;
        }
        field(500108; "Alert Date Send"; Date)
        {
            Caption = '';
            DataClassification = ToBeClassified;
        }
        field(500109; "Disposal Date"; Date)
        {
            Caption = '';
            DataClassification = ToBeClassified;
        }
        field(600110; "Disposal Reason"; text[200])
        {
            Caption = '';
            DataClassification = ToBeClassified;
        }

    }

    var
        ItemLedEntry: Record "Item Ledger Entry";
}
