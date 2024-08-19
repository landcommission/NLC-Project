#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50007 "Customer/donor"
{
    Format = VariableText;
    Caption = 'Customer/donor';
    schema
    {
        textelement(root)
        {
            tableelement(Customer; Customer)
            {
                XmlName = 'cust';
                fieldelement(a; Customer."No.") { }
                fieldelement(b; Customer.Name) { }
                fieldelement(c; Customer."Search Name") { }
                fieldelement(d; Customer.Address) { }
                fieldelement(e; Customer."Address 2") { }
                fieldelement(f; Customer.City) { }
                fieldelement(g; Customer.Contact) { }
                fieldelement(h; Customer."Phone No.") { }
                fieldelement(i; Customer."Customer Posting Group") { }
                fieldelement(j; Customer."Currency Code") { }
                fieldelement(k; Customer."Country/Region Code") { }
                fieldelement(p; Customer."Fax No.") { }
                fieldelement(q; Customer."Gen. Bus. Posting Group") { }
                fieldelement(r; Customer."Post Code") { }
                fieldelement(l; Customer.County) { }
                fieldelement(s; Customer."E-Mail") { }
                fieldelement(t; Customer."Home Page") { }
                fieldelement(m; Customer."VAT Bus. Posting Group") { }
                fieldelement(n; Customer."Account Type") { }
                fieldelement(o; Customer."Employee Job Group")
                {
                    MinOccurs = Zero;

                    trigger OnAfterAssignField()
                    begin
                        Customer.Validate(Customer."No.");
                    end;
                }
                fieldelement(u; Customer."Donor Category")
                {
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
        Message('COMPLETE');
    end;
}
