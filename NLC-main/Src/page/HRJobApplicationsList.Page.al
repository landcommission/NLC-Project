#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193441 "HR Job Applications List"
{
    ApplicationArea = Basic;
    CardPageId = "HR Job Applications Card";
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Applicant,Functions,Print';
    SourceTable = "HR Job Applications";
    SourceTableView = where(ReApplied = const(false));
    UsageCategory = Lists;
    Caption = 'HR Job Applications List';
    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
            {
                Editable = false;
                field("Job Application No."; Rec."Job Application No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Job Application No. field.';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
                }
                field("Date Applied"; Rec."Date Applied")
                {
                    ApplicationArea = Basic;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Date Applied field.';
                }
                field("Employee Requisition No"; Rec."Employee Requisition No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Application Ref. No.';
                    ToolTip = 'Specifies the value of the Application Ref. No. field.';
                }
                field("Job Applied For"; Rec."Job Applied For")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job ID';
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Applied for Description"; Rec."Job Applied for Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Description';
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Style = Attention;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1; Links) { }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("Other Details")
            {
                Caption = 'Other Details';
                action(Qualifications)
                {
                    ApplicationArea = Basic;
                    Caption = 'Qualifications';
                    Image = QualificationOverview;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = page "Applicant Job Requirements";
                    RunPageLink = "Application No." = field("Job Application No.");
                    ToolTip = 'Executes the Qualifications action.';
                }
                action(Referees)
                {
                    ApplicationArea = Basic;
                    Caption = 'Referees';
                    Image = ContactReference;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    RunObject = page "HR Applicant Referees";
                    RunPageLink = "Application No." = field("Employee Requisition No");
                    ToolTip = 'Executes the Referees action.';
                }
            }
            group("Job Details")
            {
                Caption = 'Job Details';
                action(Requirements)
                {
                    ApplicationArea = Basic;
                    Caption = 'Requirements';
                    Image = Card;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = page "HR Job Requirement Lines";
                    RunPageLink = "Job ID" = field("Job Applied For");
                    ToolTip = 'Executes the Requirements action.';
                }
                action(Responsibilities)
                {
                    ApplicationArea = Basic;
                    Caption = 'Responsibilities';
                    Image = JobResponsibility;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = page "HR Job Responsiblities Lines";
                    RunPageLink = "Job ID" = field("Job Applied For");
                    ToolTip = 'Executes the Responsibilities action.';
                }
            }
        }
    }

    var
        HRJobApplications: Record "HR Job Applications";
        Text001: Label 'Are you sure you want to Upload Applicants Details to the Employee Card?';
        Text002: Label 'Are you sure you want to Send an Interview Application?';
}
