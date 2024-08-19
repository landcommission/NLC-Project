#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50077 "HR Employees XMLBeneficiary"
{
    Format = VariableText;
    Caption = 'HR Employees XMLBeneficiary';
    schema
    {
        textelement(root)
        {
            tableelement("HR Employee Kin"; "HR Employee Kin")
            {
                AutoUpdate = true;
                XmlName = 'HREmp';
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
