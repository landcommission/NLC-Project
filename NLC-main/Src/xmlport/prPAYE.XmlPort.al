#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 52193423 prPAYE
{
    Format = VariableText;
    Caption = 'prPAYE';
    schema
    {
        textelement(Root)
        {
            tableelement("PR PAYE"; "PR PAYE")
            {
                XmlName = 'prPAYE';
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
