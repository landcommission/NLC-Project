#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193738 "Job-Register"
{
    Caption = 'Job Register';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
        }
        field(2; "From Entry No."; Integer)
        {
            Caption = 'From Entry No.';
            TableRelation = "Job-Ledger Entry";
        }
        field(3; "To Entry No."; Integer)
        {
            Caption = 'To Entry No.';
            TableRelation = "Job-Ledger Entry";
        }
        field(4; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
        }
        field(5; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(6; "User ID"; Code[50])
        {
            Caption = 'User ID';
            TableRelation = User;

        }
        field(7; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Creation Date") { }
        key(Key3; "Source Code", "Journal Batch Name", "Creation Date") { }
    }

    fieldgroups { }
}
