#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 69637 "Commitee Guideline"
{
    Caption = 'Commitee Guideline';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Committee Type ID"; Code[30])
        {
            TableRelation = "Committee Type";
            Caption = 'Committee Type ID';
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(3; Description; Text[300])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Committee Type ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}

