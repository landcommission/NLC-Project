#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193572 "prGratuity Approval"
{
    DataCaptionFields = "Document No.", "Employee Names";
    Caption = 'prGratuity Approval';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            trigger OnValidate()
            begin
                //TEST IF MANUAL NOs ARE ALLOWED
                if "Document No." <> xRec."Document No." then begin
                    prSetup.Get();
                    NoSeriesMgt.TestManual(prSetup."Gratuity Approval Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(3; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(5; "Employee ID"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee ID';
            trigger OnValidate()
            begin
                HREmp.Reset();
                HREmp.SetRange(HREmp."No.", "Employee ID");
                if HREmp.Find('-') then begin
                    "Employee Names" := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
                    "Job Group" := HREmp.Grade;
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
        field(20; "Calculated Gratuity"; Decimal)
        {
            Caption = 'Calculated Gratuity';
        }
        field(25; "Approval Date"; Date)
        {
            Caption = 'Approval Date';
        }
        field(30; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }
        field(35; Status; Option)
        {
            Editable = false;
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
            Caption = 'Status';
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin

        if "Document No." = '' then begin
            prSetup.Get();
            prSetup.TestField(prSetup."Gratuity Approval Nos.");
            NoSeriesMgt.InitSeries(prSetup."Gratuity Approval Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;

        "Document Date" := Today;
    end;

    var
        HREmp: Record "HR Employees";
        prSetup: Record "prPayroll Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
