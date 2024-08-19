#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193692 "Bid Analysis"
{
    Caption = 'Bid Analysis';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "RFQ No."; Code[20])
        {
            Caption = 'RFQ No.';
        }
        field(2; "RFQ Line No."; Integer)
        {
            Caption = 'RFQ Line No.';
        }
        field(3; "Quote No."; Code[20])
        {
            Caption = 'Quote No.';
        }
        field(4; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
        }
        field(5; "Item No."; Code[20])
        {
            Caption = 'Item No.';
        }
        field(6; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(7; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(8; "Unit Of Measure"; Code[20])
        {
            Caption = 'Unit Of Measure';
        }
        field(9; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(10; "Line Amount"; Decimal)
        {
            Caption = 'Line Amount';
        }
        field(11; Total; Decimal)
        {
            Caption = 'Total';
        }
        field(12; "Last Direct Cost"; Decimal)
        {
            CalcFormula = lookup(Item."Last Direct Cost" where("No." = field("Item No.")));
            FieldClass = FlowField;
            Caption = 'Last Direct Cost';
            Editable = false;
        }
        field(13; Remarks; Text[50])
        {
            Caption = 'Remarks';
            trigger OnValidate()
            begin
                PurchLine.Reset();
                PurchLine.SetRange(PurchLine."Document Type", PurchLine."Document Type"::Quote);
                PurchLine.SetRange(PurchLine."Document No.", "Quote No.");
                PurchLine.SetRange(PurchLine."Line No.", "RFQ Line No.");
                if PurchLine.FindSet() then begin
                    PurchLine."RFQ Remarks" := Remarks;
                    PurchLine.Modify();
                end
            end;
        }
    }

    keys
    {
        key(Key1; "RFQ No.", "RFQ Line No.", "Quote No.", "Vendor No.")
        {
            Clustered = true;
        }
        key(Key2; "Item No.") { }
        key(Key3; "Vendor No.") { }
    }

    fieldgroups { }

    var
        PurchLine: Record "Purchase Line";
}
