#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193439 "HR Employee Course Comp."
{
    Caption = 'HR Employee Course Comp.';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            trigger OnValidate()
            begin
                OK := Employee.Get("Employee No.");
                if OK then
                    // "Employee First Name":= Employee."Known As";
                    "Employee Last Name" := Employee."Last Name";
            end;
        }
        field(2; "Product Name"; Code[30])
        {
            Caption = 'Product Name';
        }
        field(3; "Date Acredited"; Date)
        {
            Caption = 'Date Acredited';
        }
        field(4; "Apply To Employee"; Boolean)
        {
            Caption = 'Apply To Employee';
        }
        field(5; "Employee First Name"; Text[30])
        {
            Caption = 'Employee First Name';
        }
        field(6; "Employee Last Name"; Text[30])
        {
            Caption = 'Employee Last Name';
        }
        field(7; "Product Description"; Text[170])
        {
            Caption = 'Product Description';
        }
        field(8; "Class Code"; Text[30])
        {
            Caption = 'Class Code';
        }
        field(9; Department; Code[10])
        {
            Caption = 'Department';
        }
        field(10; Office; Code[10])
        {
            Caption = 'Office';
        }
    }

    keys
    {
        key(Key1; "Employee No.", "Product Name")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        OK := Employee.Get("Employee No.");
        if OK then
            // "Employee First Name":= Employee."Known As";
            "Employee Last Name" := Employee."Last Name";
    end;

    var
        Employee: Record "HR Employees";
        OK: Boolean;
}
