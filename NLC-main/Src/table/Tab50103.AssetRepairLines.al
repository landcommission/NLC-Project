#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50103 "Asset Repair Lines"
{

    fields
    {
        field(1; "Request No."; Code[20])
        {
            TableRelation = "Asset Repair Header"."Request No.";
        }
        field(5; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(10; "Registartion No"; Code[20])
        {
            TableRelation = "Company Vehicles"."Registration No.";

            trigger OnValidate()
            begin
                CompanyVehicles.Reset;
                CompanyVehicles.SetRange(CompanyVehicles."Registration No.", "Registartion No");
                if CompanyVehicles.Find('-') then begin
                    Description := CompanyVehicles.Description;
                    Capacity := CompanyVehicles.Capacity;
                    "Asset No" := CompanyVehicles."Asset No.";
                end;
            end;
        }
        field(15; Description; Text[50])
        {
            Editable = false;
        }
        field(20; Location; Code[20])
        {
            Editable = false;
            TableRelation = "FA Location";
        }
        field(25; "Asset No"; Text[30])
        {
            Editable = false;
        }
        field(30; "Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          "Dimension Value Type" = const(Standard));
        }
        field(35; "Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          "Dimension Value Type" = const(Standard));
        }
        field(40; "Repair Date"; Date)
        {
        }
        field(45; Cost; Decimal)
        {
        }
        field(46; "Asset Type"; Option)
        {
            Editable = true;
            OptionMembers = " ",Vehicles,"Other Assets";
        }
        field(47; "FA Class Code"; Code[20])
        {
        }
        field(48; Capacity; Integer)
        {
        }
        field(49; "Service Provider"; Code[30])
        {
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                if Vendor.Get("Service Provider") then
                    "Service Provider Name" := Vendor.Name;
                Address := Vendor.Address;
            end;
        }
        field(50; "Service Provider Name"; Text[100])
        {
            Editable = false;
        }
        field(51; Address; Code[100])
        {
        }
        field(52; "Type of Maitenance"; Code[30])
        {
            TableRelation = "Maintanance Types"."Maintanance Code";

            trigger OnValidate()
            begin
                if MaintananceTypes.Get("Type of Maitenance") then
                    "Maitenance Description" := MaintananceTypes."Maintanance Description";
            end;
        }
        field(53; "Maitenance Description"; Text[100])
        {
            Editable = false;
        }
        field(54; "Service Date"; Date)
        {

            trigger OnValidate()
            begin
                "Approximate Service Date" := CalcDate('1M', "Service Date");
            end;
        }
        field(55; "Current Mileage"; Decimal)
        {

            trigger OnValidate()
            begin
                "Next Service Mileage" := "Current Mileage" + "Service Mileage";
            end;
        }
        field(56; "Next Service Mileage"; Decimal)
        {
            Editable = false;
        }
        field(57; "Service Mileage"; Decimal)
        {

            trigger OnValidate()
            begin
                "Next Service Mileage" := 0;
                "Next Service Mileage" := "Current Mileage" + "Service Mileage";
            end;
        }
        field(58; "Approximate Service Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Request No.", "Asset Type", "Registartion No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        CompanyVehicles: Record "Company Vehicles";
        Vendor: Record Vendor;
        MaintananceTypes: Record "Maintanance Types";
}
