#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 70000 "HR Applicant CV CAK"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Applicant CV CAK.rdlc';
    ApplicationArea = All;
    Caption = 'HR Applicant CV CAK';
    dataset
    {
        dataitem("HR Job Applications"; "HR Job Applications")
        {
            RequestFilterFields = "Job Application No.", "ID Number";
            column(ReportForNavId_1; 1) { }
            column(CountyOfBirth_HRJobApplications; "HR Job Applications"."County Of Birth") { }
            column(Citizenship_HRJobApplications; "HR Job Applications".Citizenship) { }
            column(DateApplied_HRJobApplications; "HR Job Applications"."Date Applied") { }
            column(Gender_HRJobApplications; "HR Job Applications".Gender) { }
            column(MaritalStatus_HRJobApplications; "HR Job Applications"."Marital Status") { }
            column(IDNumber_HRJobApplications; "HR Job Applications"."ID Number") { }
            column(FirstName_HRJobApplications; "HR Job Applications"."First Name") { }
            column(MiddleName_HRJobApplications; "HR Job Applications"."Middle Name") { }
            column(LastName_HRJobApplications; "HR Job Applications"."Last Name") { }
            column(CountyOfResidence_HRJobApplications; "HR Job Applications"."County Of Residence") { }
            column(CellPhoneNumber_HRJobApplications; "HR Job Applications"."Cell Phone Number") { }
            column(JobAppliedforDescription_HRJobApplications; "HR Job Applications"."Job Applied for Description") { }
            column(CountryCode_HRJobApplications; "HR Job Applications"."Country Code") { }
            column(FirstLanguageRWS_HRJobApplications; "HR Job Applications"."First Language (R/W/S)") { }
            column(EMail_HRJobApplications; "HR Job Applications"."E-Mail") { }
            column(FirstLanguageRead_HRJobApplications; "HR Job Applications"."First Language Read") { }
            column(FirstLanguageWrite_HRJobApplications; "HR Job Applications"."First Language Write") { }
            column(FirstLanguageSpeak_HRJobApplications; "HR Job Applications"."First Language Speak") { }
            column(AdditionalLanguage_HRJobApplications; "HR Job Applications"."Additional Language") { }
            column(SecondLanguageRead_HRJobApplications; "HR Job Applications"."Second Language Read") { }
            column(CitizenshipDetails_HRJobApplications; "HR Job Applications"."Citizenship Details") { }
            column(SecondLanguageWrite_HRJobApplications; "HR Job Applications"."Second Language Write") { }
            column(Region_HRJobApplications; "HR Job Applications".Region) { }
            column(SecondLanguageSpeak_HRJobApplications; "HR Job Applications"."Second Language Speak") { }
            column(SecondLanguageRWS_HRJobApplications; "HR Job Applications"."Second Language (R/W/S)") { }
            column(PhysicallyChallengedDescript_HRJobApplications; "HR Job Applications"."Physically Challenged Descript") { }
            column(AdditionalRead_HRJobApplications; "HR Job Applications"."Additional Read") { }
            column(AdditionalWrite_HRJobApplications; "HR Job Applications"."Additional Write") { }
            column(AdditionalSpeak_HRJobApplications; "HR Job Applications"."Additional Speak") { }
            column(AlternativeContacts_HRJobApplications; "HR Job Applications"."Alternative Contacts") { }
            column(DateOfBirth_HRJobApplications; "HR Job Applications"."Date Of Birth") { }
            column(ResidentialAddress_HRJobApplications; "HR Job Applications"."Residential Address") { }
            column(PostalAddress_HRJobApplications; "HR Job Applications"."Postal Address") { }
            column(PhysicallyChallenged_HRJobApplications; "HR Job Applications"."Physically Challenged?") { }
            column(RelativeWhoWork_HRJobApplications; "HR Job Applications"."Relative Who Work?") { }
            column(RelativeRelation_HRJobApplications; "HR Job Applications"."Relative Relation") { }
            column(CompInfoName; CompInfo.Name) { }
            column(CompInfoAddress; CompInfo.Address) { }
            column(CompInfoAddress2; CompInfo."Address 2") { }
            column(CompInfoPostCode; CompInfo."Post Code") { }
            column(CompInfoPicture; CompInfo.Picture) { }
            dataitem("NAV Applicant Relevant Docs1"; "NAV Applicant Relevant Docs1")
            {
                DataItemLink = "Job Application No" = field("Job Application No.");
                DataItemTableView = sorting("Job Application No", "Applicant No") order(ascending);
                column(ReportForNavId_81; 81) { }
                column(HelbCertificate_NAVApplicantRelevantDocs1; "NAV Applicant Relevant Docs1"."Helb Certificate") { }
                column(GoodConductCertificate_NAVApplicantRelevantDocs1; "NAV Applicant Relevant Docs1"."Good Conduct Certificate") { }
                column(CRBCertificate_NAVApplicantRelevantDocs1; "NAV Applicant Relevant Docs1"."CRB Certificate") { }
                column(EACCCertificate_NAVApplicantRelevantDocs1; "NAV Applicant Relevant Docs1"."EACC Certificate") { }
                column(KRAPinCertificate_NAVApplicantRelevantDocs1; "NAV Applicant Relevant Docs1"."KRA Pin Certificate") { }
                column(Tempbool; Tempbool) { }

                trigger OnAfterGetRecord()
                begin
                    Tempbool := false;
                    if ("NAV Applicant Relevant Docs1"."Helb Certificate") or not ("NAV Applicant Relevant Docs1"."Helb Certificate") then
                        Tempbool := true;
                end;
            }
            dataitem("HR Applicant Qualifications"; "HR Applicant Qualifications")
            {
                DataItemLink = "Application No" = field("Job Application No.");
                DataItemTableView = sorting("Application No", "Qualification Type", "Qualification Code", "Employee No.");
                column(ReportForNavId_34; 34) { }
                column(QualificationDescription_HRApplicantQualifications; "HR Applicant Qualifications"."Qualification Description") { }
                column(QualificationType_HRApplicantQualifications; "HR Applicant Qualifications"."Qualification Type") { }
                column(QualificationGrade_HRApplicantQualifications; "HR Applicant Qualifications"."Qualification Grade") { }
                column(RenewalDate_HRApplicantQualifications; "HR Applicant Qualifications".RenewalDate) { }
                column(Description_HRApplicantQualifications; "HR Applicant Qualifications".Description) { }
                column(QualificationTypeDescription_HRApplicantQualifications; "HR Applicant Qualifications"."Qualification Type Description") { }
                column(InstitutionCompany_HRApplicantQualifications; "HR Applicant Qualifications"."Institution/Company") { }
                column(FromDate_HRApplicantQualifications; "HR Applicant Qualifications"."Start Date") { }
                column(BriefDescriptionOfTheGroup_HRApplicantQualifications; "HR Applicant Qualifications"."Brief Description Of The Group") { }
                column(Category_HRApplicantQualifications; "HR Applicant Qualifications".Category) { }
                column(ToDate_HRApplicantQualifications; "HR Applicant Qualifications"."End Date") { }
                column(ExperienceType; ExperienceType) { }

                trigger OnAfterGetRecord()
                begin
                    ExperienceType := '';

                    HRLookupVal.Reset();
                    HRLookupVal.SetRange(HRLookupVal.Code, "HR Applicant Qualifications"."Qualification Type");
                    if HRLookupVal.Find('-') then
                        ExperienceType := HRLookupVal.Description;
                end;
            }
            dataitem("HR Appl Employment History"; "HR Appl Employment History")
            {
                DataItemLink = JobID = field("Job Application No.");
                DataItemTableView = sorting(JobID, Department, "Description of Duties", "Previous Employer Contacts", "Name of Previous Employer");
                column(ReportForNavId_41; 41) { }
                column(NameofPreviousEmployer_HRApplEmploymentHistory; "HR Appl Employment History"."Name of Previous Employer") { }
                column(Department_HRApplEmploymentHistory; "HR Appl Employment History".Department) { }
                column(DateLeft_HRApplEmploymentHistory; "HR Appl Employment History".DateLeft) { }
                column(DateEmployed_HRApplEmploymentHistory; "HR Appl Employment History"."Date Employed / Left") { }
                column(StaffNumber_HRApplEmploymentHistory; "HR Appl Employment History".StaffNumber) { }
                column(PhoneNo_HRApplEmploymentHistory; "HR Appl Employment History".DateLeft) { }
                column(DescriptionofDuties_HRApplEmploymentHistory; "HR Appl Employment History"."Description of Duties") { }
                column(PositionType_HRApplEmploymentHistory; "HR Appl Employment History"."Position Type") { }
                column(Position_HRApplEmploymentHistory; "HR Appl Employment History".Position) { }
            }
            dataitem("HR Applicant Referees"; "HR Applicant Referees")
            {
                DataItemLink = "Job Application No" = field("Job Application No.");
                DataItemTableView = sorting("Job Application No", Names);
                column(ReportForNavId_50; 50) { }
                column(Names_HRApplicantReferees; "HR Applicant Referees".Names) { }
                column(Address_HRApplicantReferees; "HR Applicant Referees".Address) { }
                column(EMail_HRApplicantReferees; "HR Applicant Referees"."E-Mail") { }
                column(TelephoneNo_HRApplicantReferees; "HR Applicant Referees"."Telephone No") { }
                column(Designation_HRApplicantReferees; "HR Applicant Referees".Designation) { }
                column(Institution_HRApplicantReferees; "HR Applicant Referees".Institution) { }
            }
            dataitem("HR Current Employment"; "HR Current Employment")
            {
                DataItemLink = JobID = field("Job Application No.");
                DataItemTableView = sorting(JobID) order(ascending);
                column(ReportForNavId_57; 57) { }
                column(CurrentEmployer_HRCurrentEmployment; "HR Current Employment"."Current Employer") { }
                column(Department_HRCurrentEmployment; "HR Current Employment".Department) { }
                column(PositionHeld_HRCurrentEmployment; "HR Current Employment"."Position Held") { }
                column(AdditionalBenefits_HRCurrentEmployment; "HR Current Employment"."Additional Benefits") { }
                column(AcceptableSalary_HRCurrentEmployment; "HR Current Employment"."Acceptable Salary") { }
                column(TypeOfPosition_HRCurrentEmployment; "HR Current Employment"."Type Of Position") { }
                column(Salary_HRCurrentEmployment; "HR Current Employment".Salary) { }
                column(ReasonForLeaving_HRCurrentEmployment; "HR Current Employment"."Reason For Leaving") { }
                column(Contacts_HRCurrentEmployment; "HR Current Employment".Contacts) { }
                column(DateEmployed_HRCurrentEmployment; "HR Current Employment"."Date Employed") { }
            }
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
    end;

    var
        CompInfo: Record "Company Information";
        HELB: Boolean;
        GoodConduct: Boolean;
        CRB: Boolean;
        EACC: Boolean;
        KRA: Boolean;
        NAVApplicantDocs: Record "NAV Applicant Relevant Docs";
        Tempbool: Boolean;
        HRLookupVal: Record "HR Lookup Values";
        ExperienceType: Text;
}
