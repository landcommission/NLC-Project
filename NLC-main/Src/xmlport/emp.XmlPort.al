#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50027 emp
{
    Format = VariableText;
    Caption = 'emp';
    schema
    {
        textelement(root)
        {
            tableelement("HR Appl Employment History"; "HR Appl Employment History")
            {
                XmlName = 'comp';
                fieldelement(a; "HR Appl Employment History".JobID) { }
                fieldelement(b; "HR Appl Employment History"."Name of Previous Employer") { }
                fieldelement(c; "HR Appl Employment History".Department) { }
                fieldelement(d; "HR Appl Employment History".Position) { }
                fieldelement(hh; "HR Appl Employment History"."Position Type") { }
                fieldelement(rt; "HR Appl Employment History".StaffNumber) { }
                fieldelement(yy; "HR Appl Employment History"."Date Employed / Left") { }
                fieldelement(hj; "HR Appl Employment History"."Applicant No") { }
                fieldelement(jk; "HR Appl Employment History"."Type of Business") { }
                fieldelement(kl; "HR Appl Employment History"."Previous Employer Contacts") { }
                fieldelement(kk; "HR Appl Employment History"."Benefits/Other Allowances") { }
                fieldelement(yi; "HR Appl Employment History"."Employee No.") { }
                fieldelement(k; "HR Appl Employment History".Salary) { }
                fieldelement(yu; "HR Appl Employment History".Title) { }
                fieldelement(o; "HR Appl Employment History"."Number of Employees Supervised") { }
                fieldelement(m; "HR Appl Employment History"."Reason for Leaving") { }
                fieldelement(j; "HR Appl Employment History"."Terms of Service") { }
                fieldelement(hy; "HR Appl Employment History"."Description of Duties") { }
                fieldelement(yy; "HR Appl Employment History".DateLeft) { }
                fieldelement(io; "HR Appl Employment History".PhoneNo) { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
