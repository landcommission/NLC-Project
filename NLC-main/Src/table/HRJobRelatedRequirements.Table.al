#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193898 "HR Job Related Requirements"
{
    Caption = 'HR Job Related Requirements';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Qualification ID"; Code[50])
        {
            NotBlank = true;
            TableRelation = "HR Job Requirements"."Qualification Code";
            Caption = 'Qualification ID';
        }
        field(2; "Qualification Type"; Code[20])
        {
            NotBlank = false;
            TableRelation = "HR Lookup Values".Code where(Type = filter("Qualification Type"));
            Caption = 'Qualification Type';
        }
        field(3; "Qualification Code"; Code[30])
        {
            TableRelation = "HR Job Qualifications".Code where(Code = const('REL-001'));
            Caption = 'Qualification Code';

        }
        field(6; Priority; Option)
        {
            OptionMembers = " ",High,Medium,Low;
            Caption = 'Priority';
        }
        field(8; "Score ID"; Decimal)
        {
            Caption = 'Score ID';
        }
        field(9; "Need code"; Code[10])
        {
            Caption = 'Need code';
            //TableRelation = Table0;
        }
        field(10; "Stage Code"; Code[10])
        {
            Caption = 'Stage Code';
        }
        field(11; Mandatory; Boolean)
        {
            Caption = 'Mandatory';
        }
        field(12; "Minimum Score"; Decimal)
        {
            Caption = 'Minimum Score';
        }
        field(13; "Total (Stage)Desired Score"; Decimal)
        {
            Caption = 'Total (Stage)Desired Score';
        }
        field(14; "Qualification Description"; Text[100])
        {
            Caption = 'Qualification Description';
        }
        field(15; "Maximum Score"; Decimal)
        {
            Caption = 'Maximum Score';
        }
        field(16; Relevant; Boolean)
        {
            Caption = 'Relevant';
        }
        field(17; "Job ID"; Code[50])
        {
            TableRelation = "HR Job Requirements"."Job ID" where("Qualification Type" = field("Qualification Type"),
                                                                  "Qualification Code" = field("Qualification ID"));
            Caption = 'Job ID';
        }
        field(18; No; Code[20])
        {
            Caption = 'No';
        }
        field(19; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'No. Series';
        }
    }

    keys
    {
        key(Key1; "Qualification Type", "Qualification ID", No)
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin

        if No = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Acceleration Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Acceleration Nos.", xRec."No. Series", 0D, No, "No. Series");
        end;
    end;

    var
        HRQualifications: Record "HR Job Qualifications";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRSetup: Record "HR Setup";
}
