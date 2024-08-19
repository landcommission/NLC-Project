#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50001 "Grant List"
{
    Format = VariableText;
    Caption = 'Grant List';
    schema
    {
        textelement(root)
        {
            tableelement("HR Employee Qualifications"; "HR Employee Qualifications")
            {
                AutoReplace = false;
                XmlName = 'Job';
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
