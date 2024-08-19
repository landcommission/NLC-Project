#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50080 "Asset Upload"
{
    Direction = Import;
    Format = VariableText;
    Caption = 'Asset Upload';
    schema
    {
        textelement(Root)
        {
            tableelement("Fixed Asset"; "Fixed Asset")
            {
                AutoUpdate = false;
                XmlName = 'FixedAsset';
                fieldelement(no; "Fixed Asset"."No.") { }
                fieldelement(class; "Fixed Asset"."FA Class Code") { }
                fieldelement(subclass; "Fixed Asset"."FA Subclass Code") { }
                fieldelement(description; "Fixed Asset".Description)
                {
                    FieldValidate = Yes;
                }
                fieldelement(financedby; "Fixed Asset"."Financed By") { }
                fieldelement(serial; "Fixed Asset"."Serial No.") { }
                fieldelement(tag; "Fixed Asset"."Tag No") { }
                fieldelement(make; "Fixed Asset"."Make/Model") { }
                fieldelement(datedelivery; "Fixed Asset"."Date of Delivery/Installation") { }
                fieldelement(countyname; "Fixed Asset"."County Name") { }
                fieldelement(locationname; "Fixed Asset"."Location Name") { }
                fieldelement(responsibleofficeofficer; "Fixed Asset"."Responsible Office/Officer") { }
                fieldelement(condition; "Fixed Asset".Condition) { }
                fieldelement(suppliername; "Fixed Asset"."Supplier Name") { }
                fieldelement(notesremark; "Fixed Asset"."Notes/Remarks") { }
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
