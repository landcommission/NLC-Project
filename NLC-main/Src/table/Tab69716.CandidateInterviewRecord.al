#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69716 "Candidate Interview Record"
{

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Interview Invitation No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Candidate Selection Header"."Document No." where("Document Type" = filter("Interview Invitation"));

            trigger OnValidate()
            begin
                SelectionHeader.Reset;
                SelectionHeader.SetRange("Document No.", "Interview Invitation No.");
                if SelectionHeader.FindFirst then begin
                    "Interview Scoresheet Template" := SelectionHeader."Interview Scoresheet Template";
                    "Candidate Shortlist Vouch No." := SelectionHeader."Candidate Shortlist No.";


                    Validate("Interview Scoresheet Template");
                    //  end;

                end
            end;
        }
        field(3; "Interview Scoresheet Template"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "HR Screening Template".Code where("Template Type" = filter("Interview Scoresheet"));

            trigger OnValidate()
            begin
                IF "Document Type" = "Document Type"::Individual then begin
                    HrScreeningQn1.Reset;
                    HrScreeningQn1.SetRange("Header No.", "Interview Scoresheet Template");
                    if HrScreeningQn1.FindSet then begin
                        repeat
                            CandidateInterviewQn2.Init;
                            CandidateInterviewQn2."Document No." := "Document No.";
                            CandidateInterviewQn2.Description := HrScreeningQn1.Description;

                            CandidateInterviewQn2."Question Category" := HrScreeningQn1."Question Category";
                            CandidateInterviewQn2."Interview Scoresheet Template" := "Interview Scoresheet Template";
                            CandidateInterviewQn2.Insert(true);
                        until HrScreeningQn1.Next = 0;
                    end;
                    Qns.Reset;
                    Qns.SetRange("Template ID", "Interview Scoresheet Template");
                    if Qns.FindSet then begin
                        repeat

                            CandidateInterviewQuestion."Document No." := "Document No.";
                            CandidateInterviewQuestion."Interview Scoresheet Template" := "Interview Scoresheet Template";
                            CandidateInterviewQuestion."Question Category" := Qns."Question Category";
                            CandidateInterviewQuestion."Question ID" := Qns."Question Id";

                            CandidateInterviewQuestion."Interview Area" := Qns."Interview Area";
                            CandidateInterviewQuestion.Description := Qns.Description;
                            CandidateInterviewQuestion."Question Type" := Qns."Question Type";
                            CandidateInterviewQuestion."Close Ended Qn Subtype" := Qns."Closed-ended Question Sub-Type";
                            CandidateInterviewQuestion.Rating := Qns."Default Rating Scale";
                            CandidateInterviewQuestion.Weight := Qns.Weight;
                            CandidateInterviewQuestion."Maximum Raw Score" := Qns."Maximum Points Accepted";
                            CandidateInterviewQuestion.Insert(true);
                        until Qns.Next = 0
                    end;
                end;
            end;
        }
        field(4; "Vacancy ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Recruitment Requisition Header" where("Document Type" = filter("Job Vacancy"));
        }
        field(6; "Candidate Shortlist Vouch No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Candidate Selection Header" where("Document Type" = const("Candidate Shortlisting"));
        }
        field(7; "Application No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Applications";

            trigger OnValidate()
            begin
                InterviewLine.Reset;
                InterviewLine.SetRange("Application No.", "Application No.");
                InterviewLine.SetRange("Document No.", "Interview Invitation No.");
                if InterviewLine.FindFirst then begin
                    "Candidate No." := InterviewLine."Candidate No.";
                    Validate("Candidate No.");
                    "Interview Date" := InterviewLine."Interview Date";
                    "Interview Start Time" := InterviewLine."Interview Start Time";
                    "Interview End Time" := InterviewLine."Interview End Time";
                    "Interview Venue" := InterviewLine."Interview Venue";
                    "Room No." := InterviewLine."Room No.";
                    "Vacancy ID" := InterviewLine."Vacancy ID";
                    "Candidate Shortlist Vouch No." := InterviewLine."Candidate Shortlist Voucher";
                    "Assigned Panel ID" := InterviewLine."Assigned Panel ID";
                end
            end;
        }
        field(8; "Candidate No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Applicant;

            trigger OnValidate()
            begin
                Applicant.Reset;
                Applicant.SetRange("Candidate No.", "Candidate No.");
                if Applicant.FindFirst then begin
                    "First Name" := Applicant."First Name";
                    "Middle Name" := Applicant."Middle Name";
                    "Last Name" := Applicant."Last Name";
                end
            end;
        }
        field(9; "First Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Middle Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Last Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Interview Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Interview Start Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Interview End Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Interview Venue"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Room No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Assigned Panel ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Commitee Appointment Voucher"."Document No.";
        }
        field(18; "Panel Member No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Commitee Appointed Member"."Member No." where("Document No." = field("Assigned Panel ID"));

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange("No.", "Panel Member No.");
                if Resource.FindSet then begin
                    Member := Resource.Name;
                end;
            end;
        }
        field(19; Member; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Panel Interview Outcome"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Unsuccessful,Successful';
            OptionMembers = " ",Unsuccessful,Successful;
        }
        field(21; "Panel Interview Score %"; Decimal)
        {
            CalcFormula = sum("Candidate Interview Question"."Weighted Score %" where("Document No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(22; "Panelist Interview Remarks"; Text[350])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Unsuccesful App Reason Code"; Code[500])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Active,Cancelled';
            OptionMembers = Active,Cancelled;
        }
        field(25; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(26; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Posted By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Posted On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Individual,Consolidated';
            OptionMembers = Individual,Consolidated;
        }
        field(31; "Oral Interview Score %"; Decimal)
        {
            CalcFormula = sum("Candidate Interview Question"."Weighted Score %" where("Document No." = field("Document No."), "Interview Area" = filter("Oral Interview")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(32; "Technical Interview Score %"; Decimal)
        {
            CalcFormula = sum("Candidate Interview Question"."Weighted Score %" where("Document No." = field("Document No."), "Interview Area" = filter("Technical Interview")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        HumanResourcesSetup.Get;
        HumanResourcesSetup.TestField("Interview Invitation Nos.");
        if "Document No." = '' then
            NoSeriesMgt.InitSeries(HumanResourcesSetup."Interview Invitation Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
        //"Created By":=USERID;
        //"Created On":=CURRENTDATETIME;
        "Document Date" := Today;
    end;

    var
        Applicant: Record Applicant;
        SelectionHeader: Record "Candidate Selection Header";
        InterviewLine: Record "Candidate Interview Line";
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        JobApplications: Record "Job Applications";
        Qns: Record "Hr Screening Template Line";
        CandidateInterviewQuestion: Record "Candidate Interview Question";
        HrScreeningQn1: Record "Hr Screening Qn Group";
        CandidateInterviewQn2: Record "Candidate Interview Qn Group";
        Resource: Record Resource;
}

