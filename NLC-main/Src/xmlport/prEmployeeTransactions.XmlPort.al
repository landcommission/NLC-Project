#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 52193426 "prEmployee Transactions"
{
    Direction = Import;
    Format = VariableText;
    Caption = 'prEmployee Transactions';
    schema
    {
        textelement(Root)
        {
            tableelement("PR Employee Transactions"; "PR Employee Transactions")
            {
                AutoUpdate = true;
                XmlName = 'prEmployeeTransactions';
                fieldelement(EmployeeCode; "PR Employee Transactions"."Employee Code") { }
                fieldelement(TransactionCode; "PR Employee Transactions"."Transaction Code")
                {
                    FieldValidate = Yes;
                }
                fieldelement(PeriodMonth; "PR Employee Transactions"."Period Month") { }
                fieldelement(PeriodYear; "PR Employee Transactions"."Period Year") { }
                fieldelement(PayrollPeriod; "PR Employee Transactions"."Payroll Period") { }
                fieldelement(amount; "PR Employee Transactions".Amount) { }
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
        Message('done');
    end;
}
