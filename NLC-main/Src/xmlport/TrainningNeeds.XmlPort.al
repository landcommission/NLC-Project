#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50022 "Trainning Needs"
{
    Format = VariableText;
    Caption = 'Trainning Needs';
    schema
    {
        textelement(root)
        {
            tableelement("HR Training Needs"; "HR Training Needs")
            {
                XmlName = 'comp';
                fieldelement(a; "HR Training Needs".Code) { }
                fieldelement(b; "HR Training Needs".Description) { }
                fieldelement(C; "HR Training Needs".Status) { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
