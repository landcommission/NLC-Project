#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193716 "Online User Reset Activity"
{
    Caption = 'Online User Reset Activity';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
        field(2; "User Name"; Code[50])
        {
            Editable = true;
            NotBlank = true;
            Caption = 'User Name';
        }
        field(3; "Last Modified"; DateTime)
        {
            Caption = 'Last Modified';
        }
        field(4; Name; Text[150])
        {
            Caption = 'Name';
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
