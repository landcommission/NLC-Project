#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50014 Dimension
{
    Format = VariableText;
    Caption = 'Dimension';
    schema
    {
        textelement(root)
        {
            tableelement("Dimension Value"; "Dimension Value")
            {
                XmlName = 'dim';
                fieldelement(a; "Dimension Value"."Dimension Code") { }
                fieldelement(b; "Dimension Value".Code) { }
                fieldelement(c; "Dimension Value".Name) { }
                fieldelement(d; "Dimension Value"."Global Dimension No.") { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
