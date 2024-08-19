#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193562 "prSalary Review Header"
{
    DataCaptionFields = "Proposal No.", Reason;
    Caption = 'prSalary Review Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Proposal No."; Code[20])
        {
            Caption = 'Proposal No.';
            trigger OnValidate()
            begin
                //TEST IF MANUAL NOs ARE ALLOWED
                if "Proposal No." <> xRec."Proposal No." then begin
                    PrSetup.Get();
                    NoSeriesMgt.TestManual(PrSetup."Salary Review Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(5; "Proposal Date"; Date)
        {
            Caption = 'Proposal Date';
        }
        field(10; Reason; Text[100])
        {
            Caption = 'Reason';
        }
        field(15; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }
        field(20; Status; Option)
        {
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
            Caption = 'Status';
        }
    }

    keys
    {
        key(Key1; "Proposal No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        if "Proposal No." = '' then begin
            PrSetup.Get();
            PrSetup.TestField(PrSetup."Salary Review Nos.");
            NoSeriesMgt.InitSeries(PrSetup."Salary Review Nos.", xRec."No. Series", 0D, "Proposal No.", "No. Series");
        end;

        "Proposal Date" := Today;
    end;

    var
        PrSetup: Record "prPayroll Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
