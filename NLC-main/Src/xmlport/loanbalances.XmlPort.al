#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 52193424 "loan balances"
{
    Format = VariableText;
    Caption = 'loan balances';
    schema
    {
        textelement(Root)
        {
            tableelement("PR Employee Transactions"; "PR Employee Transactions")
            {
                XmlName = 'loanbal';
                fieldelement(a; "PR Employee Transactions"."Employee Code") { }
                fieldelement(b; "PR Employee Transactions"."Transaction Code") { }
                fieldelement(c; "PR Employee Transactions".Amount) { }
                fieldelement(d; "PR Employee Transactions".Balance) { }
                fieldelement(e; "PR Employee Transactions"."Period Month") { }
                fieldelement(f; "PR Employee Transactions"."Period Year") { }
                fieldelement(g; "PR Employee Transactions"."Payroll Period") { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
