#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193778 "Jobs Comments"
{
    Caption = 'Jobs Comments';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "jobs no"; Code[50])
        {
            Caption = 'jobs no';
        }
        field(2; Comments; Text[250])
        {
            Caption = 'Comments';
        }
        field(3; "Date Comments"; Date)
        {
            Caption = 'Date Comments';
        }
    }

    keys
    {
        key(Key1; "jobs no")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
