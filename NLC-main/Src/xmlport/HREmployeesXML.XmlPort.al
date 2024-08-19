#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50070 "HR Employees XML"
{
    Format = VariableText;
    Caption = 'HR Employees XML';
    schema
    {
        textelement(root)
        {
            tableelement("HR Employees"; "HR Employees")
            {
                AutoUpdate = true;
                XmlName = 'HREmp';
                fieldelement(a; "HR Employees"."No.") { }
                fieldelement(b; "HR Employees"."First Name") { }
                fieldelement(c; "HR Employees"."Middle Name") { }
                fieldelement(d; "HR Employees"."Last Name") { }
                fieldelement(e; "HR Employees"."Job Title") { }
                fieldelement(f; "HR Employees".Grade) { }
                fieldelement(g; "HR Employees"."ID Number") { }
                fieldelement(h; "HR Employees".Religion) { }
                fieldelement(i; "HR Employees".Gender) { }
                fieldelement(j; "HR Employees"."NHIF No.") { }
                fieldelement(k; "HR Employees"."NSSF No.") { }
                fieldelement(l; "HR Employees"."PIN No.") { }
                fieldelement(m; "HR Employees".Citizenship) { }
                fieldelement(n; "HR Employees"."Contract Type") { }
                fieldelement(o; "HR Employees"."Date Of Joining the Company") { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    trigger OnPostXmlPort()
    begin
        Message('Process Complete');
    end;
}
