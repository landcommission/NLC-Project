#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50021 "Item Journal Line Import"
{
    Format = VariableText;
    Caption = 'Item Journal Line Import';
    schema
    {
        textelement(ItemJournalLines)
        {
            tableelement("Item Journal Line"; "Item Journal Line")
            {
                XmlName = 'JournalLineTable';
                fieldelement(TemplateName; "Item Journal Line"."Journal Template Name") { }
                fieldelement(BatchName; "Item Journal Line"."Journal Batch Name") { }
                fieldelement(PostingDate; "Item Journal Line"."Posting Date") { }
                fieldelement(EntryType; "Item Journal Line"."Entry Type") { }
                fieldelement(DocumentNo; "Item Journal Line"."Document No.") { }
                fieldelement(ItemNo; "Item Journal Line"."Item No.") { }
                fieldelement(Description; "Item Journal Line".Description) { }
                fieldelement(Quantity; "Item Journal Line".Quantity)
                {

                    trigger OnAfterAssignField()
                    begin
                        "Item Journal Line".Validate("Item Journal Line".Quantity);
                        "Item Journal Line".Validate("Item Journal Line"."Unit Amount")
                    end;
                }
                fieldelement(UnitCost; "Item Journal Line"."Unit Amount")
                {

                    trigger OnAfterAssignField()
                    begin
                        "Item Journal Line".Validate("Item Journal Line".Quantity);
                        "Item Journal Line".Validate("Item Journal Line"."Unit Amount")
                    end;
                }
                fieldelement(Amount; "Item Journal Line".Amount) { }
                fieldelement(Location; "Item Journal Line"."Location Code") { }
                fieldelement(UnitofMeasure; "Item Journal Line"."Unit of Measure Code") { }
                fieldelement(ExpiryDate; "Item Journal Line"."Expiration Date") { }
                fieldelement(GenProd; "Item Journal Line"."Gen. Prod. Posting Group") { }
                fieldelement(InventoryPostingGrp; "Item Journal Line"."Inventory Posting Group") { }
                fieldelement(GenBusiness; "Item Journal Line"."Gen. Bus. Posting Group")
                {
                    MinOccurs = Zero;
                }
                fieldelement(LineNo; "Item Journal Line"."Line No.") { }

                trigger OnAfterInsertRecord()
                begin
                    "Item Journal Line".Validate("Item Journal Line".Quantity);
                    "Item Journal Line".Validate("Item Journal Line"."Unit Amount")
                end;
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
