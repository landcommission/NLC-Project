#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50065 "Chart of Accounts"
{
    Format = VariableText;
    Caption = 'Chart of Accounts';
    schema
    {
        textelement(root)
        {
            tableelement("G/L Account"; "G/L Account")
            {
                XmlName = 'General';
                fieldelement(a; "G/L Account"."No.") { }
                fieldelement(b; "G/L Account".Name) { }
                fieldelement(c; "G/L Account"."Search Name") { }
                fieldelement(d; "G/L Account"."Income/Balance") { }
                fieldelement(e; "G/L Account"."Account Type") { }
                fieldelement(f; "G/L Account"."Direct Posting")
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
}
