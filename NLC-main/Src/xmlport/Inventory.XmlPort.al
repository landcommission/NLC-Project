#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50025 Inventory
{
    Format = VariableText;
    Caption = 'Inventory';
    schema
    {
        textelement(root)
        {
            tableelement("Item Journal Line"; "Item Journal Line")
            {
                XmlName = 't';
                fieldelement(a; "Item Journal Line"."Journal Template Name") { }
                fieldelement(s; "Item Journal Line"."Posting Date") { }
                fieldelement(b; "Item Journal Line"."Journal Batch Name") { }
                fieldelement(c; "Item Journal Line"."Document No.") { }
                fieldelement(r; "Item Journal Line"."Entry Type") { }
                fieldelement(d; "Item Journal Line"."Item No.") { }
                fieldelement(e; "Item Journal Line".Description) { }
                fieldelement(f; "Item Journal Line"."Location Code") { }
                fieldelement(g; "Item Journal Line".Quantity) { }
                fieldelement(j; "Item Journal Line"."Shortcut Dimension 1 Code") { }
                fieldelement(k; "Item Journal Line"."Shortcut Dimension 2 Code") { }
                fieldelement(l; "Item Journal Line"."Shortcut Dimension 3 Code") { }
                fieldelement(m; "Item Journal Line"."Shortcut Dimension 4 Code") { }
                fieldelement(s; "Item Journal Line"."Line No.") { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
