#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 69606 "Duty Station"
{
    DrillDownPageId = "Duty Station";
    LookupPageId = "Duty Station";
    Caption = 'Duty Station';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[30])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[150])
        {
            Caption = 'Description';
        }
        field(3; "Region ID"; Code[30])
        {
            Caption = 'Region ID';
            //TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Region));
        }
        field(4; "Approved Establishment"; Integer)
        {
            Caption = 'Approved Establishment';
            //CalcFormula = sum("Establishment Planning Line"."Optimal Staffing" where("Duty Station ID" = field(Code)));
            //FieldClass = FlowField;
        }
        field(5; "No. of Active Employees"; Integer)
        {
            CalcFormula = count("HR Employees" where("Current Duty Station" = field(Code)));
            FieldClass = FlowField;
            Caption = 'No. of Active Employees';
            Editable = false;
        }
        field(6; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(7; Longitude; Decimal)
        {
            DecimalPlaces = 2 : 16;
            Caption = 'Longitude';
        }
        field(8; Latitude; Decimal)
        {
            DecimalPlaces = 2 : 16;
            Caption = 'Latitude';
        }
        field(9; "Hardship Area"; Boolean)
        {
            Caption = 'Hardship Area';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}

