#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193444 "HR Employment History"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Employment History.rdlc';
    ApplicationArea = All;
    Caption = 'HR Employment History';
    dataset
    {
        dataitem("HR Employment History"; "HR Employment History")
        {
            column(ReportForNavId_1; 1) { }
            column(JobID_HREmploymentHistory; "HR Employment History".JobID) { }
            column(NameofPreviousEmployer_HREmploymentHistory; "HR Employment History"."Name of Previous Employer") { }
            column(Department_HREmploymentHistory; "HR Employment History".Department) { }
            column(Position_HREmploymentHistory; "HR Employment History".Position) { }
            column(PositionType_HREmploymentHistory; "HR Employment History"."Position Type") { }
            column(StaffNumber_HREmploymentHistory; "HR Employment History".StaffNumber) { }
            column(DateEmployed_HREmploymentHistory; "HR Employment History"."Date Employed") { }
            column(DateLeft_HREmploymentHistory; "HR Employment History".DateLeft) { }
            column(ApplicantNo_HREmploymentHistory; "HR Employment History"."Applicant No") { }
            column(TypeofBusiness_HREmploymentHistory; "HR Employment History"."Type of Business") { }
            column(PreviousEmployerContacts_HREmploymentHistory; "HR Employment History"."Previous Employer Contacts") { }
            column(BenefitsOtherAllowances_HREmploymentHistory; "HR Employment History"."Benefits/Other Allowances") { }
            column(EmployeeNo_HREmploymentHistory; "HR Employment History"."Employee No.") { }
            column(Salary_HREmploymentHistory; "HR Employment History".Salary) { }
            column(Title_HREmploymentHistory; "HR Employment History".Title) { }
            column(NumberofEmployeesSupervised_HREmploymentHistory; "HR Employment History"."Number of Employees Supervised") { }
            column(ReasonforLeaving_HREmploymentHistory; "HR Employment History"."Reason for Leaving") { }
            column(TermsofService_HREmploymentHistory; "HR Employment History"."Terms of Service") { }
            column(DescriptionofDuties_HREmploymentHistory; "HR Employment History"."Description of Duties") { }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }
}
