#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50100 "Asset Incident"
{
    DrillDownPageID = "Asset Incident List";
    LookupPageID = "Asset Incident List";

    fields
    {
        field(1; "Incident No."; Code[20])
        {

            trigger OnValidate()
            begin
                //TEST IF MANUAL NOs ARE ALLOWED
                if "Incident No." <> xRec."Incident No." then begin
                    FASetup.Get;
                    NoSeriesMgt.TestManual(FASetup."Asset Incident Nos.");
                    "No. Series" := ' ';
                end;
            end;
        }
        field(5; Description; Text[100])
        {
        }
        field(10; "Reported By"; Code[30])
        {
        }
        field(15; "Date Reported"; Date)
        {
        }
        field(20; "Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          "Dimension Value Type" = const(Standard));
        }
        field(25; "Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          "Dimension Value Type" = const(Standard));
        }
        field(30; Location; Code[20])
        {
            TableRelation = "FA Location";
        }
        field(35; Status; Option)
        {
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
        }
        field(40; Recommendations; Text[100])
        {
        }
        field(45; "Incident Type"; Option)
        {
            OptionMembers = " ",Minor,Major;
        }
        field(50; "No. Series"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Incident No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Incident No." = '' then begin
            FASetup.Get;
            FASetup.TestField("Asset Incident Nos.");
            NoSeriesMgt.InitSeries(FASetup."Asset Incident Nos.", xRec."No. Series", 0D, "Incident No.", "No. Series");
        end;

        "Reported By" := UserId;
        "Date Reported" := Today;
    end;

    var
        FASetup: Record "FA Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
