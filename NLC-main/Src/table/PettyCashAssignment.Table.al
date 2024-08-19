#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193672 "Petty Cash Assignment"
{
    Caption = 'Petty Cash Assignment';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Status; Option)
        {
            OptionMembers = New,Approval,Issue,Confirmation;
            Caption = 'Status';
        }
        field(2; "Assigned User"; Code[20])
        {
            Caption = 'Assigned User';

        }
        field(3; "Allow Print"; Boolean)
        {
            Caption = 'Allow Print';
        }
    }

    keys
    {
        key(Key1; Status, "Assigned User")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        LoginMgt: Codeunit "User Management";
}
