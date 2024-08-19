#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50018 "My TransCodes"
{
    Format = VariableText;
    Caption = 'My TransCodes';
    schema
    {
        textelement(root)
        {
            tableelement("Printer Selection"; "Printer Selection")
            {
                XmlName = 'MyTemp';
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
