#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193595 "HR Job Applicantions - Long Li"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Job Applicantions - Long Li.rdlc';
    ApplicationArea = All;
    Caption = 'HR Job Applicantions - Long Li';
    dataset
    {
        dataitem("HR Job Applications"; "HR Job Applications")
        {
            RequestFilterFields = "Employee Requisition No", "Job Applied For", Qualified, Gender, "County Of Birth", "County Of Residence", Region;
            column(ReportForNavId_1; 1) { }
            column(JobApplicationNo_HRJobApplications; "HR Job Applications"."Job Application No.") { }
            column(FirstName_HRJobApplications; "HR Job Applications"."First Name") { }
            column(MiddleName_HRJobApplications; "HR Job Applications"."Middle Name") { }
            column(LastName_HRJobApplications; "HR Job Applications"."Last Name") { }
            column(CellPhoneNumber_HRJobApplications; "HR Job Applications"."Cell Phone Number") { }
            column(EMail_HRJobApplications; "HR Job Applications"."E-Mail") { }
            column(IDNumber_HRJobApplications; "HR Job Applications"."ID Number") { }
            column(Gender_HRJobApplications; "HR Job Applications".Gender) { }
            column(JobAppliedFor_HRJobApplications; "HR Job Applications"."Job Applied For") { }
            column(EmployeeRequisitionNo_HRJobApplications; "HR Job Applications"."Employee Requisition No") { }
            column(ReApplied_HRJobApplications; "HR Job Applications".ReApplied) { }
            column(JobAppliedforDescription_HRJobApplications; "HR Job Applications"."Job Applied for Description") { }
            column(Picture; CompInfo.Picture) { }
            column(Int; Int) { }
            column(AppliedFilters; AppliedFilters) { }
            column(JobDesc; JobDesc) { }

            trigger OnAfterGetRecord()
            begin
                // Int:=Int+1;
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
        CompInfo.CalcFields(CompInfo.Picture);
        Int := 0;

        AppliedFilters := "HR Job Applications".GetFilters;

        JobDesc := '';

        if "HR Job Applications".GetFilter("HR Job Applications"."Employee Requisition No") = '' then
            Error('Please select Employee Requisition No. for respective Job ID')
    end;

    var
        CompInfo: Record "Company Information";
        Int: Integer;
        AppliedFilters: Text;
        HRJobs: Record "HR Jobs";
        JobDesc: Text;
}
