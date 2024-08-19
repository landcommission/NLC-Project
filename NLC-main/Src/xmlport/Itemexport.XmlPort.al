#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50053 "Item export"
{
    Format = VariableText;
    Caption = 'Item export';
    schema
    {
        textelement(ItemList)
        {
            tableelement(Item; Item)
            {
                XmlName = 'ItemTable';
                fieldelement(ItemNo; Item."No.") { }
                fieldelement(Description; Item.Description) { }
                fieldelement(Unitomeasure; Item."Base Unit of Measure") { }
                fieldelement(GeneralProd; Item."Gen. Prod. Posting Group") { }
                fieldelement(InventoryProd; Item."Inventory Posting Group") { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
