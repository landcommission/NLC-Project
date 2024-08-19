#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193648 "Proc. Method Stage Duration"
{
    Caption = 'Proc. Method Stage Duration';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Proc. Method No."; Code[20])
        {
            Caption = 'Proc. Method No.';
        }
        field(2; Stage; Code[20])
        {
            Caption = 'Stage';

        }
        field(3; "Duration(Days)"; Integer)
        {
            Caption = 'Duration(Days)';
        }
        field(4; "Sorting No."; Integer)
        {
            Caption = 'Sorting No.';

        }
        field(5; Description; Text[50])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; Stage, "Proc. Method No.")
        {
            Clustered = true;
        }
        key(Key2; "Sorting No.") { }
    }

    fieldgroups { }

    var
        me: Record "Proc. Method Stage Duration";
        StagesRec: Record "Loader Group";
}
