#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50026 "emp his"
{
    Format = VariableText;
    Caption = 'emp his';
    schema
    {
        textelement(root)
        {
            tableelement("HR Employee Qualifications"; "HR Employee Qualifications")
            {
                XmlName = 'comp';
                fieldelement(a; "HR Employee Qualifications"."Employee No.") { }
                fieldelement(b; "HR Employee Qualifications"."Institution/Company") { }
                fieldelement(c; "HR Employee Qualifications"."Qualification Type") { }
                fieldelement(d; "HR Employee Qualifications".Description) { }
                fieldelement(rt; "HR Employee Qualifications"."From Date") { }
                fieldelement(yy; "HR Employee Qualifications"."To Date") { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
