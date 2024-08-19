#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 69254 "Disciplinary Committees"
{
    DrillDownPageId = "Disciplinary Committe";
    LookupPageId = "Disciplinary Committe";
    Caption = 'Disciplinary Committees';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            trigger OnValidate()
            begin
                if Code <> xRec.Code then begin
                    HRSetup.Get();
                    NoSeriesMgt.TestManual(HRSetup."Disciplinary Committee Nos");
                    "No series" := '';
                end;
            end;
        }
        field(2; Description; Text[200])
        {
            NotBlank = true;
            Caption = 'Description';
        }
        field(3; Comments; Text[200])
        {
            Caption = 'Comments';
        }
        field(4; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(5; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(6; Status; Option)
        {
            OptionCaption = 'Active,Disbanded';
            OptionMembers = Active,Disbanded;
            Caption = 'Status';
        }
        field(7; Mandate; Text[250])
        {
            Caption = 'Mandate';
        }
        field(8; "No series"; Code[30])
        {
            Caption = 'No series';
        }
        field(9; "No. of Members"; Integer)
        {
            CalcFormula = count("Disciplinary Committee Members" where("Commitee Code" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'No. of Members';
        }
        field(10; "Effective Date"; Date)
        {
            Caption = 'Effective Date';
        }
        field(11; "Expiry Date"; Date)
        {
            Caption = 'Expiry Date';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        if Code = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Disciplinary Committee Nos");
            NoSeriesMgt.InitSeries(HRSetup."Disciplinary Committee Nos", xRec."No series", 0D, Code, "No series");
        end;
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

