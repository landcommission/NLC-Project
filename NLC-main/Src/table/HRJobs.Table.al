#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193424 "HR Jobs"
{
    DrillDownPageId = "HR Jobs List";
    LookupPageId = "HR Jobs List";
    Caption = 'HR Jobs';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Job ID"; Code[60])
        {
            Editable = false;
            Caption = 'Job ID';
        }
        field(2; "Job Description"; Text[250])
        {
            NotBlank = true;
            Caption = 'Job Description';
        }
        field(3; "No of Posts"; Integer)
        {
            Caption = 'No of Posts';
            trigger OnValidate()
            begin
                if "No of Posts" <> xRec."No of Posts" then
                    "Vacant Positions" := "No of Posts" - "Occupied Positions";
            end;
        }
        field(4; "Position Reporting to"; Code[20])
        {
            TableRelation = "HR Jobs"."Job ID" where(Status = const(Approved));
            Caption = 'Position Reporting to';
            trigger OnValidate()
            begin
                "Position Reporting Name" := '';

                HRJobs.Reset();
                if HRJobs.Get("Position Reporting to") then
                    "Position Reporting Name" := HRJobs."Job Description";
            end;
        }
        field(5; "Occupied Positions"; Integer)
        {
            CalcFormula = count("HR Employees" where("Job ID" = field("Job ID"),
                                                      Status = const(Active)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Occupied Positions';
        }
        field(6; "Vacant Positions"; Decimal)
        {
            Editable = false;
            Caption = 'Vacant Positions';

        }
        field(7; "Score code"; Code[20])
        {
            Caption = 'Score code';
        }
        field(8; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Caption = 'Global Dimension 1 Code';
            trigger OnValidate()
            begin
                "Global Dimension 1 Name" := '';
                DimensionValue.Reset();
                DimensionValue.SetRange(DimensionValue.Code, "Global Dimension 1 Code");
                if DimensionValue.Find('-') then
                    "Global Dimension 1 Name" := DimensionValue.Name;
            end;
        }
        field(9; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            Caption = 'Global Dimension 2 Code';
            trigger OnValidate()
            begin
                "Global Dimension 2 Name" := '';
                DimensionValue.Reset();
                DimensionValue.SetRange(DimensionValue.Code, "Global Dimension 2 Code");
                if DimensionValue.Find('-') then
                    "Global Dimension 2 Name" := DimensionValue.Name;
            end;
        }
        field(17; "Total Score"; Decimal)
        {
            Editable = false;
            Caption = 'Total Score';
        }
        field(19; "Main Objective"; Text[250])
        {
            Caption = 'Main Objective';
        }
        field(21; "Key Position"; Boolean)
        {
            Caption = 'Key Position';
        }
        field(22; Category; Code[20])
        {
            Caption = 'Category';
        }
        field(23; Grade; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const(Grade));
            Caption = 'Grade';
        }
        field(24; "Employee Requisitions"; Integer)
        {
            CalcFormula = count("HR Employee Requisitions" where("Job ID" = field("Job ID")));
            FieldClass = FlowField;
            Caption = 'Employee Requisitions';
            Editable = false;
        }
        field(27; "User ID"; Code[50])
        {
            Caption = 'User ID';
        }
        field(28; "Supervisor/Manager"; Code[50])
        {
            TableRelation = "HR Employees"."No." where(Status = const(Active));
            Caption = 'Supervisor/Manager';
            trigger OnValidate()
            begin
                HREmp.Get("Supervisor/Manager");
                "Supervisor Name" := HREmp.FullName();
            end;
        }
        field(29; "Supervisor Name"; Text[60])
        {
            Editable = false;
            Caption = 'Supervisor Name';
        }
        field(30; Status; Option)
        {
            Editable = true;
            OptionMembers = New,"Pending Approval",Approved,Rejected;
            Caption = 'Status';
        }
        field(32; "Date Created"; Date)
        {
            Caption = 'Date Created';
        }
        field(33; "No. of Requirements"; Integer)
        {
            CalcFormula = count("HR Job Requirements" where("Job ID" = field("Job ID")));
            FieldClass = FlowField;
            Caption = 'No. of Requirements';
            Editable = false;
        }
        field(34; "No. of Responsibilities"; Integer)
        {
            CalcFormula = count("HR Job Responsiblities" where("Job ID" = field("Job ID")));
            FieldClass = FlowField;
            Caption = 'No. of Responsibilities';
            Editable = false;
        }
        field(44; "Is Supervisor"; Boolean)
        {
            Caption = 'Is Supervisor';
        }
        field(45; "G/L Account"; Code[50])
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'G/L Account';
        }
        field(46; "Global Dimension 1 Name"; Text[100])
        {
            Caption = 'County Name';
            Editable = false;
        }
        field(47; "Global Dimension 2 Name"; Text[100])
        {
            Caption = 'Department Name';
            Editable = false;
        }
        field(49; "Position Reporting Name"; Text[100])
        {
            Editable = false;
            Caption = 'Position Reporting Name';
        }
        field(50; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }
        field(50000; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center BR NEW";
            Caption = 'Department';
            trigger OnValidate()
            begin
                "Responsibility Center Name" := '';

                RespCenter.Reset();
                RespCenter.SetRange(Code, rec."Responsibility Center");
                if RespCenter.FindFirst() then
                    "Responsibility Center Name" := RespCenter.Name;
            end;
        }
        field(50001; "Responsibility Center Name"; Text[100])
        {
            Editable = false;
            Caption = 'Department Name';
        }
    }

    keys
    {
        key(Key1; "Job ID")
        {
            Clustered = true;
        }
        key(Key2; "Job Description") { }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Job ID", "Job Description") { }
    }


    trigger OnInsert()
    begin

        if "Job ID" = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Job ID Nos");
            NoSeriesMgt.InitSeries(HRSetup."Job ID Nos", xRec."No. Series", 0D, "Job ID", "No. Series");
        end;


        "Date Created" := Today;
        "Responsibility Center" := 'HRM';
        "Global Dimension 2 Code" := 'HRM';
    end;

    trigger OnModify()
    begin
        "Vacant Positions" := "No of Posts" - "Occupied Positions";
        //  IF Status <> Status::New THEN ERROR('You cannot delete record when status is %1',Status);

        if Status <> Status::New then begin
            UserSetup.Reset();
            UserSetup.SetRange(UserSetup."User ID", UserId);
            UserSetup.Find('-');

            if UserSetup."Modify Jobs" = false then
                Error('Kindly seek approval to modify this record.');
        end;
    end;

    var
        NoOfPosts: Decimal;
        HREmp: Record "HR Employees";
        DimensionValue: Record "Dimension Value";
        RespCenter: Record "Responsibility Center BR NEW";
        HRJobs: Record "HR Jobs";
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
}
