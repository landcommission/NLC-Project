#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193434 "HR Employee Kin"
{
    Caption = 'Employee Relative';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Employee Code"; Code[50])
        {
            Editable = false;
            NotBlank = true;
            //TableRelation = "HR Employees"."No.";
            Caption = 'Employee Code';
        }
        field(2; Relationship; Code[20])
        {
            NotBlank = true;
            TableRelation = "HR Lookup Values".Code where(Type = const("Next of Kin"));
            Caption = 'Relationship';
        }
        field(3; "Full Name"; Text[50])
        {
            Caption = 'Full Name';
        }
        field(4; Name; Text[80])
        {
            Caption = 'Name';
        }
        field(5; "ID No/Passport No"; Text[50])
        {
            Caption = 'ID No/Passport No';
        }
        field(6; "Date Of Birth"; Date)
        {
            Caption = 'Date Of Birth';
        }
        field(7; Occupation; Text[100])
        {
            Caption = 'Occupation';
        }
        field(8; Address; Text[250])
        {
            Caption = 'Address';
        }
        field(9; "Office Tel No"; Text[100])
        {
            Caption = 'Office Tel No';
        }
        field(10; "Home Tel No"; Text[50])
        {
            Caption = 'Home Tel No';
        }
        field(12; Type; Option)
        {
            OptionMembers = "Next of Kin",Beneficiary,Dependant,Spouse,Siblings,"In-Laws",Parent;
            Caption = 'Type';
        }
        field(50000; "E-mail"; Text[60])
        {
            Caption = 'E-mail';
        }
        field(50001; "Percentage Shares"; Decimal)
        {
            Caption = 'Percentage Shares';
        }
        field(50003; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Employee Code", Type, Relationship, "Full Name", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnDelete()
    var
        HRCommentLine: Record "Human Resource Comment Line";
    begin
        HRCommentLine.SetRange("Table Name", HRCommentLine."Table Name"::"Employee Relative");
        HRCommentLine.SetRange("No.", "Employee Code");
        HRCommentLine.DeleteAll();
    end;
}
