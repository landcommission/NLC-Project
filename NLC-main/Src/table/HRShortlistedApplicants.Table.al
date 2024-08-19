#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193464 "HR Shortlisted Applicants"
{
    Caption = 'HR Shortlisted Applicants';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee Requisition No"; Code[20])
        {
            Editable = false;
            NotBlank = true;
            TableRelation = "HR Employee Requisitions"."Requisition No.";
            Caption = 'Employee Requisition No';
        }
        field(2; "Stage Code"; Code[20])
        {
            Editable = false;
            NotBlank = true;
            Caption = 'Stage Code';
        }
        field(3; "Job Application No"; Code[20])
        {
            Editable = false;
            NotBlank = true;
            TableRelation = "HR Job Applications"."Job Application No.";
            Caption = 'Job Application No';
        }
        field(4; "Stage Score"; Decimal)
        {
            Editable = false;
            Caption = 'Stage Score';
        }
        field(5; Qualified; Boolean)
        {
            Caption = 'Qualified';
        }
        field(6; "First Name"; Text[100])
        {
            Editable = false;
            Caption = 'First Name';
            trigger OnValidate()
            begin
                fn_FullName();
            end;
        }
        field(7; "Middle Name"; Text[100])
        {
            Editable = false;
            Caption = 'Middle Name';
            trigger OnValidate()
            begin
                fn_FullName();
            end;
        }
        field(8; "Last Name"; Text[100])
        {
            Editable = false;
            Caption = 'Last Name';
            trigger OnValidate()
            begin
                fn_FullName();
            end;
        }
        field(9; "ID No"; Integer)
        {
            Editable = false;
            Caption = 'ID No';
        }
        field(10; Gender; Option)
        {
            Editable = false;
            OptionMembers = ,Male,Female;
            Caption = 'Gender';
        }
        field(11; "Marital Status"; Option)
        {
            Editable = false;
            Caption = 'Marital Status';
            OptionCaption = ' ,Single,Married,Divorced,Others,Widow(er),Separated';
            OptionMembers = " ",Single,Married,Divorced,Others,Widowed,Separated;
        }
        field(12; "Manual Change"; Boolean)
        {
            Editable = false;
            Caption = 'Manual Change';
        }
        field(13; Employ; Boolean)
        {
            Caption = 'Employ';

        }
        field(14; Date; Date)
        {
            Caption = 'Date';
        }
        field(15; Position; Integer)
        {
            Caption = 'Position';
        }
        field(16; "Reporting Date"; Date)
        {
            Caption = 'Reporting Date';
        }
        field(17; "Full Name"; Text[100])
        {
            Caption = 'Full Name';
        }
        field(18; Disability; Boolean)
        {
            Caption = 'Disability';
        }
        field(19; "Job applied"; text[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Employee Requisition No", "Job Application No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        Employee: Record "HR Employees";
        Applicants: Record "HR Job Applications";
        EmpQualifications: Record "HR Applicant Qualifications";
        AppQualifications: Record "HR Applicant Qualifications";

    local procedure fn_FullName()
    begin
        "Full Name" := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";
    end;
}
