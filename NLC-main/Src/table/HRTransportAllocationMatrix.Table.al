#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193523 "HR Transport Allocation Matrix"
{
    Caption = 'HR Transport Allocation Matrix';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Enrty No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Enrty No';
        }
        field(2; "Employee No"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee No';
            trigger OnValidate()
            begin
                Employees.Reset();
                Employees.SetRange(Employees."No.", "Employee No");
                if Employees.Find('-') then
                    "Employee Name" := Employees."Full Name";
            end;
        }
        field(3; "User ID"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
            Caption = 'User ID';
        }
        field(4; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
        }
        field(5; Station; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Caption = 'Station';

        }
        field(6; "Station Name"; Text[50])
        {
            Caption = 'Station Name';
        }
        field(7; Active; Boolean)
        {
            Caption = 'Active';
        }
    }

    keys
    {
        key(Key1; "Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        Employees: Record "HR Employees";
        Station: Record "Dimension Value";
}
