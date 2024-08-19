#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193429 "HR Job Applications"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Job Applications.rdlc';
    ApplicationArea = All;
    Caption = 'HR Job Applications';
    dataset
    {
        dataitem("HR Job Applications"; "HR Job Applications")
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "Job Application No.";
            column(ReportForNavId_1102755000; 1102755000) { }
            column(CI_Name; CI.Name)
            {
                IncludeCaption = true;
            }
            column(CI_Address; CI.Address)
            {
                IncludeCaption = true;
            }
            column(CI_Address2; CI."Address 2")
            {
                IncludeCaption = true;
            }
            column(CI_City; CI.City)
            {
                IncludeCaption = true;
            }
            column(CI_EMail; CI."E-Mail")
            {
                IncludeCaption = true;
            }
            column(CI_HomePage; CI."Home Page")
            {
                IncludeCaption = true;
            }
            column(CI_PhoneNo; CI."Phone No.")
            {
                IncludeCaption = true;
            }
            column(CI_Picture; CI.Picture)
            {
                IncludeCaption = true;
            }
            column(JobApplicationNo_HRJobApplications; "HR Job Applications"."Job Application No.") { }
            column(FirstName_HRJobApplications; "HR Job Applications"."First Name") { }
            column(MiddleName_HRJobApplications; "HR Job Applications"."Middle Name") { }
            column(LastName_HRJobApplications; "HR Job Applications"."Last Name") { }
            column(Initials_HRJobApplications; "HR Job Applications".Initials) { }
            column(SearchName_HRJobApplications; "HR Job Applications"."Search Name") { }
            column(PostalAddress_HRJobApplications; "HR Job Applications"."Postal Address") { }
            column(ResidentialAddress_HRJobApplications; "HR Job Applications"."Residential Address") { }
            column(City_HRJobApplications; "HR Job Applications".City) { }
            column(PostCode_HRJobApplications; "HR Job Applications"."Post Code") { }
            column(County_HRJobApplications; "HR Job Applications".County) { }
            column(HomePhoneNumber_HRJobApplications; "HR Job Applications"."Home Phone Number") { }
            column(CellPhoneNumber_HRJobApplications; "HR Job Applications"."Cell Phone Number") { }
            column(WorkPhoneNumber_HRJobApplications; "HR Job Applications"."Work Phone Number") { }
            column(Ext_HRJobApplications; "HR Job Applications"."Ext.") { }
            column(EMail_HRJobApplications; "HR Job Applications"."E-Mail") { }
            column(Picture_HRJobApplications; "HR Job Applications".Picture) { }
            column(IDNumber_HRJobApplications; "HR Job Applications"."ID Number") { }
            column(Gender_HRJobApplications; "HR Job Applications".Gender) { }
            column(CountryCode_HRJobApplications; "HR Job Applications"."Country Code") { }
            column(Status_HRJobApplications; "HR Job Applications".Status) { }
            column(Comment_HRJobApplications; "HR Job Applications".Comment) { }
            column(FaxNumber_HRJobApplications; "HR Job Applications"."Fax Number") { }
            column(MaritalStatus_HRJobApplications; "HR Job Applications"."Marital Status") { }
            column(EthnicOrigin_HRJobApplications; "HR Job Applications"."Ethnic Origin") { }
            column(FirstLanguageRWS_HRJobApplications; "HR Job Applications"."First Language (R/W/S)") { }
            column(DrivingLicence_HRJobApplications; "HR Job Applications"."Driving Licence") { }
            column(Disabled_HRJobApplications; "HR Job Applications".Disabled) { }
            column(HealthAssesment_HRJobApplications; "HR Job Applications"."Health Assesment?") { }
            column(HealthAssesmentDate_HRJobApplications; "HR Job Applications"."Health Assesment Date") { }
            column(DateOfBirth_HRJobApplications; "HR Job Applications"."Date Of Birth") { }
            column(Age_HRJobApplications; "HR Job Applications".Age) { }
            column(SecondLanguageRWS_HRJobApplications; "HR Job Applications"."Second Language (R/W/S)") { }
            column(AdditionalLanguage_HRJobApplications; "HR Job Applications"."Additional Language") { }
            column(PrimarySkillsCategory_HRJobApplications; "HR Job Applications"."Primary Skills Category") { }
            column(Level_HRJobApplications; "HR Job Applications".Level) { }
            column(TerminationCategory_HRJobApplications; "HR Job Applications"."Termination Category") { }
            column(PostalAddress2_HRJobApplications; "HR Job Applications"."Postal Address2") { }
            column(PostalAddress3_HRJobApplications; "HR Job Applications"."Postal Address3") { }
            column(ResidentialAddress2_HRJobApplications; "HR Job Applications"."Residential Address2") { }
            column(ResidentialAddress3_HRJobApplications; "HR Job Applications"."Residential Address3") { }
            column(PostCode2_HRJobApplications; "HR Job Applications"."Post Code2") { }
            column(Citizenship_HRJobApplications; "HR Job Applications".Citizenship) { }
            column(DisablingDetails_HRJobApplications; "HR Job Applications"."Disabling Details") { }
            column(DisabilityGrade_HRJobApplications; "HR Job Applications"."Disability Grade") { }
            column(PassportNumber_HRJobApplications; "HR Job Applications"."Passport Number") { }
            column(V2ndSkillsCategory_HRJobApplications; "HR Job Applications"."2nd Skills Category") { }
            column(V3rdSkillsCategory_HRJobApplications; "HR Job Applications"."3rd Skills Category") { }
            column(Region_HRJobApplications; "HR Job Applications".Region) { }
            column(FirstLanguageRead_HRJobApplications; "HR Job Applications"."First Language Read") { }
            column(FirstLanguageWrite_HRJobApplications; "HR Job Applications"."First Language Write") { }
            column(FirstLanguageSpeak_HRJobApplications; "HR Job Applications"."First Language Speak") { }
            column(SecondLanguageRead_HRJobApplications; "HR Job Applications"."Second Language Read") { }
            column(SecondLanguageWrite_HRJobApplications; "HR Job Applications"."Second Language Write") { }
            column(SecondLanguageSpeak_HRJobApplications; "HR Job Applications"."Second Language Speak") { }
            column(PINNumber_HRJobApplications; "HR Job Applications"."PIN Number") { }
            column(JobAppliedFor_HRJobApplications; "HR Job Applications"."Job Applied For") { }
            column(EmployeeRequisitionNo_HRJobApplications; "HR Job Applications"."Employee Requisition No") { }
            column(TotalScore_HRJobApplications; "HR Job Applications"."Total Score") { }
            column(Shortlist_HRJobApplications; "HR Job Applications".Shortlist) { }
            column(Qualified_HRJobApplications; "HR Job Applications".Qualified) { }
            column(Stage_HRJobApplications; "HR Job Applications".Stage) { }
            column(NoSeries_HRJobApplications; "HR Job Applications"."No. Series") { }
            column(EmployeeNo_HRJobApplications; "HR Job Applications"."Employee No") { }
            column(ApplicantType_HRJobApplications; "HR Job Applications"."Applicant Type") { }
            column(InterviewInvitationSent_HRJobApplications; "HR Job Applications"."Interview Invitation Sent") { }
            column(DateApplied_HRJobApplications; "HR Job Applications"."Date Applied") { }
            column(CitizenshipDetails_HRJobApplications; "HR Job Applications"."Citizenship Details") { }
            column(Expatriate_HRJobApplications; "HR Job Applications".Expatriate) { }
            column(TotalScoreAfterInterview_HRJobApplications; "HR Job Applications"."Total Score After Interview") { }
            column(TotalScoreAfterShortlisting_HRJobApplications; "HR Job Applications"."Total Score After Shortlisting") { }
            column(DateofInterview_HRJobApplications; "HR Job Applications"."Date of Interview") { }
            column(FromTime_HRJobApplications; "HR Job Applications"."From Time") { }
            column(ToTime_HRJobApplications; "HR Job Applications"."To Time") { }
            column(Venue_HRJobApplications; "HR Job Applications".Venue) { }
            column(JobAppliedforDescription_HRJobApplications; "HR Job Applications"."Job Applied for Description") { }
            column(RegretNoticeSent_HRJobApplications; "HR Job Applications"."Regret Notice Sent") { }
            column(InterviewType_HRJobApplications; "HR Job Applications"."Interview Type") { }
            column(Uploaded_HRJobApplications; "HR Job Applications".Uploaded) { }
            column(FullName_HRJobApplications; "HR Job Applications"."Full Name") { }
            column(ResponsibilityCenter_HRJobApplications; "HR Job Applications"."Responsibility Center") { }
            column(ApprovalStatus_HRJobApplications; "HR Job Applications"."Approval Status") { }
            column(CountyOfBirth_HRJobApplications; "HR Job Applications"."County Of Birth") { }
            column(CountyOfResidence_HRJobApplications; "HR Job Applications"."County Of Residence") { }
            column(Tribe_HRJobApplications; "HR Job Applications".Tribe) { }
            column(PhysicallyChallenged_HRJobApplications; "HR Job Applications"."Physically Challenged?") { }
            column(PhysicallyChallengedDescript_HRJobApplications; "HR Job Applications"."Physically Challenged Descript") { }
            dataitem("HR Applicant Qualifications"; "HR Applicant Qualifications")
            {
                DataItemLink = "Application No" = field("Job Application No.");
                PrintOnlyIfDetail = true;
                column(ReportForNavId_88; 88) { }
                column(QualificationGrade_HRApplicantQualifications; "HR Applicant Qualifications"."Qualification Grade") { }
                column(ApplicationNo_HRApplicantQualifications; "HR Applicant Qualifications"."Application No") { }
                column(EmployeeNo_HRApplicantQualifications; "HR Applicant Qualifications"."Employee No.") { }
                column(QualificationDescription_HRApplicantQualifications; "HR Applicant Qualifications"."Qualification Description") { }
                column(FromDate_HRApplicantQualifications; "HR Applicant Qualifications"."Start Date") { }
                column(ToDate_HRApplicantQualifications; "HR Applicant Qualifications"."End Date") { }
                column(Description_HRApplicantQualifications; "HR Applicant Qualifications".Description) { }
                column(InstitutionCompany_HRApplicantQualifications; "HR Applicant Qualifications"."Institution/Company") { }
                column(CourseGrade_HRApplicantQualifications; "HR Applicant Qualifications"."Course Grade") { }
                column(EmployeeStatus_HRApplicantQualifications; "HR Applicant Qualifications"."Employee Status") { }
                column(ExpirationDate_HRApplicantQualifications; "HR Applicant Qualifications"."Expiration Date") { }
                column(QualificationType_HRApplicantQualifications; "HR Applicant Qualifications"."Qualification Type") { }
                column(QualificationCode_HRApplicantQualifications; "HR Applicant Qualifications"."Qualification Code") { }
                column(ScoreID_HRApplicantQualifications; "HR Applicant Qualifications"."Score ID") { }
            }
            dataitem("HR Applicant Referees"; "HR Applicant Referees")
            {
                DataItemLink = "Job Application No" = field("Job Application No.");
                column(ReportForNavId_104; 104) { }
                column(Names_HRApplicantReferees; "HR Applicant Referees".Names) { }
                column(Designation_HRApplicantReferees; "HR Applicant Referees".Designation) { }
                column(Institution_HRApplicantReferees; "HR Applicant Referees".Institution) { }
                column(Address_HRApplicantReferees; "HR Applicant Referees".Address) { }
                column(TelephoneNo_HRApplicantReferees; "HR Applicant Referees"."Telephone No") { }
                column(EMail_HRApplicantReferees; "HR Applicant Referees"."E-Mail") { }
                column(EmployeeNo_HRApplicantReferees; "HR Applicant Referees"."Employee No") { }
                dataitem("HR Employment History"; "HR Employment History")
                {
                    column(ReportForNavId_113; 113) { }
                    column(EmployeeNo_HREmploymentHistory; "HR Employment History".JobID) { }
                    column(From_HREmploymentHistory; "HR Employment History"."Name of Previous Employer") { }
                    column(CompanyName_HREmploymentHistory; "HR Employment History".Department) { }
                    column(PostalAddress_HREmploymentHistory; "HR Employment History".Position) { }
                    column(Address2_HREmploymentHistory; "HR Employment History"."Position Type") { }
                    column(JobTitle_HREmploymentHistory; "HR Employment History".StaffNumber) { }
                    column(KeyExperience_HREmploymentHistory; "HR Employment History"."Date Employed") { }
                    column(SalaryOnLeaving_HREmploymentHistory; "HR Employment History".DateLeft) { }
                    column(ReasonForLeaving_HREmploymentHistory; "HR Employment History"."Applicant No") { }
                    column(Comment_HREmploymentHistory; "HR Employment History".Title) { }
                }
                dataitem("Applicant Documents"; "Applicant Documents")
                {
                    DataItemLink = ApplicantNo = field("Job Application No");
                    column(ReportForNavId_125; 125) { }
                    column(DocNo_ApplicantDocuments; "Applicant Documents"."Doc No") { }
                    column(Id_ApplicantDocuments; "Applicant Documents".Id) { }
                    column(ApplicantNo_ApplicantDocuments; "Applicant Documents".ApplicantNo) { }
                    column(DocType_ApplicantDocuments; "Applicant Documents".DocType) { }
                    column(FileName_ApplicantDocuments; "Applicant Documents".FileName) { }
                    column(DocumentNo_ApplicantDocuments; "Applicant Documents"."Document No") { }
                    column(DocumentURL_ApplicantDocuments; "Applicant Documents".DocumentURL) { }
                    column(Posted_ApplicantDocuments; "Applicant Documents".Posted) { }
                    column(Company_ApplicantDocuments; "Applicant Documents".Company) { }
                    column(Section_ApplicantDocuments; "Applicant Documents".Section) { }
                    column(DocumentNotes_ApplicantDocuments; "Applicant Documents"."Document Notes") { }
                    column(RandomMapperEduBackGr_ApplicantDocuments; "Applicant Documents".RandomMapperEduBackGr) { }
                    column(NoSeries_ApplicantDocuments; "Applicant Documents"."No. Series") { }
                }
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
        CI.Get();
        CI.CalcFields(CI.Picture);

        //GET FILTER
        JobApplicationNo := "HR Job Applications".GetFilter("HR Job Applications"."Job Application No.");
        if JobApplicationNo = '' then begin
            Message('Please select a Job Application Number before printing a report');
            CurrReport.Quit();
        end;
    end;

    var
        CI: Record "Company Information";
        SectionA: Label 'Section A :: Personal Details';
        SectionB: Label 'Section B :: Contact Details';
        SectionC: Label 'Section C :: Academic and Qualification Information';
        SectionD: Label 'Section D :: Applicant''s Refferees';
        JobApplicationNo: Text;
}
