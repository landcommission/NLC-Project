#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193871 "Company Vehicles"
{
    DrillDownPageID = "Company Vehicles list";
    LookupPageID = "Company Vehicles list";

    fields
    {
        field(1; "Registration No."; Code[20])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; Capacity; Decimal)
        {
        }
        field(4; "Asset No."; Code[20])
        {
            TableRelation = "Fixed Asset"."No." where("FA Posting Group" = const('AUTOMOBILE'));

            trigger OnValidate()
            begin
                FA.Reset;
                if FA.Get("Asset No.") then
                    Description := FA.Description;
            end;
        }
        field(7; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");
            end;
        }
        field(8; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(9; Status; Option)
        {
            OptionCaption = ',Active,Inactive,Written off,Grounded';
            OptionMembers = ,Active,Inactive,"Written off",Grounded;
        }
        field(10; "Current Mileage"; Decimal)
        {
            Editable = false;
        }
        field(11; "Last Service Date"; Date)
        {
            Editable = false;
        }
        field(12; "Next Service Date"; Date)
        {
            Editable = false;
        }
        field(13; "Serviced by"; Text[100])
        {
            Editable = false;
        }
        field(14; "Engine Capacity"; Code[20])
        {

        }
        field(15; "Year of Manufacture"; Code[20])
        {

        }
        field(16; "Colour"; Code[20])
        {

        }

        field(17; Allocated; Boolean)
        {

        }
        field(18; "Wheelchair Accessible"; Boolean)
        {

        }
        field(19; "Comment"; Text[100])
        {

        }
        field(20; Model; code[20])
        {

        }

    }

    keys
    {
        key(Key1; "Registration No.", "Asset No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Registration No.", Allocated, Description, "Wheelchair Accessible")
        {
        }
    }

    var
        FA: Record "Fixed Asset";
        DimMgt: Codeunit DimensionManagement;

    local procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        DimMgt.SaveDefaultDim(Database::"Company Vehicles", "Registration No.", FieldNumber, ShortcutDimCode);
        Modify(true);
    end;
}
