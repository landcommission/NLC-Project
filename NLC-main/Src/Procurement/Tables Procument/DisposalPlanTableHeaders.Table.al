#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50108 "Disposal Plan Table Headers"
{
    Caption = 'Disposal Plan Table Headers';

    fields
    {
        field(1; "No."; Code[10])
        {

            trigger OnValidate()
            begin

                if "No." <> xRec."No." then begin
                    GetInvtsetup;
                    NoSeriesMgt.TestManual(Invtsetup."Item Nos.");
                    "No. Series" := '';

                end;
            end;
        }
        field(2; Year; Date)
        {
        }
        field(3; Description; Text[250])
        {
        }
        field(4; "Shortcut dimension 1 code"; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(5; "Shortcut dimension 2 code"; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(6; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(9; "Disposal Method"; Code[20])
        {
            TableRelation = "Disposal Method";

            trigger OnValidate()
            begin
                dispoline.Reset;
                dispoline.SetRange(dispoline."Ref. No.", "No.");
                if dispoline.Find('-') then begin
                    dispoline."Disposal Method" := "Disposal Method";
                    dispoline.Modify;
                end;
            end;
        }
        field(50000; "Disposal Methodc"; Option)
        {
            OptionCaption = ' ,Open tender,public auction,Trade-in,Transfer,Dumping';
            OptionMembers = " ","Open tender","public auction","Trade-in",Transfer,Dumping;
        }
        field(50001; Status; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Pending Approval,Approved,Rejected,Posted,Pending Recommendation';
            OptionMembers = Open,"Pending Approval",Approved,Rejected,Posted,"Pending Recommendation";
        }
        field(50002; "Disposal Status"; Option)
        {
            OptionCaption = ' Planning,CEO,Tender Committee,Disposal implementation,Disposed';
            OptionMembers = " Planning",CEO,"Tender Committee","Disposal implementation",Disposed;
        }
        field(50003; Date; Date)
        {
        }
        field(50004; "No series"; Code[20])
        {
        }
        field(50005; "Ref No"; Code[30])
        {
        }
        field(50006; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility Center BR 2".Code;
        }
        field(50007; "Planned Date"; Date)
        {
        }
        field(50009; "Disposal Year"; Code[20])
        {
            NotBlank = false;
            TableRelation = "Disposal Periods".Code;

            trigger OnValidate()
            begin
                DisposalPeriod.Reset;
                DisposalPeriod.SetRange(DisposalPeriod.Code, "Disposal Year");
                if DisposalPeriod.Find('-') then
                    "Disposal Description" := DisposalPeriod.Description;
            end;
        }
        field(50010; "Disposal Description"; Text[30])
        {
        }
        field(50011; "Created By"; Code[80])
        {
            DataClassification = ToBeClassified;
        }
        field(50012; "Disposal Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Procurement,Departmental';
            OptionMembers = Procurement,Departmental;
        }
        field(50013; "Employee No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50014; "Employee Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Ref No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        //GENERATE NEW NUMBER FOR THE DOCUMENT
        if "No." = '' then begin
            PurchSetup.Get;
            PurchSetup.TestField(PurchSetup."Disposal Process Nos.");
            NoSeriesMgt.InitSeries(PurchSetup."Disposal Process Nos.", xRec."No series", 0D, "No.", "No series");
        end;

        DisposalPeriod.Reset;
        DisposalPeriod.SetRange(DisposalPeriod."Current Year", true);
        if DisposalPeriod.Find('-') then
            "Disposal Year" := DisposalPeriod.Code;
        rec."Created By" := UserId;
        rec.Date := Today
    end;

    var
        GLSetup: Record 98;
        Invtsetup: Record 313;
        NoSeriesMgt: Codeunit 396;
        PurchSetup: Record "Purchases & Payables Setup";
        DisposalPeriod: Record "Disposal Periods";
        dispoline: Record "Disposal plan table line";


    procedure GetInvtsetup()
    begin
    end;
}

