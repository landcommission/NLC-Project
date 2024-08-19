#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50050 "Item Jnl Import"
{
    Format = VariableText;
    Caption = 'Item Jnl Import';
    schema
    {
        textelement(ItemJnlRoot)
        {
            tableelement("Item Journal Line"; "Item Journal Line")
            {
                MinOccurs = Zero;
                XmlName = 'ItemJnlTable';
                fieldelement(JnlTemplate; "Item Journal Line"."Journal Template Name") { }
                fieldelement(JnlBatch; "Item Journal Line"."Journal Batch Name") { }
                fieldelement(LineNo; "Item Journal Line"."Line No.") { }
                fieldelement(PostingDate; "Item Journal Line"."Posting Date") { }
                fieldelement(EntryType; "Item Journal Line"."Entry Type") { }
                fieldelement(DocumentNo; "Item Journal Line"."Document No.") { }
                fieldelement(ItemNo; "Item Journal Line"."Item No.") { }
                fieldelement(Description; "Item Journal Line".Description) { }
                fieldelement(LocationCode; "Item Journal Line"."Location Code") { }
                fieldelement(Quantity; "Item Journal Line".Quantity) { }
                fieldelement(UnitofMeasure; "Item Journal Line"."Unit of Measure Code") { }
                fieldelement(UnitCost; "Item Journal Line"."Unit Amount") { }
                fieldelement(ItemCategory; "Item Journal Line"."Item Category Code") { }
                fieldelement(GenBusiness; "Item Journal Line"."Gen. Bus. Posting Group") { }
                fieldelement(GenProd; "Item Journal Line"."Gen. Prod. Posting Group") { }
                fieldelement(InventoryPosting; "Item Journal Line"."Inventory Posting Group") { }
                fieldelement(Expiiry; "Item Journal Line"."Expiration Date") { }
                fieldelement(Fund; "Item Journal Line"."Shortcut Dimension 1 Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(Dimension2; "Item Journal Line"."Shortcut Dimension 2 Code")
                {
                    MinOccurs = Zero;
                }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
