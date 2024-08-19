#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50126 tableextension50126 extends "Purch. Inv. Header"
{
    fields
    {
        field(50000; Copied; Boolean)
        {
            Caption = 'Copied';
            DataClassification = CustomerContent;
        }
        field(50001; "Debit Note"; Boolean)
        {
            Caption = 'Debit Note';
            DataClassification = CustomerContent;
        }
        field(50002; "Request for Quote No."; Code[20])
        {
            Description = 'Added this field';
            TableRelation = "Purchase Quote Line"."Document No.";
            Caption = 'Request for Quote No.';
            DataClassification = CustomerContent;
        }
        field(50003; "Quote Comments"; Text[250])
        {
            Description = 'Store Comments of Purchase Quote in the DB (Added)';
            Caption = 'Quote Comments';
            DataClassification = CustomerContent;
        }
        field(50004; "Responsibility Center Name"; Text[100])
        {
            Description = 'Stores Responsibilty Center Name in the database (Added)';
            Caption = 'Responsibility Center Name';
            DataClassification = CustomerContent;
        }
        field(50005; "Donor Name"; Text[50])
        {
            Description = 'Stores Donor Name in the database (Added)';
            Caption = 'Donor Name';
            DataClassification = CustomerContent;
        }
        field(50006; "Pillar Name"; Text[50])
        {
            Description = 'Stores Pillar Name in the database (Added)';
            Caption = 'Pillar Name';
            DataClassification = CustomerContent;
        }
        field(50009; "Quote Comments 2"; Text[150])
        {
            Caption = 'Quote Comments 2';
            DataClassification = CustomerContent;
        }
        field(50010; "Quote Comments 3"; Text[100])
        {
            Enabled = false;
            Caption = 'Quote Comments 3';
            DataClassification = CustomerContent;
        }
        field(50011; "Recommendation 1"; Text[150])
        {
            Caption = 'Recommendation 1';
            DataClassification = CustomerContent;
        }
        field(50012; "Recommendation 2"; Text[150])
        {
            Caption = 'Recommendation 2';
            DataClassification = CustomerContent;
        }
        field(50013; "Project Code"; Code[10])
        {
            Caption = 'Project Code';
            DataClassification = CustomerContent;
        }
        field(50014; "Archive Unused Doc"; Boolean)
        {
            Caption = 'Archive Unused Doc';
            DataClassification = CustomerContent;
        }
        field(50050; "VAT Method"; Option)
        {
            OptionCaption = 'Expensed,Recovered';
            OptionMembers = Expensed,Recovered;
            Caption = 'VAT Method';
            DataClassification = CustomerContent;
        }
        /* field(39005536;Cancelled;Boolean)
        {
            Editable = false;
        } */
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
            TableRelation = "CshMgt PV Steps";
            Caption = 'Procurement Type Code';
            DataClassification = CustomerContent;
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
        field(39005552; "Responsible Officer"; Code[50])
        {
            TableRelation = "User Setup" where("Procurement Officer" = filter(true));
            Caption = 'Responsible Officer';
            DataClassification = CustomerContent;
        }
        field(39005553; Type; Option)
        {
            OptionCaption = ' ,LPO,LSO';
            OptionMembers = " ",LPO,LSO;
            Caption = 'Type';
            DataClassification = CustomerContent;
        }
        field(39005554; "Imprest Purchase Doc No"; Code[20])
        {
            Caption = 'Imprest Purchase Doc No';
            DataClassification = CustomerContent;
        }
        field(39005555; "Manual LPO No."; Code[20])
        {
            Caption = 'Manual LPO No.';
            DataClassification = CustomerContent;
        }
        field(39005556; "Requisition No."; Code[20])
        {
            TableRelation = "Purchase Quote Header"."No." where(Status = const(Released));
            Caption = 'Requisition No.';
            DataClassification = CustomerContent;
        }
    }
}
