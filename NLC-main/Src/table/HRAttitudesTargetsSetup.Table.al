#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193700 "HR Attitudes Targets Setup"
{
    Caption = 'HR Attitudes Targets Setup';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
        field(2; Criteria; Code[50])
        {
            TableRelation = "HR Criteria Setup".Code;
            Caption = 'Criteria';

        }
        field(3; Attributes; Text[250])
        {
            Caption = 'Attributes';
        }
        field(4; "Appraisal Year"; Code[50])
        {
            Caption = 'Appraisal Year';
        }
        field(5; "Job Grade"; Code[50])
        {
            Caption = 'Job Grade';
        }
        field(6; Remarks; Text[100])
        {
            Caption = 'Remarks';
        }
        field(7; "Attitude Description"; Text[250])
        {
            Caption = 'Attitude Description';
        }
        field(8; "Code"; Code[10])
        {
            Caption = 'Code';
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
