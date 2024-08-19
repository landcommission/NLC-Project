#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193600 "HR Job Applications -NShortlis"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Job Applications -NShortlis.rdlc';
    Caption = 'HR Job Applications -Not Shortlisted';
    ApplicationArea = All;

    dataset
    {
        dataitem("HR Job Applications"; "HR Job Applications")
        {
            DataItemTableView = where(Qualified = const(false));
            RequestFilterFields = "Job Application No.", "Employee Requisition No", Qualified, Gender, County;
            column(ReportForNavId_1; 1) { }
            column(JobApplicationNo_HRJobApplications; "HR Job Applications"."Job Application No.") { }
            column(FirstName_HRJobApplications; "HR Job Applications"."First Name") { }
            column(MiddleName_HRJobApplications; "HR Job Applications"."Middle Name") { }
            column(Gender_HRJobApplications; "HR Job Applications".Gender) { }
            column(LastName_HRJobApplications; "HR Job Applications"."Last Name") { }
            column(IDNumber_HRJobApplications; "HR Job Applications"."ID Number") { }
            column(CellPhoneNumber_HRJobApplications; "HR Job Applications"."Cell Phone Number") { }
            column(AppliedFilters; AppliedFilters) { }
            column(JobDesc; JobDesc) { }
            column(CompInfoPicture; CompInfo.Picture) { }
            column(CounterVar; CounterVar) { }
            dataitem("HR Job Requirements"; "HR Job Requirements")
            {
                DataItemLink = "Job ID" = field("Job Applied For");
                column(ReportForNavId_10; 10) { }
                column(JobID_HRJobRequirements; "HR Job Requirements"."Job ID") { }
                column(QualificationType_HRJobRequirements; "HR Job Requirements"."Qualification Type") { }
                column(QualificationCode_HRJobRequirements; "HR Job Requirements"."Qualification Code") { }
                column(QualificationDescription_HRJobRequirements; "HR Job Requirements"."Qualification Description") { }
            }
            dataitem("HR Applicant Qualifications"; "HR Applicant Qualifications")
            {
                DataItemLink = "Application No" = field("Job Application No.");
                column(ReportForNavId_18; 18) { }
                column(ApplicationNo_HRApplicantQualifications; "HR Applicant Qualifications"."Application No") { }
                column(EmployeeNo_HRApplicantQualifications; "HR Applicant Qualifications"."Employee No.") { }
                column(QualificationDescription_HRApplicantQualifications; "HR Applicant Qualifications"."Qualification Description") { }
                column(QualificationType_HRApplicantQualifications; "HR Applicant Qualifications"."Qualification Type") { }
                column(QualificationCode_HRApplicantQualifications; "HR Applicant Qualifications"."Qualification Code") { }
            }

            trigger OnAfterGetRecord()
            begin
                CounterVar += 1;

                HRJobs.Reset();
                if HRJobs.Get("HR Job Applications"."Job Applied For") then
                    JobDesc := UpperCase(HRJobs."Job Description");
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        CompInfo.Reset();
        CompInfo.Get();
        CompInfo.CalcFields(CompInfo.Picture);
        JobDesc := '';

        if "HR Job Applications".GetFilter("HR Job Applications"."Employee Requisition No") = '' then
            Error('Please select Employee Requisition No. for respective Job ID');

        AppliedFilters := "HR Job Applications".GetFilters;

        CounterVar := 0;
    end;

    var
        CompInfo: Record "Company Information";
        AppliedFilters: Text;
        HRJobs: Record "HR Jobs";
        JobDesc: Text;
        CounterVar: Integer;
}
