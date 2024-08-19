#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 50038 "test recruitment12cak"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/test recruitment12cak.rdlc';
    ApplicationArea = All;
    Caption = 'test recruitment12cak';
    dataset
    {
        dataitem("HR Job Applications"; "HR Job Applications")
        {
            RequestFilterFields = "Employee Requisition No";
            column(ReportForNavId_1; 1) { }
            column(Phone; CompanyInformation."Phone No.") { }
            column(Picture; CompanyInformation.Picture) { }
            column(Address; CompanyInformation."Address 2") { }
            column(Address2; CompanyInformation.Address) { }
            column(Name; CompanyInformation.Name) { }
            column(HomePage; CompanyInformation."Home Page") { }
            column(EmailS; CompanyInformation."E-Mail") { }
            column(FirstName_HRJobApplications; "HR Job Applications"."First Name") { }
            column(MiddleName_HRJobApplications; "HR Job Applications"."Middle Name") { }
            column(LastName_HRJobApplications; "HR Job Applications"."Last Name") { }
            column(EmployeeRequisitionNo_HRJobApplications; "HR Job Applications"."Employee Requisition No") { }
            column(JobAppliedforDescription_HRJobApplications; "HR Job Applications"."Job Applied for Description") { }
            column(JobApplicationNo_HRJobApplications; "HR Job Applications"."Job Application No.") { }
            column(CellPhoneNumber_HRJobApplications; "HR Job Applications"."Cell Phone Number") { }
            column(EMail_HRJobApplications; "HR Job Applications"."E-Mail") { }
            column(IDNumber_HRJobApplications; "HR Job Applications"."ID Number") { }
            column(DateOfBirth_HRJobApplications; "HR Job Applications"."Date Of Birth") { }
            column(County_HRJobApplications; "HR Job Applications"."County Of Birth") { }
            column(PostalAddress_HRJobApplications; "HR Job Applications"."Postal Address") { }
            dataitem("HR Applicant Qualifications"; "HR Applicant Qualifications")
            {
                DataItemLink = "Application No" = field("Job Application No.");
                column(ReportForNavId_5; 5) { }
                column(QualificationDescription_HRApplicantQualifications; "HR Applicant Qualifications"."Qualification Description") { }
                column(no; no) { }
            }

        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    trigger OnInitReport()
    begin
        CompanyInformation.Get();
        CompanyInformation.CalcFields(Picture);
        //no:=no+1;
    end;

    var
        HRApplicantQualifications: Record "HR Applicant Qualifications";
        CompanyInformation: Record "Company Information";
        HRApplEmploymentHistory: Record "HR Appl Employment History";
        HRAppEmploymentDetails: Record "HR Individual Objectives1";
        FullName: Text;
        no: Integer;
}
