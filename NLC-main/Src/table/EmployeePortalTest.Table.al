#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193754 "Employee Portal Test"
{
    Caption = 'Employee Portal Test';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee No"; Code[10])
        {
            Caption = 'Employee No';
        }
        field(2; "Employee Name"; Text[250])
        {
            Caption = 'Employee Name';
        }
        field(3; "Employee ID"; Code[50])
        {
            Caption = 'Employee ID';
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
}
