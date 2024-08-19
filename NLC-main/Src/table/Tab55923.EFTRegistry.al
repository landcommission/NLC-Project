table 55923 "EFT Registry"
{
    Caption = 'EFT Registry';
    //DrillDownPageID = UnknownPage51126;
    //LookupPageID = UnknownPage51126;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Editable = false;
        }
        field(2; "Creation Batch Number"; Code[20])
        {
            Editable = false;
            NotBlank = true;
            TableRelation = "EFT Registry";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(3; "Vendor No."; Code[20])
        {
            Editable = false;
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                Vendor.Get("Vendor No.");
                "Vendor Name" := Vendor.Name;
                "Vendor Email" := Vendor."E-Mail";
            end;
        }
        field(4; "Document No."; Code[20])
        {
            Editable = false;
        }
        field(5; "User ID"; Code[50])
        {
            Editable = false;
            TableRelation = User;
        }
        field(6; "DateTime Created"; DateTime)
        {
            Editable = false;
        }
        field(8; Exported; Boolean)
        {
            Editable = true;
        }
        field(10; "DateTime Exported"; DateTime)
        {
            Editable = false;
        }
        field(11; "Exported by"; Code[50])
        {
            Editable = false;
            TableRelation = User;
        }
        field(12; "Re-Exported by"; Code[50])
        {
            Editable = false;
            TableRelation = User;
        }
        field(13; "Entry Type"; Option)
        {
            Editable = false;
            OptionMembers = Payment,"Paid Invoice";
        }
        field(14; "Amount (LCY)"; Decimal)
        {
            Editable = false;
        }
        field(15; "Bank Account No."; Code[20])
        {
        }
        field(16; "Vendor Name"; Text[50])
        {
            Editable = false;
        }
        field(17; "Invoice No."; Code[20])
        {
            Editable = false;
        }
        field(18; "Re-Exported"; Boolean)
        {
            Editable = false;
        }
        field(19; "Date Re-Exported"; Date)
        {
            Editable = false;
        }
        field(20; "External Document Number"; Code[50])
        {
            Editable = false;
        }
        field(21; "Transaction Date"; Date)
        {
            Editable = false;
        }
        field(23; "Exported Batch No."; Code[20])
        {
            Editable = false;
        }
        field(24; "Bank Code"; Code[2])
        {
        }
        field(25; "Bank Branch Code"; Code[10])
        {
        }
        field(26; "Re-Exported Batch No."; Code[20])
        {
        }
        field(27; Amount; Decimal)
        {
        }
        field(28; "Currency Code"; Code[20])
        {
        }
        field(29; Export; Boolean)
        {
        }
        field(30; "Purchase Order"; Code[30])
        {
            TableRelation = "Purchase Header"."No." where("Document Type" = const(Order),
                                                           Status = const(Released));
        }
        field(31; "Vendor Email"; Code[100])
        {
            CalcFormula = lookup(Vendor."E-Mail" where("No." = field("Vendor No.")));
            ExtendedDatatype = EMail;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Entry No.", "Creation Batch Number")
        {
            Clustered = true;
        }
        key(Key2; "Vendor No.")
        {
        }
        key(Key3; "Document No.")
        {
        }
        key(Key4; "Creation Batch Number", "Vendor No.", Exported, "Exported Batch No.")
        {
            SumIndexFields = Amount;
        }
        key(Key5; "Exported Batch No.")
        {
        }
        key(Key6; "Exported Batch No.", "Vendor No.")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Creation Batch Number", "Vendor No.", "Document No.", "Invoice No.", "External Document Number", "Transaction Date", Amount, "Currency Code")
        {
        }
    }

    var
        // TransferTableCode: Codeunit "Table Code Transferred-Layer";
        Vendor: Record Vendor;

    procedure GetVendorInvoiceRec(VendorNo: Code[20]; DocumentNo: Code[20]; var DetVendLedgEntry: Record "Detailed Vendor Ledg. Entry")
    begin
        // TransferTableCode.EFTRegistryGetVendorInvoiceRec(VendorNo, DocumentNo, DetVendLedgEntry);
    end;

    procedure GetVendorInvoiceCount(VendorNo: Code[20]; DocumentNo: Code[20]): Integer
    begin
        //  TransferTableCode.EFTRegistryGetVendorInvoiceCount(VendorNo, DocumentNo);
    end;
}

