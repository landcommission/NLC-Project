#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193618 "Destination Rate Entry"
{
    DrillDownPageId = "Destination Rate List";
    LookupPageId = "Destination Rate List";
    Caption = 'Destination Rate Entry';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Advance Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Receipts and Payment Types".Code where(Type = const(Imprest));
            Caption = 'Advance Code';
        }
        field(2; "Destination Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Travel Destination"."Destination Code";
            Caption = 'Destination Code';
            trigger OnValidate()
            begin
                "objTravel Destination".Reset();
                "objTravel Destination".SetRange("objTravel Destination"."Destination Code", "Destination Code");
                if "objTravel Destination".Find('-') then begin
                    "Destination Name" := "objTravel Destination"."Destination Name";
                    "Destination Type" := "objTravel Destination"."Destination Type";
                end;
            end;
        }
        field(3; Currency; Code[10])
        {
            NotBlank = false;
            TableRelation = Currency;
            Caption = 'Currency';
        }
        field(4; "Destination Type"; Option)
        {
            Editable = false;
            OptionMembers = "local",Foreign;
            Caption = 'Destination Type';
        }
        field(5; "Daily Rate (Amount)"; Decimal)
        {
            Caption = 'Daily Rate (Amount)';
        }
        field(6; "Employee Job Group"; Code[10])
        {
            Editable = true;
            NotBlank = true;
            TableRelation = "HR Lookup Values".Code where(Type = const(Grade));
            Caption = 'Employee Job Group';
        }
        field(7; "Destination Name"; Text[50])
        {
            Editable = false;
            Caption = 'Destination Name';
        }
    }

    keys
    {
        key(Key1; "Destination Code", "Employee Job Group", Currency, "Advance Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        "objTravel Destination": Record "Travel Destination";
}
