#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50023 "hr-employee33"
{
    Format = VariableText;
    Caption = 'hr-employee33';
    schema
    {
        textelement(root)
        {
            tableelement("HR Employees"; "HR Employees")
            {
                AutoUpdate = true;
                XmlName = 'comp';
                fieldelement(a; "HR Employees"."No.") { }
                fieldelement(B; "HR Employees"."ID Number") { }
                fieldelement(N; "HR Employees"."PIN No.") { }
                fieldelement(GH; "HR Employees"."NSSF No.") { }
                fieldelement(BB; "HR Employees"."NHIF No.") { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
