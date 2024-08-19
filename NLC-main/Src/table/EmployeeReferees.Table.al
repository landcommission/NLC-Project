#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193899 "Employee Referees"
{
    Caption = 'Employee Referees';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee code"; Code[20])
        {
            Caption = 'Employee code';
        }
        field(2; "Full Name"; Text[30])
        {
            Caption = 'Full Name';
        }
        field(3; Address; Text[50])
        {
            Caption = 'Address';
        }
        field(4; Telephone; Code[10])
        {
            Caption = 'Telephone';
        }
        field(5; "Business/Occupation"; Text[50])
        {
            Caption = 'Business/Occupation';
        }
    }

    keys
    {
        key(Key1; "Employee code", "Full Name")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
