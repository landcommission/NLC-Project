#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 52193427 "prNSSF Tiers"
{
    Format = VariableText;
    Caption = 'prNSSF Tiers';
    schema
    {
        textelement(root)
        {
            tableelement("prNSSF Tiers"; "prNSSF Tiers")
            {
                XmlName = 'prNSSFTiers';
                fieldelement(a; "prNSSF Tiers".Tier) { }
                fieldelement(b; "prNSSF Tiers".Earnings) { }
                fieldelement(c; "prNSSF Tiers"."Pensionable Earnings") { }
                fieldelement(d; "prNSSF Tiers"."Tier 1 earnings") { }
                fieldelement(e; "prNSSF Tiers"."Tier 1 Employee Deduction") { }
                fieldelement(f; "prNSSF Tiers"."Tier 1 Employer Contribution") { }
                fieldelement(g; "prNSSF Tiers"."Tier 2 earnings") { }
                fieldelement(h; "prNSSF Tiers"."Tier 2 Employee Deduction") { }
                fieldelement(i; "prNSSF Tiers"."Tier 2 Employer Contribution") { }
                fieldelement(j; "prNSSF Tiers"."Lower Limit") { }
                fieldelement(k; "prNSSF Tiers"."Upper Limit") { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
