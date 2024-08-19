#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50072 "Destination Code List"
{
    Format = VariableText;
    Caption = 'Destination Code List';
    schema
    {
        textelement(root)
        {
            tableelement("Travel Destination"; "Travel Destination")
            {
                XmlName = 'Destinationcodelist';
                fieldelement(a; "Travel Destination"."Destination Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(b; "Travel Destination"."Destination Name")
                {
                    MinOccurs = Zero;
                }
                fieldelement(c; "Travel Destination"."Destination Type")
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
