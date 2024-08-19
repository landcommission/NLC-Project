table 50007 "HR Employee Staff Changes"
{
    Caption = 'HR Employees Staff Changes';
    DataCaptionFields = "No.", "Full Name", "Job Title";
    DataClassification = CustomerContent;
    DrillDownPageId = "Hr Staff Changes List";
    LookupPageId = "Hr Staff Changes List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            trigger OnValidate()
            var
                NewStr: Code[20];
            begin
                if "No." <> xRec."No." then begin
                    HrSetup.Get();
                    NoSeriesMgt.TestManual(HrSetup."Staff Emp Changes");
                    "No. Series" := '';
                end;
            end;
        }
        field(500; "Employee No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Employees"."No.";

            trigger OnValidate()
            var
                myInt: Integer;
                HrEmpRec: Record "HR Employees";
                HRChnages: Record "HR Employee Staff Changes";
                HRChnge: Integer;
            begin
                HRChnages.Reset();
                HRChnages.SetRange("Employee No", Rec."Employee No");
                HRChnages.SetFilter("Approval Status", '<>%1', HRChnages."Approval Status"::Approved);
                if HRChnages.FindFirst() then begin
                    HRChnge := HRChnages.Count;
                    if HRChnge >= 1 then
                        Error('kindly make use of changes card %1', HRChnages."No.");
                end;

                rec."Captured By" := UserId;
                HrEmpRec.Reset();
                HrEmpRec.SetRange("No.", rec."Employee No");
                if HrEmpRec.FindFirst() then begin
                    HrEmpRec.CalcFields(Picture);
                    Rec."First Name" := HrEmpRec."First Name";
                    Rec."Middle Name" := HrEmpRec."Middle Name";
                    rec."Last Name" := HrEmpRec."Last Name";
                    rec.Validate("Last Name");
                    rec.Status := HrEmpRec.Status;
                    rec."Postal Address" := HrEmpRec."Postal Address";
                    rec."Passport Number" := HrEmpRec."Passport Number";
                    rec."Last Date Modified" := HrEmpRec."Last Date Modified";
                    Rec."Date Of Birth" := HrEmpRec."Date Of Birth";
                    Rec."Account Type" := HrEmpRec."Account Type";
                    Rec."ID Number" := HrEmpRec."ID Number";
                    Rec."Branch Bank" := HrEmpRec."Branch Bank";
                    rec."If Acted?" := HrEmpRec."If Acted?";
                    rec."Cell Phone Number" := HrEmpRec."Cell Phone Number";
                    rec.Citizenship := HrEmpRec.Citizenship;
                    Rec."Contract Type" := HrEmpRec."Contract Type";
                    rec."Job ID" := HrEmpRec."Job ID";
                    rec."E-Mail" := HrEmpRec."E-Mail";
                    rec."Company E-Mail" := HrEmpRec."Company E-Mail";
                    Rec."Job Title" := HrEmpRec."Job Title";
                    rec."Current Duty Station" := HrEmpRec."Current Duty Station";
                    rec."Marital Status" := HrEmpRec."Marital Status";
                    Rec."Ethnic Origin" := HrEmpRec."Ethnic Origin";
                    Rec.Ethnicity := HrEmpRec.Ethnicity;
                    HrEmpRec.CalcFields(Picture);
                    Rec.Picture := HrEmpRec.Picture;
                    rec."Commisioner?" := HrEmpRec."Commisioner?";
                    rec."Home District" := HrEmpRec."Home District";
                    Rec."Home Phone Number" := HrEmpRec."Home Phone Number";
                    Rec.County := HrEmpRec.County;
                    REC.Grade := HrEmpRec.Grade;
                    rec.Gender := HrEmpRec.Gender;
                    Rec."County Name" := HrEmpRec."County Name";
                    Rec."Global Dimension 1 Code" := HrEmpRec."Global Dimension 1 Code";
                    Rec."Global Dimension 2 Code" := HrEmpRec."Global Dimension 2 Code";
                    rec.Title := HrEmpRec.Title;
                    Rec."Job ID" := HrEmpRec."Job ID";
                    rec.City := HrEmpRec.City;
                    rec.Disabled := HrEmpRec.Disabled;
                    rec."Disabling Details" := HrEmpRec."Disabling Details";
                    rec."Disability Grade" := HrEmpRec."Disability Grade";
                    Rec.Location := HrEmpRec.Location;
                    Rec."Sub Location" := HrEmpRec."Sub Location";
                    Rec.Division := HrEmpRec.Division;
                    Rec."User ID" := HrEmpRec."User ID";
                    Rec."Employee Type Primary" := HrEmpRec."Employee Type Primary";
                    Rec."Employee Type" := HrEmpRec."Employee Type";
                    rec."Post Code" := HrEmpRec."Post Code";
                    Rec."Responsibility Center" := HrEmpRec."Responsibility Center";
                    Rec."Department Name" := HrEmpRec."Department Name";
                    Rec."Global Dimension 1 Code" := HrEmpRec."Global Dimension 1 Code";
                    rec."Global Dimension 2 Code" := HrEmpRec."Global Dimension 2 Code";
                    Rec."Highest level" := HrEmpRec."Highest level";
                    Rec.Validate("Highest level");
                    rec."Date Of Birth" := HrEmpRec."Date Of Birth";
                    Rec."Contract Duration" := HrEmpRec."Contract Duration";
                    Rec."Contract Start Date" := HrEmpRec."Contract Start Date";
                    rec."Contracted Hours" := HrEmpRec."Contracted Hours";
                    rec."Date Of Joining the Company" := HrEmpRec."Date Of Joining the Company";
                    Rec."Date Of Leaving" := HrEmpRec."Date Of Leaving";
                    GetNextofkin();
                end;

            end;
        }
        field(2; "First Name"; Text[30])
        {
            Caption = 'First Name';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                fn_FullName();

            end;
        }
        field(3; "Middle Name"; Text[50])
        {
            Caption = 'Middle Name';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                fn_FullName();

            end;

        }
        field(4; "Last Name"; Text[50])
        {
            Caption = 'Last Name';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                fn_FullName();

            end;
        }
        field(5; Initials; Text[15])
        {
            Caption = 'Initials';
        }
        field(7; "Full Name"; Text[60])
        {
            Caption = 'Full Name';
        }
        field(8; "Postal Address"; Text[50])
        {
            Caption = 'Postal Address';
        }
        field(9; "Residential Address"; Text[50])
        {
            Caption = 'Residential Address';
        }
        field(10; City; Text[30])
        {
            Caption = 'City';
        }
        field(11; "Post Code"; Code[20])
        {
            TableRelation = "Post Code";
        }
        field(12; County; Code[30])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Caption = 'Workstation';
            trigger OnValidate()
            var
                myInt: Integer;
                Dimensi: Record "Dimension Value";
            begin
                Dimensi.Reset();
                Dimensi.SetRange(Code, rec.County);
                if Dimensi.FindFirst() then
                    rec."County Name" := Dimensi.Name;
            end;
        }
        field(13; "Home Phone Number"; Text[30])
        {
            Caption = 'Home Phone Number';
        }
        field(14; "Cellular Phone Number"; Text[30])
        {
            Caption = 'Cellular Phone Number';
        }
        field(15; "Work Phone Number"; Text[30])
        {
            Caption = 'Work Phone Number';
        }
        field(16; "Ext."; Text[7])
        {
            Caption = 'Ext.';
        }
        field(17; "E-Mail"; Text[30])
        {
            ExtendedDatatype = EMail;
            Caption = 'E-Mail';
        }
        field(19; Picture; Blob)
        {
            Subtype = Bitmap;
            Caption = 'Picture';
        }
        field(21; "ID Number"; Code[20])
        {
            Caption = 'ID Number';

        }
        field(22; "Union Code"; Code[10])
        {
            TableRelation = Union;
            Caption = 'Union Code';
        }
        field(23; "UIF Number"; Text[10])
        {
            Caption = 'UIF Number';
        }
        field(24; Gender; Option)
        {
            OptionMembers = " ",Male,Female;
            Caption = 'Gender';
        }
        field(25; "Country Code"; Code[10])
        {
            TableRelation = "Country/Region";
            Caption = 'Country Code';
        }
        field(28; "Statistics Group Code"; Code[10])
        {
            TableRelation = "Employee Statistics Group";
            Caption = 'Statistics Group Code';
        }
        field(31; Status; Option)
        {
            Editable = true;
            OptionMembers = Active,Inactive,New,"Pending Approval",Rejected;
            Caption = 'Status';
            trigger OnValidate()
            begin
                //Delete payroll transactions for open period in the table
                // PRPayrollPeriod.Reset();
                // PRPayrollPeriod.SetRange(PRPayrollPeriod.Closed, false);
                // if PRPayrollPeriod.Find('-') then begin
                //     PRPeriodTrans.Reset();
                //     PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "No.");
                //     PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PRPayrollPeriod."Date Opened");
                //     if PRPeriodTrans.Find('-') then
                //         if Confirm(Text0005, false, "No.", UpperCase("Full Name"), PRPeriodTrans."Payroll Period") = false then
                //             Error('Process Aborted')
                //         else begin
                //             PRPeriodTrans.DeleteAll(true);
                //             Message('Process Complete');
                //         end;
                // end;

            end;
        }

        // field(36; "Department Code"; Code[20])
        // {
        //     Caption = 'Department Code';
        //     trigger OnValidate()
        //     begin
        //         if SalCard.Get("No.") then begin
        //             SalCard."Mobile Number" := "Department Code";
        //             SalCard.Modify();
        //         end;
        //     end;
        // }
        field(37; Office; Code[20])
        {
            Description = 'Dimension 2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          "Dimension Value Type" = const(Standard));
            Caption = 'Office';
        }

        field(39; Comment; Boolean)
        {

            Caption = 'Comment';
        }
        field(40; "Last Date Modified"; Date)
        {
            Editable = false;
            Caption = 'Last Date Modified';
        }
        field(51; Title; Option)
        {
            OptionCaption = ',MR,MRS,MISS,MS,DR, ENG.,CC,Prof';
            OptionMembers = ,MR,MRS,MISS,MS,DR," ENG.",CC,Prof;
            Caption = 'Title';
        }

        field(53; "No. Series"; Code[10])
        {
            Editable = false;
            TableRelation = "No. Series";
            Caption = 'No. Series';
        }

        field(55; Position; Text[30])
        {
            Caption = 'Position';
        }
        field(57; "Full / Part Time"; Option)
        {
            OptionMembers = " ","Full Time"," Part Time",Contract;
            Caption = 'Full / Part Time';
        }
        field(58; "Contract Type"; Option)
        {
            OptionMembers = " ",Contract,Deployed,"Seconded/Contract",Intern,Casuals,"Permanent and Pensionable",Probation;
            Caption = 'Contract Type';

        }
        field(59; "Contract End Date"; Date)
        {
            Caption = 'Contract End Date';
        }
        field(60; "Notice Period"; Code[10])
        {
            Caption = 'Notice Period';
        }
        field(61; "Union Member?"; Boolean)
        {
            Caption = 'Union Member?';
        }
        field(62; "Shift Worker?"; Boolean)
        {
            Caption = 'Shift Worker?';
        }
        field(63; "Contracted Hours"; Decimal)
        {
            Caption = 'Contracted Hours';
        }
        field(64; "Pay Period"; Option)
        {
            OptionMembers = Weekly,"2 Weekly","4 Weekly",Monthly," ";
            Caption = 'Pay Period';
        }
        field(65; "Pay Per Period"; Decimal)
        {
            Caption = 'Pay Per Period';
        }
        field(66; "Cost Code"; Code[20])
        {
            Caption = 'Cost Code';
        }
        field(68; "Secondment Institution"; Text[30])
        {
            Caption = 'Secondment Institution';
        }
        field(69; "UIF Contributor?"; Boolean)
        {
            Caption = 'UIF Contributor?';
        }
        field(73; "Marital Status"; Option)
        {
            OptionMembers = " ",Single,Married,Separated,Divorced,"Widow(er)",Other;
            Caption = 'Marital Status';
        }
        field(74; "Ethnic Origin"; Option)
        {
            OptionMembers = African,Indian,White,Coloured;
            Caption = 'Ethnic Origin';
        }
        field(75; "First Language (R/W/S)"; Code[10])
        {
            Caption = 'First Language (R/W/S)';
        }
        field(76; "Driving Licence"; Code[10])
        {
            Caption = 'Driving Licence';
        }
        field(77; "Vehicle Registration Number"; Code[10])
        {
            Caption = 'Vehicle Registration Number';
        }
        field(78; Disabled; Option)
        {
            Caption = 'PWD';
            OptionMembers = No,Yes," ";

            trigger OnValidate()
            begin
                "Retirement date" := 0D;
                if Disabled = Disabled::Yes then
                    if "Date Of Birth" <> 0D then
                        "Retirement date" := CalcDate('65Y', "Date Of Birth");
            end;
        }
        field(79; "Health Assesment?"; Boolean)
        {
            Caption = 'Health Assesment?';
        }
        field(80; "Health Assesment Date"; Date)
        {
            Caption = 'Health Assesment Date';
        }
        field(81; "Date Of Birth"; Date)
        {
            Caption = 'Date Of Birth';
            trigger OnValidate()
            var
                myInt: Integer;
            begin


            end;

        }
        field(82; Age; Text[10])
        {
            Caption = 'Age';
        }
        field(83; "Date Of Join"; Date)
        {
            Caption = 'Date Of Join';
        }
        field(84; "Length Of Service"; Text[80])
        {
            Caption = 'Length Of Service';
        }
        field(85; "End Of Probation Date"; Date)
        {
            Caption = 'End Of Probation Date';
        }
        field(86; "Pension Scheme Join"; Date)
        {
            Caption = 'Pension Scheme Join';
        }
        field(87; "Time Pension Scheme"; Text[20])
        {
            Caption = 'Time Pension Scheme';
        }
        field(88; "Medical Scheme Join"; Date)
        {
            Caption = 'Medical Scheme Join';
        }
        field(89; "Time Medical Scheme"; Text[20])
        {
            Caption = 'Time Medical Scheme';
            //This property is currently not supported
            //TestTableRelation = true;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = true;
        }
        field(90; "Date Of Leaving"; Date)
        {
            Caption = 'Date Of Leaving';
            trigger OnValidate()
            begin

                if "Termination Grounds" = 0 then
                    Error('Kindly Enter Reason for Leaving');
            end;
        }
        field(95; "Per Annum"; Decimal)
        {
            Caption = 'Per Annum';
        }
        field(96; "Allow Overtime"; Option)
        {
            OptionMembers = Yes,No," ";
            Caption = 'Allow Overtime';
        }
        field(97; "Medical Scheme No."; Text[30])
        {
            Caption = 'Medical Scheme No.';

        }
        field(98; "Medical Scheme Head Member"; Text[30])
        {
            Caption = 'Medical Scheme Head Member';

        }
        field(99; "Number Of Dependants"; Integer)
        {
            Caption = 'Number Of Dependants';

        }
        field(100; "Medical Scheme Name"; Text[20])
        {
            Caption = 'Medical Scheme Name';

        }
        field(101; "Amount Paid By Employee"; Decimal)
        {
            Caption = 'Amount Paid By Employee';

        }
        field(102; "Amount Paid By Company"; Decimal)
        {
            Caption = 'Amount Paid By Company';

        }
        field(103; "Receiving Car Allowance ?"; Boolean)
        {
            Caption = 'Receiving Car Allowance ?';
        }
        field(104; "Second Language (R/W/S)"; Code[10])
        {
            Caption = 'Second Language (R/W/S)';
        }
        field(105; "Additional Language"; Code[10])
        {
            Caption = 'Additional Language';
        }
        field(106; "Cell Phone Reimbursement?"; Boolean)
        {
            Caption = 'Cell Phone Reimbursement?';
        }
        field(107; "Amount Reimbursed"; Decimal)
        {
            Caption = 'Amount Reimbursed';
        }
        field(108; "UIF Country"; Code[10])
        {
            TableRelation = "Country/Region".Code;
            Caption = 'UIF Country';
        }
        field(109; "Direct/Indirect"; Option)
        {
            OptionMembers = Direct,Indirect;
            Caption = 'Direct/Indirect';
        }
        field(110; "Primary Skills Category"; Option)
        {
            OptionMembers = Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
            Caption = 'Primary Skills Category';
        }
        field(111; Level; Option)
        {
            OptionMembers = " ","Level 1","Level 2","Level 3","Level 4","Level 5","Level 6","Level 7";
            Caption = 'Level';
        }
        field(112; "Termination Category"; Option)
        {
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Death,Other;
            Caption = 'Termination Category';

        }
        field(113; "Job ID"; Code[30])
        {
            Description = 'To put description on Job title field';
            TableRelation = "HR Jobs"."Job ID";
            Caption = 'Job ID';
            trigger OnValidate()
            begin
                objJobs.Reset();
                objJobs.SetRange(objJobs."Job ID", "Job ID");
                if objJobs.Find('-') then
                    "Job Title" := objJobs."Job Description";
            end;
        }
        field(114; DateOfBirth; Date)
        {
            Caption = 'DateOfBirth';
            trigger OnValidate()
            begin
                //calculate age 02-05-1988
                yTODAY := Date2DMY(Today, 3); //2014

                yDOB := Date2DMY("Date Of Birth", 3);
                dDOB := Date2DMY("Date Of Birth", 1);
                mDOB := Date2DMY("Date Of Birth", 2);

                AppAge := yTODAY - yDOB;

                //calculate how many years remaining for this employee to retire : ret yr is 65
                noYrsToRetirement := 60 - AppAge;

                //add noYrsToRetirement to current year to get retirement year da
                RetirementYear := yTODAY + noYrsToRetirement;
                //ERROR(FORMAT(RetirementYear));
                RetirementDate := DMY2Date(dDOB, mDOB, RetirementYear);
                "Retirement date" := RetirementDate;
                // END ELSE
                // //IF HREmp.Disabled= HREmp.Disabled::Yes THEN
                ////calculate how many years remaining for this employee to retire : ret yr is 60
                //noYrsToRetirement:=70 - AppAge;

                ////add noYrsToRetirement to current year to get retirement year da
                //RetirementYear:= yTODAY + noYrsToRetirement;
                ////ERROR(FORMAT(RetirementYear));
                //RetirementDate:=DMY2DATE(dDOB,mDOB,RetirementYear);
                //"Retirement date":=RetirementDate;
                //END;
                //END;
            end;
        }
        field(115; DateEngaged; Text[8])
        {
            Caption = 'DateEngaged';
        }
        field(119; "Residential Address3"; Text[20])
        {
            Caption = 'Residential Address3';
        }
        field(120; "Post Code2"; Code[20])
        {
            TableRelation = "Post Code";
            Caption = 'Post Code2';
        }
        field(121; Citizenship; Code[10])
        {
            TableRelation = "Country/Region".Code;
            Caption = 'Citizenship';
        }
        field(122; "Name Of Manager"; Text[45])
        {
            Caption = 'Name Of Manager';
        }
        field(123; "User ID"; Code[60])
        {
            TableRelation = "User Setup"."User ID";
            Caption = 'User ID';
            trigger OnValidate()
            var
                myInt: Integer;
                hrEmplrec: Record "HR Employees";
            begin
                hrEmplrec.Reset();
                hrEmplrec.SetRange(hrEmplrec."User ID", Rec."User ID");
                hrEmplrec.SetFilter(hrEmplrec."No.", '<>%1', rec."Employee No");
                if hrEmplrec.FindFirst() then
                    Error('Employee with membership no. %1  is using the user id', hrEmplrec."No.");
            end;
        }
        field(124; "Disabling Details"; Text[30])
        {
            Caption = 'Disabling Details';
        }
        field(125; "Disability Grade"; Text[30])
        {
            Caption = 'Disability Grade';
        }
        field(126; "Passport Number"; Text[30])
        {
            Caption = 'Passport Number';
        }
        field(131; Region; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('REGION'));
            Caption = 'Region';
        }

        field(134; "Employee Qty"; Integer)
        {
            CalcFormula = count("HR Employees");
            FieldClass = FlowField;
            Caption = 'Employee Qty';
            Editable = false;
        }

        field(137; "Contract Location"; Text[10])
        {
            Description = 'Location where contract was closed';
            Caption = 'Contract Location';
        }
        field(145; "PIN No."; Code[20])
        {
            Caption = 'PIN No.';
        }
        field(146; "NSSF No."; Code[20])
        {
            Caption = 'NSSF No.';
        }
        field(147; "NHIF No."; Code[20])
        {
            Caption = 'NHIF No.';
        }
        field(148; "Cause of Inactivity Code"; Code[10])
        {
            Caption = 'Cause of Inactivity Code';
            TableRelation = "Cause of Inactivity";
        }
        field(150; "Sacco Staff No"; Code[20])
        {
            Caption = 'Sacco Staff No';
        }
        field(151; "Period Filter"; Date)
        {
            Caption = 'Period Filter';
        }
        field(152; "HELB No"; Text[10])
        {
            Caption = 'HELB No';
        }
        field(153; "Co-Operative No"; Text[30])
        {
            Caption = 'Co-Operative No';
        }
        field(154; "Wedding Anniversary"; Date)
        {
            Caption = 'Wedding Anniversary';
        }
        field(156; "Competency Area"; Code[20])
        {
            FieldClass = FlowFilter;
            Caption = 'Competency Area';
        }
        field(157; "Cost Center Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          "Dimension Value Type" = const(Standard));
            Caption = 'Cost Center Code';
            trigger OnValidate()
            begin
                if SalCard.Get("Employee No") then begin
                    SalCard.Nationality := "Cost Center Code";
                    SalCard.Modify();
                end;
            end;
        }
        field(158; "Position To Succeed"; Code[20])
        {
            Caption = 'Position To Succeed';
        }
        field(159; "Succesion Date"; Date)
        {
            Caption = 'Succesion Date';
        }
        field(160; "Send Alert to"; Code[15])
        {
            Caption = 'Send Alert to';
        }
        field(161; Tribe; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = filter(Tribe));
            Caption = 'Tribe';
        }
        field(162; Religion; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = filter(Religion));
            Caption = 'Religion';
        }
        field(163; "Job Title"; Text[50])
        {
            Editable = false;
            Caption = 'Job Title';
        }
        field(164; "Post Office No"; Text[20])
        {
            Caption = 'Post Office No';
        }
        field(165; "Posting Group"; Code[20])
        {
            NotBlank = false;
            TableRelation = "prEmployee Posting Group".Code;
            Caption = 'Posting Group';
        }
        field(166; "Payroll Posting Group"; Code[20])
        {
            Caption = 'Payroll Posting Group';
        }
        field(167; "Served Notice Period"; Boolean)
        {
            Caption = 'Served Notice Period';
        }
        field(168; "Exit Interview Date"; Date)
        {
            Caption = 'Exit Interview Date';
        }
        field(169; "Exit Interview Done by"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Exit Interview Done by';
        }
        field(170; "Allow Re-Employment In Future"; Boolean)
        {
            Caption = 'Allow Re-Employment In Future';
        }
        field(171; "Medical Scheme Name #2"; Text[30])
        {
            Caption = 'Medical Scheme Name #2';

        }
        field(172; "Resignation Date"; Date)
        {
            Caption = 'Resignation Date';
        }
        field(173; "Suspension Date"; Date)
        {
            Caption = 'Suspension Date';
        }
        field(174; "Demised Date"; Date)
        {
            Caption = 'Demised Date';
        }
        field(175; "Retirement date"; Date)
        {
            Caption = 'Retirement date';
            trigger OnValidate()
            begin
                // yTODAY := Date2DMY(Today, 3); //2014
                // yDOB := Date2DMY("Date Of Birth", 3);
                // dDOB := Date2DMY("Date Of Birth", 1);
                // mDOB := Date2DMY("Date Of Birth", 2);

                // AppAge := yTODAY - yDOB;
            end;
        }
        field(176; "Retrenchment date"; Date)
        {
            Caption = 'Retrenchment date';
        }
        field(177; Campus; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('CAMPUS'));
            Caption = 'Campus';
        }
        field(178; Permanent; Boolean)
        {
            Caption = 'Permanent';
        }
        field(179; "Library Category"; Option)
        {
            OptionMembers = "ADMIN STAFF","TEACHING STAFF",DIRECTORS;
            Caption = 'Library Category';
        }
        field(180; Category; Code[20])
        {
            Caption = 'Category';
        }
        field(181; "Payroll Departments"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
            Caption = 'Payroll Departments';
        }
        field(188; "Salary Grade"; Code[20])
        {
            Caption = 'Salary Grade';
            //TableRelation = "Payment Terms".Field1396040;
        }
        field(189; "Company Type"; Option)
        {
            OptionCaption = 'Others,USAID';
            OptionMembers = Others,USAID;
            Caption = 'Company Type';
        }
        field(190; "Main Bank"; Code[20])
        {
            TableRelation = "PR Bank Accounts"."Bank Code";
            Caption = 'Main Bank';
        }
        field(191; "Branch Bank"; Code[20])
        {
            TableRelation = "PR Bank Accounts"."Bank Name";
            Caption = 'Branch Bank';
        }
        field(192; "Lock Bank Details"; Boolean)
        {
            Caption = 'Lock Bank Details';
        }
        field(193; "Bank Account Number"; Code[20])
        {
            Caption = 'Bank Account Number';
        }
        field(195; "Payroll Code"; Code[20])
        {
            Caption = 'Payroll Code';
        }
        field(196; "Holiday Days Entitlement"; Decimal)
        {
            Caption = 'Holiday Days Entitlement';
        }
        field(197; "Holiday Days Used"; Decimal)
        {
            Caption = 'Holiday Days Used';
        }
        field(198; "Payment Mode"; Option)
        {
            Description = 'Bank Transfer,Cheque,Cash,SACCO';
            OptionMembers = " ","Bank Transfer",Cheque,Cash,FOSA;
            Caption = 'Payment Mode';
        }
        field(199; "Hourly Rate"; Decimal)
        {
            Caption = 'Hourly Rate';
        }
        field(200; "Daily Rate"; Decimal)
        {
            Caption = 'Daily Rate';
        }
        field(300; "Social Security No."; Code[20])
        {
            Caption = 'Social Security No.';
        }
        field(301; "Pension House"; Code[20])
        {
            TableRelation = "prInstitutional Membership"."Institution No" where("Group No" = const('PENSION'));
            Caption = 'Pension House';
        }

        field(304; "Previous Month Filter"; Date)
        {
            FieldClass = FlowFilter;
            Caption = 'Previous Month Filter';
        }
        field(305; "Current Month Filter"; Date)
        {
            FieldClass = FlowFilter;
            Caption = 'Current Month Filter';
        }
        field(306; "Prev. Basic Pay"; Decimal)
        {
            FieldClass = Normal;
            Caption = 'Prev. Basic Pay';
        }
        field(307; "Curr. Basic Pay"; Decimal)
        {
            FieldClass = Normal;
            Caption = 'Curr. Basic Pay';
        }
        field(308; "Prev. Gross Pay"; Decimal)
        {
            FieldClass = Normal;
            Caption = 'Prev. Gross Pay';
        }
        field(309; "Curr. Gross Pay"; Decimal)
        {
            FieldClass = Normal;
            Caption = 'Curr. Gross Pay';
        }
        field(310; "Gross Income Variation"; Decimal)
        {
            FieldClass = Normal;
            Caption = 'Gross Income Variation';
        }
        field(311; "Basic Pay 2"; Decimal)
        {
            Editable = false;
            Caption = 'Basic Pay 2';
        }
        field(312; "Net Pay"; Decimal)
        {
            Caption = 'Net Pay';
        }
        field(313; "Transaction Amount"; Decimal)
        {
            Caption = 'Transaction Amount';
        }
        field(314; "Transaction Code Filter"; Text[30])
        {
            FieldClass = FlowFilter;
            TableRelation = "Bank Bal. Alert Buffer"."Line No.";
            Caption = 'Transaction Code Filter';
        }
        field(317; "Account Type"; Option)
        {
            OptionCaption = ' ,Savings,Current';
            OptionMembers = " ",Savings,Current;
            Caption = 'Account Type';
        }

        field(323; "Payroll Type"; Option)
        {
            Description = 'General,Consultants,Seconded Staff';
            OptionCaption = 'General,Consultants,Seconded Staff';
            OptionMembers = General,Consultants,"Seconded Staff";
            Caption = 'Payroll Type';
        }
        field(324; "Employee Classification"; Code[20])
        {
            Description = 'Service';
            TableRelation = "Employee Class".Code;
            Caption = 'Employee Classification';
        }
        field(328; "Department Name"; Text[50])
        {
            // CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 2 Code")));
            // FieldClass = FlowField;
            Caption = 'Department Name';
            Editable = false;
        }
        field(329; "County Name"; Text[50])
        {
            // CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 1 Code")));
            // FieldClass = FlowField;
            Caption = 'Workstation Name';
            Editable = false;
        }
        field(2004; "Total Leave Taken"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Staff No." = field("Employee No"),
                                                                             "Leave Entry Type" = const(Negative),
                                                                             Closed = const(false),
                                                                             "Leave Type" = const('ANNUAL'),
                                                                             "Posting Date" = filter('07/05/23..06/30/24'),
                                                                             "Leave Calendar Code" = const('2023/2024'),
                                                                             "Journal Batch Name" = const('POSITIVE')));
            DecimalPlaces = 2 : 2;
            FieldClass = FlowField;
            Caption = 'Total Leave Taken';
            Editable = false;
        }
        field(2006; "Total (Leave Days)"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            Editable = false;
            Caption = 'Total (Leave Days)';
        }
        field(2007; "Cash - Leave Earned"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            Caption = 'Cash - Leave Earned';
        }
        field(2008; "Reimbursed Leave Days"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Staff No." = field("Employee No"),
                                                                             "Posting Date" = filter('07/05/23..06/30/24'),
                                                                             Closed = const(false),
                                                                             "Leave Entry Type" = const(Positive),
                                                                             "Leave Type" = const('ANNUAL'),
                                                                             "Document No." = const('LV2023/2024'),
                                                                             "Leave Calendar Code" = const('2023/2024'),
                                                                             "Leave Posting Description" = const('Carry Forward Days on07/04/23')));
            DecimalPlaces = 2 : 2;
            FieldClass = FlowField;
            Caption = 'Reimbursed Leave Days';
            Editable = false;
            trigger OnValidate()
            begin
                Validate("Allocated Leave Days");
            end;
        }
        field(2009; "Cash per Leave Day"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            Caption = 'Cash per Leave Day';
        }
        field(2023; "Allocated Leave Days"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Staff No." = field("Employee No"),
                                                                             "Posting Date" = filter('07/05/23..06/30/24'),
                                                                             Closed = const(false),
                                                                             "Leave Entry Type" = const(Positive),
                                                                             "Leave Type" = const('ANNUAL'),
                                                                             "Document No." = const('LV2023/2024'),
                                                                             "Leave Calendar Code" = const('2023/2024'),
                                                                             "Leave Posting Type" = const(Normal),
                                                                             "Leave Posting Description" = const('Leave Allocation on07/04/23')));
            FieldClass = FlowField;
            Caption = 'Allocated Leave Days';
            Editable = false;
            trigger OnValidate()
            begin
                CalcFields("Leave Balance");
                "Leave Balance" := "Total (Leave Days)" - "Total Leave Taken";
            end;
        }
        field(2024; "End of Contract Date"; Date)
        {
            Caption = 'End of Contract Date';
        }
        field(2040; "Leave Period Filter"; Code[20])
        {
            Caption = 'Leave Period Filter';
        }
        field(3899; "Mutliple Bank A/Cs"; Boolean)
        {
            Caption = 'Mutliple Bank A/Cs';
        }
        field(3900; "No. Of Bank A/Cs"; Integer)
        {
            CalcFormula = count("HR Employee Bank Accounts" where("Bank  Code" = filter(<> ''),
                                                                   "Branch Code" = filter(<> ''),
                                                                   "A/C  Number" = filter(<> ''),
                                                                   "Employee Code" = field("Employee No")));
            FieldClass = FlowField;
            Caption = 'No. Of Bank A/Cs';
            Editable = false;
        }
        field(3971; "Annual Leave Account"; Decimal)
        {
            Caption = 'Annual Leave Account';
        }
        field(3972; "Compassionate Leave Acc."; Decimal)
        {
            Caption = 'Compassionate Leave Acc.';
        }
        field(3973; "Maternity Leave Acc."; Decimal)
        {
            Caption = 'Maternity Leave Acc.';
        }
        field(3974; "Paternity Leave Acc."; Decimal)
        {
            Caption = 'Paternity Leave Acc.';
        }
        field(3975; "Sick Leave Acc."; Decimal)
        {
            Caption = 'Sick Leave Acc.';
        }
        field(3976; "Study Leave Acc"; Decimal)
        {
            Caption = 'Study Leave Acc';
        }
        field(3977; "Appraisal Method"; Option)
        {
            OptionCaption = ' ,Normal Appraisal,360 Appraisal';
            OptionMembers = " ","Normal Appraisal","360 Appraisal";
            Caption = 'Appraisal Method';
        }
        field(3978; "Employee Type Primary"; Option)
        {
            OptionMembers = " ",Primary,Secondary,Board;
            Caption = 'Employee Type Primary';
        }
        field(3988; "Leave Type"; Code[20])
        {
            Caption = 'Leave Type';
            //TableRelation = Table39005570.Field1;
        }
        field(3989; "Employee Type"; Option)
        {
            OptionMembers = Normal,Deployed;
            Caption = 'Employee Type';
        }
        field(39003901; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            FieldClass = Normal;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(39003902; "Responsibility Center"; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            Caption = 'Department';
            CaptionClass = '1,1,2';

            trigger OnValidate()
            var
                myInt: Integer;
                Responsblece: Record "Dimension Value";
            begin
                Responsblece.Reset();
                Responsblece.SetRange(Code, Rec."Responsibility Center");
                if Responsblece.FindFirst() then
                    "Department Name" := Responsblece.Name;

            end;
        }
        field(39003903; HR; Boolean)
        {
            Caption = 'HR';
        }
        field(39003904; "Date Of Joining the Company"; Date)
        {
            Caption = 'Date Of Joining the Company';
        }
        field(39003906; "Termination Grounds"; Option)
        {
            OptionCaption = ' ,Resignation,Non-Renewal Of Contract,Dismissal,Retirement,Death,Other';
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Death,Other;
            Caption = 'Termination Grounds';
        }
        field(39003907; "Cell Phone Number"; Text[20])
        {
            ExtendedDatatype = PhoneNo;
            Caption = 'Cell Phone Number';
        }
        field(39003908; Grade; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const(Grade));
            Caption = 'Grade';
        }
        field(39003910; "Leave Balance"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Staff No." = field("Employee No"),
                                                                             Closed = const(false),
                                                                             "Leave Type" = const('ANNUAL'),
                                                                             "Posting Date" = filter('07/05/23..06/30/24')));
            FieldClass = FlowField;
            Caption = 'Leave Balance';
            Editable = false;
        }
        field(39003911; "Leave Status"; Option)
        {
            OptionCaption = ' ,On Leave,Resumed';
            OptionMembers = " ","On Leave",Resumed;
            Caption = 'Leave Status';
        }
        field(39003912; "Pension Scheme Join Date"; Date)
        {
            Caption = 'Pension Scheme Join Date';
        }
        field(39003913; "Medical Scheme Join Date"; Date)
        {
            Caption = 'Medical Scheme Join Date';
        }

        field(39003915; "Acrued Leave Days"; Decimal)
        {
            Caption = 'Acrued Leave Days';
        }
        field(39003916; Supervisor; Boolean)
        {
            Caption = 'Supervisor';
        }
        field(39003918; "Grant/Compliance Officer"; Boolean)
        {
            Caption = 'Grant/Compliance Officer';
        }

        field(39003925; "Basic Pay"; Decimal)
        {
            CalcFormula = lookup("PR Salary Card"."Basic Pay" where("Employee Code" = field("Employee No")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Basic Pay';
        }

        field(39003928; "Commisioner?"; Boolean)
        {
            Caption = 'Commisioner?';
        }
        field(39003929; "No. of Employees"; Integer)
        {
            CalcFormula = count("HR Employees" where("Commisioner?" = const(false)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'No. of Employees';
        }
        field(39003930; "On Leave"; Boolean)
        {
            Caption = 'On Leave';
        }
        field(39003931; "Job Group Range"; Code[20])
        {
            Caption = 'Job Group Range';
        }
        field(39003932; "Contract Duration"; Code[10])
        {
            Caption = 'Contract Duration';
        }
        field(39003934; DPension; Text[40])
        {
            Caption = 'DPension';
        }
        field(39003935; "New Basic Pay"; Decimal)
        {
            Caption = 'New Basic Pay';
        }
        field(39003938; "Passport Expiry Date"; Date)
        {
            Caption = 'Passport Expiry Date';
        }
        field(39003939; "Date of Current Employment"; Date)
        {
            Caption = 'Date of Current Employment';
        }
        field(39003940; "Type of Employee"; Option)
        {
            OptionMembers = Primary,Secondary;
            Caption = 'Type of Employee';
        }
        field(39003941; "Residential status"; Option)
        {
            OptionMembers = Resident,"Non-Resident";
            Caption = 'Residential status';
        }
        field(39003944; "Is Driver"; Boolean)
        {
            Caption = 'Is Driver';
        }
        field(39003945; "Exemption Certificate No."; Code[20])
        {
            Caption = 'Exemption Certificate No.';
        }
        field(39003946; "Stop Pay"; Boolean)
        {
            Caption = 'Stop Pay';
        }
        field(39003947; "Contract Start Date"; Date)
        {
            Caption = 'Contract Start Date';
            trigger OnValidate()
            begin
                "Contract End Date" := 0D;

                if ("Contract Type" = "Contract Type"::Contract) and ("Contract Duration" <> '') then
                    "Contract End Date" := CalcDate("Contract Duration", "Contract Start Date");

                if ("Contract Type" = "Contract Type"::Probation) then;
                //  "Contract Duration":='6M';
                //  "Contract End Date":=CALCDATE("Contract Duration","Date Of Joining the Company");
            end;
        }
        field(39003948; "Specify Other Reasons"; Text[23])
        {
            Caption = 'Specify Other Reasons';
        }
        field(39003949; "Home District"; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = filter("Home District"));
            Caption = 'Home District';
        }
        field(39003950; Division; Text[30])
        {
            Caption = 'Division';
        }
        field(39003951; Location; Text[30])
        {
            Caption = 'Location';
        }
        field(39003952; "Sub Location"; Text[20])
        {
            Caption = 'Sub Location';
        }
        field(39003953; Ethnicity; Text[20])
        {
            Caption = 'Ethnicity';
        }
        // field(39003900; "Global Dimension 1 Code"; Code[20])
        // {
        //     //CaptionClass = '1,1,1';
        //     Caption = 'Workstation';
        //     TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        //     trigger OnValidate()
        //     var
        //         myInt: Integer;
        //         ValuesRE: Record "Dimension Value";
        //     begin
        //         ValuesRE.Reset();
        //         ValuesRE.SetRange(ValuesRE.Code, Rec."Global Dimension 1 Code");
        //         if ValuesRE.FindFirst() then
        //             Rec."Global Dimension 1 Code" := ValuesRE.Name;

        //     end;
        // }
        field(39003954; "Blood Group"; Option)
        {
            OptionCaption = ' ,A,B,AB,O-,O+';
            OptionMembers = " ",A,B,AB,"O-","O+";
            Caption = 'Blood Group';
        }
        field(39003955; Weight; Decimal)
        {
            Caption = 'Weight';
        }
        field(39003956; Height; Decimal)
        {
            Caption = 'Height';
        }
        field(39003957; "Place Of Birth"; Text[50])
        {
            Caption = 'Place Of Birth';
        }
        field(39003958; "Job ID1"; Code[20])
        {
            TableRelation = "HR Jobs"."Job ID";
            Caption = 'Job ID1';
            trigger OnValidate()
            begin
                objJobs.Reset();
                objJobs.SetRange(objJobs."Job ID", "Job ID1");
                if objJobs.Find('-') then
                    "Job Title1" := objJobs."Job Description";
            end;
        }
        field(39003959; "Job ID2"; Code[20])
        {
            TableRelation = "HR Jobs"."Job ID";
            Caption = 'Job ID2';
            trigger OnValidate()
            begin
                objJobs.Reset();
                objJobs.SetRange(objJobs."Job ID", "Job ID2");
                if objJobs.Find('-') then
                    "Job Title2" := objJobs."Job Description";
            end;
        }
        field(39003960; "Job ID3"; Code[20])
        {
            TableRelation = "HR Jobs"."Job ID";
            Caption = 'Job ID3';
            trigger OnValidate()
            begin
                objJobs.Reset();
                objJobs.SetRange(objJobs."Job ID", "Job ID3");
                if objJobs.Find('-') then
                    "Job Title3" := objJobs."Job Description";
            end;
        }
        field(39003961; "Job ID4"; Code[20])
        {
            TableRelation = "HR Jobs"."Job ID";
            Caption = 'Job ID4';
            trigger OnValidate()
            begin
                objJobs.Reset();
                objJobs.SetRange(objJobs."Job ID", "Job ID4");
                if objJobs.Find('-') then
                    "Job Title4" := objJobs."Job Description";
            end;
        }
        field(39003962; "Job Title1"; Text[50])
        {
            Editable = true;
            Caption = 'Job Title1';
        }
        field(39003963; "Job Title2"; Text[50])
        {
            Editable = true;
            Caption = 'Job Title2';
        }
        field(39003964; "Job Title3"; Text[50])
        {
            Editable = true;
            Caption = 'Job Title3';
        }
        field(39003965; "Job Title4"; Text[50])
        {
            Editable = true;
            Caption = 'Job Title4';
        }
        field(39003966; Grade1; Code[10])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const(Grade));
            Caption = 'Grade1';
        }
        field(39003967; Grade2; Code[10])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const(Grade));
            Caption = 'Grade2';
        }
        field(39003968; Grade3; Code[10])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const(Grade));
            Caption = 'Grade3';
        }
        field(39003969; Grade4; Code[10])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const(Grade));
            Caption = 'Grade4';
        }
        field(39003970; "From Payroll4"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'From Payroll4';
        }
        field(39003971; "To Payroll4"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'To Payroll4';
        }
        field(39003972; "From Payroll1"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'From Payroll1';
        }
        field(39003973; "To payroll1"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'To payroll1';
        }
        field(39003974; "From payroll2"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'From payroll2';
        }
        field(39003975; "To Payroll2"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'To Payroll2';
        }
        field(39003976; "From payroll3"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'From payroll3';
        }
        field(39003977; "To payroll3"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'To payroll3';
        }
        field(39003978; "Show On Payslip"; Boolean)
        {
            Caption = 'Show On Payslip';
        }
        field(39003979; Acting; Boolean)
        {
            Caption = 'Acting';
        }
        field(39003980; "Job ID5"; Code[15])
        {
            TableRelation = "HR Jobs"."Job ID";
            Caption = 'Job ID5';
            trigger OnValidate()
            begin

                objJobs.Reset();
                objJobs.SetRange(objJobs."Job ID", "Job ID5");
                if objJobs.Find('-') then
                    "Job Title5" := objJobs."Job Description";
            end;
        }
        field(39003981; "Job Title5"; Text[30])
        {
            Editable = false;
            Caption = 'Job Title5';
        }
        field(39003982; Grade5; Code[10])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const(Grade));
            Caption = 'Grade5';
        }
        field(39003983; "From Payroll5"; Date)
        {
            Caption = 'From Payroll5';
        }
        field(39003984; "To Payroll5"; Date)
        {
            Caption = 'To Payroll5';
        }
        field(39003985; "Reason For Acting"; Option)
        {
            OptionCaption = ' ,Demise,Resignation,Termination,Suspension';
            OptionMembers = " ",Demise,Resignation,Termination,Suspension;
            Caption = 'Reason For Acting';
        }
        field(39003987; "If Acted?"; Boolean)
        {
            Caption = 'If Acted?';
        }
        field(39003988; "Sitting C.E.O"; Boolean)
        {
            Caption = 'Sitting C.E.O';
        }
        field(39003989; DRetirement; Decimal)
        {
            Caption = 'DRetirement';
        }
        field(39003990; "Payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'Payroll Period';
        }
        field(4001; "Current Duty Station"; Code[50])
        {
            Caption = 'Current Duty Station';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                myInt: Integer;
                DimesonsionVA: Record "Dimension Value";
            begin
                DimesonsionVA.Reset();
                DimesonsionVA.SetRange(Code, Rec."Current Duty Station");
                if DimesonsionVA.FindFirst() then
                    Rec."Current Duty Station" := DimesonsionVA.Name;
            end;
        }

        field(4002; "EMP Transfer Date"; Date)
        {
            Caption = 'EMP Transfer Date';
            DataClassification = CustomerContent;
        }
        field(4003; "EMP Reporting Date"; Date)
        {
            Caption = 'EMP Reporting Date';
            DataClassification = CustomerContent;
        }

        field(4004; "EMP Actual Reporting Date"; Date)
        {
            Caption = 'EMP Actual Reporting Date';
            DataClassification = CustomerContent;
        }

        field(4005; "Head Of Station"; Boolean)
        {
            Caption = 'Head Of Station';
            DataClassification = CustomerContent;
        }
        field(5001; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,"Pending approval",Approved,Rejected;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if rec."Approval Status" = rec."Approval Status"::Approved then
                    UpdateEmployeechanges(rec."Employee No");
            end;
        }
        field(40045; "Highest level"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Employee Qualifications"."Line No." where("Employee No." = field("Employee No"));
            trigger OnValidate()
            var
                myInt: Integer;
                HrQualif: Record "HR Employee Qualifications";
            begin
                HrQualif.Reset();
                HrQualif.SetRange(HrQualif."Employee No.", Rec."Employee No");
                HrQualif.SetRange("Line No.", Rec."Highest level");
                if HrQualif.FindFirst() then
                    Rec."Highest Leverl Description" := HrQualif.Description;
            end;
        }
        field(40046; "Highest Leverl Description"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(5002; "Reason for Change"; text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5004; "Posted"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Captured By"; Code[80])
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "Posted By"; code[80])
        {
            DataClassification = ToBeClassified;
        }
        field(39003900; "Global Dimension 1 Code"; Code[20])
        {
            //CaptionClass = '1,1,1';
            Caption = 'Home County';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            trigger OnValidate()
            var
                myInt: Integer;
                ValuesRE: Record "Dimension Value";
            begin
                ValuesRE.Reset();
                ValuesRE.SetRange(ValuesRE.Code, Rec."Global Dimension 1 Code");
                if ValuesRE.FindFirst() then
                    Rec."Global Dimension 1 Code" := ValuesRE.Name;

            end;
        }
        field(39003905; "Company E-Mail"; Text[50])
        {
            Caption = 'Company E-Mail';
        }

    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", "Employee No", Initials, "First Name", "Middle Name", "Last Name") { }
    }

    trigger OnDelete()
    begin
        Error('Sorry, Deleting of an Existing Employee is stricktly not permitted');
    end;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            HrSetup.Get();
            HrSetup.TestField("Staff Emp Changes");
            NoSeriesMgt.InitSeries(HrSetup."Staff Emp Changes", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify()
    begin
        "Last Date Modified" := Today;
        //"Last Date Modified By" := USERID;
    end;

    trigger OnRename()
    begin
        "Last Date Modified" := Today;
    end;

    var
        PostCode: Record "Post Code";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HrSetup: Record "HR Setup";
        SalCard: Record "PR Salary Card";
        PRPayrollPeriod: Record "PR Payroll Periods";
        objJobs: Record "HR Jobs";
        yDOB: Integer;
        yTODAY: Integer;
        noYrsToRetirement: Integer;
        RetirementYear: Integer;
        AppAge: Integer;
        RetirementDate: Date;
        dDOB: Integer;
        mDOB: Integer;
        HasHRSetup: Boolean;
        PRPeriodTrans: Record "PR Period Transactions";
        Text0005: Label 'Please note that ALL PAYROLL TRANSACTIONS PROCESSED for [EMPLOYEE  :: %1 - %2  ] in the [CURRENT PAYROLL PERIOD :: %3 ] will be deleted. \\Proceed?';

    local procedure fn_FullName()
    begin
        "Full Name" := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";
    end;

    [Scope('OnPrem')]
    procedure GetHRSetup()
    begin
        if not HasHRSetup then begin
            HrSetup.Get();
            HasHRSetup := true;
        end;
    end;

    procedure UpdateEmployeechanges(EmploeeNum: Code[40]);
    var
        myInt: Integer;
        HrEmployeesRec: Record "HR Employees";
        NextOfKinApp: Record "Next Of KIn Application";
        NextOfKin: Record "HR Employee Kin";
    begin
        HrEmployeesRec.Reset();
        HrEmployeesRec.SetRange("No.", EmploeeNum);
        if HrEmployeesRec.FindFirst() then begin
            if xRec."First Name" <> "First Name" then
                HrEmployeesRec.Validate(HrEmployeesRec."First Name", "First Name");
            if HrEmployeesRec."Middle Name" <> "Middle Name" then
                HrEmployeesRec.Validate(HrEmployeesRec."Middle Name", "Middle Name");
            if HrEmployeesRec."Last Name" <> "Last Name" then
                HrEmployeesRec.Validate(HrEmployeesRec."Last Name", "Last Name");
            if HrEmployeesRec."ID Number" <> Rec."ID Number" then
                HrEmployeesRec."ID Number" := rec."ID Number";
            if HrEmployeesRec."Global Dimension 1 Code" <> Rec."Global Dimension 1 Code" then
                HrEmployeesRec."Global Dimension 1 Code" := rec."Global Dimension 1 Code";
            IF HrEmployeesRec.Grade <> REC.Grade then
                HrEmployeesRec.Grade := rec.Grade;
            if HrEmployeesRec."Department Name" <> rec."Department Name" then
                HrEmployeesRec."Department Name" := rec."Department Name";
            if HrEmployeesRec."Full Name" <> "Full Name" then
                HrEmployeesRec.Validate(HrEmployeesRec."Full Name", "Full Name");
            if HrEmployeesRec."Allow Overtime" <> rec."Allow Overtime" then
                HrEmployeesRec.Validate(HrEmployeesRec."Allow Overtime", "Allow Overtime");
            if HrEmployeesRec.Status <> Rec.Status then
                HrEmployeesRec.Validate(HrEmployeesRec.Status, Status);
            if HrEmployeesRec."Responsibility Center" <> Rec."Responsibility Center" then
                HrEmployeesRec.Validate(HrEmployeesRec."Responsibility Center", Rec."Responsibility Center");
            if HrEmployeesRec."Account Type" <> rec."Account Type" then
                HrEmployeesRec.Validate(HrEmployeesRec."Account Type", "Account Type");
            if HrEmployeesRec."Contract Type" <> rec."Contract Type" then
                HrEmployeesRec."Contract Type" := Rec."Contract Type";
            // if HrEmployeesRec."Department Code" <> Rec."Department Code" then
            //     HrEmployeesRec.Validate(HrEmployeesRec."Department Code", "Department Code");
            if HrEmployeesRec.City <> rec.City then
                HrEmployeesRec.City := rec.City;
            if HrEmployeesRec."Postal Address" <> rec."Postal Address" then
                HrEmployeesRec."Postal Address" := rec."Postal Address";
            if HrEmployeesRec.Citizenship <> Rec.Citizenship then
                HrEmployeesRec.Validate(HrEmployeesRec.Citizenship, Citizenship);
            if HrEmployeesRec."Current Duty Station" <> rec."Current Duty Station" then
                HrEmployeesRec."Current Duty Station" := rec."Current Duty Station";
            if HrEmployeesRec.Disabled <> Rec.Disabled then
                HrEmployeesRec.Validate(HrEmployeesRec.Disabled, Disabled);
            if HrEmployeesRec."E-Mail" <> Rec."E-Mail" then
                HrEmployeesRec."E-Mail" := rec."E-Mail";
            if HrEmployeesRec."Disability Grade" <> rec."Disability Grade" then
                HrEmployeesRec.Validate(HrEmployeesRec."Disability Grade", rec."Disability Grade");
            if HrEmployeesRec."Disabling Details" <> rec."Disabling Details" then
                HrEmployeesRec.Validate(HrEmployeesRec."Disabling Details", rec."Disabling Details");
            // if xRec."Country Code" <> Rec."Country Code" then
            //     HrEmployeesRec.Validate(HrEmployeesRec."Country Code", Rec."Country Code");
            if HrEmployeesRec."Marital Status" <> Rec."Marital Status" then
                HrEmployeesRec."Marital Status" := Rec."Marital Status";
            if HrEmployeesRec."Job ID" <> Rec."Job ID" then
                HrEmployeesRec."Job ID" := Rec."Job ID";
            if HrEmployeesRec."Job Title" <> rec."Job Title" then
                HrEmployeesRec."Job Title" := rec."Job Title";
            if HrEmployeesRec."User ID" <> Rec."User ID" then
                HrEmployeesRec."User ID" := Rec."User ID";
            if HrEmployeesRec."Company E-Mail" <> rec."Company E-Mail" then
                HrEmployeesRec."Company E-Mail" := rec."Company E-Mail";
            if HrEmployeesRec."County Name" <> Rec."County Name" then
                HrEmployeesRec."County Name" := rec."County Name";
            if HrEmployeesRec."Ethnic Origin" <> Rec."Ethnic Origin" then
                HrEmployeesRec."Ethnic Origin" := Rec."Ethnic Origin";
            if HrEmployeesRec."Passport Number" <> rec."Passport Number" then
                HrEmployeesRec."Passport Number" := Rec."Passport Number";
            if HrEmployeesRec.Ethnicity <> Rec.Ethnicity then
                HrEmployeesRec.Validate(HrEmployeesRec.Ethnicity, Rec.Ethnicity);
            HrEmployeesRec.CalcFields(Picture);
            CalcFields(rec.Picture);
            HrEmployeesRec.Validate(HrEmployeesRec.Picture, Rec.Picture);
            if HrEmployeesRec."Health Assesment?" <> rec."Health Assesment?" then
                HrEmployeesRec.Validate(HrEmployeesRec."Health Assesment?", Rec."Health Assesment?");
            if HrEmployeesRec."Home District" <> rec."Home District" then
                HrEmployeesRec."Home District" := Rec."Home District";
            if HrEmployeesRec."Home Phone Number" <> Rec."Home Phone Number" then
                HrEmployeesRec.Validate(HrEmployeesRec."Home Phone Number", Rec."Home Phone Number");
            if HrEmployeesRec."Home District" <> Rec."Home District" then
                HrEmployeesRec.Validate(HrEmployeesRec."Home District", Rec."Home District");
            if HrEmployeesRec."Employee Type Primary" <> Rec."Employee Type Primary" then
                HrEmployeesRec.Validate(HrEmployeesRec."Employee Type Primary", rec."Employee Type Primary");
            if HrEmployeesRec."Employee Type" <> Rec."Employee Type" then
                HrEmployeesRec.Validate(HrEmployeesRec."Employee Type", Rec."Employee Type");
            if HrEmployeesRec."Post Code" <> rec."Post Code" then
                HrEmployeesRec."Post Code" := rec."Post Code";
            if HrEmployeesRec.County <> Rec.County then
                HrEmployeesRec.County := Rec.County;
            if HrEmployeesRec."Postal Address" <> rec."Postal Address" then
                HrEmployeesRec."Postal Address" := rec."Postal Address";
            if HrEmployeesRec."Global Dimension 2 Code" <> Rec."Global Dimension 2 Code" then
                HrEmployeesRec."Global Dimension 2 Code" := rec."Global Dimension 2 Code";
            if HrEmployeesRec.Title <> Rec.Title then
                HrEmployeesRec.Validate(HrEmployeesRec.Title, Rec.Title);
            if HrEmployeesRec."Highest level" <> Rec."Highest level" then
                HrEmployeesRec."Highest level" := Rec."Highest level";
            if HrEmployeesRec."Highest Leverl Description" <> rec."Highest Leverl Description" then
                HrEmployeesRec."Highest Leverl Description" := Rec."Highest Leverl Description";
            if HrEmployeesRec.Gender <> rec.Gender then
                HrEmployeesRec.Validate(HrEmployeesRec.Gender, rec.Gender);
            if HrEmployeesRec.Division <> Rec.Division then
                HrEmployeesRec.Validate(HrEmployeesRec.Division, Rec.Division);
            if HrEmployeesRec."Middle Name" <> Rec."Middle Name" then
                HrEmployeesRec.Validate(HrEmployeesRec."Middle Name", Rec."Middle Name");
            if HrEmployeesRec."First Name" <> Rec."First Name" then
                HrEmployeesRec.Validate(HrEmployeesRec."First Name", Rec."First Name");
            if HrEmployeesRec."Last Name" <> Rec."Last Name" then
                HrEmployeesRec.Validate(HrEmployeesRec."Last Name", Rec."Last Name");
            if HrEmployeesRec.Location <> Rec.Location then
                HrEmployeesRec.Location := Rec.Location;
            if HrEmployeesRec."Sub Location" <> Rec."Sub Location" then
                HrEmployeesRec.Validate(HrEmployeesRec."Sub Location", Rec."Sub Location");
            if HrEmployeesRec."Date Of Joining the Company" <> Rec."Date Of Joining the Company" then
                HrEmployeesRec.Validate(HrEmployeesRec."Date Of Joining the Company", Rec."Date Of Joining the Company");
            if HrEmployeesRec."Date Of Leaving" <> Rec."Date Of Leaving" then
                HrEmployeesRec.Validate(HrEmployeesRec."Date Of Leaving", Rec."Date Of Leaving");
            if HrEmployeesRec."Contract Duration" <> Rec."Contract Duration" then
                HrEmployeesRec.Validate(HrEmployeesRec."Contract Duration", Rec."Contract Duration");
            if HrEmployeesRec."Contract Start Date" <> Rec."Contract Start Date" then
                HrEmployeesRec.Validate(HrEmployeesRec."Contract Start Date", rec."Contract Start Date");
            if HrEmployeesRec."Contract End Date" <> rec."Contract End Date" then
                HrEmployeesRec.Validate(HrEmployeesRec."Contract End Date", rec."Contract End Date");
            if HrEmployeesRec."Home District" <> Rec."Home District" then
                HrEmployeesRec."Home District" := Rec."Home District";
            HrEmployeesRec.Modify();
            NextOfKinApp.Reset;
            NextOfKinApp.SetRange(NextOfKinApp."Employee Code", EmploeeNum);
            if NextOfKinApp.Find('-') then begin
                NextOfKin.Reset;
                NextOfKin.SetRange(NextOfKin."Employee Code", EmploeeNum);
                if NextOfKin.Find('-') then
                    NextOfKin.DeleteAll;
                repeat
                    NextOfKin.Init;
                    NextOfKin."Employee Code" := EmploeeNum;
                    NextOfKin.Name := NextOfKinApp.Name;
                    NextOfKin."Full Name" := NextOfKinApp."Full Name";
                    NextOfKin."Entry No" := NextOfKin."Entry No" + 1;
                    NextOfKin.Relationship := NextOfKinApp.Relationship;
                    NextOfKin.Type := NextOfKinApp.Type;
                    NextOfKin."Date of Birth" := NextOfKinApp."Date of Birth";
                    NextOfKin.Address := NextOfKinApp.Address;
                    NextOfKin."E-mail" := NextOfKinApp."E-mail";
                    NextOfKin."Home Tel No" := NextOfKinApp."Home Tel No";
                    NextOfKin."Percentage Shares" := NextOfKinApp."Percentage Shares";
                    NextOfKin."ID No/Passport No" := NextOfKinApp."ID No/Passport No";
                    NextOfKin.Occupation := NextOfKinApp.Occupation;
                    NextOfKin."Office Tel No" := NextOfKinApp."Office Tel No";
                    NextOfKin.Insert;
                until NextOfKinApp.Next = 0;
            end;
            Message('Changes Updated successfully');
        end;

    end;

    procedure GetNextofkin()
    var
        NextOfKinApp: Record "Next Of KIn Application";
        NextOfKin: Record "HR Employee Kin";

    begin
        NextOfKinApp.Reset;
        NextOfKinApp.SetRange(NextOfKinApp."Employee Code", Rec."Employee No");
        if NextOfKinApp.Find('-') then
            NextOfKinApp.DeleteAll;
        NextOfKin.Reset;
        NextOfKin.SetRange(NextOfKin."Employee Code", rec."Employee No");
        if NextOfKin.Find('-') then begin
            repeat
                NextOfKinApp.Init;
                NextOfKinApp."Entry No" := NextOfKinApp."Entry No" + 1;
                NextOfKinApp."Employee Code" := rec."Employee No";
                NextOfKinApp.Name := NextOfKin.Name;
                NextOfKinApp.Relationship := NextOfKin.Relationship;
                NextOfKinApp.Type := NextOfKin.Type;
                NextOfKinApp."Date of Birth" := NextOfKin."Date of Birth";
                NextOfKinApp.Address := NextOfKin.Address;
                NextOfKinApp."E-mail" := NextOfKin."E-mail";
                NextOfKinApp."Home Tel No" := NextOfKin."Home Tel No";
                NextOfKinApp."Percentage Shares" := NextOfKin."Percentage Shares";
                NextOfKinApp."ID No/Passport No" := NextOfKin."ID No/Passport No";
                NextOfKinApp.Occupation := NextOfKin.Occupation;
                NextOfKinApp."Office Tel No" := NextOfKin."Office Tel No";
                NextOfKinApp.Insert;
            until NextOfKin.Next = 0;
        end;
    end;
}

