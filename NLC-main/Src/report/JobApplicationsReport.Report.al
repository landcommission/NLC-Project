#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50036 "Job Applications Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Job Applications Report.rdlc';
    ApplicationArea = All;
    Caption = 'Job Applications Report';
    dataset
    {
        dataitem("HR Job Applications"; "HR Job Applications")
        {
            column(ReportForNavId_1; 1) { }
            column(JobApplicationNo_HRJobApplications; "HR Job Applications"."Job Application No.") { }
            column(IDNumber_HRJobApplications; "HR Job Applications"."ID Number") { }
            column(Gender_HRJobApplications; "HR Job Applications".Gender) { }
            column(EMail_HRJobApplications; "HR Job Applications"."E-Mail") { }
            column(Disabled_HRJobApplications; "HR Job Applications".Disabled) { }
            column(DateOfBirth_HRJobApplications; "HR Job Applications"."Date Of Birth") { }
            column(Region_HRJobApplications; "HR Job Applications".Region) { }
            column(JobAppliedFor_HRJobApplications; "HR Job Applications"."Job Applied For") { }
            column(EmployeeRequisitionNo_HRJobApplications; "HR Job Applications"."Employee Requisition No") { }
            column(FullName_HRJobApplications; "HR Job Applications"."Full Name") { }
            column(CountyOfBirth_HRJobApplications; "HR Job Applications"."County Of Birth") { }
            column(Tribe_HRJobApplications; "HR Job Applications".Tribe) { }
            dataitem("HR Applicant Qualifications"; "HR Applicant Qualifications")
            {
                DataItemLink = "Application No" = field("Job Application No.");
                column(ReportForNavId_14; 14) { }
                column(EmployeeNo_HRApplicantQualifications; "HR Applicant Qualifications"."Employee No.") { }
                column(ApplicationNo_HRApplicantQualifications; "HR Applicant Qualifications"."Application No") { }
                column(QualificationDescription_HRApplicantQualifications; "HR Applicant Qualifications"."Qualification Description") { }
                column(QualificationCode_HRApplicantQualifications; "HR Applicant Qualifications"."Qualification Code") { }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }
}
