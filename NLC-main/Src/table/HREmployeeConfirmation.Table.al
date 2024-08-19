#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193507 "HR Employee Confirmation"
{
    Caption = 'HR Employee Confirmation';
    DataClassification = CustomerContent;
    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'No';
        }
        field(2; "Employee Number"; Code[20])
        {
            TableRelation = "HR Employees";
            Caption = 'Employee Number';
            trigger OnValidate()
            begin



                HREmployees.Reset();
                SetRange("Employee Number", HREmployees."No.");
                if HREmployees.FindFirst() then begin
                    "Employee Name" := HREmployees."Full Name";
                    "Shortcut Dimension code1" := HREmployees.Region;
                    "Shortcut Dimension code2" := HREmployees."Responsibility Center";
                    Designation := HREmployees.Position;
                    "Probation Start Date" := HREmployees."Date Of Joining the Company";
                    "Probation End Date" := HREmployees."End Of Probation Date";
                end;
            end;
        }
        field(3; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
        }
        field(4; "Request Date"; Date)
        {
            Caption = 'Request Date';
        }
        field(5; "Shortcut Dimension code1"; Code[20])
        {
            TableRelation = "Dimension Value".Code;
            Caption = 'Shortcut Dimension code1';
        }
        field(6; "Shortcut Dimension code2"; Code[20])
        {
            TableRelation = "Responsibility Center BR 2".Code;
            Caption = 'Shortcut Dimension code2';
        }
        field(7; Reason; Text[250])
        {
            Caption = 'Reason';
        }
        field(8; "Probation Start Date"; Date)
        {
            Caption = 'Probation Start Date';
        }
        field(9; "Probation End Date"; Date)
        {
            Caption = 'Probation End Date';
        }
        field(10; "Confirmation Date"; Date)
        {
            Caption = 'Confirmation Date';
        }
        field(11; Designation; Code[10])
        {
            Caption = 'Designation';
        }
        field(12; Grade; Code[10])
        {
            Caption = 'Grade';
        }
        field(13; Status; Option)
        {
            OptionMembers = New,"Pending Approval",Approved;
            Caption = 'Status';
        }
        field(14; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility Center BR 2";
            Caption = 'Responsibility Center';
        }
        field(15; User; Code[20])
        {
            Caption = 'User';
        }
        field(16; "No series"; Code[20])
        {
            Caption = 'No series';
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        //No. Series
        if No = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Employee Confirmation No.");
            NoSeriesMgt.InitSeries(HRSetup."Employee Confirmation No.", xRec."No series", 0D, No, "No series");
        end;
    end;

    var
        HREmployees: Record "HR Employees";
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
