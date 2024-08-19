#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193426 "HR Job Occupations"
{
    Caption = 'HR Job Occupations';
    DataClassification = CustomerContent;
    fields
    {
        field(2; "Employee No."; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee No.';
            trigger OnValidate()
            begin
                HREmp.Get("Employee No.");

                CalcFields("First Name");
                CalcFields("Middle Name");
                CalcFields("Last Name");
                Email := HREmp."E-Mail";
                "Date of Join" := HREmp."Date Of Joining the Company";
                HREmp."Job Title" := "Job Id";
                HREmp.Validate(HREmp."Job Title");
                HREmp.Modify();
            end;
        }
        field(3; "First Name"; Text[30])
        {
            CalcFormula = lookup("HR Employees"."First Name" where("No." = field("Employee No.")));
            FieldClass = FlowField;
            Caption = 'First Name';
            Editable = false;
        }
        field(4; "Middle Name"; Text[30])
        {
            CalcFormula = lookup("HR Employees"."Middle Name" where("No." = field("Employee No.")));
            FieldClass = FlowField;
            Caption = 'Middle Name';
            Editable = false;
        }
        field(5; "Last Name"; Text[30])
        {
            CalcFormula = lookup("HR Employees"."Last Name" where("No." = field("Employee No.")));
            FieldClass = FlowField;
            Caption = 'Last Name';
            Editable = false;
        }
        field(6; Extension; Text[30])
        {
            FieldClass = Normal;
            Caption = 'Extension';
        }
        field(7; Email; Text[30])
        {
            FieldClass = Normal;
            Caption = 'Email';
        }
        field(8; "Date of Join"; Date)
        {
            FieldClass = Normal;
            Caption = 'Date of Join';
        }
        field(9; Department; Code[20])
        {
            FieldClass = Normal;
            Caption = 'Department';
        }
        field(55; "Job Desc"; Text[50])
        {
            CalcFormula = lookup("HRBack To Office Form"."Course Title" where("Document No" = field("Job Id")));
            FieldClass = FlowField;
            Caption = 'Job Desc';
            Editable = false;
        }
        field(56; "Job Id"; Code[100])
        {
            TableRelation = "Vendor Invoice Disc."."Service Charge";
            Caption = 'Job Id';
        }
    }

    keys
    {
        key(Key1; "Job Id", "Employee No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        HRJobs.Reset();
        HRJobs.SetRange(HRJobs."Job ID", "Job Id");
        HRJobs.SetRange(HRJobs.Status, HRJobs.Status::Approved);
        if HRJobs.Find('-') then begin
            UserSetup.Reset();
            UserSetup.SetRange(UserSetup."User ID", UserId);
            UserSetup.SetRange(UserSetup."Modify Jobs", true);
            if UserSetup.Find('-') = false then
                Error('Kindly seek approval to modify this record.');
        end
    end;

    trigger OnModify()
    begin
        HRJobs.Reset();
        HRJobs.SetRange(HRJobs."Job ID", "Job Id");
        HRJobs.SetRange(HRJobs.Status, HRJobs.Status::Approved);
        if HRJobs.Find('-') then begin
            UserSetup.Reset();
            UserSetup.SetRange(UserSetup."User ID", UserId);
            UserSetup.SetRange(UserSetup."Modify Jobs", true);
            if UserSetup.Find('-') = false then
                Error('Kindly seek approval to modify this record.');
        end
    end;

    var
        HREmp: Record "HR Employees";
        HRJobs: Record "HR Jobs";
        UserSetup: Record "User Setup";
}
