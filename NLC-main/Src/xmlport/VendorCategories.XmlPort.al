#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50009 "Vendor Categories"
{
    Format = VariableText;
    Caption = 'Vendor Categories';
    schema
    {
        textelement(root)
        {
            tableelement("HR Disciplinary Cases"; "HR Disciplinary Cases")
            {
                AutoReplace = true;
                XmlName = 'x';
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    trigger OnInitXmlPort()
    begin
        Counter := 0;
    end;

    trigger OnPostXmlPort()
    begin
        Message('%1 Recrods Imported', Counter);
    end;

    var
        Counter: Integer;
}
