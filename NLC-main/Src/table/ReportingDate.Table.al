#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193756 "Reporting Date"
{
    Caption = 'Reporting Date';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "code"; Code[20])
        {
            Caption = 'code';
        }
        field(2; "Financial Reporting Date"; Date)
        {
            Caption = 'Financial Reporting Date';
        }
        field(3; "Technical Reporting Date"; Date)
        {
            Caption = 'Technical Reporting Date';
        }
    }

    keys
    {
        key(Key1; "code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
