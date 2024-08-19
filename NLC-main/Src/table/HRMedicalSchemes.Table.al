#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193503 "HR Medical Schemes"
{
    DrillDownPageId = "Asset Purchase Requisition Ls";
    LookupPageId = "Asset Purchase Requisition Ls";
    Caption = 'HR Medical Schemes';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Scheme No"; Code[10])
        {
            Caption = 'Scheme No';
        }
        field(2; "Medical Insurer"; Code[10])
        {
            TableRelation = Vendor."No.";
            Caption = 'Medical Insurer';
            trigger OnValidate()
            begin

                Insurer.Reset();
                Insurer.SetRange(Insurer."No.", "Medical Insurer");
                if Insurer.Find('-') then
                    "Insurer Name" := Insurer.Name;
            end;
        }
        field(3; "Scheme Name"; Text[250])
        {
            Caption = 'Scheme Name';
        }
        field(4; "In-patient limit"; Decimal)
        {
            Caption = 'In-patient limit';
        }
        field(5; "Out-patient limit"; Decimal)
        {
            Caption = 'Out-patient limit';
        }
        field(6; "Area Covered"; Text[30])
        {
            Caption = 'Area Covered';
        }
        field(7; "Dependants Included"; Boolean)
        {
            Caption = 'Dependants Included';
        }
        field(8; Comments; Text[100])
        {
            Caption = 'Comments';
        }
        field(9; "Insurer Name"; Text[250])
        {
            Caption = 'Insurer Name';
        }
    }

    keys
    {
        key(Key1; "Scheme No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        Insurer: Record Vendor;
}
