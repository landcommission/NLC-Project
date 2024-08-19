#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193583 "HR Organizational Indicators"
{
    Caption = 'HR Organizational Indicators';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(3; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('DIVISION'));
            Caption = 'Department Code';
        }
        field(4; Active; Boolean)
        {
            Caption = 'Active';
        }
        field(5; Name; Text[250])
        {
            Caption = 'Name';
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
