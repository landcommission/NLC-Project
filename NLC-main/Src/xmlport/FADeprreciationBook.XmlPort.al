#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50063 "FA Deprreciation Book"
{
    Format = VariableText;
    Caption = 'FA Deprreciation Book';
    schema
    {
        textelement(FADepreciationBook)
        {
            tableelement("FA Depreciation Book"; "FA Depreciation Book")
            {
                MinOccurs = Zero;
                XmlName = 'DepreciationBookTable';
                fieldelement(No; "FA Depreciation Book"."FA No.") { }
                fieldelement(DepreciationBookCode; "FA Depreciation Book"."Depreciation Book Code") { }
                fieldelement(DepreciationMethod; "FA Depreciation Book"."Depreciation Method") { }
                fieldelement(FAPosting; "FA Depreciation Book"."FA Posting Group") { }
                fieldelement(Description; "FA Depreciation Book".Description) { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }
}
