#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 69510 "Plaintive-Defentants"
{
    Caption = 'Plaintive-Defentants';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Type; Option)
        {
            OptionCaption = 'Plaintive,Defendant';
            OptionMembers = Plaintive,Defendant;
            Caption = 'Type';
        }
        field(3; Names; Code[255])
        {
            Caption = 'Names';
        }
        field(4; Contact; Code[100])
        {
            Caption = 'Contact';
        }
    }

    keys
    {
        key(Key1; "Code", Type)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}

