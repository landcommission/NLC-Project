#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193684 "Quotation Request Vendors"
{
    Caption = 'Quotation Request Vendors';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionMembers = "Quotation Request","Open Tender","Restricted Tender";
            Caption = 'Document Type';
        }
        field(2; "Requisition Document No."; Code[20])
        {
            Caption = 'Requisition Document No.';
        }
        field(3; "Vendor No."; Code[20])
        {
            TableRelation = Vendor where("Vendor Posting Group" = filter(<> 'DRIVERS'));
            Caption = 'Vendor No.';
        }
        field(4; "Vendor Name"; Text[100])
        {
            CalcFormula = lookup(Vendor.Name where("No." = field("Vendor No.")));
            FieldClass = FlowField;
            Caption = 'Vendor Name';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Requisition Document No.", "Vendor No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
