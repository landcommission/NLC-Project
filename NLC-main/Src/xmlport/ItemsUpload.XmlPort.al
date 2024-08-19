#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50081 "Items Upload"
{
    Direction = Import;
    Format = VariableText;
    Caption = 'Items Upload';
    schema
    {
        textelement(Root)
        {
            tableelement(Item; Item)
            {
                AutoUpdate = false;
                XmlName = 'Item';
                fieldelement(no; Item."No.") { }
                fieldelement(description; Item.Description)
                {
                    FieldValidate = Yes;
                }
                fieldelement(category; Item."Item Category Code") { }
                fieldelement(postinggroup; Item."Inventory Posting Group") { }
                fieldelement(Suppliername; Item."Supplier Name") { }
                fieldelement(deliverydate; Item."Delivery Date") { }
                fieldelement(financialyear; Item."Financial Year") { }
                fieldelement(deliverynote; Item."Delivery Note") { }
                fieldelement(invoiceno; Item."Invoice No") { }
                fieldelement(orderno; Item."Order No") { }
                fieldelement(unitmeasure; Item."Base Unit of Measure") { }
                fieldelement(GenProduct; Item."Gen. Prod. Posting Group") { }

                trigger OnBeforeInsertRecord()
                begin
                    Item."VAT Prod. Posting Group" := 'ZERO'
                end;
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    trigger OnPostXmlPort()
    begin
        Message('done');
    end;
}
