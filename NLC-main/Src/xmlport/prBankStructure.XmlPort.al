#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 52193425 "prBank Structure"
{
    Caption = 'prBank Structure';
    schema
    {
        textelement(Root)
        {
            tableelement("PR Bank Accounts"; "PR Bank Accounts")
            {
                XmlName = 'prBankStructure';
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
