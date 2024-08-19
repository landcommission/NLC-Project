#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193598 "HR Recruitment - Long List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Recruitment - Long List.rdlc';
    ApplicationArea = All;
    Caption = 'HR Recruitment - Long List';
    dataset
    {
        dataitem("HR Job Applications"; "HR Job Applications")
        {
            RequestFilterFields = "Job Application No.", "Employee Requisition No", Qualified, Gender, County;
            column(ReportForNavId_1; 1) { }
            column(JobApplicationNo_HRJobApplications; "HR Job Applications"."Job Application No.") { }
            column(FirstName_HRJobApplications; "HR Job Applications"."First Name") { }
            column(MiddleName_HRJobApplications; "HR Job Applications"."Middle Name") { }
            column(LastName_HRJobApplications; "HR Job Applications"."Last Name") { }
            column(Gender_HRJobApplications; "HR Job Applications".Gender) { }
            column(IDNumber_HRJobApplications; "HR Job Applications"."ID Number") { }
            column(CellPhoneNumber_HRJobApplications; "HR Job Applications"."Cell Phone Number") { }
            column(AppliedFilters; AppliedFilters) { }
            column(JobDesc; JobDesc) { }
            column(CompInfoPicture; CompInfo.Picture) { }
            column(CounterVar; CounterVar) { }

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
