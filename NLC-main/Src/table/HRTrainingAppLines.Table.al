#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193499 "HR Training App Lines"
{
    DrillDownPageId = "HR Training Application Lines";
    LookupPageId = "HR Training Application Lines";
    Caption = 'HR Training App Lines';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(2; "Application No."; Code[20])
        {
            Caption = 'Application No.';
        }
        field(3; "Employee No."; Code[20])
        {
            Editable = false;
            TableRelation = "HR Employees"."No." where(Status = const(Active));
            Caption = 'Employee No.';
            trigger OnValidate()
            var
                TRainHngheader: Record "HR Training App Header";
                Traininglines: Record "HR Training App Lines";
            begin
                TRainHngheader.Reset();
                TRainHngheader.SetRange("Application No", Rec."Application No.");
                TRainHngheader.SetRange(Training_Category, TRainHngheader.Training_Category::Individual);
                if TRainHngheader.FindFirst() then begin
                    Traininglines.Reset();
                    Traininglines.SetRange("Application No.", TRainHngheader."Application No");
                    if Traininglines.FindFirst() then
                        if Traininglines.Count >= 1 then
                            Error('For individual tranings only one person is required on  the lines');
                end;
                HREmployees.Reset();
                if HREmployees.Get("Employee No.") then begin
                    Name := HREmployees."Full Name";
                    "Job Title" := HREmployees."Job ID";
                    "Job Description" := HREmployees."Job Title";
                end else begin
                    Name := '';
                    "Job Title" := '';
                    "Job Description" := '';
                end;
            end;
        }
        field(4; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(5; Objectives; Text[250])
        {
            Caption = 'Objectives';
        }
        field(6; "Job Title"; Code[20])
        {
            Caption = 'Job Title';
        }
        field(7; "Job Description"; Text[250])
        {
            Caption = 'Job Description';
        }
        field(8; Notified; Boolean)
        {
            Caption = 'Notified';
        }
        field(9; Suggested; Boolean)
        {
            Editable = false;
            Caption = 'Suggested';
        }
        field(10; Attended; Boolean)
        {
            Caption = 'Attended';
        }
    }

    keys
    {
        key(Key1; "Application No.", "Line No.")
        {
            Clustered = true;
        }

    }

    fieldgroups { }

    var
        HREmployees: Record "HR Employees";
}

