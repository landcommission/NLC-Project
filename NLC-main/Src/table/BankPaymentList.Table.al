#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193890 "Bank Payment List"
{
    Caption = 'Bank Payment List';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(2; "Bank Code"; Code[10])
        {
            TableRelation = "PR Bank Accounts"."Bank Code";
            Caption = 'Bank Code';
        }
        field(3; "Branch Code"; Code[10])
        {
            Caption = 'Branch Code';
        }
        field(4; "Payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods";
            Caption = 'Payroll Period';
        }
        field(5; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(6; "Transaction Code"; Code[10])
        {
            Caption = 'Transaction Code';
        }
        field(7; "Staff No."; Code[20])
        {
            Caption = 'Staff No.';
        }
        field(8; "% NPAY"; Decimal)
        {
            Caption = '% NPAY';
        }
        field(9; "A/C Number"; Code[50])
        {
            Caption = 'A/C Number';
        }
        field(10; "Bank Name"; Text[100])
        {
            Caption = 'Bank Name';
        }
        field(11; "Branch Name"; Text[100])
        {
            Caption = 'Branch Name';
        }
        field(12; "Staff Name"; Text[100])
        {
            CalcFormula = lookup("HR Employees"."Full Name" where("No." = field("Staff No.")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Staff Name';
        }
        field(13; "Department Code"; Code[20])
        {
            CalcFormula = lookup("HR Employees"."Global Dimension 2 Code" where("No." = field("Staff No.")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Department Code';
        }
        field(14; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
