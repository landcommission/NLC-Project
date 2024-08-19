#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193485 "HR Transport Allocations"
{
    Caption = 'HR Transport Allocations';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Allocation No"; Code[20])
        {
            Caption = 'Allocation No';
        }
        field(2; "Employee No"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee No';
            trigger OnValidate()
            begin
                if HREmp.Get("Employee No") then begin
                    "Passenger/s Full Name/s" := HREmp.FullName();
                    Dept := HREmp."Global Dimension 2 Code";
                end;
            end;
        }
        field(3; "Passenger/s Full Name/s"; Text[70])
        {
            Caption = 'Passenger/s Full Name/s';
        }
        field(4; Dept; Text[70])
        {
            Caption = 'Dept';
        }
        field(5; "Requisition No"; Code[10])
        {
            TableRelation = "HR Transport Requisition";
            Caption = 'Requisition No';
            trigger OnValidate()
            begin
                HRTransportRequests.Reset();
                HRTransportRequests.Get("Requisition No");
                "Employee No" := HRTransportRequests."User ID";
                // VALIDATE("Employee No");
                From := HRTransportRequests."Trip From Destination";//HRTransportRequests."start date";
                "To" := HRTransportRequests."Trip To Destination";//HRTransportRequests.Status;

                HRTransportRequests.Comment := true;
                HRTransportRequests.Modify();
            end;
        }
        field(6; From; Text[30])
        {
            Caption = 'From';
        }
        field(7; "To"; Text[30])
        {
            Caption = 'To';
        }
    }

    keys
    {
        key(Key1; "Allocation No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        HREmp: Record "HR Employees";
        HRTransportRequests: Record "HR Transport Requisition";
        HRTransportAllocationH: Record "HR Transport Allocations";
}
