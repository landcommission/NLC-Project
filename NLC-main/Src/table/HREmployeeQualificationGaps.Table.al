#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193516 "HR Employee Qualification Gaps"
{
    Caption = 'HR Employee Qualification Gaps';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Qualification Code"; Code[20])
        {
            Caption = 'Qualification Code';
        }
        field(4; "From Date"; Date)
        {
            Caption = 'From Date';
        }
        field(5; "To Date"; Date)
        {
            Caption = 'To Date';
        }
        field(6; Type; Option)
        {
            OptionMembers = " ",Internal,External,"Previous Position";
            Caption = 'Type';
        }
        field(7; Description; Text[150])
        {
            Caption = 'Description';
        }
        field(8; "Institution/Company"; Text[250])
        {
            Caption = 'Institution/Company';
        }
        field(9; Cost; Decimal)
        {
            Caption = 'Cost';
        }
        field(10; "Course Grade"; Text[30])
        {
            Caption = 'Course Grade';
        }
        field(11; "Employee Status"; Option)
        {
            OptionMembers = Active,Inactive,Terminated;
            Caption = 'Employee Status';
        }
        field(12; Comment; Boolean)
        {
            Caption = 'Comment';
        }
        field(13; "Expiration Date"; Date)
        {
            Caption = 'Expiration Date';
        }
        field(14; "Qualification Type"; Code[50])
        {
            Caption = 'Qualification Type';
        }
        field(15; Qualification; Text[200])
        {
            Caption = 'Qualification';
        }
        field(16; "Score ID"; Decimal)
        {
            Caption = 'Score ID';
        }
        field(17; "Grad. Date"; Date)
        {
            Caption = 'Grad. Date';
        }
        field(18; Gap; Boolean)
        {
            Caption = 'Gap';
        }
    }

    keys
    {
        key(Key1; "Employee No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
