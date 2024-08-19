#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193514 "HR Succession Employee"
{
    Caption = 'HR Succession Employee';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Staff No."; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Staff No.';
            trigger OnValidate()
            begin
                Employee.Reset();
                Employee.SetRange(Employee."No.", "Staff No.");
                if Employee.Find('-') then begin
                    "First Name" := Employee."First Name";
                    "Middle Name" := Employee."Middle Name";
                    "Last Name" := Employee."Last Name";
                    "Date of Join" := Employee."Date Of Joining the Company";
                    "ID No." := Employee."ID Number";
                    "Department Code" := Employee."Global Dimension 2 Code";
                end
            end;
        }
        field(2; "Position to Succeed"; Code[20])
        {
            TableRelation = "HR Jobs"."Job ID";
            Caption = 'Position to Succeed';
        }
        field(3; "First Name"; Text[50])
        {
            Caption = 'First Name';
        }
        field(4; "Middle Name"; Text[50])
        {
            Caption = 'Middle Name';
        }
        field(5; "Last Name"; Text[50])
        {
            Caption = 'Last Name';
        }
        field(6; "ID No."; Text[30])
        {
            Caption = 'ID No.';
        }
        field(7; "Department Code"; Code[20])
        {
            Caption = 'Department Code';
        }
        field(8; "Date of Join"; Date)
        {
            Caption = 'Date of Join';
        }
        field(9; "Succession Date"; Date)
        {
            Caption = 'Succession Date';
        }
        field(10; Readiness; Option)
        {
            OptionMembers = " ",Ready,Waiting,"Not Ready",Dismissed;
            Caption = 'Readiness';
        }
        field(11; Status; Option)
        {
            OptionMembers = Ready,Waiting,"Not Ready",Succeeded,Dismissed;
            Caption = 'Status';
        }
        field(12; "Date Marked"; Date)
        {
            Caption = 'Date Marked';
        }
        field(13; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(14; "Employee Qualifications"; Integer)
        {
            FieldClass = Normal;
            Caption = 'Employee Qualifications';
        }
        field(15; "Line No.2"; Integer)
        {
            Caption = 'Line No.2';
        }
    }

    keys
    {
        key(Key1; "Line No.", "Position to Succeed", "Line No.2")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        Employee: Record "HR Employees";
}
