page 50056 "Job Applicants Qualifications"
{
    ApplicationArea = All;
    Caption = 'Job Applicants Qualifications';
    PageType = List;
    SourceTable = "Job Applicants Qualification";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Candidate No."; Rec."Candidate No.")
                {
                    ToolTip = 'Specifies the value of the Candidate No. field.', Comment = '%';
                }
                field("Attained Score"; Rec."Attained Score")
                {
                    ToolTip = 'Specifies the value of the Attained Score field.', Comment = '%';
                }
                field(Country; Rec.Country)
                {
                    ToolTip = 'Specifies the value of the Country field.', Comment = '%';
                }
                field("Course Grade"; Rec."Course Grade")
                {
                    ToolTip = 'Specifies the value of the Course Grade field.', Comment = '%';
                }
                field("Job Applicant Status"; Rec."Job Applicant Status")
                {
                    ToolTip = 'Specifies the value of the Job Applicant Status field.', Comment = '%';
                }
                field("Job Description/Designation"; Rec."Job Description/Designation")
                {
                    ToolTip = 'Specifies the value of the Job Description/Designation field.', Comment = '%';
                }
                field("Membership Registration No"; Rec."Membership Registration No")
                {
                    ToolTip = 'Specifies the value of the Membership Registration No field.', Comment = '%';
                }
                field("Qualification Category"; Rec."Qualification Category")
                {
                    ToolTip = 'Specifies the value of the Qualification Category field.', Comment = '%';
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ToolTip = 'Specifies the value of the Qualification Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Education Level"; Rec."Education Level")
                {
                    ToolTip = 'Specifies the value of the Education Level field.', Comment = '%';
                }
            }
        }
    }
}
