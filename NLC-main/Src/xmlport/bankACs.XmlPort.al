#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50078 "bank A/Cs"
{
    Format = VariableText;
    Caption = 'bank A/Cs';
    schema
    {
        textelement(Root)
        {
            tableelement("HR Employee Kin"; "HR Employee Kin")
            {
                AutoUpdate = true;
                XmlName = 'prEmployeeTransactions';
                fieldelement(EmployeeCode; "HR Employee Kin"."Employee Code") { }
                fieldelement(surName; "HR Employee Kin"."Full Name")
                {
                    FieldValidate = Yes;
                }
                fieldelement(othernames; "HR Employee Kin".Name) { }
                fieldelement(Relationship; "HR Employee Kin".Relationship) { }
                fieldelement(Address; "HR Employee Kin".Address) { }
                fieldelement(Tel; "HR Employee Kin"."Home Tel No") { }
                fieldelement(mail; "HR Employee Kin"."E-mail") { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
