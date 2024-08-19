#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193505 "HR Setup"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    RefreshOnActivate = false;
    SourceTable = "HR Setup";
    UsageCategory = Administration;
    Caption = 'HR Setup';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Leave Posting Period[FROM]"; Rec."Leave Posting Period[FROM]")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Posting Period[FROM] field.';
                }
                field("Leave Posting Period[TO]"; Rec."Leave Posting Period[TO]")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Posting Period[TO] field.';
                }
                field("Default Leave Posting Template"; Rec."Default Leave Posting Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Leave Posting Template field.';
                }
                field("Positive Leave Posting Batch"; Rec."Positive Leave Posting Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Positive Leave Posting Batch field.';
                }
                field("Negative Leave Posting Batch"; Rec."Negative Leave Posting Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Negative Leave Posting Batch field.';
                }
                field("Portal Files Path"; Rec."Portal Files Path")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Portal Files Path field.';
                }
                field("Min. Member Age"; "Min. Member Age")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the minimum Member age to be registered';
                }
                field("Retirement Age"; "Retirement Age")
                {
                    ApplicationArea = all;
                }
                field("Disabled Retirement Age"; "Disabled Retirement Age")
                {
                    ApplicationArea = all;
                    Caption = 'PWD Retirement Age';
                }
            }
            group(Numbering)
            {
                Caption = 'Numbering';
                field("Job ID Nos"; Rec."Job ID Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job ID Nos field.';
                }

                field("Employee Requisition Nos."; Rec."Employee Requisition Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Requisition Nos. field.';
                }
                field("Job Application Nos"; Rec."Job Application Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Application Nos field.';
                }
                field("Employee Nos."; Rec."Employee Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Nos. field.';
                }
                field("Training Application Nos."; Rec."Training Application Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Application Nos. field.';
                }
                field("Leave Application Nos."; Rec."Leave Application Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Application Nos. field.';
                }
                field("Leave Reimbursment Nos."; Rec."Leave Reimbursment Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Reimbursment Nos. field.';
                }
                field("Leave Carry Over App Nos."; Rec."Leave Carry Over App Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Carry Over App Nos. field.';
                }
                field("Disciplinary Cases Nos."; Rec."Disciplinary Cases Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disciplinary Cases Nos. field.';
                }
                field("Exit Interview Nos"; Rec."Exit Interview Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exit Interview Nos field.';
                }
                field("Appraisal Nos"; Rec."Appraisal Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Nos field.';
                }
                field("Company Activities"; Rec."Company Activities")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company Activities field.';
                }
                field("Job Interview Nos"; Rec."Job Interview Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Interview Nos field.';
                }
                field("Notice Board Nos."; Rec."Notice Board Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice Board Nos. field.';
                }
                field("Company Documents"; Rec."Company Documents")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company Documents field.';
                }
                field("Transport Req Nos"; Rec."Transport Req Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transport Req Nos field.';
                }
                field("Clearance Nos"; Rec."Clearance Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Clearance Nos field.';
                }
                field("HR Policies"; Rec."HR Policies")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HR Policies field.';
                }
                field("Pay-change No."; Rec."Pay-change No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay-change No. field.';
                }
                field("Employee Transfer Nos."; Rec."Employee Transfer Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Transfer Nos. field.';
                }
                field("Leave Planner Nos."; Rec."Leave Planner Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Planner Nos. field.';
                }
                field("Proffessional Bodies Nos."; Rec."Proffessional Bodies Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proffessional Bodies Nos. field.';
                }
                field("Traning Needs Nos."; Rec."Traning Needs Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Traning Needs Nos. field.';
                }
                field("Employee Promotion No."; Rec."Employee Promotion No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Promotion No. field.';
                }
                field("Medical Claims Nos"; Rec."Medical Claims Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Medical Claims Nos field.';
                }
                field("Induction Nos"; Rec."Induction Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Induction Nos field.';
                }
                field("Exit Questionnaire Nos."; Rec."Exit Questionnaire Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exit Questionnaire Nos. field.';
                }
                field("Separation Nos."; Rec."Separation Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Separation Nos. field.';
                }
                field("Overtime Req Nos."; Rec."Overtime Req Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overtime Requisition Nos. field.';
                }
                field("Acceleration Nos."; Rec."Acceleration Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Acceleration Nos. field.';
                }
                field("Payroll Change Nos."; Rec."Payroll Change Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Change Nos. field.';
                }
                field("Promotion Nos."; Rec."Promotion Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Promotion Nos. field.';
                }
                field("Transfer Nos"; Rec."Transfer Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfer Nos field.';
                }
                field("EducaQual Setup"; "EducaQual Setup")
                {
                    ApplicationArea = all;
                    Caption = 'Education Qualification';
                    ToolTip = 'Specifies the valuie for Setting the educations Qualification setup';
                }
                field("Staff Emp Changes"; "Staff Emp Changes")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the number series for staff  Emp changes';
                }
                field("Deployed Nos"; "Deployed Nos")
                {
                    ApplicationArea = all;
                }
                field("PNP Nos"; "PNP Nos")
                {
                    ApplicationArea = all;
                }
                field("Contract Emp NOs"; "Contract Emp NOs")
                {
                    ApplicationArea = all;
                }
                field("Intern Nos"; "Intern Nos")
                {
                    ApplicationArea = all;
                }
                field("Casual NOs"; "Casual NOs")
                {
                    ApplicationArea = all;
                }
                field("Probation Nos"; "Probation Nos")
                {
                    ApplicationArea = all;
                }

            }
            group(Appraisal)
            {
                Caption = 'Appraisal';
                field("Appraisal Posting Period[FROM]"; Rec."Appraisal Posting Period[FROM]")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Posting Period[FROM] field.';
                }
                field("Appraisal Posting Period[TO]"; Rec."Appraisal Posting Period[TO]")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Posting Period[TO] field.';
                }
                field("Max Appraisal Rating"; Rec."Max Appraisal Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Appraisal Rating field.';
                }
                field("Appraisal Method"; Rec."Appraisal Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Method field.';
                }
                field("Appraisal Template"; Rec."Appraisal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Template field.';
                }
                field("Appraisal Batch"; Rec."Appraisal Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Batch field.';
                }
                field("Training Needs Nos."; Rec."Training Needs Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Needs Nos. field.';
                }
                field("Target Setting Month"; Rec."Target Setting Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Setting Month field.';
                }
                field("Appraisal Interval"; Rec."Appraisal Interval")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Interval field.';
                }
            }
            group(Finance)
            {
                field("Transfer Allowance"; "Transfer Allowance")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the transfer allowance code';
                }
                field("Promotion Allowance"; "Promotion Allowance")
                {

                    ApplicationArea = all;
                    ToolTip = 'Specifies the promotion allowance';
                }
                field("Hardship Allowance"; "Hardship Allowance")
                {
                    ApplicationArea = all;
                }
                field("VAT %"; "VAT %")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the VAT percentage';
                }
            }
        }
    }

    actions { }

    trigger OnOpenPage()
    begin

        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
