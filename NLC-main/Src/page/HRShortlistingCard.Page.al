#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193499 "HR Shortlisting Card"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Shortlist';
    SourceTable = "HR Employee Requisitions";
    SourceTableView = where(Status = const(Approved),
                            Closed = const(false));
    ApplicationArea = All;
    Caption = 'HR Shortlisting Card';
    layout
    {
        area(Content)
        {
            group("Job Details")
            {
                Caption = 'Job Details';
                Editable = true;
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
                field("Requisition No."; "Requisition No.")
                {
                    ApplicationArea = all;
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                    ApplicationArea = Basic;
                    Editable = "Requisition DateEditable";
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Requisition Date field.';
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = Basic;
                    Editable = PriorityEditable;
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Priority field.';
                }
                field("Vacant Positions"; Rec."Vacant Positions")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Vacant Positions field.';
                }
                field("Required Positions"; Rec."Required Positions")
                {
                    ApplicationArea = Basic;
                    Editable = "Required PositionsEditable";
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Required Positions field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Shortlisted; "HR Shortlisting Lines")
            {
                Editable = ShortlistedEditable;
                SubPageLink = "Employee Requisition No" = field("Requisition No.");
            }
        }
        area(FactBoxes)
        {
            systempart(Control1102755001; Outlook) { }
        }
    }

    actions
    {
        area(Navigation)
        {
            group(Applicants)
            {
                Caption = 'Applicants';
                action("&ShortList Applicants")
                {
                    ApplicationArea = Basic;
                    Caption = '&ShortList Applicants';
                    Image = SelectField;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the &ShortList Applicants action.';

                }
                action(Filters)
                {
                    ApplicationArea = Basic;
                    Caption = 'Filters';
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = page "HR Shortlisting Filters";
                    RunPageLink = "Job ID" = field("Job ID"),
                                  "Requisition No." = field("Requisition No.");
                    Visible = false;
                    ToolTip = 'Executes the Filters action.';
                }
                action(Action3)
                {
                    ApplicationArea = Basic;
                    Caption = '&ShortList Applicants';
                    Image = SelectField;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &ShortList Applicants action.';
                    trigger OnAction()
                    var
                        Qual: Boolean;
                        Scor: Decimal;
                    begin

                        if Confirm('Shortlist Applicants for Employee Requisition %1 - %2.' + ' ' + 'Qualified candidates will have a check mark on the qualified column.', false, Rec."Requisition No.", Rec."Job Description") = true then begin
                            // HRJobRequirements.Reset();
                            // HRJobRequirements.SetRange(HRJobRequirements."Job ID", Rec."Job ID");
                            // if HRJobRequirements.Count = 0 then begin
                            //     Message('Job Requirements for the job ' + Rec."Job ID" + ' have not been setup');
                            //     exit;
                            // end else begin
                            //GET JOB REQUIREMENTS
                            //DELETE ALL RECORDS FROM THE SHORTLISTED APPLICANTS TABLE
                            HRShortlistedApplicants.Reset();
                            HRShortlistedApplicants.SetRange(HRShortlistedApplicants."Employee Requisition No", Rec."Requisition No.");
                            HRShortlistedApplicants.DeleteAll();
                            //GET JOB APPLICANTS
                            HRJobApplications.Reset();
                            HRJobApplications.SetRange(HRJobApplications."Employee Requisition No", Rec."Requisition No.");
                            if not HRJobApplications.Find('-') then
                                Error('No Applicants have applied for this Job');
                            // HRJobApplications.FindFirst();
                            // repeat
                            //     HRJobApplications.Qualified := false;
                            //     HRJobApplications.Modify();
                            // until HRJobApplications.Next() = 0;
                            //MOVE TO FIRST RECORD AGAIN
                            HRJobApplications.Reset();
                            HRJobApplications.SetRange(HRJobApplications."Employee Requisition No", Rec."Requisition No.");
                            HRJobApplications.FindFirst();
                            repeat
                                Rec.Qualified := true;
                                HRJobRequirements.Reset();
                                HRJobRequirements.SetRange(HRJobRequirements."Job ID", Rec."Job ID");
                                if HRJobRequirements.Find('-') then
                                    repeat
                                        Scor := 0;
                                        Qual := false;
                                        //GET THE APPLICANTS QUALIFICATIONS AND COMPARE THEM WITH THE JOB REQUIREMENTS
                                        HRApplicantRequirements.Reset();
                                        HRApplicantRequirements.SetRange(HRApplicantRequirements."Application No", HRJobApplications."Job Application No.");
                                        HRApplicantRequirements.SetRange(HRApplicantRequirements."Qualification Code", HRJobRequirements."Qualification Code");
                                        if HRApplicantRequirements.Find('-') then begin
                                            Scor := Rec.Score + HRApplicantRequirements."Score ID";
                                            //Condition 1
                                            if (HRApplicantRequirements."Score ID" < HRJobRequirements."Minimum Score")
                                            or
                                               (HRApplicantRequirements."Score ID" < HRJobRequirements."Maximum Score")
                                           then
                                                Qual := false
                                            else
                                                Qual := true;
                                        end else
                                            //IF WE DO NOT FIND ANY APPLICANT QUALIFICATIONS
                                            Qual := false;
                                    until HRJobRequirements.Next() = 0;
                                HRShortlistedApplicants.Init();
                                HRShortlistedApplicants."Employee Requisition No" := Rec."Requisition No.";
                                HRShortlistedApplicants."Job Application No" := HRJobApplications."Job Application No.";
                                HRShortlistedApplicants."Stage Score" := Scor;
                                HRShortlistedApplicants.Qualified := Qual;
                                HRShortlistedApplicants."First Name" := HRJobApplications."First Name";
                                HRShortlistedApplicants.Validate(HRShortlistedApplicants."First Name");
                                HRShortlistedApplicants."Middle Name" := HRJobApplications."Middle Name";
                                HRShortlistedApplicants.Validate(HRShortlistedApplicants."Middle Name");
                                HRShortlistedApplicants."Last Name" := HRJobApplications."Last Name";
                                HRShortlistedApplicants.Validate(HRShortlistedApplicants."Last Name");
                                HRShortlistedApplicants."ID No" := HRJobApplications."ID Number";
                                HRShortlistedApplicants.Gender := HRJobApplications.Gender;
                                HRShortlistedApplicants."Marital Status" := HRJobApplications."Marital Status";
                                HRShortlistedApplicants."Job applied" := HRJobApplications."Job Applied For";
                                HRShortlistedApplicants.Insert();
                                HRJobApplications.Modify();
                            until HRJobApplications.Next() = 0;
                            Message('Shortlisting Competed Successfully for %1', Rec."Job ID");
                        end else
                            exit;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        OnAfterGetCurrRecord();
    end;

    trigger OnInit()
    begin
        "Required PositionsEditable" := true;
        PriorityEditable := true;
        ShortlistedEditable := true;
        "Requisition DateEditable" := true;
        "Job IDEditable" := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        OnAfterGetCurrRecord();
    end;

    var
        HRJobRequirements: Record "HR Job Requirements";
        AppQualifications: Record "HR Applicant Qualifications";
        HRJobApplications: Record "HR Job Applications";
        Qualified: Boolean;
        StageScore: Decimal;
        HRShortlistedApplicants: Record "HR Shortlisted Applicants";
        MyCount: Integer;
        RecCount: Integer;
        HREmpReq: Record "HR Employee Requisitions";
        [InDataSet]
        "Job IDEditable": Boolean;
        [InDataSet]
        "Requisition DateEditable": Boolean;
        [InDataSet]
        ShortlistedEditable: Boolean;
        [InDataSet]
        PriorityEditable: Boolean;
        [InDataSet]
        "Required PositionsEditable": Boolean;
        Text19057439: Label 'Short Listed Candidates';
        HRShorlistedApps: Record "HR Shortlisted Applicants";
        HRShortFilters: Record "HR Shortlisting Filters";
        HRJobApps: Record "HR Job Applications";
        HRAppQual: Record "HR Applicant Qualifications";
        RelatedQualification: Record "HR Job Related Requirements";
        found: Integer;
        HRApplicantRequirements: Record "HR Appplicants Requirements";
        HRApplicantRelatedQualifications: Record "HR Applic Related Requirements";


    procedure UpdateControls()
    begin

        if Rec.Status = Rec.Status::New then begin
            "Job IDEditable" := true;
            "Requisition DateEditable" := true;
            ShortlistedEditable := true;
            PriorityEditable := true;
            "Required PositionsEditable" := true;
        end else begin
            "Job IDEditable" := false;
            "Requisition DateEditable" := false;
            ShortlistedEditable := false;
            PriorityEditable := false;
            "Required PositionsEditable" := false;
        end;
    end;

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;

        UpdateControls();
    end;
}
