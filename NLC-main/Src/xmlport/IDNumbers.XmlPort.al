#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50079 "ID Numbers"
{
    Format = VariableText;
    Caption = 'ID Numbers';
    schema
    {
        textelement(Root)
        {
            tableelement("HR Employees"; "HR Employees")
            {
                AutoUpdate = true;
                XmlName = 'employeeCard';
                fieldelement(a; "HR Employees"."No.")
                {
                    FieldValidate = Yes;
                    MinOccurs = Zero;

                    trigger OnAfterAssignField()
                    begin
                        CounterVar += 1;
                    end;
                }
                fieldelement(b; "HR Employees"."ID Number")
                {
                    FieldValidate = Yes;
                    MinOccurs = Zero;
                }
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
        Message('%1 Records Imported', CounterVar);
    end;

    trigger OnPreXmlPort()
    begin
        CounterVar := 0;
    end;

    var
        CounterVar: Integer;
}
