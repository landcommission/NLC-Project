#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 69016 "Salary Pointer Details"
{
    Caption = 'Salary Pointer Details';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee No"; Code[20])
        {
            Caption = 'Employee No';
        }
        field(2; "Payroll Period"; Date)
        {
            Caption = 'Payroll Period';
        }
        field(3; Present; Code[20])
        {
            Caption = 'Present';
        }
        field(4; Previous; Code[20])
        {
            Caption = 'Previous';
        }
        field(5; "Salary Scale"; Code[10])
        {
            TableRelation = "Salary Scales";
            Caption = 'Salary Scale';
        }
    }

    keys
    {
        key(Key1; "Employee No", "Payroll Period", Present, Previous, "Salary Scale")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}

