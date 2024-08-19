#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50075 Dependants
{
    Format = VariableText;
    Caption = 'Dependants';
    schema
    {
        textelement(Root)
        {
            tableelement("HR Employee Kin"; "HR Employee Kin")
            {
                AutoUpdate = true;
                XmlName = 'prEmployeeTransactions';
                fieldelement(EmployeeCode; "HR Employee Kin"."Employee Code") { }
                fieldelement(Name; "HR Employee Kin".Name)
                {
                    FieldValidate = Yes;
                }
                fieldelement(Relationship; "HR Employee Kin".Relationship) { }
                fieldelement(Address; "HR Employee Kin".Address) { }
                fieldelement(Tel; "HR Employee Kin"."Home Tel No") { }
                fieldelement(mail; "HR Employee Kin"."E-mail") { }
                fieldelement(ty; "HR Employee Kin".Type) { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
