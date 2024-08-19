#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193767 "Grants Compliance"
{
    DrillDownPageId = "Staff Advance Lines";
    LookupPageId = "Staff Advance Lines";
    Caption = 'Grants Compliance';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Grant No"; Code[20])
        {
            TableRelation = Jobs."No.";
            Caption = 'Grant No';
        }
        field(2; "Compliance Code"; Code[20])
        {
            Caption = 'Compliance Code';
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(4; Compliance; Boolean)
        {
            Caption = 'Compliance';
        }
        field(5; User; Code[50])
        {
            TableRelation = User."User Name";
            Caption = 'User';
        }
        field(6; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(7; Comments; Text[250])
        {
            Caption = 'Comments';
        }
        field(8; "Date Issued"; Date)
        {
            Caption = 'Date Issued';
        }
    }

    keys
    {
        key(Key1; "Grant No", "Compliance Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
