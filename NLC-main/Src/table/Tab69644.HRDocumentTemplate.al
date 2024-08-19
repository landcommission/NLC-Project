#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69644 "HR Document Template"
{

    fields
    {
        field(1;"Template ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"No. Series";Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Template ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Template ID" = '' then begin
          HumanResourcesSetup.Get;
          HumanResourcesSetup.TestField("HR Template Nos.");
          NoSeriesMgt.InitSeries(HumanResourcesSetup."HR Template Nos.",xRec."No. Series",0D,"Template ID","No. Series");
          end;
    end;

    var
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

