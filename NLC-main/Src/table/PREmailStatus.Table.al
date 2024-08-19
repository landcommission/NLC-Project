#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193887 "PR Email Status"
{
    Caption = 'PR Email Status';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee No"; Code[20])
        {
            Editable = false;
            Caption = 'Employee No';
        }
        field(2; "Payroll Period"; Date)
        {
            Editable = false;
            Caption = 'Payroll Period';
        }
        field(3; "Date Sent"; Date)
        {
            Editable = false;
            Caption = 'Date Sent';
        }
        field(4; Status; Text[100])
        {
            Editable = false;
            Caption = 'Status';
        }
        field(5; Batch; Code[20])
        {
            Editable = false;
            Enabled = false;
            Caption = 'Batch';
        }
    }

    keys
    {
        key(Key1; "Employee No", "Payroll Period")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
