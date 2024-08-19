#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193872 "HR Appl Employment History"
{
    Caption = 'HR Appl Employment History';
    DataClassification = CustomerContent;
    fields
    {
        field(1; JobID; Code[20])
        {
            Caption = 'JobID';
        }
        field(2; "Name of Previous Employer"; Code[100])
        {
            NotBlank = false;
            Caption = 'Name of Previous Employer';
        }
        field(4; Department; Text[100])
        {
            NotBlank = false;
            Caption = 'Department';
        }
        field(5; Position; Text[100])
        {
            NotBlank = false;
            Caption = 'Position';
        }
        field(6; "Position Type"; Text[100])
        {
            Caption = 'Position Type';
        }
        field(7; StaffNumber; Text[40])
        {
            Caption = 'StaffNumber';
        }
        field(8; "Date Employed / Left"; Text[100])
        {
            Caption = 'Date Employed / Left';
        }
        field(10; "Applicant No"; Integer)
        {
            Caption = 'Applicant No';
        }
        field(11; "Type of Business"; Text[100])
        {
            Caption = 'Type of Business';
        }
        field(12; "Previous Employer Contacts"; Text[100])
        {
            Caption = 'Previous Employer Contacts';
        }
        field(13; "Benefits/Other Allowances"; Text[100])
        {
            Caption = 'Benefits/Other Allowances';
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
        field(16; Title; Text[100])
        {
            Caption = 'Title';
        }
        field(17; "Number of Employees Supervised"; Text[100])
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
        field(21; DateLeft; Date)
        {
            Caption = 'DateLeft';
        }
        field(22; PhoneNo; Text[50])
        {
            Caption = 'PhoneNo';
        }
        field(23; "Date Employed"; Date)
        {
            Caption = 'Date Employed';
        }
    }

    keys
    {
        key(Key1; JobID, Department, "Previous Employer Contacts", "Name of Previous Employer")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
