#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193423 "HR Job Responsiblities"
{
    DrillDownPageId = "HR Job Responsiblities Lines";
    LookupPageId = "HR Job Responsiblities Lines";
    Caption = 'HR Job Responsiblities';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Job ID"; Code[50])
        {
            Editable = false;
            TableRelation = "HR Jobs"."Job ID";
            Caption = 'Job ID';
        }
        field(2; "Responsibility Description"; Text[250])
        {
            Caption = 'Responsibility Description';
        }
        field(3; Remarks; Text[150])
        {
            Caption = 'Remarks';
        }
        field(4; "Responsibility Code"; Code[20])
        {
            Caption = 'Responsibility Code';
            trigger OnValidate()
            begin
                HRAppEvalArea.Reset();
                HRAppEvalArea.SetRange(HRAppEvalArea.Code, "Responsibility Code");
                if HRAppEvalArea.Find('-') then
                    Remarks := HRAppEvalArea."Measure No";
            end;
        }
        field(5; "Request No"; Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Document Type"; Option)
        {
            OptionMembers = "Job Vacancy",Advertised;
        }
    }

    keys
    {
        key(Key1; "Job ID", "Responsibility Code", "Request No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        HRAppEvalArea: Record "HR OSMeasure Line";

    trigger OnInsert()
    var
        myInt: Integer;
        HRJobs: Record "HR Jobs";
    begin
        ControlList();
        "Document Type" := "Document Type"::"Job Vacancy";

    end;

    trigger OnModify()
    var
        myInt: Integer;
    begin
        ControlList();
        "Document Type" := "Document Type"::"Job Vacancy";

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
}
