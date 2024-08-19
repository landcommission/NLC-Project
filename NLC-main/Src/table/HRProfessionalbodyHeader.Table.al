#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193510 "HR Professional body Header"
{
    Caption = 'HR Professional body Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; UserID; Code[20])
        {
            TableRelation = "HR Employees"."User ID";
            Caption = 'UserID';
            trigger OnValidate()
            begin

                HREmployees.Reset();
                SetRange(UserID, HREmployees."No.");
                if HREmployees.FindFirst() then begin
                    "Employee Name" := HREmployees."Full Name";
                    "Shortcut Dimension code1" := HREmployees.Region;
                    "Shortcut Dimension code2" := HREmployees."Responsibility Center";
                    HREmployees.Next();
                end;
            end;
        }
        field(3; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
        }
        field(4; "Shortcut Dimension code1"; Code[20])
        {
            Caption = 'Shortcut Dimension code1';
        }
        field(5; "Shortcut Dimension code2"; Code[20])
        {
            Caption = 'Shortcut Dimension code2';
        }
        field(6; Designation; Code[20])
        {
            Caption = 'Designation';
        }
        field(7; "Professional Body Applying"; Text[100])
        {
            Caption = 'Professional Body Applying';
        }
        field(8; "Body relevant"; Boolean)
        {
            Caption = 'Body relevant';
        }
        field(9; Status; Option)
        {
            OptionMembers = New,"Pending Approval",Approved;
            Caption = 'Status';
        }
        field(10; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility Center".Code;
            Caption = 'Responsibility Center';
        }
        field(11; "No Series"; Code[20])
        {
            Caption = 'No Series';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Proffessional Bodies Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Proffessional Bodies Nos.", xRec."No Series", 0D, "No.", "No Series");
        end;
        UserID := UserID;

        /*

       EmployeeQaulifications.RESET;
       EmployeeQaulifications.SETRANGE(EmployeeQaulifications."Employee No.","Employee No.");
       IF EmployeeQaulifications.FINDFIRST THEN
       BEGIN
              */

    end;

    var
        HREmployees: Record "HR Employees";
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        EmployeeQaulifications: Record "HR Employee Qualifications";
}
