#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193505 "HR Medical Claims"
{
    DrillDownPageId = "HR Medical Claims List";
    LookupPageId = "HR Medical Claims List";
    Caption = 'HR Medical Claims';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Member No"; Code[30])
        {
            TableRelation = "HR Employees";
            Caption = 'Member No';
        }
        field(2; "Claim Type"; Option)
        {
            OptionMembers = Inpatient,Outpatient;
            Caption = 'Claim Type';
        }
        field(3; "Claim Date"; Date)
        {
            Caption = 'Claim Date';
        }
        field(4; "Patient Name"; Text[100])
        {
            Caption = 'Patient Name';
        }
        field(5; "Document Ref"; Text[50])
        {
            Caption = 'Document Ref';
        }
        field(6; "Date of Service"; Date)
        {
            Caption = 'Date of Service';
        }
        field(7; "Attended By"; Code[10])
        {
            TableRelation = Vendor."No.";
            Caption = 'Attended By';
        }
        field(8; "Amount Charged"; Decimal)
        {
            Caption = 'Amount Charged';
        }
        field(9; Comments; Text[250])
        {
            Caption = 'Comments';
        }
        field(10; "Claim No"; Code[10])
        {
            Caption = 'Claim No';
            trigger OnValidate()
            begin

                if "Claim No" <> xRec."Claim No" then begin
                    HRSetup.Get();
                    NoSeriesMgt.TestManual(HRSetup."Medical Claims Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(11; Dependants; Code[50])
        {
            TableRelation = "HR Employee Kin".Name where("Employee Code" = field("Member No"));
            Caption = 'Dependants';
            trigger OnValidate()
            begin
                MDependants.Reset();
                MDependants.SetRange(MDependants."Employee Code", Dependants);
                if MDependants.Find('-') then
                    "Patient Name" := MDependants."Full Name" + ' ' + MDependants.Name;
            end;
        }
        field(3967; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
        }
    }

    keys
    {
        key(Key1; "Member No", "Claim No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        if "Claim No" = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Medical Claims Nos");
            NoSeriesMgt.InitSeries(HRSetup."Medical Claims Nos", xRec."No. Series", 0D, "Claim No", "No. Series");
        end;
    end;

    var
        MDependants: Record "HR Employee Kin";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRSetup: Record "HR Setup";
}
