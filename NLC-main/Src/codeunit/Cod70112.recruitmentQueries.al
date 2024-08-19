codeunit 70112 recruitmentQueries
{
    trigger OnRun()
    begin

    end;

    var
        //recruitmentRequisitionHeader: Record "Recruitment Requisition Header";
        tbl_dynasoftPortalUser: Record "Dynasoft Portal User";

        tbl_counties: Record "HR Lookup Values";
        tbl_applicant: Record Applicant;
        tbl_jobRequirements: Record "Recruitment Req Requirement";

        tbl_HRQualification: Record Qualification;
        tbl_countries: Record "Country/Region";
        //tbl_counties: Record County;
        tbl_ethnicity: Record "HR Lookup Values";
        tbl_postCodes: Record "Post Code";
        tbl_specializationAreas: Record "Domain Area";
        tbl_jobQualication: Record "Job Applicants Qualification";
        tbl_qualification: Record "HR Job Qualifications";
        tbl_referees: Record "Employee_Applicant Referees";
        tbl_jobResponsibility: Record "Recruitment Req Responsibility";
        tbl_requirementCheckList: Record "Requirements Checklist";
        tbl_workConditions: Record "Recruitment Req Work Condition";
        tbl_jobApplications: Record "Job Applications";

    //tbl_profile:Record "Applicant Profile";

    // procedure fnGetAdvertisedVacancies() data: Text
    // var
    //     HRemployeeRequistion: Record "HR Employee Requisitions";
    //     Datum: JsonObject;
    //     DataA: JsonArray;
    //     ResponseObject: JsonObject;
    //     Response: Text;
    // begin
    //     HRemployeeRequistion.Reset();
    //     HRemployeeRequistion.SetRange(Status, HRemployeeRequistion.Status::Approved);
    //     HRemployeeRequistion.SetRange(Advertised, true);
    //     HRemployeeRequistion.SetRange(Closed, false);
    //     if HRemployeeRequistion.FindSet() then
    //         repeat
    //             Datum.Add('Job_Id', HRemployeeRequistion."Job ID");
    //             Datum.Add('Requisition_no', HRemployeeRequistion."Requisition No.");
    //             Datum.Add('Requisition Date', Format(HRemployeeRequistion."Requisition Date"));
    //             Datum.Add('Job_Grade', HRemployeeRequistion."Job Grade");
    //             Datum.Add('Job_Title', HRemployeeRequistion."Job Description");
    //             Datum.Add('Date_Approved', Format(HRemployeeRequistion."Date Approved"));
    //             Datum.Add('Job_Supervisor', Format(HRemployeeRequistion."Job Supervisor/Manager"));
    //             Datum.Add('Closing_Date', Format(HRemployeeRequistion."Closing Date"));
    //             Datum.Add('Required_Positions', Format(HRemployeeRequistion."Required Positions"));
    //             Datum.Add('Responsibility_Center', HRemployeeRequistion."Responsibility Center");
    //             Datum.Add('Status', HRemployeeRequistion.Status);
    //             Datum.Add('Type_of_Contract', Format(HRemployeeRequistion."Type of Contract Required"));
    //             Datum.Add('Directorate', HRemployeeRequistion."Global Dimension 2 Code");
    //             Datum.Add('Reason_For_Request', HRemployeeRequistion."Reason For Request");
    //             Datum.Add('Advertised', HRemployeeRequistion.Advertised);
    //             DataA.Add(Datum);
    //             Datum.ReadFrom('{}');
    //         //data += HRemployeeRequistion."Vacancy Announcement ID" + '*' + recruitmentRequisitionHeader."Vacancy No" + '*' + Format(recruitmentRequisitionHeader."Vacancy Status") + '*' + Format(recruitmentRequisitionHeader."Approval Status") + '*' + Format(recruitmentRequisitionHeader."Duty Station ID") + '*' + Format(HRemployeeRequistion."Hierarchically Reports To") + '*' + Format(HRemployeeRequistion."Target Candidate Source") + '*' + Format(HRemployeeRequistion."Estimate Annual Salary") + '*' + Format(HRemployeeRequistion."No of Openings") + '*' + Format(HRemployeeRequistion."Target Candidate Source") + '*' + Format(HRemployeeRequistion."Position ID") + '*' + Format(HRemployeeRequistion.Directorate) + '*' + Format(HRemployeeRequistion.Department) + '*' + Format(HRemployeeRequistion."Default Terms of Service Code") + '*' + Format(HRemployeeRequistion."Seniority Level") + '*' + Format(HRemployeeRequistion."Application Procedure 1") + '*' + Format(HRemployeeRequistion."Application Procedure 2") + '*' + Format(HRemployeeRequistion."Application Procedure 3") + '::::';
    //         until HRemployeeRequistion.Next = 0;
    //     // ResponseObject.Add('status', 'SUCCESS');
    //     // ResponseObject.Add('description', 'Request is successful');
    //     ResponseObject.Add('data', DataA);
    //     AddDateTimeToResponse(ResponseObject);
    //     ResponseObject.WriteTo(Response);
    //     exit(Response);
    // end;

    procedure fnGetAdvertisedVacancies() data: Text
    var
        HRemployeeRequistion: Record "HR Employee Requisitions";
    begin
        HRemployeeRequistion.Reset();
        HRemployeeRequistion.SetRange(Status, HRemployeeRequistion.Status::Approved);
        HRemployeeRequistion.SetRange(Advertised, true);
        HRemployeeRequistion.SetRange(Closed, false);
        if HRemployeeRequistion.FindSet then begin
            repeat
                data += HRemployeeRequistion."Job ID" + '*' + HRemployeeRequistion."Requisition No." + '*' + Format(HRemployeeRequistion."Requisition Date") + '*' + HRemployeeRequistion."Job Grade" + '*' + HRemployeeRequistion."Job Description" + '*' + Format(HRemployeeRequistion."Date Approved") + '*' + Format(HRemployeeRequistion."Closing Date") + '*' + Format(HRemployeeRequistion."Vacant Positions") + '*' + HRemployeeRequistion."Requisition No." + '*' + Format(HRemployeeRequistion.status) + '*' + Format(HRemployeeRequistion.status) + '*' + Format(HRemployeeRequistion."Responsibility Center") + '::::';
            until HRemployeeRequistion.Next = 0;
        end;
        exit(data);
    end;

    local procedure AddDateTimeToResponse(var ResponseObject: JsonObject)
    var
        GlobalFunctions: Codeunit "Global Functions";
    begin
        ResponseObject.Add('date_time', GlobalFunctions.FormatISODateTime(CurrentDateTime));
    end;

    procedure fnGetPortalUser(email: Text; password: Text) data: Text
    begin
        tbl_applicant.Reset();
        tbl_dynasoftPortalUser.Reset();
        tbl_applicant.SetRange("E-Mail", email);
        tbl_dynasoftPortalUser.SetRange("Authentication Email", email);
        tbl_dynasoftPortalUser.SetRange("Password Value", password);
        tbl_dynasoftPortalUser.SetRange("Record Type", tbl_dynasoftPortalUser."Record Type"::"Job Applicant");
        if tbl_dynasoftPortalUser.FindSet(true) and tbl_applicant.FindSet(true) then begin
            data := 'success*' + tbl_applicant."Full Names" + '*' + tbl_applicant."Mobile Phone No." + '*' + Format(tbl_applicant."Profile Completed") + '*' + tbl_dynasoftPortalUser."Authentication Email" + '*' + tbl_dynasoftPortalUser."Record ID" + '*' + Format(tbl_applicant."Passport No.") + '*' + tbl_applicant."First Name" + '*' + tbl_applicant."Middle Name" + '*' + tbl_applicant."Last Name" + '*' + Format(tbl_dynasoftPortalUser.State) + '*' + Format(tbl_dynasoftPortalUser."Change Password") + '::::';
            exit(data);
        end else begin
            data := 'danger* Sorry, You have entered the wrong password or email. Kindly try again'
        end;

    end;

    procedure fnGetJobVacancyRequirements(var AppliNU: Code[30]) data: Text
    var
        JobReq: record "HR Job Requirements";
    begin
        JobReq.Reset();
        //JobReq.SetRange("Applicant No", AppliNU);
        JobReq.SetRange("Document Type", JobReq."Document Type"::"Job Vacancy");
        if JobReq.FindSet(true) then begin
            repeat
                data += Format(JobReq."Document Type") + '*' + Format(JobReq."Job ID") + '*' + Format(JobReq."Qualification Type") + '*' + Format(JobReq."Qualification Code") + '*' + JobReq."Qualification Description" + '::::';
            until JobReq.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetJobVacancyAcademicRequirements() data: Text
    begin
        tbl_jobRequirements.Reset();
        tbl_jobRequirements.SetRange("Document Type", tbl_jobRequirements."Document Type"::"Job Vacancy");
        tbl_jobRequirements.SetRange(tbl_jobRequirements."Qualification Category", tbl_jobRequirements."Qualification Category"::Academic);
        if tbl_jobRequirements.FindSet(true) then begin
            repeat
                data += Format(tbl_jobRequirements."Document Type") + '*' + Format(tbl_jobRequirements."Document No.") + '*' + Format(tbl_jobRequirements."Requirement Type") + '*' + Format(tbl_jobRequirements."Qualification Category") + '*' + tbl_jobRequirements.Description + '::::';
            until tbl_jobRequirements.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetHRQualifications() data: Text
    begin
        tbl_HRQualification.Reset();
        tbl_HRQualification.SetRange(tbl_HRQualification."Qualification Category", tbl_HRQualification."Qualification Category"::Professional);
        if tbl_HRQualification.FindSet(true) then begin
            repeat
                data += Format(tbl_HRQualification.Code) + '*' + Format(tbl_HRQualification.Description) + '::::';
            until tbl_HRQualification.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetJobVacancyProfessionalRequirements() data: Text
    begin
        tbl_jobRequirements.Reset();
        tbl_jobRequirements.SetRange("Document Type", tbl_jobRequirements."Document Type"::"Job Vacancy");
        tbl_jobRequirements.SetRange(tbl_jobRequirements."Qualification Category", tbl_jobRequirements."Qualification Category"::Professional);
        if tbl_jobRequirements.FindSet(true) then begin
            repeat
                data += Format(tbl_jobRequirements."Document Type") + '*' + Format(tbl_jobRequirements."Document No.") + '*' + Format(tbl_jobRequirements."Requirement Type") + '*' + Format(tbl_jobRequirements."Qualification Category") + '*' + tbl_jobRequirements.Description + '::::';
            until tbl_jobRequirements.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetJobVacancyCoreCompetenciesRequirements() data: Text
    begin
        tbl_jobRequirements.Reset();
        tbl_jobRequirements.SetRange("Document Type", tbl_jobRequirements."Document Type"::"Job Vacancy");
        tbl_jobRequirements.SetRange(tbl_jobRequirements."Qualification Category", tbl_jobRequirements."Qualification Category"::"Skills & Competencies");
        if tbl_jobRequirements.FindSet(true) then begin
            repeat
                data += Format(tbl_jobRequirements."Document Type") + '*' + Format(tbl_jobRequirements."Document No.") + '*' + Format(tbl_jobRequirements."Requirement Type") + '*' + Format(tbl_jobRequirements."Qualification Category") + '*' + tbl_jobRequirements.Description + '::::';
            until tbl_jobRequirements.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetJobVacancyEthicsRequirements() data: Text
    begin
        tbl_jobRequirements.Reset();
        tbl_jobRequirements.SetRange("Document Type", tbl_jobRequirements."Document Type"::"Job Vacancy");
        tbl_jobRequirements.SetRange(tbl_jobRequirements."Qualification Category", tbl_jobRequirements."Qualification Category"::"Ethics & Integrity");
        if tbl_jobRequirements.FindSet(true) then begin
            repeat
                data += Format(tbl_jobRequirements."Document Type") + '*' + Format(tbl_jobRequirements."Document No.") + '*' + Format(tbl_jobRequirements."Requirement Type") + '*' + Format(tbl_jobRequirements."Qualification Category") + '*' + tbl_jobRequirements.Description + '::::';
            until tbl_jobRequirements.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetCountries() data: Text
    begin
        tbl_countries.Reset();
        repeat
            data += tbl_countries.Code + '*' + tbl_countries.Name + '::::';
        until tbl_countries.Next = 0;
        exit(data);
    end;

    procedure fnGetSpecializationAreas() data: Text
    var
        tbl_specializationAreas: Record Qualification;
    // TableRelation = "HR Lookup Values".Code where(Type = filter("Qualification Type"));
    //         Caption = 'Qualification Type';
    begin
        tbl_specializationAreas.Reset();
        repeat
            data += tbl_specializationAreas.Code + '*' + tbl_specializationAreas.Description + '::::';
        until tbl_specializationAreas.Next = 0;
        exit(data);
    end;

    procedure fnGetPostCodes() data: Text
    begin
        tbl_postCodes.Reset();
        repeat
            data += tbl_postCodes.code + '*' + tbl_postCodes.City + '::::';
        until tbl_postCodes.Next = 0;
        exit(data);
    end;

    procedure fnGetCounties() data: Text
    begin
        tbl_counties.Reset();
        tbl_counties.SetRange(tbl_counties.type, tbl_counties.type::County);
        repeat
            data += tbl_counties.code + '*' + tbl_counties.Description + '::::';
        until tbl_counties.Next = 0;
        exit(data);
    end;

    procedure fnGetEthnicity() data: Text
    begin
        tbl_ethnicity.Reset();
        tbl_ethnicity.SetRange(tbl_ethnicity.type, tbl_ethnicity.type::Tribe);
        repeat
            data += tbl_ethnicity.Code + '*' + tbl_ethnicity.Description + '::::';
        until tbl_ethnicity.Next = 0;
        exit(data);
    end;

    procedure fnGetJobApplicantsQualification(applicantNumber: Code[20]) data: Text
    begin
        tbl_jobQualication.Reset();
        tbl_jobQualication.SetRange("Candidate No.", applicantNumber);
        if tbl_jobQualication.FindSet(true) then begin
            repeat
                data += tbl_jobQualication."Candidate No." + '*' + Format(tbl_jobQualication."Qualification Category") + '*' + tbl_jobQualication."Institution/Company" + '*' + tbl_jobQualication.Country + '*' + tbl_jobQualication."Specialized Domain Area" + '*' + Format(tbl_jobQualication."Attained Score") + '*' + Format(tbl_jobQualication."Graduation Year") + '*' + Format(tbl_jobQualication."From Date") + '*' + Format(tbl_jobQualication."To Date") + '*' + Format(tbl_jobQualication."Line No.") + '*' + tbl_jobQualication."Job Description/Designation" + '*' + Format(tbl_jobQualication."Terms of Service") + '*' + Format(tbl_jobQualication."Experience Years") + '*' + Format(tbl_jobQualication."Duties and Resposibilities") + '*' + Format(tbl_jobQualication."Membership Registration No") + '*' + Format(tbl_jobQualication."Membership Type") + '*' + Format(tbl_jobQualication."Member Renewal Date") + '*' + Format(tbl_jobQualication."Licensing Number") + '*' + Format(tbl_jobQualication."Licensing Renewal Date") + '*' + Format(tbl_jobQualication."Education Level") + '*' + Format(tbl_jobQualication."Proffessional Qualifications") + '*' + tbl_jobQualication."Qualification Code" + '*' + Format(tbl_jobQualication."Employment Type") + '::::';
            until tbl_jobQualication.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetQualifications() data: Text
    var
        HrVlookups: Record "HR Lookup Values";
    begin
        HrVlookups.Reset();
        HrVlookups.SetRange(Type, HrVlookups.Type::"Qualification Type");
        repeat
            data += HrVlookups.Code + '*' + HrVlookups.Description + '*' + Format(HrVlookups.Level) + '::::';
        until HrVlookups.Next = 0;
        exit(data);
    end;

    procedure fnGetApplicantProfile(ApplicantNumber: Code[20]) data: Text
    begin
        tbl_applicant.Reset();
        tbl_applicant.SetRange("Candidate No.", ApplicantNumber);
        if tbl_applicant.FindSet(true) then begin
            repeat
                data += Format(tbl_applicant.Tittles) + '*' + Format(tbl_applicant.Disabled) + '*' + Format(tbl_applicant.City) + '*' + Format(tbl_applicant.Gender) + '*' + Format(tbl_applicant."E-Mail") + '*' + Format(tbl_applicant."First Name") + '*' + Format(tbl_applicant."County of Birth") + '*' + Format(tbl_applicant."Disability Description") + '*' + Format(tbl_applicant."Middle Name") + '*' + Format(tbl_applicant."Last Name") + '*' + Format(tbl_applicant."ID Number") + '*' + Format(tbl_applicant."Passport No.") + '*' + Format(tbl_applicant.Nationality) + '*' + Format(tbl_applicant.Religion) + '*' + Format(tbl_applicant."Post Code") + '*' + Format(tbl_applicant."Ethnic Group") + '*' + Format(tbl_applicant."Mobile Phone No.") + '*' + Format(tbl_applicant."Marital Status") + '*' + Format(tbl_applicant.Address) + '*' + Format(tbl_applicant."Disability Certificate No") + '*' + tbl_applicant."KRA Pin" + '*' + Format(tbl_applicant."Birth Date") + '*' + Format(tbl_applicant."NSSF No") + '*' + Format(tbl_applicant."NHIF No") + '*' + Format(tbl_applicant."Full Names") + '*' + Format(tbl_applicant."Specialization Area") + '*' + Format(tbl_applicant."Skills & Competences") + '*' + Format(tbl_applicant."Highest Academic Qualification") + '*' + Format(tbl_applicant."Management Experience (Years)") + '*' + Format(tbl_applicant."Work Experience (Years)") + '*' + Format(tbl_applicant."County of Residence") + '::::';
            until tbl_applicant.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetApplicantReferees(applicantNumber: Code[20]) data: Text
    begin
        tbl_referees.Reset();
        tbl_referees.SetRange("No.", applicantNumber);
        if tbl_referees.FindSet(true) then begin
            repeat
                data += Format(tbl_referees."Line No.") + '*' + Format(tbl_referees."Rererence Type") + '*' + Format(tbl_referees.Name) + '*' + Format(tbl_referees."Designation/Title") + '*' + Format(tbl_referees.Institution) + '*' + Format(tbl_referees."E-Mail") + '*' + Format(tbl_referees."Phone No.") + '*' + Format(tbl_referees.Relationship) + '*' + Format(tbl_referees."Country/Region Code") + '*' + Format(tbl_referees."Years Known") + '::::';
            until tbl_referees.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetJobResponsibility(var RequestNo: Code[30]) data: Text
    var
        HrRespo: Record "HR Job Responsiblities";
    begin
        HrRespo.Reset();
        HrRespo.SetRange("Request No", RequestNo);
        HrRespo.SetRange(HrRespo."Document Type", HrRespo."Document Type"::"Job Vacancy");
        if HrRespo.FindSet(true) then begin
            repeat
                data += Format(HrRespo."Request No") + '*' + Format(HrRespo."Document Type") + '*' + Format(HrRespo.Remarks) + '::::';
            until HrRespo.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetRequirementCheckList() data: Text
    begin
        tbl_requirementCheckList.Reset();
        repeat
            data += tbl_requirementCheckList."Vacancy No." + '*' + Format(tbl_requirementCheckList."Qualification Category") + '*' + Format(tbl_requirementCheckList.Description) + '*' + Format(tbl_requirementCheckList."Requirement Type") + '*' + Format(tbl_requirementCheckList."Rating Type") + '::::';
        until tbl_requirementCheckList.Next = 0;
        exit(data);
    end;

    procedure fnGetWorkConditions() data: Text
    begin
        tbl_workConditions.Reset();
        tbl_workConditions.SetRange("Document Type", tbl_workConditions."Document Type"::"Job Vacancy");
        if tbl_workConditions.FindSet(true) then begin
            repeat
                data += Format(tbl_workConditions."Document No") + '*' + Format(tbl_workConditions."Document Type") + '*' + Format(tbl_workConditions."Working Condition Category") + '*' + tbl_workConditions.Description + '::::';
            until tbl_workConditions.Next = 0;
        end;

    end;

    procedure fnGetMyJobApplications(applicantNumber: Code[30]) data: Text
    begin
        tbl_jobApplications.Reset();
        tbl_jobApplications.SetRange("Candidate No.", applicantNumber);
        if tbl_jobApplications.FindSet(true) then begin
            repeat
                data += format(tbl_jobApplications."Application No.") + '*' + Format(tbl_jobApplications."Application Status") + '*' + Format(tbl_jobApplications."Vacancy Id") + '*' + Format(tbl_jobApplications."Professional Summary") + '*' + Format(tbl_jobApplications."Job Title/Designation") + '::::';
            until tbl_jobApplications.Next = 0;
        end;
        exit(data);
    end;


}