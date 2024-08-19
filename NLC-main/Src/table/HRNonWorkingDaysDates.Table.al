#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193470 "HR Non Working Days & Dates"
{
    Caption = 'HR Non Working Days & Dates';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Date; Date)
        {
            Caption = 'Date';
        }
        field(2; Reason; Text[100])
        {
            Caption = 'Reason';
        }
        field(3; Recurring; Boolean)
        {
            Caption = 'Recurring';
        }
    }

    keys
    {
        key(Key1; Date)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
