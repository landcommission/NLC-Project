#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193645 "CshMgt Cash Issue"
{
    DrillDownPageId = "Imprest Vouchers List";
    LookupPageId = "Imprest Vouchers List";
    Caption = 'CshMgt Cash Issue';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "No."; Code[20])
        {
            Editable = false;
            Caption = 'No.';
        }
        field(2; "Request No."; Code[20])
        {
            Editable = false;
            Caption = 'Request No.';
        }
        field(3; "Issue Date"; Date)
        {
            Editable = false;
            Caption = 'Issue Date';
        }
        field(4; "Issue Time"; Time)
        {
            Editable = false;
            Caption = 'Issue Time';
        }
        field(5; "Requester ID"; Code[20])
        {
            Editable = false;
            Caption = 'Requester ID';
        }
        field(6; "Requester Name"; Text[30])
        {
            Editable = false;
            Caption = 'Requester Name';
        }
        field(7; "Requester Acc. No."; Code[20])
        {
            Editable = false;
            Caption = 'Requester Acc. No.';
        }
        field(8; "Request Amount"; Decimal)
        {
            Editable = false;
            Caption = 'Request Amount';
        }
        field(9; "Issuer ID"; Code[20])
        {
            Editable = false;
            Caption = 'Issuer ID';
        }
        field(10; "Issuer Name"; Text[30])
        {
            Editable = false;
            Caption = 'Issuer Name';
        }
        field(11; "Issuer Acc. No."; Code[20])
        {
            Editable = false;
            Caption = 'Issuer Acc. No.';
        }
        field(12; "Issue Amount"; Decimal)
        {
            Caption = 'Issue Amount';
        }
        field(13; Remarks; Text[250])
        {
            Caption = 'Remarks';
        }
        field(14; Posted; Boolean)
        {
            Editable = false;
            Caption = 'Posted';
        }
        field(15; "Posted By"; Code[20])
        {
            Editable = false;
            Caption = 'Posted By';
        }
        field(16; "Posted Date"; Date)
        {
            Editable = false;
            Caption = 'Posted Date';
        }
        field(17; "Posted Time"; Time)
        {
            Editable = false;
            Caption = 'Posted Time';
        }
        field(18; Receipted; Boolean)
        {
            Editable = false;
            Caption = 'Receipted';
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
