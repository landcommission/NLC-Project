#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193699 "HR Criteria Setup"
{
    Caption = 'HR Criteria Setup';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(3; "Job Grade"; Code[50])
        {
            TableRelation = "HR Lookup Values".Type where(Type = filter("Job Group"));
            Caption = 'Job Grade';
        }
        field(4; "Job Group Range"; Code[50])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const(Grade));
            Caption = 'Job Group Range';
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
}
