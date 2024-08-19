#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193512 "HR Appraissal Appeal"
{
    Caption = 'HR Appraissal Appeal';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "No."; Code[30])
        {
            Caption = 'No.';
        }
        field(2; "Employee No."; Code[30])
        {
            TableRelation = "FA Budget Entry";
            Caption = 'Employee No.';
            trigger OnLookup()
            begin
                HREmployees.Reset();
                SetRange("Employee No.", HREmployees."No.");
                if HREmployees.FindFirst() then
                    "Employee Name" := HREmployees."Full Name";
            end;
        }
        field(3; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
        }
        field(4; "Appraisser No."; Code[30])
        {
            Caption = 'Appraisser No.';
        }
        field(5; "Appraiser Name"; Text[100])
        {
            Caption = 'Appraiser Name';
        }
        field(6; "Appraissal Period"; Code[30])
        {
            Caption = 'Appraissal Period';
        }
        field(7; Reason; Text[250])
        {
            Caption = 'Reason';
        }
        field(8; Region; Code[30])
        {
            Caption = 'Region';
        }
        field(9; Department; Code[30])
        {
            Caption = 'Department';
        }
        field(10; "Responsibility Center"; Code[30])
        {
            Caption = 'Responsibility Center';
        }
        field(11; Status; Option)
        {
            OptionMembers = New,"Pending Approval",Approved;
            Caption = 'Status';
        }
        field(12; "No Series"; Code[30])
        {
            Caption = 'No Series';
        }
        field(13; "User ID"; Code[20])
        {
            Caption = 'User ID';
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
        HREmployees.Reset();
        HREmployees.SetRange(HREmployees."User ID", UserId);
        if HREmployees.Find('-') then begin
            "Employee Name" := HREmployees."Full Name";
            "Employee No." := HREmployees."No.";
            "User ID" := HREmployees."User ID";
        end;
    end;

    var
        HREmployees: Record "HR Employees";
}
