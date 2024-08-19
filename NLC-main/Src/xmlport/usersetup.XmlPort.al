#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50020 "user setup"
{
    Format = VariableText;
    TransactionType = UpdateNoLocks;
    Caption = 'user setup';
    schema
    {
        textelement(root)
        {
            tableelement("HR Employees"; "HR Employees")
            {
                AutoReplace = true;
                AutoUpdate = false;
                XmlName = 'MyTemp';
                fieldelement(a; "HR Employees"."No.") { }
                fieldelement(c; "HR Employees"."User ID") { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
