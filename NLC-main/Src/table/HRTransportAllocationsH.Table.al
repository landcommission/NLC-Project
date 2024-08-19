#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193486 "HR Transport Allocations H"
{
    LookupPageId = "HR Transport Allocation";
    Caption = 'HR Transport Allocations H';
    DataClassification = CustomerContent;
    fields
    {
        field(2; Commencement; Text[30])
        {
            Caption = 'Commencement';
        }
        field(3; "Destination(s)"; Text[30])
        {
            Caption = 'Destination(s)';
        }
        field(4; "Vehicle Reg Number"; Code[20])
        {
            TableRelation = "Company Vehicles"."Registration No." where(Status = const(Active), Allocated = const(false));
            Caption = 'Vehicle Reg Number';
            trigger OnValidate()
            var
                VehicleReg: Record "HR Transport Allocations H";
            begin
                VehicleReg.Reset();
                VehicleReg.SetRange(VehicleReg."Transport Allocation No", Rec."Transport Allocation No");
                VehicleReg.SetRange(VehicleReg."Vehicle Reg Number", Rec."Vehicle Reg Number");
                if VehicleReg.FindFirst() then
                    Error('You cannot repeat the same vehicle registration number');
                Vehicle.Reset();
                Vehicle.SetRange(Vehicle."Registration No.", "Vehicle Reg Number");
                if Vehicle.Find('-') then begin
                    Rec."Vehicle Description" := Vehicle.Description;
                    rec."Passenger Capacity" := Vehicle.Capacity;
                    rec."Wheelchair Accesible" := Vehicle."Wheelchair Accessible";
                end;
            end;
        }
        field(5; "Assigned Driver"; Code[20])
        {
            TableRelation = "HR Employees"."No." where("Job ID" = filter('JOB-0011'), "On Leave" = filter(false), "Vehicle Allocated" = const(false));
            Caption = 'Assigned Driver';
            trigger OnValidate()
            begin
                HREmp.Reset();
                HREmp.SetRange(HREmp."No.", rec."Assigned Driver");
                if HREmp.Find('-') then
                    "Driver Name" := HREmp."Full Name";
            end;
        }
        field(7; "Date of Allocation"; Date)
        {
            Caption = 'Date of Allocation';
        }
        field(8; "Vehicle Allocated by"; Code[20])
        {
            Caption = 'Vehicle Allocated by';
        }
        field(9; "Opening Odometer Reading"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Caption = 'Opening Odometer Reading';
        }
        field(10; Status; Option)
        {
            Editable = false;
            OptionMembers = Open,Released,Closed,Cancelled;
            Caption = 'Status';
        }
        field(13; "Date of Trip"; Date)
        {
            Caption = 'Date of Trip';
        }
        field(14; "Purpose of Trip"; Text[250])
        {
            Caption = 'Purpose of Trip';
        }
        field(60; "No. Series"; Code[20])
        {
            Description = 'Stores the number series in the database';
            Caption = 'No. Series';
        }
        field(61; Comments; Text[250])
        {
            Caption = 'Comments';
        }
        field(63; "Driver Name"; Text[100])
        {
            Caption = 'Driver Name';
        }
        field(64; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center".Code;

        }
        field(65; "Loaded to WorkTicket"; Boolean)
        {
            Caption = 'Loaded to WorkTicket';
        }
        field(66; "Time out"; Time)
        {
            Caption = 'Time out';
        }
        field(67; "Time In"; Time)
        {
            Caption = 'Time In';
        }
        field(68; "Journey Route"; Text[250])
        {
            Caption = 'Journey Route';
        }
        field(69; "Time of Trip"; Time)
        {
            Caption = 'Time of Trip';
        }
        field(70; "Closing Odometer Reading"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Caption = 'Closing Odometer Reading';
        }
        field(71; "Linked to Invoice No"; Code[20])
        {
            Caption = 'Linked to Invoice No';

        }
        field(72; "No of Days Requested"; Integer)
        {
            Caption = 'No of Days Requested';
        }
        field(73; "Authorized  By"; Code[60])
        {
            Caption = 'Authorized  By';
        }
        field(75; "Transport Allocation No"; Code[20])
        {
            Editable = true;
            Caption = 'Transport Allocation No';
        }
        field(76; "Passenger Capacity"; Integer)
        {
            Caption = 'Passenger Capacity';
        }
        field(77; "Requisition Type"; Option)
        {
            OptionMembers = Internal,External;
            Caption = 'Requisition Type';
        }
        field(78; "Invoice Description"; Text[100])
        {
            Caption = 'Invoice Description';
        }
        field(79; "Wheelchair Accesible"; Boolean)
        {
            Caption = 'Wheelchair Accesible';
        }
        field(80; "Vehicle Description"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(81; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Transport Allocation No", "Vehicle Reg Number")
        {
            Clustered = true;
        }
    }

    fieldgroups { }


    var
        Text0001: Label 'You cannot modify an Approved or Closed Record';
        Text001: Label 'Your identification is set up to process from %1 %2 only.';
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        PurchHeader: Record "Purchase Header";
        Vehicle: Record "Company Vehicles";
        HREmp: Record "HR Employees";
}
