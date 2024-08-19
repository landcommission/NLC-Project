#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 56040 "Case Investigator"
{
    Caption = 'Case Investigator';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Case No"; Code[20])
        {
            Caption = 'Case No';
        }
        field(2; "Employee No"; Code[20])
        {
            TableRelation = Employee;
            Caption = 'Employee No';
            trigger OnValidate()
            begin
                if emp.Get("Employee No") then
                    "Employee Name" := emp.FullName();
            end;
        }
        field(3; "Employee Name"; Text[60])
        {
            Editable = false;
            Caption = 'Employee Name';
        }
        field(4; "Effective Date"; Date)
        {
            Caption = 'Effective Date';
        }
        field(5; "Allocation Comments"; Text[60])
        {
            Caption = 'Allocation Comments';
        }
        field(6; "Created By"; Code[50])
        {
            Caption = 'Created By';
        }
        field(7; "Date Created"; Date)
        {
            Caption = 'Date Created';
        }
        field(8; "Time Created"; Time)
        {
            Caption = 'Time Created';
        }
    }

    keys
    {
        key(Key1; "Case No", "Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        "Date Created" := Today;
        "Time Created" := Time;
        "Created By" := UserId;
    end;

    var
        emp: Record Employee;
}

