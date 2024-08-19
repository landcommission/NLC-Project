#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193855 "HR Employment History"
{
    Caption = 'HR Employment History';
    DataClassification = CustomerContent;
    fields
    {
        field(1; JobID; Code[30])
        {
            Caption = 'JobID';
        }
        field(2; "Name of Previous Employer"; Code[250])
        {
            NotBlank = false;
            Caption = 'Name of Previous Employer';
        }
        field(4; Department; Text[50])
        {
            NotBlank = false;
            TableRelation = "Responsibility Center BR NEW"."Global Dimension 2 Code";
            Caption = 'Department';
        }
        field(5; Position; Text[150])
        {
            NotBlank = false;
            Caption = 'Position';
        }
        field(6; "Position Type"; Text[40])
        {
            Caption = 'Position Type';
        }
        field(7; StaffNumber; Text[40])
        {
            Caption = 'StaffNumber';
        }
        field(8; "Date Employed"; Text[100])
        {
            Caption = 'Date Employed';
        }
        field(9; DateLeft; DateTime)
        {
            Caption = 'DateLeft';
        }
        field(10; "Applicant No"; Code[30])
        {
            Caption = 'Applicant No';
        }
        field(12; "Previous Employer Contacts"; Text[30])
        {
            Caption = 'Previous Employer Contacts';
        }
        field(14; "Employee No."; Code[30])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee No.';
        }
        field(15; Salary; Code[30])
        {
            Caption = 'Salary';
        }
        field(16; Title; Text[50])
        {
            Caption = 'Title';
        }
        field(17; "Number of Employees Supervised"; Text[70])
        {
            Caption = 'Number of Employees Supervised';
        }
        field(18; "Reason for Leaving"; Text[50])
        {
            Caption = 'Reason for Leaving';
        }
        field(19; "Terms of Service"; Text[100])
        {
            Caption = 'Terms of Service';
        }
        field(20; "Description of Duties"; Text[250])
        {
            Caption = 'Description of Duties';
        }
        field(21; "Type of Business"; Text[50])
        {
            Caption = 'Type of Business';
        }
        field(22; "Benefits/Other Allowances"; Decimal)
        {
            Caption = 'Benefits/Other Allowances';
        }
        field(23; "No of Employees Supervised"; Text[50])
        {
            Caption = 'No of Employees Supervised';
        }
        field(24; "Date Left"; Text[30])
        {
            Caption = 'Date Left';
        }
        field(25; "Employment Date"; Date)
        {
            Caption = 'Employment Date';
        }
    }

    keys
    {
        key(Key1; JobID, Department, "Description of Duties", "Previous Employer Contacts", "Name of Previous Employer")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        Employee: Record "HR Employees";
        OK: Boolean;
}
