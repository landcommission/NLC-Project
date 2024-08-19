#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193787 "Evaluation Year"
{
    DrillDownPageId = "Evaluation Year List";
    LookupPageId = "Evaluation Year List";
    Caption = 'Evaluation Year';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Year; Integer)
        {
            Caption = 'Year';
        }
        field(3; Description; Code[20])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; Year, "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
