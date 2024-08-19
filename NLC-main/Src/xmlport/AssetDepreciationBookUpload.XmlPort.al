#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50082 "Asset Depreciation Book Upload"
{
    Direction = Import;
    Format = VariableText;
    Caption = 'Asset Depreciation Book Upload';
    schema
    {
        textelement(Root)
        {
            tableelement("FA Depreciation Book"; "FA Depreciation Book")
            {
                AutoUpdate = false;
                XmlName = 'DepreciationBook';
                fieldelement(FANo; "FA Depreciation Book"."FA No.") { }
                fieldelement(FAPostingGroup; "FA Depreciation Book"."FA Posting Group")
                {
                    FieldValidate = Yes;
                }
                fieldelement(FADepreBook; "FA Depreciation Book"."Depreciation Book Code") { }
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
