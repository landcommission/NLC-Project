#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50008 "Opening Bal"
{
    Format = VariableText;
    Caption = 'Opening Bal';
    schema
    {
        textelement(root)
        {
            tableelement("Gen. Journal Line"; "Gen. Journal Line")
            {
                XmlName = 'gen';
                fieldelement(a; "Gen. Journal Line"."Line No.") { }
                fieldelement(b; "Gen. Journal Line"."Journal Template Name")
                {
                    MinOccurs = Zero;
                }
                fieldelement(c; "Gen. Journal Line"."Journal Batch Name") { }
                fieldelement(d; "Gen. Journal Line"."Posting Date") { }
                fieldelement(e; "Gen. Journal Line"."Document No.") { }
                fieldelement(f; "Gen. Journal Line"."Account Type") { }
                fieldelement(g; "Gen. Journal Line"."Account No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(h; "Gen. Journal Line".Description) { }
                fieldelement(i; "Gen. Journal Line".Amount) { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
