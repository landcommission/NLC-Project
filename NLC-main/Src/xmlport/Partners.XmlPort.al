#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50004 Partners
{
    Format = VariableText;
    Caption = 'Partners';
    schema
    {
        textelement(root)
        {
            tableelement(Vendor; Vendor)
            {
                XmlName = 'partner';
                fieldelement(a; Vendor."No.")
                {

                    trigger OnAfterAssignField()
                    begin
                        Counter := Counter + 1;
                    end;
                }
                fieldelement(b; Vendor.Name) { }
                fieldelement(c; Vendor."Search Name") { }
                fieldelement(d; Vendor.Address) { }
                fieldelement(e; Vendor."Address 2") { }
                fieldelement(f; Vendor.City) { }
                fieldelement(g; Vendor.Contact) { }
                fieldelement(h; Vendor."Phone No.") { }
                fieldelement(l; Vendor."Country/Region Code") { }
                fieldelement(m; Vendor."Gen. Bus. Posting Group") { }
                fieldelement(n; Vendor."Post Code") { }
                fieldelement(o; Vendor.County) { }
                fieldelement(p; Vendor."E-Mail") { }
                fieldelement(j; Vendor."VAT Bus. Posting Group") { }
                fieldelement(q; Vendor."Vendor Posting Group") { }
                fieldelement(k; Vendor."Currency Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(s; Vendor."Vendor Type")
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

    trigger OnInitXmlPort()
    begin
        Counter := 0;
    end;

    trigger OnPostXmlPort()
    begin
        Message('%1 Records imported', Counter);
    end;

    var
        Counter: Integer;
}
