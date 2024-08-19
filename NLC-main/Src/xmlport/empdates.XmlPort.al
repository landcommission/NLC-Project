#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50029 "emp dates"
{
    Format = VariableText;
    Caption = 'emp dates';
    schema
    {
        textelement(root)
        {
            tableelement("HR Employees"; "HR Employees")
            {
                AutoUpdate = true;
                XmlName = 'comp';
                fieldelement(a; "HR Employees"."No.") { }
                fieldelement(b; "HR Employees"."Date of Current Employment") { }
                fieldelement(c; "HR Employees"."Contract Start Date") { }
                fieldelement(d; "HR Employees"."Contract Duration") { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
