#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193893 "HR Employees - Changes"
{
    Caption = 'HR Employees - Changes';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            trigger OnValidate()
            begin
                //Transfer Fields
                HREmp.Reset();
                if HREmp.Get(Code) then
                    //"First Name":=HREmp."First Name";
                    Rec.TransferFields(HREmp, false);
                // Rec.MODIFY;
            end;
        }
        field(2; "First Name"; Text[80])
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
                fn_FullName();
            end;
        }
        field(5; Initials; Text[15])
        {
            Caption = 'Initials';
        }
        field(7; "Full Name"; Text[100])
        {
            Caption = 'Full Name';
        }
        field(8; "Postal Address"; Text[80])
        {
            Caption = 'Postal Address';
        }
        field(9; "Residential Address"; Text[20])
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
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
            Caption = 'Post Code';
            trigger OnValidate()
            begin
                PostCode.Reset();
                PostCode.SetRange(PostCode.Code, "Post Code");
                if PostCode.Find('-') then
                    City := PostCode.City;
            end;
        }
        field(12; County; Text[30])
        {
            Caption = 'County';
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
        field(21; "ID Number"; Text[30])
        {
            Caption = 'ID Number';
        }
        field(22; "Union Code"; Code[10])
        {
            TableRelation = Union;
            Caption = 'Union Code';
        }
        field(23; "UIF Number"; Text[30])
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
            OptionMembers = Active,Inactive;
            Caption = 'Status';
            trigger OnValidate()
            begin

                "Status Change Date" := Today;

                //Delete payroll transactions for open period in the table
                PRPayrollPeriod.Reset();
                PRPayrollPeriod.SetRange(PRPayrollPeriod.Closed, false);
                if PRPayrollPeriod.Find('-') then begin
                    PRPeriodTrans.Reset();
                    PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", Code);
                    PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PRPayrollPeriod."Date Opened");
                    if PRPeriodTrans.Find('-') then
                        if Confirm(Text0005, false, Code, UpperCase("Full Name"), PRPeriodTrans."Payroll Period") = false then
                            Error('Process Aborted')
                        else begin
                            PRPeriodTrans.DeleteAll(true);
                            Message('Process Complete');
                        end;
                end;
            end;
        }
        field(35; "Location/Division Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
            Caption = 'Location/Division Code';
            trigger OnValidate()
            begin
                if SalCard.Get(Code) then begin
                    SalCard."Identification Number" := "Location/Division Code";
                    SalCard.Modify();
                end;
            end;
        }
        field(36; "Department Code"; Code[20])
        {
            Caption = 'Department Code';
            trigger OnValidate()
            begin
                if SalCard.Get(Code) then begin
                    SalCard."Mobile Number" := "Department Code";
                    SalCard.Modify();
                end;
            end;
        }
        field(37; Office; Code[20])
        {
            Description = 'Dimension 2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          "Dimension Value Type" = const(Standard));
            Caption = 'Office';
        }
        field(38; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(39; Comment; Boolean)
        {
            Editable = false;
            Caption = 'Comment';
        }
        field(40; "Last Date Modified"; Date)
        {
            Editable = false;
            Caption = 'Last Date Modified';
        }
        field(41; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
            Caption = 'Date Filter';
        }
        field(42; "Department Filter 1"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
            Caption = 'Department Filter 1';
        }
        field(43; "Office Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            Caption = 'Office Filter';
        }
        field(47; "Employee No. Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Employee;
            Caption = 'Employee No. Filter';
        }
        field(49; "Fax Number"; Text[30])
        {
            Caption = 'Fax Number';
        }
        field(50; "Company E-Mail"; Text[20])
        {
            Caption = 'Company E-Mail';
        }
        field(51; Title; Option)
        {
            OptionCaption = ',MR,MRS,MISS,MS,DR, ENG. ,DR.,CC,Prof';
            OptionMembers = ,MR,MRS,MISS,MS,DR," ENG. ","DR.",CC,Prof;
            Caption = 'Title';
        }
        field(52; "Salespers./Purch. Code"; Code[10])
        {
            Caption = 'Salespers./Purch. Code';
        }
        field(53; "No. Series"; Code[10])
        {
            Editable = false;
            TableRelation = "No. Series";
            Caption = 'No. Series';
        }
        field(54; "Known As"; Text[20])
        {
            Caption = 'Known As';
        }
        field(55; Position; Text[20])
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
            OptionMembers = " ",Contract,Deployed,"Deployed Security",Intern,Casuals,"Permanent and Pensionable",Probation;
            Caption = 'Contract Type';
            trigger OnValidate()
            begin
                Validate("Contract Duration");
            end;
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
        field(66; "Cost Code"; Code[10])
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
            begin
                "Retirement date" := 0D;
                if "Date Of Birth" <> 0D then
                    "Retirement date" := CalcDate('60Y', "Date Of Birth");
            end;
        }
        field(82; Age; Text[20])
        {
            Caption = 'Age';
        }
        field(83; "Date Of Join"; Date)
        {
            Caption = 'Date Of Join';
        }
        field(84; "Length Of Service"; Text[20])
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
        }
        field(91; Paterson; Code[10])
        {
            Caption = 'Paterson';
        }
        field(92; Peromnes; Code[10])
        {
            Caption = 'Peromnes';
        }
        field(93; Hay; Code[10])
        {
            Caption = 'Hay';
        }
        field(94; Castellion; Code[10])
        {
            Caption = 'Castellion';
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
        field(98; "Medical Scheme Head Member"; Text[10])
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
                HREmp.Find('-');

                if HREmp.Disabled = HREmp.Disabled::No then begin

                    //calculate how many years remaining for this employee to retire : ret yr is 65
                    noYrsToRetirement := 60 - AppAge;

                    //add noYrsToRetirement to current year to get retirement year da
                    RetirementYear := yTODAY + noYrsToRetirement;
                    //ERROR(FORMAT(RetirementYear));
                    RetirementDate := DMY2Date(dDOB, mDOB, RetirementYear);
                    "Retirement date" := RetirementDate;
                end else
                    //IF HREmp.Disabled= HREmp.Disabled::Yes THEN
                    //calculate how many years remaining for this employee to retire : ret yr is 60
                    noYrsToRetirement := 70 - AppAge;

                //add noYrsToRetirement to current year to get retirement year da
                RetirementYear := yTODAY + noYrsToRetirement;
                //ERROR(FORMAT(RetirementYear));
                RetirementDate := DMY2Date(dDOB, mDOB, RetirementYear);
                "Retirement date" := RetirementDate;
                //END;
                //END;
            end;
        }
        field(115; DateEngaged; Text[8])
        {
            Caption = 'DateEngaged';
        }
        field(116; "Postal Address2"; Text[30])
        {
            Caption = 'Postal Address2';
        }
        field(117; "Postal Address3"; Text[20])
        {
            Caption = 'Postal Address3';
        }
        field(118; "Residential Address2"; Text[30])
        {
            Caption = 'Residential Address2';
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
            begin
                //UserMgt.ValidateUserID("User ID");

                if "User ID" = '' then
                    exit;
                /*
                HREmp.RESET;
                IF HREmp.GET("User ID") THEN
                BEGIN
                   EmpFullName:=HREmp."First Name" + SPACER + HREmp."Middle Name" + SPACER + HREmp."Last Name";
                   ERROR('UserID [%1] has already been assigned to another Employee [%2]',"User ID",EmpFullName);
                END;
                */

            end;
        }
        field(124; "Disabling Details"; Text[50])
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
        field(127; "2nd Skills Category"; Option)
        {
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
            Caption = '2nd Skills Category';
        }
        field(128; "3rd Skills Category"; Option)
        {
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
            Caption = '3rd Skills Category';
        }
        field(129; PensionJoin; Text[8])
        {
            Caption = 'PensionJoin';
        }
        field(130; DateLeaving; Text[30])
        {
            Caption = 'DateLeaving';
        }
        field(131; Region; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('REGION'));
            Caption = 'Region';
        }
        field(132; "Manager Emp No"; Code[30])
        {
            Caption = 'Manager Emp No';
        }
        field(133; Temp; Text[20])
        {
            Caption = 'Temp';
        }
        field(134; "Employee Qty"; Integer)
        {
            CalcFormula = count("HR Employees");
            FieldClass = FlowField;
            Caption = 'Employee Qty';
            Editable = false;
        }
        field(135; "Employee Act. Qty"; Integer)
        {
            CalcFormula = count("HR Employees");
            FieldClass = FlowField;
            Caption = 'Employee Act. Qty';
            Editable = false;
        }
        field(136; "Employee Arc. Qty"; Integer)
        {
            CalcFormula = count("HR Employees");
            FieldClass = FlowField;
            Caption = 'Employee Arc. Qty';
            Editable = false;
        }
        field(137; "Contract Location"; Text[10])
        {
            Description = 'Location where contract was closed';
            Caption = 'Contract Location';
        }
        field(138; "First Language Read"; Boolean)
        {
            Caption = 'First Language Read';
        }
        field(139; "First Language Write"; Boolean)
        {
            Caption = 'First Language Write';
        }
        field(140; "First Language Speak"; Boolean)
        {
            Caption = 'First Language Speak';
        }
        field(141; "Second Language Read"; Boolean)
        {
            Caption = 'Second Language Read';
        }
        field(142; "Second Language Write"; Boolean)
        {
            Caption = 'Second Language Write';
        }
        field(143; "Second Language Speak"; Boolean)
        {
            Caption = 'Second Language Speak';
        }
        field(144; "Custom Grading"; Code[20])
        {
            Caption = 'Custom Grading';
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
        field(149; "Grounds for Term. Code"; Code[10])
        {
            Caption = 'Grounds for Term. Code';
            TableRelation = "Grounds for Termination";
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
                if SalCard.Get(Code) then begin
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
        field(160; "Send Alert to"; Code[20])
        {
            Caption = 'Send Alert to';
        }
        field(161; Tribe; Code[20])
        {
            Caption = 'Tribe';
        }
        field(162; Religion; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = filter(Religion));
            Caption = 'Religion';
        }
        field(163; "Job Title"; Text[50])
        {
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
        field(171; "Medical Scheme Name #2"; Text[50])
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
                //calculate age 02-05-1988
                yTODAY := Date2DMY(Today, 3); //2014

                yDOB := Date2DMY("Date Of Birth", 3);
                dDOB := Date2DMY("Date Of Birth", 1);
                mDOB := Date2DMY("Date Of Birth", 2);

                AppAge := yTODAY - yDOB;
                HREmp.Find('-');
                if HREmp.Disabled = HREmp.Disabled::No then begin
                    //calculate how many years remaining for this employee to retire : ret yr is 60
                    noYrsToRetirement := 60 - AppAge;

                    //add noYrsToRetirement to current year to get retirement year da
                    RetirementYear := yTODAY + noYrsToRetirement;
                    //ERROR(FORMAT(RetirementYear));
                    RetirementDate := DMY2Date(dDOB, mDOB, RetirementYear);
                    "Retirement date" := RetirementDate;
                end else
                    if HREmp.Disabled = HREmp.Disabled::Yes then
                        //calculate how many years remaining for this employee to retire : ret yr is 60
                        noYrsToRetirement := 70 - AppAge;

                //add noYrsToRetirement to current year to get retirement year da
                RetirementYear := yTODAY + noYrsToRetirement;
                //ERROR(FORMAT(RetirementYear));
                RetirementDate := DMY2Date(dDOB, mDOB, RetirementYear);
                "Retirement date" := RetirementDate;
                //END;
                //END;
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
            // TableRelation = "Payment Terms".Field1396040;
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
        field(302; "Salary Notch/Step"; Code[20])
        {
            Caption = 'Salary Notch/Step';
        }
        field(303; "Status Change Date"; Date)
        {
            Caption = 'Status Change Date';
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
        field(318; "Location/Division Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('LOC/DIV'));
            Caption = 'Location/Division Filter';
        }
        field(319; "Department Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('DEPARTMENT'));
            Caption = 'Department Filter';
        }
        field(320; "Cost Centre Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('COSTCENTRE'));
            Caption = 'Cost Centre Filter';
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
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 2 Code")));
            FieldClass = FlowField;
            Caption = 'Department Name';
            Editable = false;
        }
        field(329; "County Name"; Text[40])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 1 Code")));
            FieldClass = FlowField;
            Caption = 'County Name';
            Editable = false;
        }
        field(2004; "Total Leave Taken"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            Caption = 'Total Leave Taken';
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
            DecimalPlaces = 2 : 2;
            Caption = 'Reimbursed Leave Days';
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
            Caption = 'Allocated Leave Days';

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
            Caption = 'No. Of Bank A/Cs';
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
        field(3978; "Employee Type."; Option)
        {
            OptionMembers = " ",Primary,Secondary,Board;
            Caption = 'Employee Type.';
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
        field(39003900; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
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
            TableRelation = "Responsibility Center BR NEW".Code;
            Caption = 'Responsibility Center';
        }
        field(39003903; HR; Boolean)
        {
            Caption = 'HR';
        }
        field(39003904; "Date Of Joining the Company"; Date)
        {
            Caption = 'Date Of Joining the Company';
        }
        field(39003905; "Date Of Leaving the Company"; Date)
        {
            Caption = 'Date Of Leaving the Company';
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
        field(39003909; "Employee UserID"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
            Caption = 'Employee UserID';
        }
        field(39003910; "Leave Balance"; Decimal)
        {
            Caption = 'Leave Balance';
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
        field(39003914; "Leave Type Filter"; Code[20])
        {
            TableRelation = "HR Leave Types";
            Caption = 'Leave Type Filter';
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
        field(39003921; Dim3; Text[10])
        {
            Caption = 'Dim3';
        }
        field(39003922; Dim4; Text[10])
        {
            Caption = 'Dim4';
        }
        field(39003923; IsPayrollPeriodCreator; Boolean)
        {
            Caption = 'IsPayrollPeriodCreator';
        }
        field(39003925; "Basic Pay"; Decimal)
        {
            Editable = false;
            Caption = 'Basic Pay';
        }
        field(39003926; "Other Name"; Text[20])
        {
            Caption = 'Other Name';
        }
        field(39003927; "Exist IN User Setup"; Boolean)
        {
            CalcFormula = exist("User Setup" where("User ID" = field("User ID")));
            FieldClass = FlowField;
            Caption = 'Exist IN User Setup';
            Editable = false;
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
            trigger OnValidate()
            begin
                "Contract End Date" := 0D;

                if ("Contract Type" = "Contract Type"::Contract) and ("Contract Duration" <> '') then
                    "Contract End Date" := CalcDate("Contract Duration", "Date Of Joining the Company");

                if ("Contract Type" = "Contract Type"::Probation) then begin
                    "Contract Duration" := '6M';
                    "Contract End Date" := CalcDate("Contract Duration", "Date Of Joining the Company");
                end;
            end;
        }
        field(39003933; DAge; Text[20])
        {
            Caption = 'DAge';
        }
        field(39003934; DPension; Text[20])
        {
            Caption = 'DPension';
        }
        field(39003935; "New Basic Pay"; Decimal)
        {
            Caption = 'New Basic Pay';
        }
        field(39003936; "Incremental Month"; Option)
        {
            OptionMembers = None,January,February,March,April,May,June,July,August,September,October,November,December;
            Caption = 'Incremental Month';
        }
        field(39003937; "Approval Status"; Option)
        {
            //Editable = false;
            OptionMembers = Open,"Pending Approval",Approved,Canceled;
            Caption = 'Approval Status';
            trigger OnValidate()
            begin

                TransferLines.Reset();
                TransferLines.SetRange(TransferLines."Request No", Code);
                if TransferLines.Find('-') then begin
                    repeat
                        BankLines.Reset();
                        BankLines.SetRange(BankLines."Employee Code", TransferLines."Employee No");
                        BankLines.SetRange(BankLines."From payroll Period", TransferLines."From payroll Period");
                        if BankLines.Find('-') then
                            BankLines."Bank  Code" := TransferLines."New Bank  Code";
                        BankLines."Bank Name" := TransferLines."New Bank Name";
                        BankLines."Branch Code" := TransferLines."New Branch Code";
                        BankLines."Branch Name" := TransferLines."New Branch Name";
                        BankLines."A/C  Number" := TransferLines."New A/C  Number";
                        BankLines."Percentage to Transfer" := TransferLines."Percentage to Transfer";
                        BankLines.Modify();
                    until TransferLines.Next() = 0;
                    if Rec.Get(TransferLines."Request No") then begin
                        "Bank Info Updated" := true;
                        Rec.Modify()
                    end;
                end;
            end;
        }
        field(39003938; "Approval Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center BR NEW".Code;
            Caption = 'Approval Responsibility Center';
        }
        field(39003939; "From payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'From payroll Period';
        }
        field(39003940; "To Payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'To Payroll Period';
        }
        field(39003941; "Employee No."; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee No.';

        }
        field(39003942; "Created Date"; Date)
        {
            Caption = 'Created Date';
        }
        field(39003943; "Created By"; Code[50])
        {
            Caption = 'Created By';
        }
        field(39003944; "Bank Info Updated"; Boolean)
        {
            Editable = false;
            Caption = 'Bank Info Updated';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", Initials, "First Name", "Middle Name", "Last Name") { }
    }

    trigger OnDelete()
    begin
        //ERROR('Sorry, Deleting of an Existing Employee is stricktly not permitted');
        if "Approval Status" <> "Approval Status"::Open then
            Error('You are not allowed to delete at this level');
    end;

    trigger OnInsert()
    begin

        if Code = '' then begin
            PaySetup.Get();
            PaySetup.TestField(PaySetup."Employee Change Nos");
            NoSeriesMgt.InitSeries(PaySetup."Employee Change Nos", xRec."No. Series", 0D, Code, "No. Series");
        end;

        "Created Date" := Today;
        "Created By" := UserId;

        "Approval Responsibility Center" := 'HRM';
    end;

    trigger OnModify()
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnRename()
    begin
        "Last Date Modified" := Today;
    end;

    var
        ERROR1: Label 'Employee Career History Starting Information already exist.';
        MSG1: Label 'Employee Career History Starting Information successfully created.';
        SPACER: Label ' ';
        Text0005: Label 'Please note that ALL PAYROLL TRANSACTIONS PROCESSED for [EMPLOYEE  :: %1 - %2  ] in the [CURRENT PAYROLL PERIOD :: %3 ] will be deleted. \\Proceed?';
        Res: Record Resource;
        PostCode: Record "Post Code";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        OK: Boolean;
        User: Record "User Setup";
        ReasonDiaglog: Dialog;
        EmpQualification: Record "Employee Qualification";
        PayStartDate: Date;
        PayPeriodText: Text[30];
        ToD: Date;
        CurrentMonth: Date;
        HrSetup: Record "HR Setup";
        SalCard: Record "PR Salary Card";
        PRPayrollPeriod: Record "PR Payroll Periods";
        EmpTrans: Record "PR Employee Transactions";
        EmpTransR: Record "PR Employee Transactions";
        UserMgt: Codeunit "User Management";
        DimVal: Record "Dimension Value";
        objJobs: Record "HR Jobs";
        HREmp: Record "HR Employees";
        EmpFullName: Text;
        yDOB: Integer;
        yTODAY: Integer;
        noYrsToRetirement: Integer;
        RetirementYear: Integer;
        AppAge: Integer;
        RetirementYear2: Text;
        Dates: Codeunit "HR Dates";
        Dimn: Record "Dimension Value";
        RetirementDate: Date;
        dDOB: Integer;
        mDOB: Integer;
        DaystoRetirement: Text;
        HasHRSetup: Boolean;
        PRPeriodTrans: Record "PR Period Transactions";
        PaySetup: Record "prPayroll Setup";
        BankLines: Record "HR Employee Bank Accounts";
        TransferLines: Record "HR Employee Transfer Lines";
        LineNo: Integer;


    procedure AssistEdit(): Boolean
    begin
        GetHRSetup();
    end;


    procedure FullName(): Text[100]
    begin

        /*
        //Transfer Fields
        HREmp.RESET;
        IF HREmp.GET("Employee No.") THEN
        BEGIN
            //"First Name":=HREmp."First Name";
            Rec.TRANSFERFIELDS(HREmp,FALSE);
           // Rec.MODIFY;
        END;
        */

        if "Middle Name" = '' then
            exit("Known As" + ' ' + "Last Name")
        else
            exit("Known As" + ' ' + "Middle Name" + ' ' + "Last Name");

    end;


    procedure CurrentPayDetails()
    begin
    end;


    procedure UpdtResUsersetp(var HREmpl: Record "HR Employees")
    var
        Res: Record Resource;
        Usersetup: Record "User Setup";
    begin
        /*
        ContMgtSetup.GET;
        IF ContMgtSetup."Customer Integration" =
           ContMgtSetup."Customer Integration"::"No Integration"
        THEN
          EXIT;
        */
        /*
        Res.SETCURRENTKEY("No.");
        Res.SETRANGE("No.",HREmpl."Resource No.");
        IF Res.FIND('-') THEN BEGIN
          Res."Global Dimension 1 Code" := HREmpl."Department Code";
          Res."Global Dimension 2 Code" := HREmpl.Office;
          Res.MODIFY;
        END;

        IF Usersetup.GET(HREmpl."User ID") THEN BEGIN
          Usersetup.Department := HREmpl."Department Code";
          Usersetup.Office := HREmpl.Office;
          Usersetup.MODIFY;
        END;
        */

    end;


    procedure SetEmployeeHistory()
    begin
    end;


    procedure GetPayPeriod()
    begin
    end;

    local procedure fn_FullName()
    begin
        "Full Name" := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";
    end;


    procedure GetHRSetup()
    begin
    end;

    local procedure GetLastEntryNo() LastLineNum: Integer
    var
        HRBankInfo: Record "HR Employee Bank Accounts";
    begin
        HRBankInfo.Reset();
        if HRBankInfo.Find('+') then
            LastLineNum := HRBankInfo."Line No." + 1
        else
            LastLineNum := 1000;
    end;
}
