#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193762 "Project Roles"
{
    Caption = 'Project Roles';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Role; Code[20])
        {
            Caption = 'Role';
        }
        field(2; "Role Description"; Text[100])
        {
            Caption = 'Role Description';
        }
    }

    keys
    {
        key(Key1; Role)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
