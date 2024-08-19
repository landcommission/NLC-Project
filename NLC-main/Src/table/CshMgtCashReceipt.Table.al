#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193646 "CshMgt Cash Receipt"
{
    Caption = 'CshMgt Cash Receipt';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Issue No."; Code[20])
        {
            Caption = 'Issue No.';
        }
        field(3; "Receipt Date"; Date)
        {
            Caption = 'Receipt Date';
        }
        field(4; "Receipt Time"; Time)
        {
            Caption = 'Receipt Time';
        }
        field(5; "Issuer ID"; Code[20])
        {
            Caption = 'Issuer ID';
        }
        field(6; "Issuer Name"; Text[30])
        {
            Caption = 'Issuer Name';
        }
        field(7; "Issuer Acc. No."; Code[20])
        {
            Caption = 'Issuer Acc. No.';
        }
        field(8; "Issue Amount"; Decimal)
        {
            Caption = 'Issue Amount';
        }
        field(9; "Receiver ID"; Code[20])
        {
            Caption = 'Receiver ID';
        }
        field(10; "Receiver Acc. No."; Code[20])
        {
            Caption = 'Receiver Acc. No.';
        }
        field(11; "Receiver Amount"; Decimal)
        {
            Caption = 'Receiver Amount';
        }
        field(12; Remarks; Text[250])
        {
            Caption = 'Remarks';
        }
        field(13; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Caption = 'Global Dimension 1 Code';
        }
        field(14; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            Caption = 'Global Dimension 2 Code';
        }
        field(15; Posted; Boolean)
        {
            Caption = 'Posted';
        }
        field(16; "Posted Date"; Date)
        {
            Caption = 'Posted Date';
        }
        field(17; "Posted Time"; Time)
        {
            Caption = 'Posted Time';
        }
        field(18; "Posted By"; Code[20])
        {
            Caption = 'Posted By';
        }
        field(19; "Receiver Name"; Text[30])
        {
            Caption = 'Receiver Name';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
