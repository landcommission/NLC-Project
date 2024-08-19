#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50002 "PR Salary Card"
{
    Format = VariableText;
    Caption = 'PR Salary Card';
    schema
    {
        textelement(Root)
        {
            tableelement("PR Salary Card"; "PR Salary Card")
            {
                AutoUpdate = true;
                XmlName = 'PRSalaryCard';
                fieldelement(a; "PR Salary Card"."Employee Code")
                {
                    FieldValidate = Yes;
                    MinOccurs = Zero;

                    trigger OnAfterAssignField()
                    begin
                        CounterVar += 1;
                    end;
                }
                fieldelement(b; "PR Salary Card"."Basic Pay")
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
