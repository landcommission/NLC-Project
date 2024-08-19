#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50000 "PR Basic Pay Import"
{
    Format = VariableText;
    Caption = 'PR Basic Pay Import';
    schema
    {
        textelement(Root)
        {
            tableelement("prBasic pay PCA"; "prBasic pay PCA")
            {
                XmlName = 'PRBPAY';
                fieldelement(EmpCode; "prBasic pay PCA"."Employee Code") { }
                fieldelement(BPAY; "prBasic pay PCA"."Basic Pay")
                {

                    trigger OnAfterAssignField()
                    begin
                        Counter += 1;
                    end;
                }
                fieldelement(PayrollPeriod; "prBasic pay PCA"."Payroll Period") { }
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
        Message('%1 Records Imported', Counter);
    end;

    trigger OnPreXmlPort()
    begin
        Counter := 0;
    end;

    var
        Counter: Integer;
}
