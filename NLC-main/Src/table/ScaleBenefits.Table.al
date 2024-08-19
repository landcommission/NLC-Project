#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 69019 "Scale Benefits"
{
    Caption = 'Scale Benefits';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Salary Scale"; Code[10])
        {
            TableRelation = "Salary Scales";
            Caption = 'Salary Scale';
        }
        field(2; "Salary Pointer"; Code[10])
        {
            TableRelation = "Salary Pointers"."Salary Pointer";
            Caption = 'Salary Pointer';
        }
        field(3; "ED Code"; Code[10])
        {
            NotBlank = true;
            TableRelation = "PR Transaction Codes";
            Caption = 'ED Code';
            trigger OnValidate()
            begin
                if EarningRec.Get("ED Code") then
                    "ED Description" := EarningRec."Transaction Name";
            end;
        }
        field(4; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(5; "ED Description"; Text[30])
        {
            Caption = 'ED Description';
        }
        field(6; "G/L Account"; Code[20])
        {
            Caption = 'G/L Account';
        }
        field(7; "Basic Salary"; Boolean)
        {
            Caption = 'Basic Salary';
        }
        field(8; Percentage; Decimal)
        {
            Caption = 'Percentage';
            trigger OnValidate()
            var
                Pointer: Record "Salary Pointers";
            begin
                if "Based On" = "Based On"::Percentage then begin
                    Pointer.Get("Salary Scale", "Salary Pointer");
                    Amount := Pointer."Gross Pay" * Percentage / 100;
                end;
            end;
        }
        field(9; "Based On"; Option)
        {
            OptionMembers = Amount,Percentage;
            OptionCaption = 'Flat Amount,Percentage of Gross';
            Caption = 'Based On';
        }

    }

    keys
    {
        key(Key1; "Salary Scale", "Salary Pointer", "ED Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        EarningRec: Record "PR Transaction Codes";
}

