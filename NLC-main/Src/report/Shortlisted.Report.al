#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193597 Shortlisted
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Shortlisted.rdlc';
    ApplicationArea = All;
    Caption = 'Shortlisted';
    dataset
    {
        dataitem("HR Shortlisted Applicants"; "HR Shortlisted Applicants")
        {
            column(ReportForNavId_1; 1) { }
            column(EmployeeRequisitionNo_HRShortlistedApplicants; "HR Shortlisted Applicants"."Employee Requisition No") { }
            column(JobApplicationNo_HRShortlistedApplicants; "HR Shortlisted Applicants"."Job Application No") { }
            column(StageScore_HRShortlistedApplicants; "HR Shortlisted Applicants"."Stage Score") { }
            column(IDNo_HRShortlistedApplicants; "HR Shortlisted Applicants"."ID No") { }
            column(FullName_HRShortlistedApplicants; "HR Shortlisted Applicants"."Full Name") { }
            column(Picture; CompInfo.Picture) { }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        CompInfo: Record "Company Information";
}
