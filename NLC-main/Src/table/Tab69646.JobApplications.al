#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69646 "Job Applications"
{

    fields
    {
        field(1; "Candidate No."; Code[20])
        {
            Caption = 'Candidate No.';
            TableRelation = Applicant;

            trigger OnValidate()
            begin
                if Applicant.Get("Candidate No.") then begin
                    "First Name" := Applicant."First Name";
                    "Middle Name" := Applicant."Middle Name";
                    "E-Mail" := Applicant."E-Mail";
                    "Last Name" := Applicant."Last Name";
                    Address := Applicant.Address;
                    "Country/Region Code" := Applicant."Country/Region Code";
                    "Birth Date" := Applicant."Birth Date";
                    "Post Code" := Applicant."Post Code";
                    City := Applicant.City;
                    "Ethnic Group" := Applicant."Ethnic Group";
                    Gender := Applicant.Gender;
                    "Marital Status" := Applicant."Marital Status";
                    Nationality := Applicant.Nationality;
                    "Mobile Phone No." := Applicant."Mobile Phone No.";
                    "Phone No." := Applicant."Phone No.";
                    "County of Birth" := Applicant."County of Birth";


                end;
            end;
        }
        field(2; "First Name"; Text[30])
        {
            Caption = 'First Name';
        }
        field(3; "Middle Name"; Text[30])
        {
            Caption = 'Middle Name';
        }
        field(4; "Last Name"; Text[30])
        {
            Caption = 'Last Name';
        }
        field(5; "Full Names"; Text[200])
        {
            Caption = 'Initials';
        }
        field(6; "Employee No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Professional Summary"; Text[350])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(9; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(10; City; Text[30])
        {
            Caption = 'City';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", "County of Birth", Nationality);
            end;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", "County of Birth", Nationality, (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(11; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", "County of Birth", Nationality);
            end;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(City, "Post Code", "County of Birth", Nationality, (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(12; "County of Birth"; Text[30])
        {
            Caption = 'County';
        }
        field(13; "Phone No."; Text[15])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(14; "Mobile Phone No."; Text[15])
        {
            Caption = 'Mobile Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(15; "E-Mail"; Text[70])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(16; Picture; Media)
        {
            Caption = 'Picture';
            ObsoleteReason = 'Replaced by Image field';
            ObsoleteState = Pending;
        }
        field(17; "Birth Date"; Date)
        {
            Caption = 'Birth Date';
        }
        field(18; Gender; Option)
        {
            Caption = 'Gender';
            OptionCaption = ' ,Female,Male,Both';
            OptionMembers = " ",Female,Male,Both;
        }
        field(19; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                PostCode.CheckClearPostCodeCityCounty(City, "Post Code", "County of Birth", Nationality, xRec.Nationality);
            end;
        }
        field(20; "ID Number"; Integer)
        {
        }
        field(21; "Passport No."; Code[30])
        {
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
            end;
        }
        field(22; "Marital Status"; Option)
        {
            OptionCaption = ' ,Single,Married,Widowed,Separated,Divorced';
            OptionMembers = " ",Single,Married,Widowed,Separated,Divorced;
        }
        field(23; Religion; Code[20])
        {
        }
        field(24; "Ethnic Group"; Code[30])
        {
            TableRelation = "Ethnic Background";
        }
        field(25; Nationality; Code[30])
        {
        }
        field(26; "Specialization Area"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Domain Area";
        }
        field(27; "Highest Academic Qualification"; Code[30])
        {
            TableRelation = "Application Qualification"."Qualification Code" where("Qualification Type" = filter('Academic'),
                                                                                    "Application No." = field("Application No."));

            trigger OnValidate()
            begin
                if Qualification.Get("Highest Academic Qualification") then
                    "Qualification Name" := Qualification.Description;
            end;
        }
        field(28; "Qualification Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Work Experience (Years)"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Management Experience (Years)"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Disability Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Disability Code";
        }
        field(32; Disabled; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Disability Description"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Disability Certificate No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Position Id"; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Position Code';
            TableRelation = "Recruitment Planning Line"."Position ID";
        }
        field(36; "Job Title/Designation"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Duty Station ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Cost center';
            TableRelation = "Duty Station";
        }
        field(38; "Work Location Details"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(39; "No. of Openings"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Target Candidate Source"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Limited-Internal Staff,Limited-External Staff';
            OptionMembers = Open,"Limited-Internal Staff","Limited-External Staff";
        }
        field(41; Directorate; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";// where("Operating Unit Type" = filter(Directorate));
        }
        field(42; Department; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";// where("Operating Unit Type" = filter("Department/Center"));
        }
        field(43; "Region ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";// where("Operating Unit Type" = filter(Region));
        }
        field(44; "Seniority Level"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Entry-Level,Mid-Level,Senior-Level,Executive';
            OptionMembers = ,"Entry-Level","Mid-Level","Senior-Level",Executive;
        }
        field(45; "Terms of Service Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(46; "Employment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Permanent,Contract,Casual,Internship,Attachment';
            OptionMembers = Permanent,Contract,Casual,Internship,Attachment;
        }
        field(47; "Vacancy Id"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Employee Requisitions"."Requisition No.";

            trigger OnValidate()
            var
                RecruitmentRequisition: Record "HR Employee Requisitions";
            begin
                RecruitmentRequisition.Reset();
                RecruitmentRequisition.SetRange("Requisition No.", rec."Vacancy Id");
                if RecruitmentRequisition.FindFirst() then begin
                    "Position Id" := RecruitmentRequisition."Job ID";
                    "Work Location Details" := RecruitmentRequisition."Responsibility Center";
                    "Employment Type" := RecruitmentRequisition."Type of Contract Required";
                    Department := RecruitmentRequisition."Responsibility Center";
                    Directorate := RecruitmentRequisition."Global Dimension 2 Code";
                    "Job Title/Designation" := RecruitmentRequisition."Job Description";
                    "Target Candidate Source" := RecruitmentRequisition.Score;
                    "No. of Openings" := RecruitmentRequisition."Required Positions";
                    //"Position Category" := RecruitmentRequisition."Type of Contract Required";
                end
            end;
        }
        field(48; "Application No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(49; "Application Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,System Shortlisting,Oral Interview,Written Interview,Closed';
            OptionMembers = Open,"System Shortlisting","Oral Interview","Written Interview",Closed;
        }
        field(50; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(51; "PIN Registration"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(52; "Applications Closing Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(53; "Applications Closing Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(54; "Pre-Screening Template ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(55; "Current Employment Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Public Service,Private Sector,Unemployed';
            OptionMembers = "Public Service","Private Sector",Unemployed;
        }
        field(56; "Employer Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(57; Station; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(58; "Personal No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(59; "Present Substantive Post"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(60; "Job Grade"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(61; "Secondment Organization"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(62; "Secondment Designation"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(63; "Secondment Job Group"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(64; "Gross Salary"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(65; "Background Checks Pass"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(66; "Referee Checks Pass"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(67; "Medical Checks Pass"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(68; "Position Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Employee,Resource';
            OptionMembers = Employee,Resource;
        }
        field(69; "Passed County of Origin"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70; "Passed Date of Birth"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(71; "Passed Ethnicity"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(72; "Passed Gender"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(73; "Passed Minimum Academic"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(74; "Passed Minimum Mngt Exp"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(75; "Passed Minimum Work Exp"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(76; "Passed PWD"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        //Shortlisted 
        field(77; Shortlisted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(78; "Shorlisting Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Candidate Selection Header"."Document No.";
        }
        field(79; "Shortlisting Outcome"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Non-Responsive,Invite for First Interview';
            OptionMembers = " ","Non-Responsive","Invite for First Interview";
        }
        field(80; "Committee Remarks"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(81; "Attended Interview"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Application No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
        HumanResourcesSetup: Record "HR Setup";
    begin
        HumanResourcesSetup.Get;
        HumanResourcesSetup.TestField("Job Application Nos");
        if "Application No." = '' then
            NoSeriesMgt.InitSeries(HumanResourcesSetup."Job Application Nos", xRec."No. Series", 0D, "Application No.", "No. Series");
    end;

    var
        PostCode: Record "Post Code";
        RecruitmentRequisition: Record "Recruitment Requisition Header";
        Applicant: Record Applicant;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Qualification: Record Qualification;
}

