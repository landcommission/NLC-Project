#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 52193429 IDs
{
    Direction = Import;
    Format = VariableText;
    Caption = 'IDs';
    schema
    {
        textelement(Root)
        {
            tableelement("HR Employees"; "HR Employees")
            {
                AutoUpdate = true;
                XmlName = 'prEmployeeTransactions';
                fieldelement(Empcode; "HR Employees"."No.") { }
                fieldelement(ID; "HR Employees"."ID Number") { }
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
        Message('done');
    end;
}
