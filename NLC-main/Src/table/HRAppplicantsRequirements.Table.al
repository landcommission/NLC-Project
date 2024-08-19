#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193608 "HR Appplicants Requirements"
{
    Caption = 'HR Appplicants Requirements';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Job ID"; Code[50])
        {
            NotBlank = true;
            TableRelation = "HR Jobs"."Job ID";
            Caption = 'Job ID';
        }
        field(2; "Qualification Type"; Code[60])
        {
            NotBlank = false;
            TableRelation = "HR Lookup Values".Code where(Type = filter("Qualification Type"));
            Caption = 'Qualification Type';
        }
        field(3; "Qualification Code"; Code[30])
        {
            TableRelation = "HR Job Qualifications".Code where("Qualification Type" = field("Qualification Type"));
            Caption = 'Qualification Code';

        }
        field(6; Priority; Option)
        {
            OptionMembers = " ",High,Medium,Low;
            Caption = 'Priority';
        }
        field(8; "Score ID"; Decimal)
        {
            Editable = false;
            Caption = 'Score ID';
        }
        field(9; "Need code"; Code[10])
        {
            Caption = 'Need code';
            //TableRelation = Table0;
        }
        field(10; "Stage Code"; Code[10])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const(Scores));
            Caption = 'Stage Code';
        }
        field(11; Mandatory; Boolean)
        {
            Caption = 'Mandatory';
        }
        field(12; "Minimum Score"; Decimal)
        {
            Editable = false;
            Caption = 'Minimum Score';
        }
        field(13; "Total (Stage)Desired Score"; Decimal)
        {
            Editable = false;
            Caption = 'Total (Stage)Desired Score';
        }
        field(14; "Qualification Description"; Text[250])
        {
            Caption = 'Qualification Description';
        }
        field(15; "Maximum Score"; Decimal)
        {
            Editable = false;
            Caption = 'Maximum Score';
        }
        field(16; Relevant; Boolean)
        {
            Caption = 'Relevant';
        }
        field(17; "Related Qualification"; Code[20])
        {
            Caption = 'Related Qualification';
        }
        field(18; ApplicantNo; Integer)
        {
            Caption = 'ApplicantNo';
        }
        field(19; "Application No"; Code[30])
        {
            Caption = 'Application No';
        }
        field(21; "Related Description"; Text[100])
        {
            Caption = 'Related Description';
        }
        field(22; "Requisition ID"; Code[50])
        {
            Caption = 'Requisition ID';
        }
    }

    keys
    {
        key(Key1; "Job ID", "Qualification Type", "Qualification Code", ApplicantNo, "Application No")
        {
            Clustered = true;
            SumIndexFields = "Score ID";
        }
    }

    fieldgroups { }


    var
        HRQualifications: Record "HR Job Qualifications";
        HRjobs: Record "HR Jobs";
        Usersetup: Record "User Setup";
}
