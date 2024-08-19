#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
codeunit 51008 eRecruitment
{
    Permissions =
        tabledata Applicant = RIM,
        tabledata "Application Declaration" = RI,
        tabledata "Application Qualification" = RIMD,
        tabledata "Application Referees" = RIMD,
        tabledata "Company Information" = R,
        tabledata Contact = RI,
        tabledata "Dynasoft Portal User" = RIM,
        tabledata "Email Account" = R,
        tabledata "Employee_Applicant Referees" = RIMD,
        tabledata "Employment Offer" = RM,
        tabledata "Human Resources Setup" = R,
        tabledata "Job Applicants Qualification" = RIMD,
        tabledata "Job Application Requirements" = RI,
        tabledata "Job Applications" = RIM,
        tabledata "Marketing Setup" = R,
        tabledata "Record Link" = RI,
        tabledata "Recruitment Req Requirement" = R,
        tabledata "Recruitment Requisition Header" = R,
        tabledata "Vacancy Declaration" = R;

    trigger OnRun()
    begin

        Contact_Test.Reset;
        Contact_Test.SetRange("E-Mail", 'shanayaaprilo@gmail.com');
        if Contact_Test.FindFirst() then begin
            FnSendEmaiNotificationOnApplicantRegRequestAcknowledge(Contact_Test);
            FnSendEmaiNotificationOnApplicantAccountActivation(Contact_Test);
        end;

        Message('Email generation complete');
        Message(FnGenerateJobApplicantReport('CAND0011', 'JAPP0024'));
    end;

    var
        DynasoftPortalUser: Record "Dynasoft Portal User";
        ApplicationEntryNumber: Integer;
        ApplicationQualification1: Record "Application Qualification";
        SMTPMailSetup: Record "Email Account";
        Email2: Text;
        Body: Text;
        FileDirectory: Text;
        FileName: Text;
        SMTP: Codeunit Mail;
        SMTPMailSetup2: Record "Email Account";
        SMTPMail: Codeunit "Email Message";
        Smail: Codeunit EMail;
        RecordIDNumber: RecordID;
        Contact_Test: Record Contact;
        FILEPATH3: label 'C:\inetpub\wwwroot\Recruitment140421\Files\';
        FILESPATH4: label 'C:\inetpub\wwwroot\Recruitment140421\Downloads\JobApplicants\';
        FILESPATH2: label '//192.168.1.181\eRecruitent\Downloads\JobApplicants\';
        FILEPATH: Text;
        HRsetup: Record "Human Resources Setup";

    procedure CheckApplicantExists(Email: Text; IDNumber: Text) Exists: Boolean
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
    begin
        Exists := false;
        Contact.Reset;
        Contact.SetRange("E-Mail", Email);
        Contact.SetRange("ID Number", IDNumber);
        if Contact.FindSet then begin
            Exists := true;
        end
    end;


    procedure FnRegistration(idnumber: Text; firstname: Text; lastname: Text; middlename: Text; email: Text[400]; phoneNumber: Text; TypeofApplicant: Option; EmployeeNo: Text) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
    begin
        // Contact.Reset;
        // Contact.SetRange("ID Number", idnumber);

        // if Contact.FindSet then begin
        //     status := 'found*Another Applicant with the same ID number exists!';
        // end;
        Contact.Reset;
        Contact.SetRange("E-Mail", email);
        Contact.SetRange("ID Number", idnumber);
        if Contact.FindSet then begin
            status := 'found*Another Applicant with the same email address exists!';
        end else begin
            MarketingSetup.Get;
            Contact.Init;
            Message('XYZ' + Format(MarketingSetup."Contact Nos."));
            Contact."No." := NoSeriesManagement.GetNextNo(MarketingSetup."Contact Nos.", Today, true);
            Contact.Name := firstname + ' ' + lastname + ' ' + middlename;
            Contact.Type := Contact.Type::Person;
            Contact."Phone No." := phoneNumber;
            Contact."E-Mail" := email;
            Contact."ID Number" := idnumber;
            Contact."First Name" := firstname;
            Contact."Middle Name" := middlename;
            Contact.Surname := lastname;
            Contact."Record Type" := TypeofApplicant;
            Contact."Employee No" := EmployeeNo;

            if Contact.Insert(true) then begin
                FnCreateApplicantAccountRequest(email);
                FnSendEmaiNotificationOnApplicantAccountActivation(Contact);
                status := 'success*Your Aplicant account was successfully created. Please check your email account for further guidelines on account activation.';
            end else begin
                status := 'danger*Your Aplicant account was not created successfully.Kindly Contact System Administrator';
            end;
        end;
        exit(status);
    end;

    procedure FnResetPassword(emailaddress: Text) passChangestatus: Text
    var
        DynasoftPortalUser: Record "Dynasoft Portal User";
        RandomDigit: Text;
        Body: Text;
    begin
        DynasoftPortalUser.Reset;
        DynasoftPortalUser.SetRange("Authentication Email", emailaddress);
        DynasoftPortalUser.SetRange("Record Type", DynasoftPortalUser."Record Type"::"Job Applicant");
        if DynasoftPortalUser.FindSet then begin
            RandomDigit := CreateGuid;
            RandomDigit := DelChr(RandomDigit, '=', '{}-01');
            RandomDigit := CopyStr(RandomDigit, 1, 8);
            DynasoftPortalUser."Password Value" := RandomDigit;
            DynasoftPortalUser."Last Modified Date" := Today;
            DynasoftPortalUser."Change Password" := false;
            DynasoftPortalUser."Record Type" := DynasoftPortalUser."record type"::"Job Applicant";
            if DynasoftPortalUser.Modify(true) then begin
                passChangestatus := 'success*Password Reset Successfully. Kindly check your email';
                ResetSendEmail(emailaddress);
            end else begin
                passChangestatus := 'danger*The Password was Not Modified';
            end;
        end else begin
            passChangestatus := 'emailnotfound*Email Address is Missing';
        end;
    end;

    procedure ResetSendEmail(emailaddress: Text)
    var
        DynasoftPortalUser: Record "Dynasoft Portal User";
        SMTPMailSetup: Record "Email Account";
        SMTPMail: Codeunit "Email Message";
        Smail: Codeunit EMail;
        Body: Text;
        SMTP: Codeunit Mail;
        Receipients: List of [Text];
        Subject: Text[250];
    begin
        DynasoftPortalUser.Reset;
        DynasoftPortalUser.SetRange("Authentication Email", emailaddress);
        if DynasoftPortalUser.FindSet then begin
            Subject := 'Password Reset - Recruitment Portal ';
            Body := 'Dear, your password for the account: ' + ' <strong>' + DynasoftPortalUser."Authentication Email" + '</strong> has been reset successfully. Kindly use the password below to access your account<br> <strong>Password: ' + DynasoftPortalUser."Password Value" + '</strong> <br>';
            Body := Body + ' ' + 'Kind Regards,<br> National Land Commision' + '<br><br>';
            Body := Body + '[This email is automated. Kindly do not reply to it]<br><br>';
            SMTPMail.Create(DynasoftPortalUser."Authentication Email", Subject, Body, true);
            Smail.Send(SMTPMail, Enum::"Email Scenario"::Default);
        end;
    end;

    procedure FnApplicantProfileRegistration(prefix: Option " ",Prof,Doctor,Mr,Mrs,Miss,Ms; applicantNumber: Text; surname: Text; firstname: Text; othernames: Text; gender: Option " ",Male,Female,Other; idnumber: Integer; passportnumber: Text; nationality: Text; religion: Option " ",Christianity,Islam,Hinduism,Buddhism,"Folk Religion",Others; dateofbirth: Date; countyofresidence: Text; countyoforigin: Text; ethnicity: Text; mobilephonenumber: Text; krapin: Text; maritalstatus: Option " ",Single,Married,Divorced,Others,Widowed,Separated; address: Code[50]; disabilitycertificate: Code[50]; disabilitysummary: Text[50]; phonenumber2: Text; isdisable: Boolean; postalcodes: Code[50]; managementYears: Integer; WorkExperience: Integer; HighestAcademicLevel: Code[50]; SkillsandCompetence: Text; specializationArea: Text; minimumAcademicQualification: Code[50]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        Applicant: Record Applicant;
    begin
        // <<< New Changes

        Applicant.Reset;
        Applicant.SetRange("Candidate No.", applicantNumber);
        if Applicant.FindSet then begin
            Applicant.Tittles := prefix;
            Applicant."First Name" := firstname;
            Applicant."Middle Name" := othernames;
            Applicant."Last Name" := surname;
            Applicant."Full Names" := firstname + ' ' + othernames + ' ' + surname;
            Applicant.Gender := gender;
            // Applicant."Passport No." := idnumber;
            //  Applicant."Passport No." := passportnumber;
            Applicant.Nationality := nationality;
            Applicant.Religion := religion;
            Applicant."Birth Date" := dateofbirth;
            Applicant."County of Birth" := countyoforigin;
            Applicant."Ethnic Group" := ethnicity;
            Applicant.Nationality := nationality;
            Applicant."Mobile Phone No." := mobilephonenumber;
            //Applicant."NHIF No" := nhif;
            // Applicant."NSSF No" := nssf;
            Applicant."KRA Pin" := krapin;
            Applicant."Country/Region Code" := nationality;
            Applicant."County of Birth" := countyoforigin;
            Applicant.Address := address;
            Applicant."Phone No." := phonenumber2;
            Applicant."Marital Status" := maritalstatus;
            Applicant."Management Experience (Years)" := managementYears;
            Applicant."Work Experience (Years)" := WorkExperience;
            Applicant."Highest Academic Qualification" := HighestAcademicLevel;
            Applicant."Skills & Competences" := SkillsandCompetence;
            Applicant.Validate("Highest Academic Qualification");
            if (isdisable = true) then begin
                Applicant.Disabled := true;
            end;
            Applicant."Phone No." := phonenumber2;
            Applicant."Post Code" := postalcodes;
            Applicant."Disability Certificate No" := disabilitycertificate;
            Applicant."Disability Description" := disabilitysummary;
            Applicant."Last Date Modified" := Today;
            Applicant."Specialization Area" := specializationArea;
            Applicant."Last Modified Date Time" := CurrentDatetime;
            if Applicant.Modify(true) then begin
                status := 'success*Your Aplicant account was successfully created. Please proceed to complete your profile!';
            end else begin
                status := 'danger*Your Aplicant account was not created successfully.Kindly Contact System Administrator';
            end;
        end else begin
            Applicant.Init;
            Applicant.Tittles := prefix;
            Applicant."First Name" := firstname;
            Applicant."Middle Name" := othernames;
            Applicant."Last Name" := surname;
            Applicant.Gender := gender;
            //Applicant."ID Number" := idnumber;
            //Applicant."Passport No." := idnumber;
            Applicant.Nationality := nationality;
            Applicant.Religion := religion;
            Applicant."Birth Date" := dateofbirth;
            Applicant."County of Birth" := countyoforigin;
            Applicant."Ethnic Group" := ethnicity;
            Applicant.Nationality := nationality;
            Applicant."Mobile Phone No." := mobilephonenumber;
            Applicant."Country/Region Code" := nationality;
            Applicant."County of Birth" := countyoforigin;
            Applicant.Address := address;
            Applicant."Marital Status" := maritalstatus;
            Applicant."KRA Pin" := krapin;
            Applicant."Phone No." := phonenumber2;
            Applicant."Post Code" := postalcodes;
            Applicant."Management Experience (Years)" := managementYears;
            Applicant."Work Experience (Years)" := WorkExperience;
            Applicant."Highest Academic Qualification" := HighestAcademicLevel;
            Applicant."Skills & Competences" := SkillsandCompetence;
            Applicant.Validate("Highest Academic Qualification");
            if (isdisable = true) then begin
                Applicant.Disabled := true;
            end;

            Applicant."Disability Certificate No" := disabilitycertificate;
            Applicant."Disability Description" := disabilitysummary;
            Applicant."Last Date Modified" := Today;
            Applicant."Last Modified Date Time" := CurrentDatetime;
            Applicant."Specialization Area" := specializationArea;

            if Applicant.Insert(true) then begin
                status := 'success*Your Aplicant account was successfully created. Please proceed to complete your profile!';
            end else begin
                status := 'danger*Your Aplicant account was not created successfully.Kindly Contact System Administrator';
            end;
        end;
        exit(status);
    end;

    procedure FnAcademicQualifications(applicantNumber: Text; educationlevel: Integer; institutionname: Text; country: Text; qualificationtitle: Text; specializationarea: Text; attainedscore: Integer; graduationyear: Text; startdate: Date; enddate: Date) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        // JobApplicantsQualification: Record "Job Applicants Qualification";
        JobApplicantsQualification: Record "Application Qualification";
    begin

        //<<< New Changes
        JobApplicantsQualification.Init;
        JobApplicantsQualification."Candidate No." := applicantNumber;
        JobApplicantsQualification."Education Level" := educationlevel;
        JobApplicantsQualification.Country := country;
        JobApplicantsQualification."Qualification Type" := JobApplicantsQualification."Qualification Type";
        JobApplicantsQualification."Qualification Code" := qualificationtitle;
        JobApplicantsQualification."Specialized Domain Area" := specializationarea;
        JobApplicantsQualification."Attained Score" := attainedscore;
        JobApplicantsQualification."Graduation Year" := graduationyear;
        JobApplicantsQualification."Institution/Company" := institutionname;
        JobApplicantsQualification.Type := JobApplicantsQualification.Type::External;
        JobApplicantsQualification."From Date" := startdate;
        JobApplicantsQualification."To Date" := enddate;
        JobApplicantsQualification.Description := qualificationtitle;
        if JobApplicantsQualification.Insert(true) then begin
            status := 'success*Details were successfully submitted';
        end else begin
            status := 'danger*Details Could not be Submitted';
        end;

        exit(status);
    end;

    procedure FnUpdateAcademicQualifications(applicantNumber: Text; EntryNumber: Integer; educationlevel: Integer; institutionname: Text; country: Text; qualificationtitle: Text; specializationarea: Text; attainedscore: Integer; graduationyear: Text; startdate: Date; enddate: Date) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin
        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Line No.", EntryNumber);
        JobApplicantsQualification.SetRange("Candidate No.", applicantNumber);
        if JobApplicantsQualification.FindSet then begin
            JobApplicantsQualification."Candidate No." := applicantNumber;
            JobApplicantsQualification."Education Level" := educationlevel;
            JobApplicantsQualification.Country := country;
            JobApplicantsQualification."Qualification Category" := JobApplicantsQualification."qualification category";
            JobApplicantsQualification."Qualification Code" := qualificationtitle;
            JobApplicantsQualification."Specialized Domain Area" := specializationarea;
            JobApplicantsQualification."Attained Score" := attainedscore;
            JobApplicantsQualification."Graduation Year" := graduationyear;
            JobApplicantsQualification."Institution/Company" := institutionname;
            JobApplicantsQualification.Type := JobApplicantsQualification.Type::External;
            JobApplicantsQualification."From Date" := startdate;
            JobApplicantsQualification."To Date" := enddate;
            JobApplicantsQualification.Description := qualificationtitle;
            if JobApplicantsQualification.Modify(true) then begin
                status := 'success*The Academic Details were successfully Saved';
            end else begin
                status := 'danger*The Academic Details Could not be Saved';
            end;
        end else begin
            status := 'danger*Kindly ensure you select the correct academic qualification to edit.';
        end;
        exit(status);
    end;

    procedure FnApplicationAcademicQualifications(applicantNumber: Text; jobApplicationNo: Text; educationlevel: Integer; institutionname: Text; country: Text; qualificationtitle: Text; specializationarea: Text; attainedscore: Integer; graduationyear: Text; startdate: Date; enddate: Date) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicationQualification: Record "Application Qualification";
    begin

        ApplicationQualification.Init;
        ApplicationQualification."Candidate No." := applicantNumber;
        ApplicationQualification."Application No." := jobApplicationNo;
        ;
        ApplicationQualification."Education Level" := educationlevel;
        ApplicationQualification.Country := country;
        ApplicationQualification."Qualification Type" := 'ACADEMIC';
        ApplicationQualification."Qualification Code" := qualificationtitle;
        ApplicationQualification."Specialized Domain Area" := specializationarea;
        ApplicationQualification."Attained Score" := attainedscore;
        ApplicationQualification."Graduation Year" := graduationyear;
        ApplicationQualification."Institution/Company" := institutionname;
        ApplicationQualification."From Date" := startdate;
        ApplicationQualification."To Date" := enddate;
        ApplicationQualification.Description := qualificationtitle;
        if ApplicationQualification.Insert(true) then begin
            status := 'success*Details were successfully submitted';
        end else begin
            status := 'danger*Details Could not be Submitted';

        end;
        exit(status);
    end;

    procedure FnUpdateApplicationAcademicQualifications(applicantNumber: Text; EntryNumber: Integer; jobApplicationNo: Text; educationlevel: Integer; institutionname: Text; country: Text; qualificationtitle: Text; specializationarea: Text; attainedscore: Integer; graduationyear: Text; startdate: Date; enddate: Date) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicationQualification: Record "Application Qualification";
    begin
        ApplicationQualification.Reset;
        ApplicationQualification.SetRange("Line No.", EntryNumber);
        if ApplicationQualification.FindSet then begin
            ApplicationQualification."Candidate No." := applicantNumber;
            ApplicationQualification."Application No." := jobApplicationNo;
            ;
            ApplicationQualification."Education Level" := educationlevel;
            ApplicationQualification.Country := country;
            ApplicationQualification."Qualification Type" := 'ACADEMIC';
            ApplicationQualification."Qualification Code" := qualificationtitle;
            ApplicationQualification."Specialized Domain Area" := specializationarea;
            ApplicationQualification."Attained Score" := attainedscore;
            ApplicationQualification."Graduation Year" := graduationyear;
            ApplicationQualification."Institution/Company" := institutionname;
            ApplicationQualification."From Date" := startdate;
            ApplicationQualification."To Date" := enddate;
            ApplicationQualification.Description := qualificationtitle;
            if ApplicationQualification.Modify(true) then begin
                status := 'success*The Academic Details were successfully saved';
            end else begin
                status := 'danger*The Academic Details could not be saved';
            end;
        end else begin
            status := 'danger*The Academic Details could not be saved';
        end;
        exit(status);
    end;

    procedure FnProffessionalQualifications(applicantNumber: Text; educationlevel: Text; institutionname: Text; country: Text; qualificationtitle: Text; specializationarea: Text; attainedscore: Integer; graduationyear: Text; startdate: Date; enddate: Date) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin
        JobApplicantsQualification.Init;
        JobApplicantsQualification."Candidate No." := applicantNumber;
        JobApplicantsQualification."Proffessional Qualifications" := educationlevel;
        JobApplicantsQualification.Country := country;
        JobApplicantsQualification."Qualification Category" := JobApplicantsQualification."qualification category";
        JobApplicantsQualification."Qualification Code" := qualificationtitle;
        JobApplicantsQualification."Specialized Domain Area" := specializationarea;
        JobApplicantsQualification."Attained Score" := attainedscore;
        JobApplicantsQualification."Graduation Year" := graduationyear;
        JobApplicantsQualification.Type := JobApplicantsQualification.Type::External;
        JobApplicantsQualification."Institution/Company" := institutionname;
        JobApplicantsQualification."From Date" := startdate;
        JobApplicantsQualification."To Date" := enddate;
        JobApplicantsQualification.Description := qualificationtitle;
        if JobApplicantsQualification.Insert(true) then begin
            status := 'success*Details were successfully submitted';
        end else begin
            status := 'danger*Details Could not be Submitted';

        end;
        exit(status);
    end;

    procedure FnUpdateProffessionalQualifications(EntryNo: Integer; applicantNumber: Text; professionQualification: Text; institutionname: Text; country: Text; qualificationtitle: Text; specializationarea: Text; attainedscore: Integer; graduationyear: Text; startdate: Date; enddate: Date) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin
        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Line No.", EntryNo);
        JobApplicantsQualification.SetRange("Candidate No.", applicantNumber);
        if JobApplicantsQualification.FindSet then begin
            JobApplicantsQualification."Candidate No." := applicantNumber;
            JobApplicantsQualification."Proffessional Qualifications" := professionQualification;
            JobApplicantsQualification.Country := country;
            JobApplicantsQualification."Qualification Category" := JobApplicantsQualification."qualification category";
            ;
            JobApplicantsQualification."Qualification Code" := qualificationtitle;
            JobApplicantsQualification."Specialized Domain Area" := specializationarea;
            JobApplicantsQualification."Attained Score" := attainedscore;
            JobApplicantsQualification."Graduation Year" := graduationyear;
            JobApplicantsQualification.Type := JobApplicantsQualification.Type::External;
            JobApplicantsQualification."Institution/Company" := institutionname;
            JobApplicantsQualification."From Date" := startdate;
            JobApplicantsQualification."To Date" := enddate;
            JobApplicantsQualification.Description := qualificationtitle;
            if JobApplicantsQualification.Modify(true) then begin
                status := 'success*Details were successfully submitted';
            end else begin
                status := 'danger*Details Could not be Submitted';
            end;
        end;
        exit(status);
    end;

    procedure FnApplicationProffessionalQualifications(applicantNumber: Text; JobApplicationNo: Text; proffesionalQualification: Text; institutionname: Text; country: Text; qualificationtitle: Text; specializationarea: Text; attainedscore: Integer; graduationyear: Text; startdate: Date; enddate: Date) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicationQualification: Record "Application Qualification";
    begin

        ApplicationQualification.Init;
        ApplicationQualification."Candidate No." := applicantNumber;
        ApplicationQualification."Application No." := JobApplicationNo;
        ApplicationQualification."Proffessional Qualification" := proffesionalQualification;
        ApplicationQualification.Country := country;
        ApplicationQualification."Qualification Type" := 'ACHIEVEMENTS';
        ApplicationQualification."Qualification Code" := qualificationtitle;
        ApplicationQualification."Specialized Domain Area" := specializationarea;
        ApplicationQualification."Attained Score" := attainedscore;
        ApplicationQualification."Graduation Year" := graduationyear;
        ApplicationQualification."Institution/Company" := institutionname;
        ApplicationQualification."From Date" := startdate;
        ApplicationQualification."To Date" := enddate;
        ApplicationQualification.Description := qualificationtitle;
        if ApplicationQualification.Insert(true) then begin
            status := 'success*Details were successfully submitted';
        end else begin
            status := 'danger*Details Could not be Submitted';
        end;
        exit(status);
    end;

    procedure FnProffessionaBodies(applicantNumber: Text; professionalbody: Text; registrationNumber: Text; MembershipType: Text; RenewalDate: Date; licensingNumber: Text; LicenseRenewalDate: Date) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin
        JobApplicantsQualification.Init;
        JobApplicantsQualification."Candidate No." := applicantNumber;
        JobApplicantsQualification."Institution/Company" := professionalbody;
        JobApplicantsQualification."Qualification Category" := JobApplicantsQualification."qualification category";
        JobApplicantsQualification."Member Renewal Date" := RenewalDate;
        JobApplicantsQualification."Membership Registration No" := registrationNumber;
        JobApplicantsQualification."Membership Type" := MembershipType;
        JobApplicantsQualification."Licensing Number" := licensingNumber;
        JobApplicantsQualification."Licensing Renewal Date" := LicenseRenewalDate;
        if JobApplicantsQualification.Insert(true) then begin
            status := 'success*Details were successfully submitted';
        end else begin
            status := 'danger*Details Could not be Submitted';

        end;
        exit(status);

    end;

    procedure FnUpdateProffessionaBodies(EntryNumber: Integer; applicantNumber: Text; professionalbody: Text; registrationNumber: Text; MembershipType: Text; RenewalDate: Date; licensingNumber: Text; LicenseRenewalDate: Date) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin
        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Line No.", EntryNumber);
        JobApplicantsQualification.SetRange("Candidate No.", applicantNumber);
        if JobApplicantsQualification.FindSet then begin
            JobApplicantsQualification."Candidate No." := applicantNumber;
            JobApplicantsQualification."Institution/Company" := professionalbody;
            JobApplicantsQualification."Qualification Category" := JobApplicantsQualification."qualification category";
            JobApplicantsQualification."Member Renewal Date" := RenewalDate;
            JobApplicantsQualification."Membership Registration No" := registrationNumber;
            JobApplicantsQualification."Membership Type" := MembershipType;
            JobApplicantsQualification."Licensing Number" := licensingNumber;
            JobApplicantsQualification."Licensing Renewal Date" := LicenseRenewalDate;
            if JobApplicantsQualification.Modify(true) then begin
                status := 'success*Details were successfully submitted';
            end else begin
                status := 'danger*Details Could not be Submitted';
            end;
        end;
        exit(status);

    end;

    procedure FnApplicationProffessionaBodies(applicantNumber: Text; JobApplicationNo: Text; professionalbody: Text; registrationNumber: Text; MembershipType: Text; RenewalDate: Date; licensingNumber: Text; LicenseRenewalDate: Date) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicationQualification: Record "Application Qualification";
    begin

        ApplicationQualification.Init;
        ApplicationQualification."Candidate No." := applicantNumber;
        ApplicationQualification."Application No." := JobApplicationNo;
        ApplicationQualification."Institution/Company" := professionalbody;
        ApplicationQualification."Qualification Type" := 'ACHIEVEMENTS';
        ApplicationQualification."Member Renewal Date" := RenewalDate;
        ApplicationQualification."Membership Registration No" := registrationNumber;
        ApplicationQualification."Membership Type" := MembershipType;
        ApplicationQualification."Licensing Number" := licensingNumber;
        ApplicationQualification."Licensing Renewal Date" := LicenseRenewalDate;
        if ApplicationQualification.Insert(true) then begin
            status := 'success*Details were successfully submitted';
        end else begin
            status := 'danger*Details Could not be Submitted';
        end;
        exit(status);

    end;

    procedure FnWorkExperience(applicantNumber: Text; employerName: Text; jobdesignation: Text; employmentstartdate: Date; employmentenddate: Date; termsofservice: Integer; experienceyears: Text; dutiesresponsibilities: Text; specializationArea: Text; employmentType: Integer) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin
        JobApplicantsQualification.Init;
        JobApplicantsQualification."Candidate No." := applicantNumber;
        JobApplicantsQualification."Job Description/Designation" := jobdesignation;
        JobApplicantsQualification."Institution/Company" := employerName;
        JobApplicantsQualification."Qualification Category" := JobApplicantsQualification."qualification category";
        JobApplicantsQualification."From Date" := employmentstartdate;
        JobApplicantsQualification."To Date" := employmentenddate;
        ;
        JobApplicantsQualification."Terms of Service" := termsofservice;
        JobApplicantsQualification."Experience Years" := experienceyears;
        JobApplicantsQualification."Duties and Resposibilities" := dutiesresponsibilities;
        JobApplicantsQualification."Specialized Domain Area" := specializationArea;
        JobApplicantsQualification."Employment Type" := employmentType;
        if JobApplicantsQualification.Insert(true) then begin
            status := 'success*Details were successfully submitted';
        end else begin
            status := 'danger*Details Could not be Submitted';
        end;
        exit(status);

    end;

    procedure FnUpdateWorkExperience(EntryNumber: Integer; applicantNumber: Text; employerName: Text; jobdesignation: Text; employmentstartdate: Date; employmentenddate: Date; termsofservice: Integer; experienceyears: Text; dutiesresponsibilities: Text; employmentType: Integer) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin
        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Line No.", EntryNumber);
        JobApplicantsQualification.SetRange("Candidate No.", applicantNumber);
        if JobApplicantsQualification.FindSet then begin
            JobApplicantsQualification."Candidate No." := applicantNumber;
            JobApplicantsQualification."Job Description/Designation" := jobdesignation;
            JobApplicantsQualification."Institution/Company" := employerName;
            JobApplicantsQualification."Qualification Category" := JobApplicantsQualification."qualification category";
            JobApplicantsQualification."From Date" := employmentstartdate;
            JobApplicantsQualification."To Date" := employmentenddate;
            JobApplicantsQualification."Terms of Service" := termsofservice;
            JobApplicantsQualification."Experience Years" := experienceyears;
            JobApplicantsQualification."Duties and Resposibilities" := dutiesresponsibilities;
            JobApplicantsQualification."Employment Type" := employmentType;
            if JobApplicantsQualification.Modify(true) then begin
                status := 'success*Details were successfully submitted';
            end else begin
                status := 'danger*Details Could not be Submitted';
            end;
        end;
        exit(status);

    end;

    procedure FnApplicationWorkExperience(applicantNumber: Text; JobApplicationNo: Text; employerName: Text; jobdesignation: Text; employmentstartdate: Date; employmentenddate: Date; termsofservice: Integer; experienceyears: Text; dutiesresponsibilities: Text) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicationQualification: Record "Application Qualification";
    begin

        ApplicationQualification.Init;
        ApplicationQualification."Candidate No." := applicantNumber;
        ApplicationQualification."Application No." := JobApplicationNo;
        ApplicationQualification."Job Description/Designation" := jobdesignation;
        ApplicationQualification."Institution/Company" := employerName;
        ApplicationQualification."Qualification Type" := 'WORK EXPERIENCE';
        ApplicationQualification."From Date" := employmentstartdate;
        ApplicationQualification."To Date" := employmentenddate;
        ;
        ApplicationQualification."Terms of Service" := termsofservice;
        ApplicationQualification."Experience Years" := experienceyears;
        ApplicationQualification."Duties and Resposibilities" := dutiesresponsibilities;
        if ApplicationQualification.Insert(true) then begin
            status := 'success*Details were successfully submitted';
        end else begin
            status := 'danger*Details Could not be Submitted';
        end;
        exit(status);

    end;

    procedure FnCandidateReferees(appplicantNumber: Text; refereetype: Integer; title: Text; surname: Text; firtsname: Text; otherNames: Text; contactdesignations: Text; emailaddress: Text; phonenumber: Text; relationship: Text; country: Text; periodknown: Integer; institution: Text) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        Employee_ApplicantReferees: Record "Employee_Applicant Referees";
    begin

        Employee_ApplicantReferees.Init;
        Employee_ApplicantReferees."No." := appplicantNumber;
        Employee_ApplicantReferees."Document Type" := Employee_ApplicantReferees."document type"::"Job Applicant";
        Employee_ApplicantReferees."Rererence Type" := refereetype;
        Employee_ApplicantReferees.Name := surname + ' ' + firtsname + ' ' + otherNames;
        Employee_ApplicantReferees."Designation/Title" := contactdesignations;
        Employee_ApplicantReferees.Institution := institution;
        ;
        Employee_ApplicantReferees."Phone No." := phonenumber;
        Employee_ApplicantReferees."Country/Region Code" := country;
        Employee_ApplicantReferees."E-Mail" := emailaddress;
        Employee_ApplicantReferees.Relationship := relationship;
        Employee_ApplicantReferees."Years Known" := periodknown;
        if Employee_ApplicantReferees.Insert(true) then begin
            status := 'success*Details were successfully submitted';
        end else begin
            status := 'danger*Details Could not be Submitted';
        end;
        exit(status);
    end;

    procedure FnUpdateCandidateReferees(entryNo: Integer; appplicantNumber: Text; refereetype: Integer; title: Text; surname: Text; firtsname: Text; otherNames: Text; contactdesignations: Text; emailaddress: Text; phonenumber: Text; relationship: Text; country: Text; periodknown: Integer; institution: Text) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        Employee_ApplicantReferees: Record "Employee_Applicant Referees";
    begin
        Employee_ApplicantReferees.Reset();
        Employee_ApplicantReferees.SetRange("No.", appplicantNumber);
        Employee_ApplicantReferees.SetRange("Line No.", entryNo);
        if Employee_ApplicantReferees.FindSet(true) then begin
            Employee_ApplicantReferees."No." := appplicantNumber;
            Employee_ApplicantReferees."Document Type" := Employee_ApplicantReferees."document type"::"Job Applicant";
            Employee_ApplicantReferees."Rererence Type" := refereetype;
            Employee_ApplicantReferees.Name := surname + ' ' + firtsname + ' ' + otherNames;
            Employee_ApplicantReferees."Designation/Title" := contactdesignations;
            Employee_ApplicantReferees.Institution := institution;
            Employee_ApplicantReferees."Phone No." := phonenumber;
            Employee_ApplicantReferees."Country/Region Code" := country;
            Employee_ApplicantReferees."E-Mail" := emailaddress;
            Employee_ApplicantReferees.Relationship := relationship;
            Employee_ApplicantReferees."Years Known" := periodknown;
            if Employee_ApplicantReferees.Modify(true) then begin
                status := 'success*Details were successfully updated';
            end else begin
                status := 'danger*Details Could not be Updated';
            end;
        end else begin
            status := 'danger*Kindly ensure you select an existing Referee to edit';
        end;

        exit(status);
    end;


    procedure FnApplicationCandidateReferees(appplicantNumber: Text; JobApplicationNo: Text; refereetype: Integer; title: Text; surname: Text; firtsname: Text; otherNames: Text; contactdesignations: Text; emailaddress: Text; phonenumber: Text; relationship: Text; country: Text; periodknown: Text; institution: Text) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        Employee_ApplicantReferees: Record "Employee_Applicant Referees";
        ApplicationReferees: Record "Application Referees";
    begin
        ApplicationReferees.Init;
        ApplicationReferees."Candidate No." := appplicantNumber;
        ApplicationReferees."Application No." := JobApplicationNo;
        ApplicationReferees."Rererence Type" := refereetype;
        ApplicationReferees."E-Mail" := emailaddress;
        ApplicationReferees.Relationship := relationship;
        ApplicationReferees.Name := surname + ' ' + firtsname + ' ' + otherNames;
        ApplicationReferees."Designation/Title" := contactdesignations;
        ApplicationReferees.Institution := institution;
        ;
        ApplicationReferees."Phone No." := phonenumber;
        ApplicationReferees."Country/Region Code" := country;
        if ApplicationReferees.Insert(true) then begin
            status := 'success*Details were successfully submitted';
        end else begin
            status := 'danger*Details Could not be Submitted';
        end;
        exit(status);
    end;

    procedure FnJobApplication(ApplicantNumber: Text; VacancyId: Text) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        JobApplications: Record "HR Job Applications";
        JobApplicationRequirements: Record "Job Application Requirements";
        Applicant: Record Applicant;
        Jobn: Record "Job Applications";
    begin
        Applicant.Reset;
        Applicant.SetRange("Candidate No.", ApplicantNumber);
        Applicant.SetRange("Profile Completed", true);
        if Applicant.FindFirst() then begin
            JobApplications.Reset;
            JobApplications.SetRange(JobApplications."Employee Requisition No", VacancyId);
            JobApplications.SetRange("Candidate No.", ApplicantNumber);
            if JobApplications.FindFirst() then begin
                JobApplications."Candidate No." := ApplicantNumber;
                JobApplications.Validate("Candidate No.");
                JobApplications."Employee Requisition No" := VacancyId;
                JobApplications.Validate("Employee Requisition No");
                if JobApplications.Modify(true) then begin
                    FnPrepopulateApplicantProfile(ApplicantNumber, JobApplications."Employee Requisition No", VacancyId);
                    status := 'success*Job Application Process was Successfully Submitted*' + JobApplications."Employee Requisition No"
                end else begin
                    status := 'danger*Job Application Process was not successfully';
                end;
            end else begin
                JobApplications.Init;
                JobApplications."Employee Requisition No" := '';
                JobApplications."Candidate No." := ApplicantNumber;
                JobApplications.Validate("Candidate No.");
                JobApplications."Employee Requisition No" := VacancyId;
                JobApplications.Validate("Employee Requisition No");
                if JobApplications.Insert(true) then begin
                    FnPrepopulateApplicantProfile(ApplicantNumber, JobApplications."Employee Requisition No", VacancyId);
                    status := 'success*Job Application Process was Successfully Submitted*' + JobApplications."Employee Requisition No";
                end else begin
                    status := 'danger*Job Application Process was not successfully';
                end;
            end;
        end else begin
            status := 'profileincomplete*Candidate profile was not successfully completed';
        end;
    end;

    procedure FnPrepopulateApplicantProfile(CandindateNo: Code[50]; ApplicationNo: Code[50]; VacancyId: Code[50]) status: Text
    var
        Applicant: Record Applicant;
        JobApplicantsQualification: Record "Job Applicants Qualification";
        Employee_ApplicantReferees: Record "Employee_Applicant Referees";
        Applicant_EmployeeHobby: Record "Applicant_Employee Hobby";
        ApplicationQualification: Record "Application Qualification";
        ApplicationReferees: Record "Application Referees";
        ApplicationReferees1: Record "Application Referees";
        RecruitmentReqRequirement: Record "Recruitment Req Requirement";
        JobApplicationRequirements: Record "Job Application Requirements";
        JobApplicationRequirements1: Record "Job Application Requirements";
        VacancyDeclaration: Record "Vacancy Declaration";
        ApplicationDeclaration: Record "Application Declaration";
        ApplicationDeclaration1: Record "Application Declaration";
    begin
        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Candidate No.", CandindateNo);
        if JobApplicantsQualification.FindSet then begin
            ApplicationQualification1.Reset;
            ApplicationQualification1.SetRange("Application No.", ApplicationNo);
            ApplicationQualification1.SetRange("Candidate No.", CandindateNo);
            if not ApplicationQualification1.FindSet then begin
                repeat
                    ApplicationQualification.Init;
                    ApplicationQualification."Line No." := JobApplicantsQualification."Line No.";
                    ApplicationQualification."Application No." := ApplicationNo;
                    ApplicationQualification."Candidate No." := CandindateNo;
                    ApplicationQualification."Qualification Code" := JobApplicantsQualification."Qualification Code";
                    ApplicationQualification."Qualification Type" := JobApplicantsQualification."Qualification Category";
                    ApplicationQualification."From Date" := JobApplicantsQualification."From Date";
                    ApplicationQualification."To Date" := JobApplicantsQualification."To Date";
                    ApplicationQualification.Type := JobApplicantsQualification.Type;
                    ApplicationQualification."Job Description/Designation" := JobApplicantsQualification."Job Description/Designation";
                    ApplicationQualification.Description := JobApplicantsQualification.Description;
                    ApplicationQualification."Institution/Company" := JobApplicantsQualification."Institution/Company";
                    ApplicationQualification."Course Grade" := JobApplicantsQualification."Course Grade";
                    ApplicationQualification."Applicant Status" := JobApplicantsQualification."Job Applicant Status";
                    ApplicationQualification."Expiration Date" := JobApplicantsQualification."Expiration Date";
                    ApplicationQualification.Specialization := JobApplicantsQualification."Specialized Domain Area";
                    ApplicationQualification."Specialized Domain Area" := JobApplicantsQualification."Specialized Domain Area";
                    ApplicationQualification."Education Level" := JobApplicantsQualification."Education Level";
                    ApplicationQualification.Country := JobApplicantsQualification.Country;
                    ApplicationQualification."Attained Score" := JobApplicantsQualification."Attained Score";
                    ApplicationQualification."Graduation Year" := JobApplicantsQualification."Graduation Year";
                    ApplicationQualification."Membership Registration No" := JobApplicantsQualification."Membership Registration No";
                    ApplicationQualification."Membership Type" := JobApplicantsQualification."Membership Type";
                    ApplicationQualification."Member Renewal Date" := JobApplicantsQualification."Member Renewal Date";
                    ApplicationQualification."Licensing Number" := JobApplicantsQualification."Licensing Number";
                    ApplicationQualification."Licensing Renewal Date" := JobApplicantsQualification."Licensing Renewal Date";
                    ApplicationQualification."Terms of Service" := JobApplicantsQualification."Terms of Service";
                    ApplicationQualification."Experience Years" := JobApplicantsQualification."Experience Years";
                    ApplicationQualification."Duties and Resposibilities" := JobApplicantsQualification."Duties and Resposibilities";
                    if ApplicationQualification.Insert(true) then begin
                        status := 'success*The Applicant Details was succesffully Populated';
                    end else begin
                        status := 'danger*The Applicant Details wcould not be Populated';
                    end;
                until JobApplicantsQualification.Next = 0;
            end else begin
                ApplicationQualification1.Reset;
                ApplicationQualification1.SetRange("Candidate No.", CandindateNo);
                ApplicationQualification1.SetRange("Application No.", ApplicationNo);
                if ApplicationQualification1.FindSet then begin
                    repeat
                        ApplicationQualification."Line No." := JobApplicantsQualification."Line No.";
                        ApplicationQualification."Application No." := ApplicationNo;
                        ApplicationQualification."Candidate No." := CandindateNo;
                        ApplicationQualification."Qualification Code" := JobApplicantsQualification."Qualification Code";
                        ApplicationQualification."Qualification Type" := JobApplicantsQualification."Qualification Category";
                        ApplicationQualification."From Date" := JobApplicantsQualification."From Date";
                        ApplicationQualification."To Date" := JobApplicantsQualification."To Date";
                        ApplicationQualification.Type := JobApplicantsQualification.Type;
                        ApplicationQualification.Description := JobApplicantsQualification.Description;
                        ApplicationQualification."Institution/Company" := JobApplicantsQualification."Institution/Company";
                        ApplicationQualification."Course Grade" := JobApplicantsQualification."Course Grade";
                        ApplicationQualification."Applicant Status" := JobApplicantsQualification."Job Applicant Status";
                        ApplicationQualification."Expiration Date" := JobApplicantsQualification."Expiration Date";
                        ApplicationQualification.Specialization := JobApplicantsQualification."Specialized Domain Area";
                        ApplicationQualification."Specialized Domain Area" := JobApplicantsQualification."Specialized Domain Area";
                        ApplicationQualification."Education Level" := JobApplicantsQualification."Education Level";
                        ApplicationQualification.Country := JobApplicantsQualification.Country;
                        ApplicationQualification."Attained Score" := JobApplicantsQualification."Attained Score";
                        ApplicationQualification."Graduation Year" := JobApplicantsQualification."Graduation Year";
                        ApplicationQualification."Member Renewal Date" := JobApplicantsQualification."Member Renewal Date";
                        ApplicationQualification."Licensing Number" := JobApplicantsQualification."Licensing Number";
                        ApplicationQualification."Licensing Renewal Date" := JobApplicantsQualification."Licensing Renewal Date";
                        ApplicationQualification."Terms of Service" := JobApplicantsQualification."Terms of Service";
                        ApplicationQualification."Experience Years" := JobApplicantsQualification."Experience Years";
                        ApplicationQualification."Duties and Resposibilities" := JobApplicantsQualification."Duties and Resposibilities";
                        if ApplicationQualification.Modify(true) then begin
                            status := 'success*The Applicant Details was succesffully Populated';
                        end else begin
                            status := 'danger*The Applicant Details wcould not be Populated';
                        end;
                    until JobApplicantsQualification.Next = 0;
                end;
            end;
            begin
                RecruitmentReqRequirement.Reset;
                RecruitmentReqRequirement.SetRange("Document No.", VacancyId);
                if RecruitmentReqRequirement.FindSet then begin
                    JobApplicationRequirements.Reset;
                    JobApplicationRequirements.SetRange("Application No.", ApplicationNo);
                    JobApplicationRequirements.SetRange("Vacancy No.", VacancyId);
                    if not JobApplicationRequirements.FindSet then begin
                        repeat
                            JobApplicationRequirements1.Init;
                            JobApplicationRequirements1."Application No." := ApplicationNo;
                            JobApplicationRequirements1."Vacancy No." := VacancyId;
                            JobApplicationRequirements1."Requirement ID" := RecruitmentReqRequirement."Requirement ID";
                            JobApplicationRequirements1."Line No." := RecruitmentReqRequirement."Line No.";
                            JobApplicationRequirements1."Requirement ID" := RecruitmentReqRequirement."Requirement ID";
                            JobApplicationRequirements1."Qualification Category" := RecruitmentReqRequirement."Qualification Category";
                            JobApplicationRequirements1."Qualification Code" := RecruitmentReqRequirement."Qualification Code";
                            JobApplicationRequirements1.Description := RecruitmentReqRequirement.Description;
                            JobApplicationRequirements1."Requirement Type" := RecruitmentReqRequirement."Requirement Type";
                            if JobApplicationRequirements1.Insert(true) then begin
                                status := 'success*The Applicant Details was succesffully Populated';
                            end else begin
                                status := 'danger*The Applicant Details wcould not be Populated';
                            end;
                        until JobApplicationRequirements.Next = 0;
                    end;
                end;
            end;
            begin
                VacancyDeclaration.Reset;
                VacancyDeclaration.SetRange("Vacancy No.", VacancyId);
                if VacancyDeclaration.FindSet then begin
                    ApplicationDeclaration.Reset;
                    ApplicationDeclaration.SetRange("Application No.", ApplicationNo);
                    if not ApplicationDeclaration.FindSet then begin
                        repeat
                            ApplicationDeclaration1.Init;
                            ApplicationDeclaration1."Application No." := ApplicationNo;
                            ApplicationDeclaration1."Line No." := ApplicationDeclaration."Line No.";
                            ApplicationDeclaration1."Declaration Statement" := ApplicationDeclaration."Declaration Statement";
                            if ApplicationDeclaration1.Insert(true) then begin
                                status := 'success*The Applicant Declaration Details was succesffully Populated';
                            end else begin
                                status := 'danger*The Applicant Declaration Details wcould not be Populated';
                            end;
                        until ApplicationDeclaration.Next = 0;
                    end;
                end;
            end;
            begin
                Employee_ApplicantReferees.Reset;
                Employee_ApplicantReferees.SetRange("No.", CandindateNo);
                if Employee_ApplicantReferees.FindSet then begin
                    ApplicationReferees.Reset;
                    ApplicationReferees.SetRange("Application No.", ApplicationNo);
                    ApplicationReferees.SetRange("Candidate No.", ApplicationNo);
                    if not ApplicationReferees.FindSet then begin
                        repeat
                            ApplicationReferees1.Init;
                            ApplicationReferees1."Application No." := ApplicationNo;
                            ApplicationReferees1."Candidate No." := CandindateNo;
                            ApplicationReferees1.Relationship := Employee_ApplicantReferees.Relationship;
                            ApplicationReferees1."Line No." := Employee_ApplicantReferees."Line No.";
                            ApplicationReferees1."Rererence Type" := Employee_ApplicantReferees."Rererence Type";
                            ApplicationReferees1.Name := Employee_ApplicantReferees.Name;
                            ApplicationReferees1."Designation/Title" := Employee_ApplicantReferees."Designation/Title";
                            ApplicationReferees1.Institution := Employee_ApplicantReferees."Designation/Title";
                            ApplicationReferees1.Address := Employee_ApplicantReferees.Address;
                            ApplicationReferees1."Address 2" := Employee_ApplicantReferees."Address 2";
                            ApplicationReferees1.City := Employee_ApplicantReferees.City;
                            ApplicationReferees1."Post Code" := Employee_ApplicantReferees."Post Code";
                            ApplicationReferees1."Country/Region Code" := Employee_ApplicantReferees."Country/Region Code";
                            ApplicationReferees1."Phone No." := Employee_ApplicantReferees."Phone No.";
                            ApplicationReferees1."E-Mail" := Employee_ApplicantReferees."E-Mail";
                            ApplicationReferees1."Years Known" := Employee_ApplicantReferees."Years Known";
                            if ApplicationReferees1.Insert(true) then begin
                                status := 'success*The Applicant Details was succesffully Populated';
                            end else begin
                                status := 'danger*The Applicant Details wcould not be Populated';
                            end;
                        until Employee_ApplicantReferees.Next = 0;
                    end else begin
                        ApplicationReferees.Reset;
                        ApplicationReferees.SetRange("Application No.", ApplicationNo);
                        ApplicationReferees.SetRange("Candidate No.", ApplicationNo);
                        if ApplicationReferees.FindSet then begin
                            repeat
                                ApplicationReferees1.Init;
                                ApplicationReferees1."Application No." := ApplicationNo;
                                ApplicationReferees1."Candidate No." := CandindateNo;
                                ApplicationReferees1."Line No." := Employee_ApplicantReferees."Line No.";
                                ApplicationReferees1."Rererence Type" := Employee_ApplicantReferees."Rererence Type";
                                ApplicationReferees1.Name := Employee_ApplicantReferees.Name;
                                ApplicationReferees1."Designation/Title" := Employee_ApplicantReferees."Designation/Title";
                                ApplicationReferees1.Institution := Employee_ApplicantReferees."Designation/Title";
                                ApplicationReferees1.Address := Employee_ApplicantReferees.Address;
                                ApplicationReferees1."Address 2" := Employee_ApplicantReferees."Address 2";
                                ApplicationReferees1.City := Employee_ApplicantReferees.City;
                                ApplicationReferees1."Post Code" := Employee_ApplicantReferees."Post Code";
                                ApplicationReferees1."Country/Region Code" := Employee_ApplicantReferees."Country/Region Code";
                                ApplicationReferees1."Phone No." := Employee_ApplicantReferees."Phone No.";
                                ApplicationReferees1."E-Mail" := Employee_ApplicantReferees."E-Mail";
                                ApplicationReferees1."Years Known" := Employee_ApplicantReferees."Years Known";
                                if ApplicationReferees1.Modify(true) then begin
                                    status := 'success*The Applicant Details was succesffully Populated';
                                end else begin
                                    status := 'danger*The Applicant Details wcould not be Populated';
                                end;
                            until Employee_ApplicantReferees.Next = 0;
                        end;
                    end;
                end;
            end;
        end;
    end;

    procedure FnSubmitApplication(ApplicantNumber: Code[100]; JobAppplicationNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        JobApplications: Record "Job Applications";
        EmailMess: Text;
    begin
        JobApplications.Reset;
        JobApplications.SetRange("Application No.", JobAppplicationNumber);
        JobApplications.SetRange("Candidate No.", ApplicantNumber);
        if JobApplications.FindSet then begin
            JobApplications.Validate("Candidate No.");

            FileDirectory := 'C:\DOCS\';
            FileName := 'JobApplication_' + JobAppplicationNumber + '.pdf';
            //Report.SaveAsPdf(69608, FileDirectory + FileName, JobApplications);
            SMTPMailSetup.Get;
            Email2 := SMTPMailSetup."Email Address";
            Body := 'JOB VACANCY APPLICATION';
            //  SMTP.CreateMessage('JOB VACANCY APPLICATION', Email2, JobApplications."E-Mail",
            //'JOB VACANCY APPLICATION',
            EmailMess := 'Dear ' + JobApplications."First Name" + '<br>' + JobApplications."Last Name" + ',<br><br>' +
             'We are pleased to inform you that your application for the post<b>' + ' ' + JobApplications."Job Title/Designation" + '</b> has been Received Successfully.' + ',<br><br>' + ' Your Job Application Number is' + '<BR><b>' + JobAppplicationNumber + '<br>' + '</b>' +
             'You will be contacted shortly and an email sent to you as regards when you will be invited for your interview<br>' +
             'Use the following link to acess the E-Recruitment Portal.' + ' ' + '<b><a href="http://192.168.1.87:7988/">E-Recruitment Portal</a></b><br>'
             + '<br>'
             ;
            // SMTP.AddAttachment(FileDirectory + FileName, FileName);
            SMTP.AddBodyline('<br><br>Kind Regards,' + '<br><br>Human Resource <br><br>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<br>');
            //  SMTP.Send();
            SMTPMail.Create(JobApplications."E-Mail", 'JOB VACANCY APPLICATION', EmailMess, true);
            Smail.Send(SMTPMail, Enum::"Email Scenario"::Default);

            status := 'success*The Job Application has been Received Successfully';
        end else begin
            status := 'danger*The Job Application was not sent Successfully';
        end;

    end;

    procedure FnSubmitProfileApplication(ApplicantNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        JobApplications: Record "Job Applications";
        Applicant: Record Applicant;
    begin

        //<<< New Changes

        Applicant.Reset;
        Applicant.SetRange("Candidate No.", ApplicantNumber);
        if Applicant.FindSet then begin
            Applicant."Profile Completed" := true;
            Applicant.Modify(true);
            FileDirectory := 'C:\DOCS\';
            FileName := 'CandidateCV' + ApplicantNumber + '.pdf';
            //     Report.SaveAsPdf(Report::"Applicant CV", FileDirectory + FileName, Applicant);
            //     SMTPMailSetup.Get;
            //     Email2 := SMTPMailSetup."Email Address";
            //     Body := 'CANDIDATE RESUME';

            //     SMTP.CreateMessage('CANDIDATE RESUME', Email2, Applicant."E-Mail",
            //     'CANDIDATE RESUME',
            //     'Dear ' + Applicant."First Name" + ',<br><br>' +
            //     'We are pleased to inform you that your profile has been received Successfully <b>' + '</b><br>' +
            //     'Use the following link to acess the E-Recruitment Portal.' + ' ' + '<b><a href="http://192.168.1.87:7988/">E-Recruitment Portal</a></b><br>'
            //     + '<br>'
            //     , true
            //  );

            //     SMTP.AddAttachment(FileDirectory + FileName, FileName);
            //     SMTP.AddBodyline('<br><br>Kind Regards,' + '<br><br>Human Resource <br><br>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<br>');
            //     SMTP.Send();
            status := 'success*The Candidate Profile has been Received Successfully';
        end else begin
            status := 'danger*The Candidate Profile has been Received Successfully';
        end;

    end;

    procedure FnChangeCandidatePassword(emailaddress: Text; currentPassword: Text; newPassword: Text; confirmNewPassword: Text) status: Text
    var
        DynasoftPortalUser: Record "Dynasoft Portal User";
    begin

        DynasoftPortalUser.Reset;
        DynasoftPortalUser.SetRange("Authentication Email", emailaddress);
        if DynasoftPortalUser.FindSet then begin
            if DynasoftPortalUser."Password Value" = currentPassword then begin
                if newPassword = confirmNewPassword then begin
                    DynasoftPortalUser."Password Value" := newPassword;
                    DynasoftPortalUser."Change Password" := true;
                    DynasoftPortalUser."Last Modified Date" := Today;
                    if DynasoftPortalUser.Modify(true) then begin
                        status := 'success*Your password was successfully changed';
                    end else begin
                        status := 'danger*Your password could not be reset';
                    end;
                end else begin
                    status := 'passwordmismatch*New password and Confirmed new password do not match';
                end;
            end else begin
                status := 'worngcurrentpassword*Wrong current password.Kindly Ensure that the Current Password is Correct';
            end;
        end else begin
            status := 'novendorfound*The specified Email Address does not exist';
        end;
    end;

    procedure SendAccountActivationLink(emailaddress: Text) status: Text
    var
        DynasoftPortalUser: Record "Dynasoft Portal User";
        SMTPMailSetup: Record "Email Account";
        Email2: Text;
        Body: Text;
        SMTP: Codeunit Mail;
        Contact: Record Contact;
    begin
        Contact.Reset;
        Contact.SetRange("E-Mail", emailaddress);
        if Contact.FindSet then begin
            SMTPMailSetup.Get;
            Email2 := SMTPMailSetup."Email Address";
            Body := 'CANDIDATE ACCOUNT ACTIVATION';
            //     SMTP.CreateMessage('CANDIDATE ACCOUNT ACTIVATION', Email2, emailaddress,
            //    'CANDIDATE ACCOUNT ACTIVATION',
            //    'Dear ' + Contact.Name + ',<br><br>' +
            //    'Your Account Creation Request has been successfully Received with Email Address<b>' + ' ' + Format(Contact."E-Mail") + ' ' + '</b> .Kindly Click on the Link Below to activate your Account<br>' +
            //    'Click on the Link to Activate your Account' + ' ' + '<b><a href="http://192.168.1.87:7988/">Click here to activate your Account</a></b><br>'
            //    + '<br>'
            //    + 'On Activation of the Account, You will Receive Login Credentials' + ' <b>'
            //  , true);
            //     SMTP.AddBCC(Email2);
            //     SMTP.AddBodyline('<br><br>Kind Regards,' + '<br><br>Human Resource <br><br>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<br>');
            //     SMTP.Send();
            Message('Notification successfully sent to %1', Contact."E-Mail");
        end;
    end;


    procedure FnCreateApplicantAccountRequest(emailaddress: Text) status: Text
    var
        PortalUSer: Record "Dynasoft Portal User";
        RandomDigit: Text[50];
        entryno: Integer;
        ApplicantProfile: Record Applicant;
        HumanResourcesSetup: Record "Human Resources Setup";
        Contact: Record Contact;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        IDD: Integer;
    begin
        Contact.Reset;
        Contact.SetRange("E-Mail", emailaddress);
        if Contact.FindSet then begin
            HumanResourcesSetup.Get;
            ApplicantProfile.Reset;
            ApplicantProfile.SetRange("E-Mail", emailaddress);
            if not ApplicantProfile.FindSet then begin
                ApplicantProfile.Init;
                ApplicantProfile."Candidate No." := NoSeriesMgt.GetNextNo(HumanResourcesSetup."Candidate No.", Today, true);
                ApplicantProfile."Full Names" := Contact.Name;
                ApplicantProfile."E-Mail" := Contact."E-Mail";
                ApplicantProfile."Mobile Phone No." := Contact."Phone No.";
                ApplicantProfile."Phone No." := Contact."Phone No.";
                //Amos- storing the ID - number in passport Number field - to avoid field conversions since a person can have either an ID Number or a passport
                //EVALUATE(IDD, Contact."ID Number");
                ApplicantProfile."Passport No." := Contact."ID Number";
                ApplicantProfile."First Name" := Contact."First Name";
                ApplicantProfile."Middle Name" := Contact."Middle Name";
                ApplicantProfile."Last Name" := Contact.Surname;
                if Contact."Record Type" = Contact."Record Type"::Employee then
                    ApplicantProfile."Employee No" := Contact."Employee No";
                if ApplicantProfile.Insert(true) then begin
                    // Update Dynasoft Portal user;
                    PortalUSer.Reset;
                    PortalUSer.SetRange("Authentication Email", emailaddress);
                    if not PortalUSer.FindSet then begin
                        PortalUSer.Init;
                        PortalUSer."User Name" := Contact.Name;
                        PortalUSer."Full Name" := Contact.Name;
                        PortalUSer."Authentication Email" := Contact."E-Mail";
                        PortalUSer."Mobile Phone No." := Contact."Phone No.";
                        PortalUSer.State := PortalUSer.State::Enabled;
                        PortalUSer."Record Type" := PortalUSer."record type"::"Job Applicant";
                        if Contact."Record Type" = Contact."Record Type"::Employee then
                            PortalUSer."Record Type" := PortalUSer."record type"::Employee;

                        PortalUSer."Record ID" := ApplicantProfile."Candidate No.";
                        RandomDigit := CreateGuid;
                        RandomDigit := DelChr(RandomDigit, '=', '{}-01');
                        RandomDigit := CopyStr(RandomDigit, 1, 8);
                        PortalUSer."Password Value" := RandomDigit;
                        PortalUSer."Last Modified Date" := Today;
                        if PortalUSer.Insert(true) then begin
                            status := 'success* Your account has been created successfully';
                        end;
                    end;
                end;
            end;
        end;
    end;


    procedure FnSendEmaiNotificationOnApplicantRegRequest(ApplicantRequest: Record Contact)
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        // "Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit Mail;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        SMTPMail_CU: Codeunit Mail;
        //DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "PR Payroll Periods";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit "PR Payroll Processing";
        IsEmailValid: Boolean;
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[250];
        SenderMessage: Text[250];
        HRSetupNew: Record "Human Resources Setup";
    begin

        CompInfo.Get;
        HRSetup.Get;
        HRSetupNew.Get;
        RequesterEmail := ApplicantRequest."E-Mail";
        RequesterName := ApplicantRequest.Name;
        Counter := Counter + 1;
        if HRSetup."E-Mail" = '' then
            Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
        SenderAddress := HRSetup."E-Mail";

        if HRSetupNew."HR E-mail Address" = '' then
            Error('Please Contact the IT Admin to specify the HR Manager E-mail address under Human Resource Setup page!!');
        CustEmail := HRSetupNew."HR E-mail Address";
        CompanyDetails := 'HR Officer,' + '<br></br>' + CompInfo.Name + '<br></br>' + CompInfo.Address + '<br></br>' + CompInfo."Address 2" + '<br></br>' + CompInfo.City;
        SenderMessage := '<br>This is to notify you that there has been a request for Registration via e-Recruitment for your action</br>';
        SupplierDetails := 'Registration Request Reference No:' + ApplicantRequest."No." + '<br></br>' + 'Company Name:' + ApplicantRequest.Name + '<br></br>' +
        '</br>' + 'Primary Email:' + ApplicantRequest."E-Mail" + '<br></br>' +
        'Mobile Phone No:' + ApplicantRequest."Phone No." + '<br></br>';
        if CustEmail = '' then
            exit;

        //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
        emailhdr := 'Applicant e-Registration Request Reference No:' + ApplicantRequest."No.";

        // SMTPMail_CU.CreateMessage(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
        // 'HR Officer,' + '<br></br>' + SenderMessage + SupplierDetails, true);

        // SMTPMail_CU.AddCC(RequesterEmail);

        //  SMTPMail_CU.AddBodyline(CompanyDetails);


        //   SMTPMail_CU.Send;
        SendingDate := Today;
        SendingTime := Time;

        Sleep(1000);
        Window.Close;
    end;


    procedure FnSendEmaiNotificationOnApplicantRegRequestAcknowledge(ApplicantRequest: Record Contact)
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        //  "Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit Mail;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        SMTPMail_CU: Codeunit Mail;
        //DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "PR Payroll Periods";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit "PR Payroll Processing";
        IsEmailValid: Boolean;
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[250];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[250];
        PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        HRSetupNew: Record "Human Resources Setup";
    begin
        //New Changes <<<

        CompInfo.Get;
        HRSetup.Get;
        HRSetupNew.Get;

        RequesterEmail := ApplicantRequest."E-Mail";
        RequesterName := ApplicantRequest.Name;
        Counter := Counter + 1;

        if HRSetup."E-Mail" = '' then
            Error('Please Contact the IT Admin to specify the E-mail address ' +
                  'under Company Information Setup page');

        SenderAddress := HRSetup."E-Mail";


        if HRSetupNew."HR E-mail Address" = '' then
            Error('Please Contact the IT Admin to specify the HR Manager ' +
         'E-mail address under Human Resource Setup page');

        CustEmail := HRSetupNew."HR E-mail Address";

        CompanyDetails := 'Dear ' + ApplicantRequest.Name + '<br>';
        SenderMessage := 'Thank you for using our e-Recruitment Portal which has been established to provide you with ' +
                            'easy access to our online Recruitment services at KeRRA.' +
                          '<br>This email is to acknowledge that your request for registration as an applicant, ' +
                          'done on: ' + Format(ApplicantRequest."Last Date Modified") +
                          ' has been received and summarized as follows:' + '<br>' + '<br>';

        SupplierDetails := 'Registration Reference No:' + ApplicantRequest."No." + '<br>' +
                        'Full Names: </b>' + ApplicantRequest.Name + '<br>' +
                        'Primary Email Address:' + ApplicantRequest."E-Mail" + '<br>' +
                        'Mobile Phone No:' + ApplicantRequest."Phone No." + '<br>';

        if CustEmail = '' then exit;

        emailhdr := 'KeRRA e-Recruitment Acknowledgment - [' + ApplicantRequest."No." + '])';

        //SMTPMail_CU.CreateMessage(SenderName,SenderAddress,Recipients,Subject,Body,HtmlFormatted)
        // SMTPMail_CU.CreateMessage(
        //                          CompInfo.Name,
        //                          SenderAddress,
        //                          RequesterEmail,
        //                          emailhdr,
        //                 CompanyDetails + '<br></br>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);
        // //SMTPMail_CU.AddCC(RequesterEmail);
        // SMTPMail_CU.AddBodyline(ProcNote);
        // SMTPMail_CU.Send;
        // SendingDate := Today;
        // SendingTime := Time;
        Sleep(1000);
        //Window.CLOSE;
    end;


    procedure FnSendEmaiNotificationOnApplicantAccountActivation(ApplicantRequest: Record Contact)
    var
        SMTPMailSetup: Record "Email Account";
        SMTPMail: Codeunit "Email Message";
        Smail: Codeunit EMail;
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        //  "Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit Mail;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        SMTPMail_CU: Codeunit Mail;
        // DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetupNew: Record "Human Resources Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "PR Payroll Periods";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit "PR Payroll Processing";
        IsEmailValid: Boolean;
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        ApplicantDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
    begin
        //New Changes on formatting of email <<<

        CompInfo.Get;
        HRSetup.Get;
        HRSetupNew.Get;

        RequesterEmail := ApplicantRequest."E-Mail";
        RequesterName := ApplicantRequest.Name;

        Counter := Counter + 1;
        PortalUser.Reset;
        PortalUser.SetRange("Authentication Email", ApplicantRequest."E-Mail");
        if PortalUser.FindSet then Password := PortalUser."Password Value";

        if HRSetup."E-Mail" = '' then Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');

        SenderAddress := HRSetup."E-Mail";
        if HRSetupNew."HR E-mail Address" = '' then Error('Please Contact the IT Admin to specify the HR Manager E-mail address under Human Resource Setup page!!');

        CustEmail := HRSetupNew."HR E-mail Address";

        CompanyDetails := 'Dear,' + ApplicantRequest.Name + '<br>';

        SenderMessage := 'Please note that your applicant account has been created on our system with the following key registration details:<br> <br>';

        ApplicantDetails := '<br> Registration Request Reference No: ' + ApplicantRequest."No." +
                          '<br> Name: ' + ApplicantRequest.Name +
                          '<br> Mobile Phone No: ' + ApplicantRequest."Phone No.";

        LoginDetails := '<br> We have also created your portal access account with the following login credentials:' +
                          '<br>  User Name :' + ApplicantRequest."E-Mail" +
                          '<br> <b> Password :' + Password + '</b>' +
                          '<br> <br>To access our portal and complete your registration click on the link below to access the ' +
                          'National Land Commision E-Recruitment Portal and complete your Profile';

        ActivationDetails := '<br> Once you access our portal, you shall be able to complete the Confidential Applicant section ' +
                                 'of the registration that shall require you to provide the following information: </br>' +
                            '<br> 1. Personal Information' +
                            '<br> 2. Contact details' +
                            '<br> 3. Academic Qualifications' +
                            '<br> 4. Proffesional Qualifications' +
                            '<br> 5. Employment History' +
                            '<br> 6. Refferees' +
                            '<br> 7. Academic Qualification Attachments' +
                            '<br> <br><a href="' + HRSetupNew."E-Recruitment Portal Link" + '">E-Recruitment Portal Link</a></br>';
        if CustEmail = '' then exit;

        emailhdr := 'National Land Commision e-Recruitment Account Activation - [' + ApplicantRequest."No." + '])';
        SMTPMail.Create(RequesterEmail, emailhdr, CompanyDetails + '<br></br>' + SenderMessage + ApplicantDetails + LoginDetails + ActivationDetails, true);
        Smail.Send(SMTPMail, Enum::"Email Scenario"::Default);

        SendingDate := Today;
        SendingTime := Time;

        Sleep(1000);

    end;

    procedure FnDeleteAacademicDetails(EntryNumber: Integer; CandidateNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin

        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Candidate No.", CandidateNumber);
        JobApplicantsQualification.SetRange("Line No.", EntryNumber);
        if JobApplicantsQualification.FindSet then begin
            if JobApplicantsQualification.Delete(true) then begin
                status := 'success*Your Academic Details was successfully Deleted';
            end else begin
                status := 'danger*Your Academic Details was not successfully Deleted';
            end;
        end;

    end;

    procedure FnDeleteJobAcademicDetails(EntryNumber: Integer; CandidateNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicationQualification: Record "Application Qualification";
    begin
        ApplicationQualification.Reset;
        ApplicationQualification.SetRange("Candidate No.", CandidateNumber);
        ApplicationQualification.SetRange("Line No.", EntryNumber);
        if ApplicationQualification.FindSet then begin
            if ApplicationQualification.Delete(true) then begin
                status := 'success*Your Academic Details was successfully Deleted';
            end else begin
                status := 'danger*Your Academic Details was not successfully Deleted';
            end;
        end;

    end;

    procedure FnDeleteProffessionalQualificationDetails(EntryNumber: Integer; CandidateNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin

        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Candidate No.", CandidateNumber);
        JobApplicantsQualification.SetRange("Line No.", EntryNumber);
        if JobApplicantsQualification.FindSet then begin
            if JobApplicantsQualification.Delete(true) then begin
                status := 'success*Your Proffesional Details was successfully Deleted';
            end else begin
                status := 'danger*Your Proffesional Details was not successfully Deleted';
            end;
        end;

    end;

    procedure FnDeleteProffessionalQualificationBodiesDetails(EntryNumber: Integer; CandidateNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin

        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Candidate No.", CandidateNumber);
        JobApplicantsQualification.SetRange("Line No.", EntryNumber);
        if JobApplicantsQualification.FindSet then begin
            if JobApplicantsQualification.Delete(true) then begin
                status := 'success*Your Proffesional Bodies Details was successfully Deleted';
            end else begin
                status := 'danger*Your Proffesional Bodies Details was not successfully Deleted';
            end;
        end;

    end;

    procedure FnDeleteWorkExperienceDetails(EntryNumber: Integer; CandidateNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin

        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Candidate No.", CandidateNumber);
        JobApplicantsQualification.SetRange("Line No.", EntryNumber);
        if JobApplicantsQualification.FindSet then begin
            if JobApplicantsQualification.Delete(true) then begin
                status := 'success*Your Academic Details was successfully Deleted';
            end else begin
                status := 'danger*Your Academic Details was not successfully Deleted';
            end;
        end;

    end;

    procedure FnDeleteRefereeDetails(EntryNumber: Integer; CandidateNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        EmployeeApplicantReferees: Record "Employee_Applicant Referees";
    begin

        EmployeeApplicantReferees.Reset;
        EmployeeApplicantReferees.SetRange("No.", CandidateNumber);
        EmployeeApplicantReferees.SetRange("Line No.", EntryNumber);
        if EmployeeApplicantReferees.FindSet then begin
            if EmployeeApplicantReferees.Delete(true) then begin
                status := 'success*Your Referree Details was successfully Deleted';
            end else begin
                status := 'danger*Your Referree Details was not successfully Deleted';
            end;
        end;

    end;

    procedure FnDeleteJobProffesionalQualificationDetails(EntryNumber: Integer; CandidateNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicationQualification: Record "Application Qualification";
    begin
        ApplicationQualification.Reset;
        ApplicationQualification.SetRange("Candidate No.", CandidateNumber);
        ApplicationQualification.SetRange("Line No.", EntryNumber);
        if ApplicationQualification.FindSet then begin
            if ApplicationQualification.Delete(true) then begin
                status := 'success*Your Proffesional Qualifications Details was successfully Deleted';
            end else begin
                status := 'danger*Your Proffesional Qualifications Details was not successfully Deleted';
            end;
        end;

    end;

    procedure FnDeleteJobProffesionalBodiesDetails(EntryNumber: Integer; CandidateNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicationQualification: Record "Application Qualification";
    begin
        ApplicationQualification.Reset;
        ApplicationQualification.SetRange("Candidate No.", CandidateNumber);
        ApplicationQualification.SetRange("Line No.", EntryNumber);
        if ApplicationQualification.FindSet then begin
            if ApplicationQualification.Delete(true) then begin
                status := 'success*Your Proffesional Qualifications Details was successfully Deleted';
            end else begin
                status := 'danger*Your Proffesional Qualifications Details was not successfully Deleted';
            end;
        end;

    end;

    procedure FnCreateCandidateDocumentsLink(applicantNo: Code[50]; ApplicationNo: Code[50]; FileName: Text; FileLink: Text) status: Text
    var
        JobApplications: Record "Job Applications";
        DocumentAttachment: Record "Document Attachment";
        RecordLink: Record "Record Link";
    begin
        // Record Links Attachment on the Applications -Obadiah Korir
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := FileLink;
            RecordLink.Description := FileName;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            JobApplications.Reset;
            JobApplications."Application No." := ApplicationNo;
            JobApplications."Candidate No." := applicantNo;
            if JobApplications.Find('=') then
                RecordIDNumber := JobApplications.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end
        end;
    end;

    procedure FnDeleteJobApplicationRefereeDetails(EntryNumber: Integer; CandidateNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        EmployeeApplicantReferees: Record "Employee_Applicant Referees";
        ApplicationReferees: Record "Application Referees";
    begin

        ApplicationReferees.Reset;
        ApplicationReferees.SetRange("Candidate No.", CandidateNumber);
        ApplicationReferees.SetRange("Line No.", EntryNumber);
        if ApplicationReferees.FindSet then begin
            if ApplicationReferees.Delete(true) then begin
                status := 'success*Your Referree Details was successfully Deleted';
            end else begin
                status := 'danger*Your Referree Details was not successfully Deleted';
            end;
        end;

    end;

    procedure FnGenerateVacancyAdvert(VcancyNo: Code[20]) status: Text
    var
        VacancyAdvert: Record "Recruitment Requisition Header";
    begin

        HRsetup.Get();
        FILEPATH := HRsetup."Reports File Path";
        VacancyAdvert.Reset;
        VacancyAdvert.SetRange("Document No.", VcancyNo);

        if VacancyAdvert.FindSet then begin
            if FILE.Exists(FILEPATH + VcancyNo + '.pdf') then
                FILE.Erase(FILEPATH + VcancyNo + '.pdf');
            Report.SaveAsPdf(Report::Vacancy, FILEPATH + VcancyNo + '.pdf', VacancyAdvert);
            status := 'success*Generated*Files\' + VcancyNo + '.pdf';

        end else begin
            status := 'danger*The Report Could not be generated';
        end
    end;

    procedure FnGenerateJobApplicantReport(CandidateNo: Code[20]; JobApplicantNumber: Code[20]) status: Text
    var
        JobApplications: Record "Job Applications";
    begin

        JobApplications.Reset;
        JobApplications.SetRange("Application No.", JobApplicantNumber);
        JobApplications.SetRange("Candidate No.", CandidateNo);
        if JobApplications.FindSet then begin
            // if FILE.Exists(FILESPATH2 + JobApplicantNumber + '.pdf') then
            //     FILE.Erase(FILESPATH2 + JobApplicantNumber + '.pdf');
            // Report.SaveAsPdf(69608, FILESPATH2 + JobApplicantNumber + '.pdf', JobApplications);
            status := 'success*Generated*Downloads\JobApplicants\' + JobApplicantNumber + '.pdf';

        end else begin
            status := 'danger*The Report Could not be generated';
        end
    end;

    procedure FnCreateApplicantDocumentsLink(applicantNo: Code[50]; FileName: Text; FileLink: Text) status: Text
    var
        Applicant: Record Applicant;
        DocumentAttachment: Record "Document Attachment";
        RecordLink: Record "Record Link";
    begin
        // Record Links Attachment on the Applications -Obadiah Korir
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := FileLink;
            RecordLink.Description := FileName;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            Applicant.Reset;
            Applicant."Candidate No." := applicantNo;
            //JobApplications."Candidate No.":=applicantNo;
            if Applicant.Find('=') then
                RecordIDNumber := Applicant.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end
        end;
    end;

    procedure AcceptJobOffer(ApplicantNo: Text; Comments: Text; OfferID: Text)
    var
        EmploymentOffer: Record "Employment Offer";
    begin
        EmploymentOffer.reset;
        EmploymentOffer.SetRange("Offer ID", OfferID);
        if EmploymentOffer.find('-') then begin
            EmploymentOffer."Candidate Response Date" := Today;
            EmploymentOffer."Candidate Response" := Comments;
            EmploymentOffer."Offer Acceptance Status" := EmploymentOffer."Offer Acceptance Status"::Accepted;
            EmploymentOffer.Modify();
        end;

    end;

    procedure RejectJobOffer(ApplicantNo: Text; Comments: Text; OfferID: Text)
    var
        EmploymentOffer: Record "Employment Offer";
    begin
        EmploymentOffer.reset;
        EmploymentOffer.SetRange("Offer ID", OfferID);
        if EmploymentOffer.find('-') then begin
            EmploymentOffer."Candidate Response Date" := Today;
            EmploymentOffer."Candidate Response" := Comments;
            EmploymentOffer."Offer Acceptance Status" := EmploymentOffer."Offer Acceptance Status"::Rejected;
            EmploymentOffer.Modify();
        end;
    end;
}

