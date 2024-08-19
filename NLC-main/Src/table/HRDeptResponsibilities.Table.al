#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193863 "HR Dept. Responsibilities"
{
    Caption = 'HR Dept. Responsibilities';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Responsibility code"; Code[20])
        {
            Caption = 'Responsibility code';
        }
        field(2; "Responsibility Description"; Text[250])
        {
            Caption = 'Responsibility Description';
        }
        field(3; Remarks; Text[250])
        {
            Caption = 'Remarks';
        }
    }

    keys
    {
        key(Key1; "Responsibility code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
