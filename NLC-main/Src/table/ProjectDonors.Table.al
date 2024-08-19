#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193758 "Project Donors"
{
    DrillDownPageId = "Project Donors";
    LookupPageId = "Project Donors";
    Caption = 'Project Donors';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Shortcut Dimension 1 Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = Customer."No." where("Account Type" = filter(Donor));
            Caption = 'Shortcut Dimension 1 Code';
            trigger OnValidate()
            begin
                DimVal.Reset();
                DimVal.SetRange(DimVal."Global Dimension No.", 1);
                DimVal.SetRange(DimVal.Code, "Shortcut Dimension 1 Code");
                if DimVal.Find('-') then
                    "Donor Name" := DimVal.Name;
            end;
        }
        field(2; "Donor Name"; Text[100])
        {
            Caption = 'Donor Name';
        }
        field(3; "Expected Donation"; Decimal)
        {
            Caption = 'Expected Donation';
        }
        field(4; "Grant No"; Code[50])
        {
            NotBlank = true;
            Caption = 'Grant No';
        }
        field(5; "Reporting Date"; Date)
        {
            Enabled = false;
            Caption = 'Reporting Date';
        }
        field(6; "Donated Amount"; Decimal)
        {
            CalcFormula = sum("Receipt Line"."Total Amount" where("Grant No" = field("Grant No"),
                                                                   Posted = const(true),
                                                                   "Shortcut Dimension 2 Code" = field("Grant No")));
            FieldClass = FlowField;
            Caption = 'Donated Amount';
            Editable = false;
        }
        field(7; Balance; Decimal)
        {
            Caption = 'Balance';
        }
        field(8; "Indirect Cost"; Boolean)
        {
            Caption = 'Indirect Cost';
        }
        field(9; Percentage; Decimal)
        {
            Caption = 'Percentage';
            trigger OnValidate()
            begin
                if "Indirect Cost" = true then
                    "Allowed Indirect Cost" := Percentage / 100 * "Expected Donation";
            end;
        }
        field(10; "Allowed Indirect Cost"; Decimal)
        {
            Caption = 'Allowed Indirect Cost';
        }
        field(11; "Charge Type"; Option)
        {
            OptionCaption = ' ,Accrual,Cash';
            OptionMembers = " ",Accrual,Cash;
            Caption = 'Charge Type';
        }
        field(12; "Contact Person"; Text[50])
        {
            Caption = 'Contact Person';
        }
        field(13; Address; Text[30])
        {
            Caption = 'Address';
        }
    }

    keys
    {
        key(Key1; "Shortcut Dimension 1 Code", "Grant No")
        {
            Clustered = true;
        }
        key(Key2; "Grant No")
        {
            SumIndexFields = "Expected Donation";
        }
    }

    fieldgroups { }


    var
        DimVal: Record "Dimension Value";
        objJobs: Record Jobs;
}
