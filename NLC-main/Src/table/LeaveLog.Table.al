#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 80000 "Leave Log"
{
    Caption = 'Leave Log';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Doc No"; Code[50])
        {
            Caption = 'Doc No';
        }
        field(2; "Prev Status"; Text[50])
        {
            Caption = 'Prev Status';
        }
        field(3; "New Status"; Text[50])
        {
            Caption = 'New Status';
        }
    }

    keys
    {
        key(Key1; "Doc No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
