#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50076 "HR Employees XMLw"
{
    Format = VariableText;
    Caption = 'HR Employees XMLw';
    schema
    {
        textelement(root)
        {
            tableelement("HR Employment History"; "HR Employment History")
            {
                AutoUpdate = true;
                XmlName = 'HREmp';
                fieldelement(a; "HR Employment History"."Employee No.") { }
                fieldelement(c; "HR Employment History"."Name of Previous Employer") { }
                fieldelement(f; "HR Employment History"."Previous Employer Contacts") { }
                fieldelement(d; "HR Employment History"."Date Employed") { }
                fieldelement(g; "HR Employment History".Salary) { }
                fieldelement(h; "HR Employment History".Title) { }
                fieldelement(i; "HR Employment History"."Number of Employees Supervised") { }
                fieldelement(j; "HR Employment History"."Reason for Leaving") { }
                fieldelement(k; "HR Employment History"."Terms of Service") { }
                fieldelement(l; "HR Employment History"."Description of Duties") { }
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
