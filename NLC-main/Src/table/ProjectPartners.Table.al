#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193757 "Project Partners"
{
    DrillDownPageId = "Project Partners";
    LookupPageId = "Project Partners";
    Caption = 'Project Partners';
    DataClassification = CustomerContent;
    fields
    {
        field(1; PartnerID; Code[20])
        {
            NotBlank = true;
            TableRelation = Vendor where(Blocked = filter(" "));
            Caption = 'PartnerID';
            trigger OnValidate()
            begin
                Cust.Get(PartnerID);
                "Partner Name" := Cust.Name;
            end;
        }
        field(2; "Partner Name"; Text[100])
        {
            Caption = 'Partner Name';
        }
        field(3; "Partner Budget"; Decimal)
        {
            CalcFormula = sum("Job-Planning Line"."Total Cost (LCY)" where(Partner = field(PartnerID),
                                                                            "Grant No." = field("Grant No")));
            FieldClass = FlowField;
            Caption = 'Partner Budget';
            Editable = false;
        }
        field(4; "Grant No"; Code[50])
        {
            NotBlank = true;
            TableRelation = Jobs;
            Caption = 'Grant No';
        }
        field(5; "Reporting Date"; Date)
        {
            Caption = 'Reporting Date';
        }
        field(6; "Disbursed Amount (LCY)"; Decimal)
        {
            CalcFormula = sum("Payment Line"."NetAmount LCY" where("Grant No" = field("Grant No"),
                                                                    "Account No." = field(PartnerID),
                                                                    Status = const(Posted)));
            FieldClass = FlowField;
            Caption = 'Disbursed Amount (LCY)';
            Editable = false;
        }
        field(7; Balance; Decimal)
        {
            Editable = false;
            Caption = 'Balance';
        }
        field(8; "Accounted Amount"; Decimal)
        {
            CalcFormula = sum("Grant Surrender Details"."Actual Spent" where("Grant No" = field("Grant No"),
                                                                              Partner = field(PartnerID),
                                                                              Posted = const(true)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Accounted Amount';
        }
        field(9; "Contractor Type"; Option)
        {
            OptionCaption = ' ,Sub-Contractor,Prime';
            OptionMembers = " ","Sub-Contractor",Prime;
            Caption = 'Contractor Type';
        }
    }

    keys
    {
        key(Key1; PartnerID, "Grant No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        Cust: Record Vendor;
}
