#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193690 "Sample Format Long List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Sample Format Long List.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Sample Format Long List';
    dataset
    {
        dataitem("HR Job Applications"; "HR Job Applications")
        {
            column(ReportForNavId_1; 1) { }
            column(JobApplicationNo_HRJobApplications; "HR Job Applications"."Job Application No.") { }
            column(FirstName_HRJobApplications; "HR Job Applications"."First Name") { }
            column(MiddleName_HRJobApplications; "HR Job Applications"."Middle Name") { }
            column(LastName_HRJobApplications; "HR Job Applications"."Last Name") { }
            column(HomePhoneNumber_HRJobApplications; "HR Job Applications"."Home Phone Number") { }
            column(CellPhoneNumber_HRJobApplications; "HR Job Applications"."Cell Phone Number") { }
            column(WorkPhoneNumber_HRJobApplications; "HR Job Applications"."Work Phone Number") { }
            column(EMail_HRJobApplications; "HR Job Applications"."E-Mail") { }
            column(IDNumber_HRJobApplications; "HR Job Applications"."ID Number") { }
            column(Gender_HRJobApplications; "HR Job Applications".Gender) { }
            column(DateOfBirth_HRJobApplications; "HR Job Applications"."Date Of Birth") { }
            column(Age_HRJobApplications; "HR Job Applications".Age) { }
            column(DateApplied_HRJobApplications; "HR Job Applications"."Date Applied") { }
            column(County_HRJobApplications; "HR Job Applications".County) { }
            column(Num; Num) { }
            column(Name; Name) { }
            dataitem("HR Applicant Qualifications"; "HR Applicant Qualifications")
            {
                DataItemLink = "Application No" = field("Job Application No.");
                column(ReportForNavId_15; 15) { }
                column(ApplicationNo_HRApplicantQualifications; "HR Applicant Qualifications"."Application No") { }
                column(EmployeeNo_HRApplicantQualifications; "HR Applicant Qualifications"."Employee No.") { }
                column(QualificationDescription_HRApplicantQualifications; "HR Applicant Qualifications"."Qualification Description") { }
                column(InstitutionCompany_HRApplicantQualifications; "HR Applicant Qualifications"."Institution/Company") { }
                column(QualificationType_HRApplicantQualifications; "HR Applicant Qualifications"."Qualification Type") { }
                column(QualificationCode_HRApplicantQualifications; "HR Applicant Qualifications"."Qualification Code") { }
            }

            trigger OnAfterGetRecord()
            begin
                Num := Num + 1;
                JobApp.Reset();
                JobApp.SetRange(JobApp."Job Application No.", "HR Job Applications"."Job Application No.");
                if JobApp.Find('-') then
                    Name := JobApp."First Name" + ' ' + JobApp."Middle Name" + ' ' + JobApp."Last Name";
            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        Num: Integer;
        Name: Text;
        JobApp: Record "HR Job Applications";
        ApplQual: Record "HR Applicant Qualifications";
}
