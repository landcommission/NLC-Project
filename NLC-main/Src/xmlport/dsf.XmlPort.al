#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50016 dsf
{
    Format = VariableText;
    Caption = 'dsf';
    schema
    {
        textelement(test)
        {
            tableelement("Gen. Journal Template"; "Gen. Journal Template")
            {
                XmlName = 'genjou';
                fieldelement(sdf; "Gen. Journal Template".Name) { }
                fieldelement(ds; "Gen. Journal Template".Description) { }
                fieldelement(dsfds; "Gen. Journal Template"."Test Report ID") { }
                fieldelement(sdfsd; "Gen. Journal Template"."Page ID") { }
                fieldelement(sdf; "Gen. Journal Template"."Posting Report ID") { }
                fieldelement(sdfs; "Gen. Journal Template"."Force Posting Report") { }
                fieldelement(dfsd; "Gen. Journal Template".Type) { }
                fieldelement(fdsfsdf; "Gen. Journal Template"."Source Code") { }
                fieldelement(dsfdsfsd; "Gen. Journal Template"."Reason Code") { }
                fieldelement(xhn; "Gen. Journal Template".Recurring) { }
                fieldelement(xg; "Gen. Journal Template"."Test Report Caption") { }
                fieldelement(sv; "Gen. Journal Template"."Page Caption") { }
                fieldelement(dc; "Gen. Journal Template"."Posting Report Caption") { }
                fieldelement(hy; "Gen. Journal Template"."Force Doc. Balance") { }
                fieldelement(gt; "Gen. Journal Template"."Bal. Account Type") { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
