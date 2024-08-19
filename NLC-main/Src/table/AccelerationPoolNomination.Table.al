#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193696 "Acceleration Pool Nomination"
{
    Caption = 'Acceleration Pool Nomination';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Pool No."; Code[10])
        {
            Caption = 'Pool No.';
            trigger OnValidate()
            begin
                if "Pool No." <> xRec."Pool No." then begin
                    HRSetup.Get();
                    NoSeriesMgt.TestManual(HRSetup."Leave Application Nos.");
                    "No Series" := '';
                end;
            end;
        }
        field(2; "Nominee No."; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Nominee No.';
            trigger OnValidate()
            begin
                HREmp.Reset();
                HREmp.SetRange(HREmp."No.", "Nominee No.");
                if HREmp.Find('-') then begin
                    "Nominee Name" := HREmp."Full Name";
                    "Job ID" := HREmp."Job ID";
                    "Job Name" := HREmp."Job Title";
                    Department := HREmp."Global Dimension 2 Code";

                end;
            end;
        }
        field(3; "Nominee Name"; Text[250])
        {
            Editable = false;
            TableRelation = "HR Employees"."Full Name";
            Caption = 'Nominee Name';
        }
        field(4; "Nominated By"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Nominated By';
            trigger OnValidate()
            begin
                HREmp.Reset();
                HREmp.SetRange(HREmp."No.", "Nominated By");
                if HREmp.Find('-') then
                    "Nominated By Name" := HREmp."Full Name";
            end;
        }
        field(5; "Nominated By Name"; Text[30])
        {
            Editable = false;
            TableRelation = "HR Employees"."Full Name";
            Caption = 'Nominated By Name';
        }
        field(6; "Job ID"; Code[10])
        {
            TableRelation = "HR Jobs"."Job ID";
            Caption = 'Job ID';
        }
        field(7; "Job Name"; Text[30])
        {
            TableRelation = "HR Employees"."Job Title";
            Caption = 'Job Name';
        }
        field(8; Date; Date)
        {
            Editable = false;
            Caption = 'Date';
        }
        field(9; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center BR NEW".Code;
            Caption = 'Responsibility Center';
        }
        field(10; Status; Option)
        {
            OptionMembers = New,"Pending Approval",Approved,Rejected;
            Caption = 'Status';
        }
        field(11; "Behaves  Consistently"; Option)
        {
            OptionMembers = " ",Strength,Proficient,"Developmental Need";
            Caption = 'Behaves  Consistently';
        }
        field(12; "Displays Respect"; Option)
        {
            OptionMembers = " ",Strength,Proficient,"Developmental Need";
            Caption = 'Displays Respect';
        }
        field(13; "Good Team Player"; Option)
        {
            OptionMembers = " ",Strength,Proficient,"Developmental Need";
            Caption = 'Good Team Player';
        }
        field(14; "Identifies Management"; Option)
        {
            OptionMembers = " ",Strength,Proficient,"Developmental Need";
            Caption = 'Identifies Management';
        }
        field(15; "Motivated to Lead"; Option)
        {
            OptionMembers = " ",Strength,Proficient,"Developmental Need";
            Caption = 'Motivated to Lead';
        }
        field(16; "Accepts Leadership"; Option)
        {
            OptionMembers = " ",Strength,Proficient,"Developmental Need";
            Caption = 'Accepts Leadership';
        }
        field(17; "Mobilizes resources/People"; Option)
        {
            OptionMembers = " ",Strength,Proficient,"Developmental Need";
            Caption = 'Mobilizes resources/People';
        }
        field(18; "Leads Team"; Option)
        {
            OptionMembers = " ",Strength,Proficient,"Developmental Need";
            Caption = 'Leads Team';
        }
        field(19; Communicates; Option)
        {
            OptionMembers = " ",Strength,Proficient,"Developmental Need";
            Caption = 'Communicates';
        }
        field(20; "Effective Presentations"; Option)
        {
            OptionMembers = " ",Strength,Proficient,"Developmental Need";
            Caption = 'Effective Presentations';
        }
        field(21; "Demonstrates diplomacy"; Option)
        {
            OptionMembers = " ",Strength,Proficient,"Developmental Need";
            Caption = 'Demonstrates diplomacy';
        }
        field(22; "Trusted & Respected"; Option)
        {
            OptionMembers = " ",Strength,Proficient,"Developmental Need";
            Caption = 'Trusted & Respected';
        }
        field(23; "Positive unit results"; Option)
        {
            OptionMembers = " ",Strength,Proficient,"Developmental Need";
            Caption = 'Positive unit results';
        }
        field(24; "Accomplishes Assignments"; Option)
        {
            OptionMembers = " ",Strength,Proficient,"Developmental Need";
            Caption = 'Accomplishes Assignments';
        }
        field(25; "Accurate self-Insight"; Option)
        {
            OptionMembers = " ",Strength,Proficient,"Developmental Need";
            Caption = 'Accurate self-Insight';
        }
        field(26; Coachable; Option)
        {
            OptionMembers = " ",Strength,Proficient,"Developmental Need";
            Caption = 'Coachable';
        }
        field(27; "Learns from Experience"; Option)
        {
            OptionMembers = " ",Strength,Proficient,"Developmental Need";
            Caption = 'Learns from Experience';
        }
        field(28; "Quick Learner"; Option)
        {
            OptionMembers = " ",Strength,Proficient,"Developmental Need";
            Caption = 'Quick Learner';
        }
        field(29; Initiative; Option)
        {
            OptionMembers = " ",Strength,Proficient,"Developmental Need";
            Caption = 'Initiative';
        }
        field(30; "ObjectiveSuccess Indicators"; Option)
        {
            OptionMembers = " ",Strength,Proficient,"Developmental Need";
            Caption = 'ObjectiveSuccess Indicators';
        }
        field(31; "Job to Succeed"; Code[30])
        {
            TableRelation = "HR Jobs to Succeed"."Job ID" where(Status = filter(Approved));
            Caption = 'Job to Succeed';
            trigger OnValidate()
            begin
                JobToSucceed.Reset();
                JobToSucceed.SetRange(JobToSucceed."Job ID", "Job to Succeed");
                if JobToSucceed.Find('-') then
                    "Job to Succeed Name" := JobToSucceed.Description;
            end;
        }
        field(32; "No Series"; Code[10])
        {
            Caption = 'No Series';
        }
        field(33; Department; Code[20])
        {
            Editable = false;
            TableRelation = "Dimension Value".Code;
            Caption = 'Department';
        }
        field(34; "Job to Succeed Name"; Text[50])
        {
            Editable = false;
            TableRelation = "HR Jobs to Succeed".Description;
            Caption = 'Job to Succeed Name';
        }
        field(35; "Incumbent No."; Code[30])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Incumbent No.';
            trigger OnValidate()
            begin
                HREmp.Reset();
                HREmp.SetRange(HREmp."No.", "Incumbent No.");
                if HREmp.Find('-') then
                    "Incumbent Name" := HREmp."Full Name";
            end;
        }
        field(36; "Incumbent Name"; Text[100])
        {
            Caption = 'Incumbent Name';
        }
        field(37; Criticality; Option)
        {
            OptionMembers = Critical,"Very Important";
            Caption = 'Criticality';
        }
        field(38; "Retirement Status"; Option)
        {
            OptionMembers = A,B,C;
            Caption = 'Retirement Status';
        }
        field(39; "User ID"; Code[20])
        {
            Caption = 'User ID';
        }
        field(40; "Supports Commision Values"; Option)
        {
            OptionMembers = " ",Strength,Proficiency,"Developmental Need";
            Caption = 'Supports Commision Values';
        }
        field(41; "Leadership Promise"; Option)
        {
            OptionMembers = " ",Strength,Proficiency,"Developmental Need";
            Caption = 'Leadership Promise';
        }
        field(42; "Interpersonal Skills"; Option)
        {
            OptionMembers = " ",Strength,Proficiency,"Developmental Need";
            Caption = 'Interpersonal Skills';
        }
        field(43; "Demonstration of Results"; Option)
        {
            OptionMembers = " ",Strength,Proficiency,"Developmental Need";
            Caption = 'Demonstration of Results';
        }
        field(44; "Developmental Orientation"; Option)
        {
            OptionMembers = " ",Strength,Proficiency,"Developmental Need";
            Caption = 'Developmental Orientation';
        }
    }

    keys
    {
        key(Key1; "Pool No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin


        //No. Series
        if "Pool No." = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Acceleration Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Acceleration Nos.", xRec."No Series", 0D, "Pool No.", "No Series");
        end;

        Date := Today;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRSetup: Record "HR Setup";
        HREmp: Record "HR Employees";
        JobToSucceed: Record "HR Jobs to Succeed";
}
