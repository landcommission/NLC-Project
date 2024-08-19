#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50096 "Maintenance Plan"
{
    DrillDownPageID = "Maintenance Plan List";
    LookupPageID = "Maintenance Plan List";

    fields
    {
        field(1; "Plan No."; Code[20])
        {

            trigger OnValidate()
            begin
                //TEST IF MANUAL NOs ARE ALLOWED
                if "Plan No." <> xRec."Plan No." then begin
                    FASetup.Get;
                    NoSeriesMgt.TestManual(FASetup."Maintenance Plan Nos.");
                    "No. Series" := ' ';
                end;
            end;
        }
        field(5; Description; Text[100])
        {
        }
        field(10; "Planned Date"; Date)
        {
        }
        field(15; "Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          "Dimension Value Type" = const(Standard));
        }
        field(20; "Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          "Dimension Value Type" = const(Standard));
        }
        field(25; Status; Option)
        {
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
        }
        field(30; Comments; Text[100])
        {
        }
        field(35; "No. Series"; Code[10])
        {
        }
        field(36; "Created By"; Code[30])
        {
            Editable = false;
        }
        field(40; "Total Estimated Cost"; Decimal)
        {
            CalcFormula = sum("Maintenance Plan Lines"."Estimated Cost" where("Plan No." = field("Plan No.")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Plan No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Plan No." = '' then begin
            FASetup.Get;
            FASetup.TestField("Maintenance Plan Nos.");
            NoSeriesMgt.InitSeries(FASetup."Maintenance Plan Nos.", xRec."No. Series", 0D, "Plan No.", "No. Series");
        end;

        "Created By" := UserId;
    end;

    var
        FASetup: Record "FA Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
