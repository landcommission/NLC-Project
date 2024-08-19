#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193428 "HR Job Applications"
{
    Caption = 'HR Job Applications';
    DrillDownPageId = "HR Job Applications List";
    LookupPageId = "HR Job Applications List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Job Application No."; Code[50])
        {
            Editable = false;
            TableRelation = "HR Job Applications";
            Caption = 'Job Application No.';
        }
        field(2; "First Name"; Text[100])
        {
            Caption = 'First Name';
            trigger OnValidate()
            begin
                fn_FullName();
            end;
        }
        field(3; "Middle Name"; Text[50])
        {
            Caption = 'Middle Name';
            trigger OnValidate()
            begin
                fn_FullName();
            end;
        }
        field(4; "Last Name"; Text[50])
        {
            Caption = 'Last Name';
            trigger OnValidate()
            var
                Reason: Text[30];
            begin
                fn_FullName()
            end;
        }
        field(5; Initials; Text[15])
        {
            Caption = 'Initials';
        }
        field(7; "Search Name"; Code[50])
        {
            Caption = 'Search Name';
        }
        field(8; "Postal Address"; Text[80])
        {
            Caption = 'Postal Address';
        }
        field(9; "Residential Address"; Text[80])
        {
            Caption = 'Residential Address';
        }
        field(10; City; Text[30])
        {
            Caption = 'City';
        }
        field(11; "Post Code"; Code[20])
        {
            Enabled = false;
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
            Caption = 'Post Code';
        }
        field(12; County; Text[30])
        {
            Caption = 'County';
        }
        field(13; "Home Phone Number"; Text[30])
        {
            Caption = 'Home Phone Number';
        }
        field(14; "Cell Phone Number"; Text[30])
        {
            Caption = 'Cell Phone Number';
        }
        field(15; "Work Phone Number"; Text[30])
        {
            Caption = 'Work Phone Number';
        }
        field(16; "Ext."; Text[7])
        {
            Caption = 'Ext.';
        }
        field(17; "E-Mail"; Text[80])
        {
            Caption = 'E-Mail';
        }
        field(19; Picture; Blob)
        {
            Subtype = Bitmap;
            Caption = 'Picture';
        }
        field(20; "ID Number"; Integer)
        {
            Caption = 'ID Number';
        }
        field(21; Gender; Option)
        {
            Caption = 'Gender';
            OptionMembers = ,Male,Female;
            OptionCaption = ' ,Male,Female';
        }
        field(22; "Country Code"; Code[50])
        {
            TableRelation = "Country/Region";
            Caption = 'Country Code';
        }
        field(23; Status; Option)
        {
            OptionMembers = Normal,Resigned,Discharged,Retrenched,Pension,Disabled;
            Caption = 'Status';
        }
        field(24; Comment; Boolean)
        {
            Editable = false;
            FieldClass = Normal;
            Caption = 'Comment';
        }
        field(25; "Fax Number"; Text[30])
        {
            Caption = 'Fax Number';
        }
        field(26; "Marital Status"; Option)
        {
            Caption = 'Marital Status';
            OptionCaption = ' ,Single,Married,Divorced,Others,Widow(er),Separated';
            OptionMembers = " ",Single,Married,Divorced,Others,Widowed,Separated;
        }
        field(27; "Ethnic Origin"; Option)
        {
            OptionMembers = African,Indian,White,Coloured;
            Caption = 'Ethnic Origin';
        }
        field(28; "First Language (R/W/S)"; Code[10])
        {
            TableRelation = "HR Lookup Values".Code where(Type = filter(Language));
            Caption = 'First Language (R/W/S)';
        }
        field(29; "Driving Licence"; Code[100])
        {
            Caption = 'Driving Licence';
        }
        field(30; Disabled; Text[50])
        {
            Caption = 'Disabled';
        }
        field(31; "Health Assesment?"; Boolean)
        {
            Caption = 'Health Assesment?';
        }
        field(32; "Health Assesment Date"; Date)
        {
            Caption = 'Health Assesment Date';
        }
        field(33; "Date Of Birth"; Date)
        {
            Caption = 'Date Of Birth';
            trigger OnValidate()
            begin
                if "Date Of Birth" >= Today then
                    Error('Date of Birth cannot be after %1', Today);
            end;
        }
        field(34; Age; Text[80])
        {
            Caption = 'Age';
        }
        field(35; "Second Language (R/W/S)"; Code[10])
        {
            TableRelation = "HR Lookup Values".Code where(Type = filter(Language));
            Caption = 'Second Language (R/W/S)';
        }
        field(36; "Additional Language"; Code[100])
        {
            TableRelation = "HR Lookup Values".Code where(Type = filter(Language));
            Caption = 'Additional Language';
        }
        field(37; "Primary Skills Category"; Option)
        {
            OptionMembers = Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
            Caption = 'Primary Skills Category';
        }
        field(38; Level; Option)
        {
            OptionMembers = " ","Level 1","Level 2","Level 3","Level 4","Level 5","Level 6","Level 7";
            Caption = 'Level';
        }
        field(39; "Termination Category"; Option)
        {
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Death,Other;
            Caption = 'Termination Category';

        }
        field(40; "Postal Address2"; Text[30])
        {
            Caption = 'Postal Address2';
        }
        field(41; "Postal Address3"; Text[20])
        {
            Caption = 'Postal Address3';
        }
        field(42; "Residential Address2"; Text[30])
        {
            Caption = 'Residential Address2';
        }
        field(43; "Residential Address3"; Text[20])
        {
            Caption = 'Residential Address3';
        }
        field(44; "Post Code2"; Code[20])
        {
            TableRelation = "Post Code";
            Caption = 'Post Code2';
        }
        field(45; Citizenship; Code[50])
        {
            TableRelation = "Country/Region".Code;
            Caption = 'Citizenship';
            trigger OnValidate()
            begin
                Country.Reset();
                Country.SetRange(Country.Code, Citizenship);
                if Country.Find('-') then
                    "Citizenship Details" := Country.Name;
            end;
        }
        field(46; "Disabling Details"; Text[50])
        {
            Caption = 'Disabling Details';
        }
        field(47; "Disability Grade"; Text[30])
        {
            Caption = 'Disability Grade';
        }
        field(48; "Passport Number"; Text[30])
        {
            Caption = 'Passport Number';
        }
        field(49; "2nd Skills Category"; Option)
        {
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
            Caption = '2nd Skills Category';
        }
        field(50; "3rd Skills Category"; Option)
        {
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
            Caption = '3rd Skills Category';
        }
        field(51; Region; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
            Caption = 'Region';
        }
        field(52; "First Language Read"; Boolean)
        {
            Caption = 'First Language Read';
        }
        field(53; "First Language Write"; Boolean)
        {
            Caption = 'First Language Write';
        }
        field(54; "First Language Speak"; Boolean)
        {
            Caption = 'First Language Speak';
        }
        field(55; "Second Language Read"; Boolean)
        {
            Caption = 'Second Language Read';
        }
        field(56; "Second Language Write"; Boolean)
        {
            Caption = 'Second Language Write';
        }
        field(57; "Second Language Speak"; Boolean)
        {
            Caption = 'Second Language Speak';
        }
        field(58; "PIN Number"; Code[20])
        {
            Caption = 'PIN Number';
        }
        field(59; "Job Applied For"; Text[30])
        {
            Editable = false;
            Caption = 'Job Applied For';
        }
        field(60; "Employee Requisition No"; Code[20])
        {
            TableRelation = "HR Employee Requisitions"."Requisition No." where(Closed = const(false),
                                                                                Status = const(Approved));
            Caption = 'Employee Requisition No';
            trigger OnValidate()
            begin
                "Job Applied For" := '';
                "Job Applied for Description" := '';

                HREmpReq.Reset();
                HREmpReq.SetRange(HREmpReq."Requisition No.", "Employee Requisition No");
                if HREmpReq.Find('-') then begin
                    "Job Applied For" := HREmpReq."Job ID";
                    "Job Applied for Description" := HREmpReq."Job Description";
                end;
            end;
        }
        field(61; "Total Score"; Decimal)
        {
            FieldClass = Normal;
            Caption = 'Total Score';
        }
        field(62; Shortlist; Boolean)
        {
            Caption = 'Shortlist';
        }
        field(63; Qualified; Boolean)
        {
            Editable = false;
            Caption = 'Qualified';
        }
        field(64; Stage; Code[20])
        {
            FieldClass = FlowFilter;
            Caption = 'Stage';
        }
        field(65; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(66; "Employee No"; Code[30])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee No';
            trigger OnValidate()
            begin
                //COPY EMPLOYEE DETAILS FROM EMPLOYEE TABLE
                Employee.Reset();
                if Employee.Get("Employee No") then begin
                    "First Name" := Employee."First Name";
                    "Middle Name" := Employee."Middle Name";
                    "Last Name" := Employee."Last Name";
                    "Search Name" := Employee."Full Name";
                    "Postal Address" := Employee."Postal Address";
                    "Residential Address" := Employee."Residential Address";
                    City := Employee.City;
                    "Post Code" := Employee."Post Code";
                    County := Employee.County;
                    "Home Phone Number" := Employee."Home Phone Number";
                    "Cell Phone Number" := Employee."Cell Phone Number";
                    "Work Phone Number" := Employee."Work Phone Number";
                    "Ext." := Employee."Ext.";
                    "E-Mail" := Employee."E-Mail";
                    //"ID Number":=Employee."ID Number";
                    //Gender:=Employee.Gender;
                    "Country Code" := Employee.Citizenship;
                    "Fax Number" := Employee."Fax Number";
                    //"Marital Status":=Employee."Marital Status";
                    "Ethnic Origin" := Employee."Ethnic Origin";
                    "First Language (R/W/S)" := Employee."First Language (R/W/S)";
                    //"Driving Licence":=Employee."Has Driving Licence";
                    //Disabled:=Employee.Disabled;
                    "Health Assesment?" := Employee."Health Assesment?";
                    "Health Assesment Date" := Employee."Health Assesment Date";
                    "Date Of Birth" := Employee."Date Of Birth";
                    Age := Employee.Age;
                    "Second Language (R/W/S)" := Employee."Second Language (R/W/S)";
                    "Additional Language" := Employee."Additional Language";
                    Citizenship := Employee.Citizenship;
                    "Passport Number" := Employee."Passport Number";
                    "First Language Read" := Employee."First Language Read";
                    "First Language Write" := Employee."First Language Write";
                    "First Language Speak" := Employee."First Language Speak";
                    "Second Language Read" := Employee."Second Language Read";
                    "Second Language Write" := Employee."Second Language Write";
                    "Second Language Speak" := Employee."Second Language Speak";
                    "PIN Number" := Employee."PIN No.";

                    "Applicant Type" := "Applicant Type"::External;
                    Modify();

                    //DELETE QUALIFICATIONS PREVIOUSLY COPIED
                    AppQualifications.Reset();
                    AppQualifications.SetRange(AppQualifications."Application No", "Job Application No.");
                    if AppQualifications.Find('-') then
                        AppQualifications.DeleteAll();

                    //GET EMPL0YEE QUALIFICATIONS
                    EmpQualifications.Reset();
                    EmpQualifications.SetRange(EmpQualifications."Employee No.", Employee."No.");
                    if EmpQualifications.Find('-') then
                        EmpQualifications.FindFirst();
                    begin
                        AppQualifications.Reset();

                        repeat
                            AppQualifications.Init();
                            AppQualifications."Application No" := "Job Application No.";
                            ////AppQualifications."Employee No.":="Employee No";
                            AppQualifications."Qualification Type" := EmpQualifications."Qualification Type";
                            AppQualifications."Qualification Code" := EmpQualifications."Qualification Code";
                            AppQualifications."Qualification Description" := EmpQualifications."Qualification Description";
                            AppQualifications."Start Date" := EmpQualifications."From Date";
                            AppQualifications."End Date" := EmpQualifications."To Date";
                            //AppQualifications.Type:=EmpQualifications.Type;
                            AppQualifications."Institution/Company" := EmpQualifications."Institution/Company";
                            AppQualifications.Insert();

                        until EmpQualifications.Next() = 0;
                    end
                end;

                /*
                END ELSE BEGIN
                "First Name":='';
                "Middle Name":='';
                "Last Name":='';
                "Search Name":='';
                "Postal Address":='';
                "Residential Address":='';
                City:=Employee.City;
                "Post Code":='';
                County:='';
                "Home Phone Number":='';
                "Cell Phone Number":='';
                "Work Phone Number":='';
                "Ext.":='';
                "E-Mail":='';
                "ID Number":='';

                "Country Code":='';
                "Fax Number":='';

                "First Language (R/W/S)":='';
                //"Driving Licence":=Employee."Has Driving Licence";

                "Health Assesment Date":=0D;
                "Date Of Birth":=0D;
                Age:='';
                "Second Language (R/W/S)":='';
                "Additional Language":='';
                "Postal Address2":='';
                "Postal Address3":='';
                "Residential Address2":='';
                "Residential Address3":='';
                "Post Code2":='';
                Citizenship:='';
                "Passport Number":='';
                "First Language Read":=FALSE;
                "First Language Write":=FALSE;
                "First Language Speak":=FALSE;
                "Second Language Read":=FALSE;
                "Second Language Write":=FALSE;
                "Second Language Speak":=FALSE;
                "PIN Number":='';

                "Applicant Type":="Applicant Type"::External;
                MODIFY;

                //DELETE QUALIFICATIONS PREVIOUSLY COPIED
                AppQualifications.RESET;
                AppQualifications.SETRANGE(AppQualifications."Application No","Application No");
                IF AppQualifications.FIND('-') THEN
                AppQualifications.DELETEALL;

                //DELETE APPLICANT REFEREES
                AppRefferees.RESET;
                AppRefferees.SETRANGE(AppRefferees."Job Application No","Application No");
                IF AppRefferees.FIND('-') THEN
                AppRefferees.DELETEALL;

                //DELETE APPLICANT HOBBIES
                AppHobbies.RESET;
                AppHobbies.SETRANGE(AppHobbies."Job Application No","Application No");
                IF AppHobbies.FIND('-') THEN
                AppHobbies.DELETEALL;

                END;
                */

            end;
        }
        field(67; "Applicant Type"; Option)
        {
            OptionCaption = ' ,External,Internal';
            OptionMembers = " ",External,Internal;
            Caption = 'Applicant Type';
        }
        field(68; "Interview Invitation Sent"; Boolean)
        {
            Editable = false;
            Caption = 'Interview Invitation Sent';
        }
        field(69; "Date Applied"; Date)
        {
            Caption = 'Date Applied';
        }
        field(70; "Citizenship Details"; Text[60])
        {
            Caption = 'Citizenship Details';
        }
        field(71; Expatriate; Boolean)
        {
            Caption = 'Expatriate';
        }
        field(72; "Total Score After Interview"; Decimal)
        {
            CalcFormula = sum("HR Job Interview".Score where("Applicant No" = field("Job Application No.")));
            FieldClass = FlowField;
            Caption = 'Total Score After Interview';
            Editable = false;
        }
        field(73; "Total Score After Shortlisting"; Decimal)
        {
            Caption = 'Total Score After Shortlisting';
        }
        field(74; "Date of Interview"; Date)
        {
            Caption = 'Date of Interview';
        }
        field(75; "From Time"; Time)
        {
            Caption = 'From Time';
        }
        field(76; "To Time"; Time)
        {
            Caption = 'To Time';
        }
        field(77; Venue; Text[100])
        {
            Caption = 'Venue';
        }
        field(78; "Job Applied for Description"; Text[100])
        {
            CalcFormula = lookup("HR Jobs"."Job Description" where("Job ID" = field("Job Applied For")));
            FieldClass = FlowField;
            Caption = 'Job Applied for Description';
            Editable = false;
        }
        field(79; "Regret Notice Sent"; Boolean)
        {
            Caption = 'Regret Notice Sent';
        }
        field(80; "Interview Type"; Option)
        {
            OptionCaption = 'Writen,Practicals,Oral';
            OptionMembers = Writen,Practicals,Oral;
            Caption = 'Interview Type';
        }
        field(81; Uploaded; Boolean)
        {
            Caption = 'Uploaded';
        }
        field(82; "Full Name"; Text[100])
        {
            Caption = 'Full Name';
        }
        field(83; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility Center BR NEW".Code;
            Caption = 'Responsibility Center';
        }
        field(84; "Approval Status"; Option)
        {
            OptionMembers = New,"Pending Approval",Approved;
            Caption = 'Approval Status';
        }
        field(85; "County Of Birth"; Code[100])
        {
            Caption = 'County Of Birth';
        }
        field(86; "County Of Residence"; Code[100])
        {
            Caption = 'County Of Residence';
        }
        field(87; Tribe; Code[100])
        {
            Caption = 'Tribe';
        }
        field(88; "Physically Challenged?"; Text[30])
        {
            Caption = 'Physically Challenged?';
        }
        field(89; "Physically Challenged Descript"; Text[250])
        {
            Caption = 'Physically Challenged Descript';
        }
        field(90; "Additional Read"; Boolean)
        {
            Caption = 'Additional Read';
        }
        field(91; "Additional Write"; Boolean)
        {
            Caption = 'Additional Write';
        }
        field(92; "Additional Speak"; Boolean)
        {
            Caption = 'Additional Speak';
        }
        field(93; "Alternative Contacts"; Text[50])
        {
            Caption = 'Alternative Contacts';
        }
        field(94; "Relative Who Work?"; Boolean)
        {
            Caption = 'Relative Who Work?';
        }
        field(95; "Relative Relation"; Text[50])
        {
            Caption = 'Relative Relation';
        }
        field(96; ReApplied; Boolean)
        {
            Caption = 'ReApplied';
        }
        field(100; "Postal Code"; Text[30])
        {
            Caption = 'Postal Code';
        }
        field(101; "Disability CertNo"; Text[50])
        {
            Caption = 'Disability CertNo';
        }
        field(102; "Employee Nos"; Code[30])
        {
            Caption = 'Employee Nos';
        }
        field(103; "Candidate No."; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Applicant;

            trigger OnValidate()
            var
                Applicant: Record Applicant;
            begin
                if Applicant.Get("Candidate No.") then begin
                    "First Name" := Applicant."First Name";
                    "Middle Name" := Applicant."Middle Name";
                    "E-Mail" := Applicant."E-Mail";
                    "Last Name" := Applicant."Last Name";
                    Rec."Full Name" := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";
                    "Postal Address" := Applicant.Address;
                    //"Country/Region Code" := Applicant."Country/Region Code";
                    "Date Of Birth" := Applicant."Birth Date";
                    "Post Code" := Applicant."Post Code";
                    City := Applicant.City;
                    "Additional Language" := Applicant."Ethnic Group";
                    Gender := Applicant.Gender;
                    "Marital Status" := Applicant."Marital Status";
                    "Cell Phone Number" := Applicant."Mobile Phone No.";
                    "Home Phone Number" := Applicant."Phone No.";
                    "County of Birth" := Applicant."County of Birth";
                end;
            end;
        }
    }

    keys
    {
        key(Key1; "Job Application No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        //GENERATE NEW NUMBER FOR THE DOCUMENT
        if "Job Application No." = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Job Application Nos");
            NoSeriesMgt.InitSeries(HRSetup."Job Application Nos", xRec."No. Series", 0D, "Job Application No.", "No. Series");
        end;

        "Date Applied" := Today;
        //Age:=TODAY-"Date Of Birth";
    end;

    var
        HREmpReq: Record "HR Employee Requisitions";
        Employee: Record "HR Employees";
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        EmpQualifications: Record "HR Employee Qualifications";
        AppQualifications: Record "HR Applicant Qualifications";
        AppRefferees: Record "HR Applicant Referees";
        AppHobbies: Record "HR Applicant Hobbies";
        HRJobApp: Record "HR Job Applications";
        Country: Record "Country/Region";


    procedure FullName(): Text[100]
    begin
        if "Middle Name" = '' then
            exit("First Name" + ' ' + "Last Name")
        else
            exit("First Name" + ' ' + "Middle Name" + ' ' + "Last Name");
    end;

    local procedure fn_FullName()
    begin
        "Full Name" := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";
    end;
}
