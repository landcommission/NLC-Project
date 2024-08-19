#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50013 "Item Import"
{
    Format = VariableText;
    FormatEvaluate = Legacy;
    Caption = 'Item Import';
    schema
    {
        textelement(ItemList)
        {
            tableelement(Item; Item)
            {
                XmlName = 'ItemTable';
                fieldelement(No; Item."No.")
                {
                    MinOccurs = Zero;

                    trigger OnAfterAssignField()
                    begin
                        Counter += 1;
                    end;
                }
                fieldelement(Description; Item.Description)
                {
                    MinOccurs = Zero;

                    trigger OnBeforePassField()
                    begin
                        Item.Validate(Item.Description);
                    end;
                }
                fieldelement(UnitofMeasure; Item."Base Unit of Measure")
                {
                    MinOccurs = Zero;

                    trigger OnAfterAssignField()
                    begin
                        Item.Validate(Item."Base Unit of Measure");
                    end;
                }
                fieldelement(GenProdPostingGrp; Item."Gen. Prod. Posting Group")
                {
                    MinOccurs = Zero;
                }
                fieldelement(VATProdPostingGrp; Item."VAT Prod. Posting Group")
                {
                    MinOccurs = Zero;
                }
                fieldelement(InventoryProdPostingGrp; Item."Inventory Posting Group")
                {
                    MinOccurs = Zero;
                }
                fieldelement(ItemCategoryCode; Item."Item Category Code")
                {
                    MinOccurs = Zero;

                    trigger OnAfterAssignField()
                    begin
                        Item.Validate(Item."Item Category Code");
                    end;
                }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    trigger OnInitXmlPort()
    begin
        Counter := 0;
    end;

    trigger OnPostXmlPort()
    begin
        Message('%1 Records Imported', Counter);
    end;

    var
        Counter: Integer;
}
