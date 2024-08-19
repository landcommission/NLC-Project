#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193522 "HR Perspectives Setup"
{
    Caption = 'HR Perspectives Setup';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Qualification Type"; Code[50])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const("Qualification Type"));
            Caption = 'Qualification Type';
        }
        field(2; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(6; Description; Text[250])
        {
            Caption = 'Description';
            NotBlank = true;
        }
    }

    keys
    {
        key(Key1; "Qualification Type", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
