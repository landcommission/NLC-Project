#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193765 "Project Components"
{
    Caption = 'Project Components';
    DataClassification = CustomerContent;
    fields
    {
        field(1; LineNo; Integer)
        {
            AutoIncrement = true;
            Caption = 'LineNo';
        }
        field(2; Components; Text[100])
        {
            Caption = 'Components';
        }
        field(4; "Project Code"; Code[10])
        {
            TableRelation = Jobs where("Grant Level" = filter("Sub-Grant"));
            Caption = 'Project Code';
        }
    }

    keys
    {
        key(Key1; "Project Code", LineNo)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
