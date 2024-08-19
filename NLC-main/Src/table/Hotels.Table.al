#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50016 Hotels
{
    // DrillDownPageID = 50075;
    // LookupPageID = 50075;

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; Description; Text[30])
        {
        }
        field(3; "No series"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(4; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        //GENERATE NEW NUMBER FOR THE DOCUMENT

        if Code = '' then begin
            PurchSetup.Get;
            PurchSetup.TestField(PurchSetup."Hotel Nos.");
            NoSeriesMgt.InitSeries(PurchSetup."Hotel Nos.", xRec."No series", 0D, Code, "No series");
        end;

        "Created By" := UserId;
        "Created Date" := Today
    end;

    var
        GLSetup: Record 98;
        Invtsetup: Record 313;
        NoSeriesMgt: Codeunit 396;
        PurchSetup: Record "Purchases & Payables Setup";
}

