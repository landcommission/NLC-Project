#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193694 "Supply Chain Management Cues"
{
    Caption = 'Supply Chain Management Cues';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Primary Key"; Integer)
        {
            Caption = 'Primary Key';
        }
        field(2; "Active Contracts"; Integer)
        {
            CalcFormula = count(Contracts where(Status = filter(Active)));
            FieldClass = FlowField;
            Caption = 'Active Contracts';
            Editable = false;
        }
        field(3; "Renewed Contracts"; Integer)
        {
            CalcFormula = count(Contracts where(Status = filter(Renewed)));
            FieldClass = FlowField;
            Caption = 'Renewed Contracts';
            Editable = false;
        }
        field(4; "Closed Contracts"; Integer)
        {
            Caption = 'Closed Contracts';
        }
        field(8; "Open Vendor Valuation"; Integer)
        {
            Caption = 'Open Vendor Valuation';
        }
        field(9; "Pending Vendor Valuation"; Integer)
        {
            Caption = 'Pending Vendor Valuation';
        }
        field(10; "Approved Vendor Valuation"; Integer)
        {
            Caption = 'Approved Vendor Valuation';
        }
        field(15; "Open WorkPlans"; Integer)
        {
            Caption = 'Open WorkPlans';
        }
        field(16; "Pending WorkPlans"; Integer)
        {
            Caption = 'Pending WorkPlans';
        }
        field(17; "Approved WorkPlans"; Integer)
        {
            Caption = 'Approved WorkPlans';
        }
        field(20; "Open Tenders"; Integer)
        {
            Caption = 'Open Tenders';
        }
        field(21; "Pending Tenders"; Integer)
        {
            Caption = 'Pending Tenders';
        }
        field(22; "Approved Tenders"; Integer)
        {
            Caption = 'Approved Tenders';
        }
        field(26; "Order Processing"; Integer)
        {
            FieldClass = Normal;
            Caption = 'Order Processing';
        }
        field(27; "Purchase Requisition"; Integer)
        {
            CalcFormula = count("Purchase Header" where("Document Type" = filter(Quote)));
            FieldClass = FlowField;
            Caption = 'Purchase Requisition';
            Editable = false;
        }
        field(28; "Request For Quotation"; Integer)
        {
            FieldClass = FlowField;
            Caption = 'Request For Quotation';
            Editable = false;
        }
        field(29; "Restricted Tendering"; Integer)
        {
            Caption = 'Restricted Tendering';
        }
        field(30; "Dircet Procurement"; Integer)
        {
            Caption = 'Dircet Procurement';
        }
        field(31; "Low Value Procurement"; Integer)
        {
            CalcFormula = count("Purchase Quote Header" where("Document Type" = filter("Low Value Procurement")));
            FieldClass = FlowField;
            Caption = 'Low Value Procurement';
            Editable = false;
        }
        field(32; "Direct Procurement"; Integer)
        {
            CalcFormula = count("Purchase Quote Header" where("Document Type" = filter("Direct Procurement")));
            FieldClass = FlowField;
            Caption = 'Direct Procurement';
            Editable = false;
        }
        field(33; "Purchase Quote"; Integer)
        {
            Caption = 'Purchase Quote';
        }
        field(34; "Purchase Order"; Integer)
        {
            Caption = 'Purchase Order';
        }
        field(35; "Purchase Invoice"; Integer)
        {
            Caption = 'Purchase Invoice';
        }
        field(36; "Open Tendering"; Integer)
        {
            CalcFormula = count("Purchase Quote Header" where("Document Type" = filter("Open Tender")));
            FieldClass = FlowField;
            Caption = 'Open Tendering';
            Editable = false;
        }
        field(37; "Stores Requisition"; Integer)
        {
            Caption = 'Stores Requisition';
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
