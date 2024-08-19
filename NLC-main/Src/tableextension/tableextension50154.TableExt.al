#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50154 tableextension50154 extends "Purchase Header Archive"
{
    fields
    {
        field(39005536; Cancelled; Boolean)
        {
            Editable = false;
            Caption = 'Cancelled';
            DataClassification = CustomerContent;
        }
        field(39005537; "Cancelled By"; Code[20])
        {
            Caption = 'Cancelled By';
            DataClassification = CustomerContent;
        }
        field(39005538; "Cancelled Date"; Date)
        {
            Caption = 'Cancelled Date';
            DataClassification = CustomerContent;
        }
        field(39005539; DocApprovalType; Option)
        {
            OptionMembers = Purchase,Requisition,Quote,Capex;
            Caption = 'DocApprovalType';
            DataClassification = CustomerContent;
        }
        field(39005540; "Procurement Type Code"; Code[20])
        {
            Caption = 'Procurement Type Code';
            DataClassification = CustomerContent;
            // //TableRelation = Table39005884;
        }
        field(39005541; "Invoice Basis"; Option)
        {
            OptionMembers = "PO Based","Direct Invoice";
            Caption = 'Invoice Basis';
            DataClassification = CustomerContent;
        }
        field(39005544; "RFQ No."; Code[20])
        {
            TableRelation = "Purchase Quote Header" where(Status = const(Released));
            Caption = 'RFQ No.';
            DataClassification = CustomerContent;

        }
        field(39005550; "Expiry Date"; Date)
        {
            Caption = 'Expiry Date';
            DataClassification = CustomerContent;
        }
        field(39005551; "Special Remark"; Text[50])
        {
            Caption = 'Special Remark';
            DataClassification = CustomerContent;
        }
    }
}
