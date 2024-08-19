#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193472 "HR Committees"
{
    Caption = 'HR Committees';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
            Caption = 'Code';
        }
        field(2; Description; Text[200])
        {
            NotBlank = true;
            Caption = 'Description';
        }
        field(3; Roles; Text[200])
        {
            Caption = 'Roles';
        }
        field(4; "Transaction Amount"; Decimal)
        {
            Caption = 'Transaction Amount';
        }
        field(5; "Transaction Code"; Code[45])
        {
            TableRelation = "Bank Bal. Alert Buffer"."Line No.";
            Caption = 'Transaction Code';
        }
        field(6; "Monetary Benefit?"; Boolean)
        {
            Caption = 'Monetary Benefit?';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
