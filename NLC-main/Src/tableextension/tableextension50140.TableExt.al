#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50140 tableextension50140 extends "Purchases & Payables Setup"
{
    fields
    {
        field(50001; "Requisition No"; Code[10])
        {
            Caption = 'Requisition No';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(50002; "Quotation Request No"; Code[10])
        {
            Caption = 'Quatation Request No';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(50003; "Stores Requisition No"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Stores Requisition No';
            DataClassification = CustomerContent;
        }
        field(50004; "Max. Purchase Requisition"; Decimal)
        {
            Caption = 'Max. Purchase Requisition';
            DataClassification = CustomerContent;
        }
        field(50005; "Tender Request No"; Code[10])
        {
            Caption = 'Tender Request No';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(50006; "Stores Issue No"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Stores Issue No';
            DataClassification = CustomerContent;
        }
        field(50007; "Requisition Default Vendor"; Code[10])
        {
            Editable = true;
            TableRelation = Vendor."No.";
            Caption = 'Requisition Default Vendor';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                Vendor.Reset();
                if Vendor.Get(xRec."Requisition Default Vendor") then begin
                    Vendor."Requisition Default Vendor" := false;
                    Vendor.Modify();
                end;

                Vendor.Reset();
                if Vendor.Get(Rec."Requisition Default Vendor") then begin
                    Vendor."Requisition Default Vendor" := true;
                    Vendor.Modify();
                end;
            end;
        }
        field(50008; "Use Procurement Limits"; Boolean)
        {
            Caption = 'Use Procurement Limits';
            DataClassification = CustomerContent;
        }
        field(50009; "Inspection Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Inspection Nos';
            DataClassification = CustomerContent;
        }
        field(39004249; "No. Of Order Copies"; Integer)
        {
            Caption = 'No. Of Order Copies';
            DataClassification = CustomerContent;
        }
        field(39004250; "Copies Print Text"; Text[250])
        {
            Description = 'Text to show on print out';
            Caption = 'Copies Print Text';
            DataClassification = CustomerContent;
        }
        field(39004252; "LPO Expiry Period"; Integer)
        {
            Caption = 'LPO Expiry Period';
            DataClassification = CustomerContent;
        }
        field(39004253; "Allow Posting to Main Sub"; Boolean)
        {
            Caption = 'Allow Posting to Main Sub';
            DataClassification = CustomerContent;
        }
        field(39004254; "Implementing Partner"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Implementing Partner';
            DataClassification = CustomerContent;
        }
        field(39004255; "Study Form Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Study Form Nos';
            DataClassification = CustomerContent;
        }
        field(39004256; "Vendor Category Nos."; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Vendor Category Nos.';
            DataClassification = CustomerContent;
        }
        field(39004257; "Vendor Contact Nos."; Code[10])
        {
            Caption = 'Vendor Contact Nos.';
            DataClassification = CustomerContent;
        }
        field(39004258; "Vendor Category Entries Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Vendor Category Entries Nos';
            DataClassification = CustomerContent;
        }
        field(39004259; "Proposal Code Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Proposal Code Nos';
            DataClassification = CustomerContent;
        }
        field(39004260; "Start Order from Requisition"; Boolean)
        {
            Caption = 'Start Order from Requisition';
            DataClassification = CustomerContent;
        }
        field(39004261; "Inspection List"; Code[10])
        {
            Caption = 'Inspection List';
            DataClassification = CustomerContent;
        }
        field(39004262; "Appraisal Parameter No"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Appraisal Parameter No';
            DataClassification = CustomerContent;
        }
        field(39004263; "Tender No"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Tender No';
            DataClassification = CustomerContent;
        }
        field(39004264; "Contract No"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Contract No';
            DataClassification = CustomerContent;
        }
        field(39004265; "Purchase Req No"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Purchase Req No';
            DataClassification = CustomerContent;
        }
        field(39004266; "Store Requisition Nos."; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Store Requisition Nos.';
            DataClassification = CustomerContent;
        }
        field(39004268; "Hotel Nos."; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Hotel Nos.';
            DataClassification = CustomerContent;
        }
        field(39004269; "Disposal Process Nos."; Code[20])
        {
            TableRelation = "No. Series";
            Caption = '"Disposal Process Nos.';
            DataClassification = CustomerContent;
        }
        field(39004270; "Internal Memo Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(39004271; "Asset Receiving No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(390004275; "File Movement Numbers"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }

    }

    var
        Vendor: Record Vendor;
}
