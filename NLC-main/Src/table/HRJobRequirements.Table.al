#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193425 "HR Job Requirements"
{
    Caption = 'HR Job Requirements';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Job ID"; Code[50])
        {
            NotBlank = true;
            TableRelation = "HR Jobs"."Job ID";
            Caption = 'Job ID';
        }
        field(2; "Qualification Type"; Code[60])
        {
            // NotBlank = false;
            TableRelation = "HR Lookup Values".Code where(Type = filter("Qualification Type"));
            Caption = 'Qualification Type';
        }
        field(3; "Qualification Code"; Code[30])
        {
            TableRelation = "HR Job Qualifications".Code where("Qualification Type" = field("Qualification Type"));
            Caption = 'Qualification Code';
            trigger OnValidate()
            begin
                /*.SETFILTER(Requirments."Qualification Type","Qualification Type");
                Requirments.SETFILTER(Requirments.Code,"Qualification Code");
                IF Requirments.FIND('-') THEN
                 Qualification := Requirments.Description; */


                if HRQualifications.Get("Qualification Type", "Qualification Code") then
                    "Qualification Description" := HRQualifications.Description;

            end;
        }
        field(6; Priority; Option)
        {
            OptionMembers = " ",High,Medium,Low;
            Caption = 'Priority';
        }
        field(8; "Score ID"; Decimal)
        {
            Editable = true;
            Caption = 'Score ID';
        }
        field(9; "Need code"; Code[10])
        {
            Caption = 'Need code';
            //TableRelation = Table0;
        }
        field(10; "Stage Code"; Code[10])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const(Scores));
            Caption = 'Stage Code';
        }
        field(11; Mandatory; Boolean)
        {
            Caption = 'Mandatory';
        }
        field(12; "Minimum Score"; Decimal)
        {
            Editable = false;
            Caption = 'Minimum Score';
        }
        field(13; "Total (Stage)Desired Score"; Decimal)
        {
            Editable = false;
            Caption = 'Total (Stage)Desired Score';
        }
        field(14; "Qualification Description"; Text[250])
        {
            Caption = 'Qualification Description';
        }
        field(15; "Maximum Score"; Decimal)
        {
            Editable = false;
            Caption = 'Maximum Score';
        }
        field(16; Relevant; Boolean)
        {
            Caption = 'Relevant';
        }
        field(17; "Related Qualification"; Boolean)
        {
            Caption = 'Related Qualification';
        }
        field(18; "Applicant No"; Code[30])
        {
            Caption = 'Applicant No';
        }
        field(19; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Recruitment Requisition,Job Vacancy';
            OptionMembers = "Recruitment Requisition","Job Vacancy";
        }
        field(21; "Line Num"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }

    }

    keys
    {
        key(Key1; "Job ID", "Line Num", "Applicant No")
        {
            Clustered = true;
            //SumIndexFields = "Score ID";
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        "Document Type" := "Document Type"::"Job Vacancy";
        ControlList();
        HRjobs.Reset();
        HRjobs.SetRange(HRjobs."Job ID", "Job ID");
        HRjobs.SetRange(HRjobs.Status, HRjobs.Status::New);
        if HRjobs.Find('-') then begin
            Usersetup.Reset();
            Usersetup.SetRange(Usersetup."User ID", UserId);
            Usersetup.SetRange(Usersetup."Modify Jobs", true);
            if Usersetup.Find('-') = false then
                Error('Kindly seek approval to modify this record.');
        end
    end;

    trigger OnModify()
    begin
        "Document Type" := "Document Type"::"Job Vacancy";
        ControlList();
        HRjobs.Reset();
        HRjobs.SetRange(HRjobs."Job ID", "Job ID");
        HRjobs.SetRange(HRjobs.Status, HRjobs.Status::New);
        if HRjobs.Find('-') then begin
            Usersetup.Reset();
            Usersetup.SetRange(Usersetup."User ID", UserId);
            Usersetup.SetRange(Usersetup."Modify Jobs", true);
            if Usersetup.Find('-') = false then
                Error('Kindly seek approval to modify this record.');
        end
    end;

    trigger OnDelete()
    var
        myInt: Integer;
    begin
        ControlList();
    end;


    local procedure ControlList()
    var
        myInt: Integer;
        HRJobs: Record "HR Jobs";
    begin

        // HRJobs.Reset();
        // HRJobs.SetRange("Job ID", Rec."Job ID");
        // if HRJobs.FindFirst() then
        //     if HRJobs.Status <> HRJobs.Status::New then
        //         Error('You cannot modify this list if the job status is not new');

    end;

    var
        HRQualifications: Record "HR Job Qualifications";
        HRjobs: Record "HR Jobs";
        Usersetup: Record "User Setup";
}
