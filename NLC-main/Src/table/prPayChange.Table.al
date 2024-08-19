#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193577 prPayChange
{
    Caption = 'prPayChange';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(2; "Employee No"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee No';
        }
        field(3; "Previous Basic Pay"; Decimal)
        {
            Caption = 'Previous Basic Pay';
        }
        field(4; "New Basic Pay"; Decimal)
        {
            Caption = 'New Basic Pay';
        }
        field(5; "Date Changed"; Date)
        {
            Caption = 'Date Changed';
        }
        field(6; "Time Changed"; Time)
        {
            Caption = 'Time Changed';
        }
        field(7; "Changed By"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Changed By';
        }
        field(8; "Old Detail"; Text[250])
        {
            Caption = 'Old Detail';
        }
        field(9; "New Detail"; Text[250])
        {
            Caption = 'New Detail';
        }
        field(10; "Reason For Change"; Text[250])
        {
            Caption = 'Reason For Change';
        }
        field(11; "Field To Change"; Text[250])
        {
            Caption = 'Field To Change';
        }
        field(12; Status; Option)
        {
            OptionMembers = New,"Pending Approval",Approved;
            Caption = 'Status';
        }
        field(13; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility Center BR 2";
            Caption = 'Responsibility Center';
        }
        field(14; "Request No."; Code[20])
        {
            Caption = 'Request No.';
        }
    }

    keys
    {
        key(Key1; "Request No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
