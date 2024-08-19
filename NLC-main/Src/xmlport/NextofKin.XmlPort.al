#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50011 "Next of Kin"
{
    Format = VariableText;
    Caption = 'Next of Kin';
    schema
    {
        textelement(root)
        {
            tableelement("HR Employee Kin"; "HR Employee Kin")
            {
                XmlName = 'comp';
                fieldelement(a; "HR Employee Kin"."Employee Code") { }
                fieldelement(b; "HR Employee Kin".Type) { }
                fieldelement(d; "HR Employee Kin".Name) { }
                fieldelement(hh; "HR Employee Kin"."Date Of Birth") { }
                fieldelement(c; "HR Employee Kin".Relationship) { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
