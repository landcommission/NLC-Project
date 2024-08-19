#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193482 "HR OSInjured Person"
{
    Caption = 'HR OSInjured Person';
    DataClassification = CustomerContent;
    fields
    {
        field(1; LineNo; Integer)
        {
            AutoIncrement = true;
            Caption = 'LineNo';
        }
        field(2; "Employee No"; Code[30])
        {
            TableRelation = if (Type = const(" ")) "Standard Text"
            else
            if (Type = const(Employee)) "HR Employees"."No.";
            Caption = 'Employee No';
            trigger OnValidate()
            begin
                HREmp.Reset();
                HREmp.SetRange(HREmp."No.", "Employee No");
                if HREmp.Find('-') then begin
                    "Employee No" := HREmp."No.";
                    "Injured Person" := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
                    Address := HREmp."Postal Address";
                    "Phone No" := HREmp."Cellular Phone Number";
                    "ID No" := HREmp."ID Number";
                    "Date Of Birth" := HREmp."Date Of Birth";
                end;
            end;
        }
        field(3; "Injured Person"; Text[100])
        {
            Caption = 'Injured Person';
        }
        field(4; Address; Code[10])
        {
            Caption = 'Address';
        }
        field(5; "Phone No"; Code[10])
        {
            Caption = 'Phone No';
        }
        field(6; "ID No"; Code[10])
        {
            Caption = 'ID No';
        }
        field(7; "Date Of Birth"; Date)
        {
            Caption = 'Date Of Birth';
        }
        field(8; Email; Text[30])
        {
            Caption = 'Email';
        }
        field(9; "Incident No"; Code[10])
        {
            Caption = 'Incident No';
        }
        field(10; Type; Option)
        {
            OptionCaption = ' ,Employee';
            OptionMembers = " ",Employee;
            Caption = 'Type';
        }
    }

    keys
    {
        key(Key1; LineNo, "Employee No", "Incident No", Type)
        {
            Clustered = true;
        }

    }

    fieldgroups { }

    var
        HREmp: Record "HR Employees";
        Casual: Boolean;
}

