#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193573 "prBonus Recommendation Header"
{
    Caption = 'prBonus Recommendation Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Recommendation No."; Code[20])
        {
            Caption = 'Recommendation No.';
            trigger OnValidate()
            begin
                //TEST IF MANUAL NOs ARE ALLOWED
                if "Recommendation No." <> xRec."Recommendation No." then begin
                    prSetup.Get();
                    NoSeriesMgt.TestManual(prSetup."Bonus Recommendation Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(3; Date; Date)
        {
            Caption = 'Date';
        }
        field(5; "Employee ID."; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee ID.';
            trigger OnValidate()
            begin
                HREmp.Reset();
                HREmp.SetRange(HREmp."No.", "Employee ID.");
                if HREmp.Find('-') then begin
                    "Employee Names" := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
                    "Job Group" := HREmp.Grade;
                    Department := HREmp."Global Dimension 1 Code";
                    Project := HREmp."Global Dimension 2 Code";
                end;
            end;
        }
        field(10; "Employee Names"; Text[250])
        {
            Caption = 'Employee Names';
        }
        field(15; "Job Group"; Code[20])
        {
            Caption = 'Job Group';
        }
        field(20; Department; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Caption = 'Department';
        }
        field(25; Project; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            Caption = 'Project';
        }
        field(30; "Proposed Bonus"; Decimal)
        {
            Caption = 'Proposed Bonus';
        }
        field(35; Status; Option)
        {
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
            Caption = 'Status';
        }
        field(40; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }
    }

    keys
    {
        key(Key1; "Recommendation No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin

        if "Recommendation No." = '' then begin
            prSetup.Get();
            prSetup.TestField(prSetup."Bonus Recommendation Nos.");
            NoSeriesMgt.InitSeries(prSetup."Bonus Recommendation Nos.", xRec."No. Series", 0D, "Recommendation No.", "No. Series");
        end;

        Date := Today;
    end;

    var
        HREmp: Record "HR Employees";
        prSetup: Record "prPayroll Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
