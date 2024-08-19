#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50071 "HR Employees XML 2"
{
    Format = VariableText;
    Caption = 'HR Employees XML 2';
    schema
    {
        textelement(root)
        {
            tableelement("HR Employees"; "HR Employees")
            {
                AutoUpdate = true;
                XmlName = 'HREmp';
                fieldelement(a; "HR Employees"."No.") { }
                fieldelement(A1; "HR Employees".County) { }
                fieldelement(B; "HR Employees"."Global Dimension 1 Code") { }
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
