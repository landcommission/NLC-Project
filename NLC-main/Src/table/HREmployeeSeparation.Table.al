#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193867 "HR Employee Separation"
{
    Caption = 'HR Employee Separation';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Separation No."; Code[20])
        {
            Caption = 'Separation No.';
        }
        field(2; "Employee No."; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee No.';
            trigger OnValidate()
            begin
                "Employee Name" := hremp."Full Name";
            end;
        }
        field(3; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
        }
        field(4; Department; Code[20])
        {
            TableRelation = "Responsibility Center BR NEW".Code;
            Caption = 'Department';
            trigger OnValidate()
            var
                myInt: Integer;
                Responsblece: Record "Responsibility Center BR NEW";
            begin
                Responsblece.Reset();
                Responsblece.SetRange(Code, Rec.Department);
                if Responsblece.FindFirst() then
                    "Department Name" := Responsblece.Name;

            end;
        }
        field(5; "Job Title"; Code[20])
        {
            Caption = 'Job Title';
        }
        field(6; "Nature of Separation"; Option)
        {
            OptionMembers = " ",Dismissal,Retirement,"Early Retirement","End of Contract","Medical grounds";
            Caption = 'Nature of Separation';
        }
        field(7; "Reason for Separation"; Text[250])
        {
            Caption = 'Reason for Separation';
        }
        field(8; Status; Option)
        {
            OptionMembers = New,"Pending Approval",Approved;
            Caption = 'Status';
        }
        field(9; "Separation Date"; Date)
        {
            Caption = 'Separation Date';
        }
        // field(10; "Responsibility Center"; Code[10])
        // {
        //     TableRelation = "Responsibility Center BR 2".Code;
        //     Caption = 'Responsibility Center';
        // }
        field(11; "Reason for Retirement"; Text[250])
        {
            Caption = 'Reason for Retirement';
        }
        field(12; Illness; Text[250])
        {
            Caption = 'Illness';
        }
        field(13; Justification; Text[250])
        {
            Caption = 'Justification';
        }
        field(14; "End of contract Date"; Date)
        {
            Caption = 'End of contract Date';
        }
        field(15; "Department Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Separation No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        hremp: Record "HR Employees";
}
