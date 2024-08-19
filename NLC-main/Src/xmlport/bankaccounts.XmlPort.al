#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 52193428 "bank accounts"
{
    Direction = Import;
    Format = VariableText;
    Caption = 'bank accounts';
    schema
    {
        textelement(Root)
        {
            tableelement("HR Employee Bank Accounts"; "HR Employee Bank Accounts")
            {
                AutoUpdate = true;
                XmlName = 'prEmployeeTra';
                fieldelement(EmployeeCode; "HR Employee Bank Accounts"."Employee Code") { }
                fieldelement(Bankname; "HR Employee Bank Accounts"."Bank Name") { }
                fieldelement(Branchname; "HR Employee Bank Accounts"."Branch Name") { }
                fieldelement(Bankcode; "HR Employee Bank Accounts"."Bank  Code")
                {
                    FieldValidate = Yes;
                }
                fieldelement(Brabnchcode; "HR Employee Bank Accounts"."Branch Code") { }
                fieldelement(Accountno; "HR Employee Bank Accounts"."A/C  Number") { }
                fieldelement(Percentage; "HR Employee Bank Accounts"."Percentage to Transfer") { }
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
