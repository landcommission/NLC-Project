/* #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 52193606 "HR Employees Infor Changes"
{
    Caption = 'HR Employees';
    DataCaptionFields = "No.", "Full Name", "Job Title";
    DrillDownPageID = "HR Employee List (ALL)";
    LookupPageID = "HR Employee List (ALL)";

    fields
    {
        field(1; "No."; Code[20])
        {
            TableRelation = "HR Employees"."No.";

            trigger OnValidate()
            var
                NewStr: Code[20];
            begin
                //To delete spaces inbetween numbers
                // NewStr:=DELCHR("No.");
                //mm
                if "No." <> xRec."No." then begin
                    HrSetup.Get;
                    NoSeriesMgt.TestManual(HrSetup."Employee Nos.");
                    "No. Series" := '';
                end;

                NewStr := DelChr("No.");
            end;
        }
        field(2; "First Name"; Text[30])
        {

            trigger OnValidate()
            begin

                fn_FullName;
            end;
        }
        field(3; "Middle Name"; Text[50])
        {

            trigger OnValidate()
            begin
                fn_FullName;
            end;
        }
        field(4; "Last Name"; Text[50])
        {

            trigger OnValidate()
            var
                Reason: Text[30];
            begin
                fn_FullName;
            end;
        }
        field(5; Initials; Text[15])
        {
        }
        field(7; "Full Name"; Text[60])
        {
        }
        field(8; "Postal Address"; Text[50])
        {
        }
        field(9; "Residential Address"; Text[50])
        {
        }
        field(10; City; Text[30])
        {
        }
        field(11; "Post Code"; Code[20])
        {
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.Reset;
                PostCode.SetRange(PostCode.Code, "Post Code");
                if PostCode.Find('-') then begin
                    City := PostCode.City;
                end;
            end;
        }
        field(12; County; Code[30])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(13; "Home Phone Number"; Text[30])
        {
        }
        field(14; "Cellular Phone Number"; Text[30])
        {
        }
        field(15; "Work Phone Number"; Text[30])
        {
        }
        field(16; "Ext."; Text[7])
        {
        }
        field(17; "E-Mail"; Text[30])
        {
            ExtendedDatatype = EMail;
        }
        field(18; sec; Date)
        {
            Description = 'seconded start date';

            trigger OnValidate()
            begin
                //Morris code for Seconded/Contract
                sec2 := 0D;

                if ("Contract Type" = "contract type"::Contract) and ("Contract Duration" <> '') then begin
                    sec2 := CalcDate(secdur, sec);
                end;
            end;
        }
        field(19; Picture; Blob)
        {
            SubType = Bitmap;
        }
        field(21; "ID Number"; Code[20])
        {

            trigger OnValidate()
            begin


            end;
        }
        field(22; "Union Code"; Code[10])
        {
            TableRelation = Union;
        }
        field(23; "UIF Number"; Text[10])
        {
        }
        field(24; Gender; Option)
        {
            OptionMembers = " ",Male,Female;
        }
        field(25; "Country Code"; Code[10])
        {
            TableRelation = "Country/Region";
        }
        field(28; "Statistics Group Code"; Code[10])
        {
            TableRelation = "Employee Statistics Group";
        }
        field(29; secdur; Code[10])
        {
            Description = 'seconded duration';

            trigger OnValidate()
            begin

                //Morris Code for seconded/contract

                sec2 := 0D;
                sec2 := CalcDate(secdur, sec);
            end;
        }
        field(30; sec2; Date)
        {
            Description = 'seconded end date';
        }
        field(31; Status; Option)
        {
            Editable = true;
            OptionMembers = Active,Inactive,New,"Pending Approval",Rejected;

            trigger OnValidate()
            begin
                "Status Change Date" := Today;

                //Delete payroll transactions for open period in the table
                PRPayrollPeriod.Reset;
                PRPayrollPeriod.SetRange(PRPayrollPeriod.Closed, false);
                if PRPayrollPeriod.Find('-') then begin
                    PRPeriodTrans.Reset;
                    PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "No.");
                    PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PRPayrollPeriod."Date Opened");
                    if PRPeriodTrans.Find('-') then begin
                        if Confirm(Text0005, false, "No.", UpperCase("Full Name"), PRPeriodTrans."Payroll Period") = false then begin
                            Error('Process Aborted');
                        end else begin
                            PRPeriodTrans.DeleteAll(true);
                            Message('Process Complete');
                        end;
                    end;
                end;
            end;
        }
        field(35; "Location/Division Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                if SalCard.Get("No.") then begin
                    SalCard."Identification Number" := "Location/Division Code";
                    SalCard.Modify;
                end;
            end;
        }
        field(36; "Department Code"; Code[20])
        {

            trigger OnValidate()
            begin
                if SalCard.Get("No.") then begin
                    SalCard."Mobile Number" := "Department Code";
                    SalCard.Modify;
                end;
            end;
        }
        field(37; Office; Code[20])
        {
            Description = 'Dimension 2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          "Dimension Value Type" = const(Standard));
        }
        field(38; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(39; Comment; Boolean)
        {
            Editable = false;
        }
        field(40; "Last Date Modified"; Date)
        {
            Editable = false;
        }
        field(41; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(42; "Department Filter 1"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(43; "Office Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(47; "Employee No. Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Employee;
        }
        field(49; "Fax Number"; Text[30])
        {
        }
        field(50; "Company E-Mail"; Text[50])
        {
        }
        field(51; Title; Option)
        {
            OptionCaption = ',MR,MRS,MISS,MS,DR, ENG.,CC,Prof';
            OptionMembers = ,MR,MRS,MISS,MS,DR," ENG.",CC,Prof;
        }
        field(52; "Salespers./Purch. Code"; Code[10])
        {
        }
        field(53; "No. Series"; Code[10])
        {
            Editable = false;
            TableRelation = "No. Series";
        }
        field(54; "Known As"; Text[30])
        {
        }
        field(55; Position; Text[30])
        {
        }
        field(57; "Full / Part Time"; Option)
        {
            OptionMembers = " ","Full Time"," Part Time",Contract;
        }
        field(58; "Contract Type"; Option)
        {
            OptionMembers = " ",Contract,Deployed,"Seconded/Contract",Intern,Casuals,"Permanent and Pensionable",Probation;

            trigger OnValidate()
            begin
                //VALIDATE("Contract Duration");
            end;
        }
        field(59; "Contract End Date"; Date)
        {
        }
        field(60; "Notice Period"; Code[10])
        {
        }
        field(61; "Union Member?"; Boolean)
        {
        }
        field(62; "Shift Worker?"; Boolean)
        {
        }
        field(63; "Contracted Hours"; Decimal)
        {
        }
        field(64; "Pay Period"; Option)
        {
            OptionMembers = Weekly,"2 Weekly","4 Weekly",Monthly," ";
        }
        field(65; "Pay Per Period"; Decimal)
        {
        }
        field(66; "Cost Code"; Code[20])
        {
        }
        field(68; "Secondment Institution"; Text[30])
        {
        }
        field(69; "UIF Contributor?"; Boolean)
        {
        }
        field(73; "Marital Status"; Option)
        {
            OptionMembers = " ",Single,Married,Separated,Divorced,"Widow(er)",Other;
        }
        field(74; "Ethnic Origin"; Option)
        {
            OptionMembers = African,Indian,White,Coloured;
        }
        field(75; "First Language (R/W/S)"; Code[10])
        {
        }
        field(76; "Driving Licence"; Code[10])
        {
        }
        field(77; "Vehicle Registration Number"; Code[10])
        {
        }
        field(78; Disabled; Option)
        {
            Caption = 'PWD';
            OptionMembers = No,Yes," ";

            trigger OnValidate()
            begin
                "Retirement date" := 0D;
                if Disabled = Disabled::Yes then begin
                    if "Date Of Birth" <> 0D then "Retirement date" := CalcDate('65Y', "Date Of Birth");
                end
            end;
        }
        field(79; "Health Assesment?"; Boolean)
        {
        }
        field(80; "Health Assesment Date"; Date)
        {
        }
        field(81; "Date Of Birth"; Date)
        {

            trigger OnValidate()
            begin

                //mm
                "Retirement date" := 0D;
                if (Date2dmy(Today, 3) - Date2dmy("Date Of Birth", 3)) < 18 then
                    Error('Staff is below allowed employable Limit');
                if "Date Of Birth" <> 0D then "Retirement date" := CalcDate('60Y', "Date Of Birth");




            end;
        }
        field(82; Age; Text[10])
        {
        }
        field(83; "Date Of Join"; Date)
        {
        }
        field(84; "Length Of Service"; Text[10])
        {
        }
        field(85; "End Of Probation Date"; Date)
        {
        }
        field(86; "Pension Scheme Join"; Date)
        {
        }
        field(87; "Time Pension Scheme"; Text[20])
        {
        }
        field(88; "Medical Scheme Join"; Date)
        {
        }
        field(89; "Time Medical Scheme"; Text[20])
        {
            //This property is currently not supported
            //TestTableRelation = true;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = true;
        }
        field(90; "Date Of Leaving"; Date)
        {
        }
        field(91; Paterson; Code[10])
        {
        }
        field(92; Peromnes; Code[10])
        {
        }
        field(93; Hay; Code[10])
        {
        }
        field(94; Castellion; Code[10])
        {
        }
        field(95; "Per Annum"; Decimal)
        {
        }
        field(96; "Allow Overtime"; Option)
        {
            OptionMembers = Yes,No," ";
        }
        field(97; "Medical Scheme No."; Text[30])
        {

            trigger OnValidate()
            begin
                //MedicalAidBenefit.SETRANGE("Employee No.","No.");
            end;
        }
        field(98; "Medical Scheme Head Member"; Text[30])
        {

            trigger OnValidate()
            begin
                //  MedicalAidBenefit.SETRANGE("Employee No.","No.");
                //   OK := MedicalAidBenefit.FIND('+');
                //  IF OK THEN BEGIN
                //  REPEAT
                //   MedicalAidBenefit."Medical Aid Head Member":= "Medical Aid Head Member";
                //    MedicalAidBenefit.MODIFY;
                //  UNTIL MedicalAidBenefit.NEXT = 0;
                // END;
            end;
        }
        field(99; "Number Of Dependants"; Integer)
        {

            trigger OnValidate()
            begin
                // MedicalAidBenefit.SETRANGE("Employee No.","No.");
                // OK := MedicalAidBenefit.FIND('+');
                // IF OK THEN BEGIN
                //REPEAT
                //  MedicalAidBenefit."Number Of Dependants":= "Number Of Dependants";
                //  MedicalAidBenefit.MODIFY;
                //UNTIL MedicalAidBenefit.NEXT = 0;
                // END;
            end;
        }
        field(100; "Medical Scheme Name"; Text[20])
        {

            trigger OnValidate()
            begin
                //MedicalAidBenefit.SETRANGE("Employee No.","No.");
                //OK := MedicalAidBenefit.FIND('+');
                //IF OK THEN BEGIN
                // REPEAT
                // MedicalAidBenefit."Medical Aid Name":= "Medical Aid Name";
                //  MedicalAidBenefit.MODIFY;
                // UNTIL MedicalAidBenefit.NEXT = 0;
                // END;
            end;
        }
        field(101; "Amount Paid By Employee"; Decimal)
        {

            trigger OnValidate()
            begin
                //  MedicalAidBenefit.SETRANGE("Employee No.","No.");
                //  OK := MedicalAidBenefit.FIND('+');
                //   IF OK THEN BEGIN
                //     REPEAT
                //      MedicalAidBenefit."Amount Paid By Employee":= "Amount Paid By Employee";
                //       MedicalAidBenefit.MODIFY;
                //     UNTIL MedicalAidBenefit.NEXT = 0;
                //    END;
            end;
        }
        field(102; "Amount Paid By Company"; Decimal)
        {

            trigger OnValidate()
            begin
                //  MedicalAidBenefit.SETRANGE("Employee No.","No.");
                //   OK := MedicalAidBenefit.FIND('+');
                //  IF OK THEN BEGIN
                // REPEAT
                //      MedicalAidBenefit."Amount Paid By Company":= "Amount Paid By Company";
                //      MedicalAidBenefit.MODIFY;
                // UNTIL MedicalAidBenefit.NEXT = 0;
                //   END;
            end;
        }
        field(103; "Receiving Car Allowance ?"; Boolean)
        {
        }
        field(104; "Second Language (R/W/S)"; Code[10])
        {
        }
        field(105; "Additional Language"; Code[10])
        {
        }
        field(106; "Cell Phone Reimbursement?"; Boolean)
        {
        }
        field(107; "Amount Reimbursed"; Decimal)
        {
        }
        field(108; "UIF Country"; Code[10])
        {
            TableRelation = "Country/Region".Code;
        }
        field(109; "Direct/Indirect"; Option)
        {
            OptionMembers = Direct,Indirect;
        }
        field(110; "Primary Skills Category"; Option)
        {
            OptionMembers = Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(111; Level; Option)
        {
            OptionMembers = " ","Level 1","Level 2","Level 3","Level 4","Level 5","Level 6","Level 7";
        }
        field(112; "Termination Category"; Option)
        {
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Death,Other;

            trigger OnValidate()
            var
                "Lrec Resource": Record Resource;
                OK: Boolean;
            begin
            end;
        }
        field(113; "Job ID"; Code[30])
        {
            Description = 'To put description on Job title field';
            TableRelation = "HR Jobs"."Job ID";

            trigger OnValidate()
            begin
                objJobs.Reset;
                objJobs.SetRange(objJobs."Job ID", "Job ID");
                if objJobs.Find('-') then begin
                    "Job Title" := objJobs."Job Description";
                end;
            end;
        }
        field(114; DateOfBirth; Date)
        {

            trigger OnValidate()
            begin
                //calculate age 02-05-1988
                yTODAY := Date2dmy(Today, 3); //2014

                yDOB := Date2dmy("Date Of Birth", 3);
                dDOB := Date2dmy("Date Of Birth", 1);
                mDOB := Date2dmy("Date Of Birth", 2);

                AppAge := yTODAY - yDOB;

                //calculate how many years remaining for this employee to retire : ret yr is 65
                noYrsToRetirement := 60 - AppAge;

                //add noYrsToRetirement to current year to get retirement year da
                RetirementYear := yTODAY + noYrsToRetirement;
                //ERROR(FORMAT(RetirementYear));
                RetirementDate := Dmy2date(dDOB, mDOB, RetirementYear);
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
        }
        field(116; "Postal Address2"; Text[30])
        {
        }
        field(117; "Postal Address3"; Text[20])
        {
        }
        field(118; "Residential Address2"; Text[30])
        {
        }
        field(119; "Residential Address3"; Text[20])
        {
        }
        field(120; "Post Code2"; Code[20])
        {
            TableRelation = "Post Code";
        }
        field(121; Citizenship; Code[10])
        {
            TableRelation = "Country/Region".Code;
        }
        field(122; "Name Of Manager"; Text[45])
        {
        }
        field(123; "User ID"; Code[60])
        {
            TableRelation = "User Setup"."User ID";

            trigger OnLookup()
            begin
                //UserMgt.LookupUserID("User ID");
            end;
        }
        field(124; "Disabling Details"; Text[30])
        {
        }
        field(125; "Disability Grade"; Text[30])
        {
        }
        field(126; "Passport Number"; Text[30])
        {
        }
        field(127; "2nd Skills Category"; Option)
        {
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(128; "3rd Skills Category"; Option)
        {
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(129; PensionJoin; Text[8])
        {
        }
        field(130; DateLeaving; Text[30])
        {
        }
        field(131; Region; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('REGION'));
        }
        field(132; "Manager Emp No"; Code[30])
        {
        }
        field(133; Temp; Text[20])
        {
        }
        field(134; "Employee Qty"; Integer)
        {
            CalcFormula = count("HR Employees");
            FieldClass = FlowField;
        }
        field(135; "Employee Act. Qty"; Integer)
        {
            CalcFormula = count("HR Employees");
            FieldClass = FlowField;
        }
        field(136; "Employee Arc. Qty"; Integer)
        {
            CalcFormula = count("HR Employees");
            FieldClass = FlowField;
        }
        field(137; "Contract Location"; Text[10])
        {
            Description = 'Location where contract was closed';
        }
        field(138; "First Language Read"; Boolean)
        {
        }
        field(139; "First Language Write"; Boolean)
        {
        }
        field(140; "First Language Speak"; Boolean)
        {
        }
        field(141; "Second Language Read"; Boolean)
        {
        }
        field(142; "Second Language Write"; Boolean)
        {
        }
        field(143; "Second Language Speak"; Boolean)
        {
        }
        field(144; "Custom Grading"; Code[20])
        {
        }
        field(145; "PIN No."; Code[20])
        {
        }
        field(146; "NSSF No."; Code[20])
        {
        }
        field(147; "NHIF No."; Code[20])
        {
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
        }
        field(151; "Period Filter"; Date)
        {
        }
        field(152; "HELB No"; Text[10])
        {
        }
        field(153; "Co-Operative No"; Text[30])
        {
        }
        field(154; "Wedding Anniversary"; Date)
        {
        }
        field(156; "Competency Area"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(157; "Cost Center Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          "Dimension Value Type" = const(Standard));

            trigger OnValidate()
            begin
                if SalCard.Get("No.") then begin
                    SalCard.Nationality := "Cost Center Code";
                    SalCard.Modify;
                end;
            end;
        }
        field(158; "Position To Succeed"; Code[20])
        {
        }
        field(159; "Succesion Date"; Date)
        {
        }
        field(160; "Send Alert to"; Code[15])
        {
        }
        field(161; Tribe; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = filter(Tribe));
        }
        field(162; Religion; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = filter(Religion));
        }
        field(163; "Job Title"; Text[50])
        {
            CalcFormula = lookup("HR Jobs"."Job Description" where("Job ID" = field("Job ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(164; "Post Office No"; Text[20])
        {
        }
        field(165; "Posting Group"; Code[20])
        {
            NotBlank = false;
            TableRelation = "prEmployee Posting Group".Code;
        }
        field(166; "Payroll Posting Group"; Code[20])
        {
        }
        field(167; "Served Notice Period"; Boolean)
        {
        }
        field(168; "Exit Interview Date"; Date)
        {
        }
        field(169; "Exit Interview Done by"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
        }
        field(170; "Allow Re-Employment In Future"; Boolean)
        {
        }
        field(171; "Medical Scheme Name #2"; Text[30])
        {

            trigger OnValidate()
            begin
                //MedicalAidBenefit.SETRANGE("Employee No.","No.");
                //OK := MedicalAidBenefit.FIND('+');
                //IF OK THEN BEGIN
                // REPEAT
                // MedicalAidBenefit."Medical Aid Name":= "Medical Aid Name";
                //  MedicalAidBenefit.MODIFY;
                // UNTIL MedicalAidBenefit.NEXT = 0;
                // END;
            end;
        }
        field(172; "Resignation Date"; Date)
        {
        }
        field(173; "Suspension Date"; Date)
        {
        }
        field(174; "Demised Date"; Date)
        {
        }
        field(175; "Retirement date"; Date)
        {

            trigger OnValidate()
            begin
                //calculate age 02-05-1988
                yTODAY := Date2dmy(Today, 3); //2014

                yDOB := Date2dmy("Date Of Birth", 3);
                dDOB := Date2dmy("Date Of Birth", 1);
                mDOB := Date2dmy("Date Of Birth", 2);

                AppAge := yTODAY - yDOB;
                //HREmp.FIND('-');
                // IF HREmp.Disabled= HREmp.Disabled::No THEN BEGIN
                ////calculate how many years remaining for this employee to retire : ret yr is 60
                //noYrsToRetirement:=60 - AppAge;

                ////add noYrsToRetirement to current year to get retirement year da
                //RetirementYear:= yTODAY + noYrsToRetirement;
                ////ERROR(FORMAT(RetirementYear));
                //RetirementDate:=DMY2DATE(dDOB,mDOB,RetirementYear);
                //"Retirement date":=RetirementDate;
                //END ELSE
                // IF HREmp.Disabled= HREmp.Disabled::Yes THEN
                ////calculate how many years remaining for this employee to retire : ret yr is 60
                //noYrsToRetirement:=70 - AppAge;

                ////add noYrsToRetirement to current year to get retirement year da
                //RetirementYear:= yTODAY + noYrsToRetirement;
                ////ERROR(FORMAT(RetirementYear));
                //RetirementDate:=DMY2DATE(dDOB,mDOB,RetirementYear);
                //"Retirement date":=RetirementDate;
                ////END;
                ////END;
            end;
        }
        field(176; "Retrenchment date"; Date)
        {
        }
        field(177; Campus; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('CAMPUS'));
        }
        field(178; Permanent; Boolean)
        {
        }
        field(179; "Library Category"; Option)
        {
            OptionMembers = "ADMIN STAFF","TEACHING STAFF",DIRECTORS;
        }
        field(180; Category; Code[20])
        {
        }
        field(181; "Payroll Departments"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(188; "Salary Grade"; Code[20])
        {
            //TableRelation = "Payment Terms".Field1396040;
        }
        field(189; "Company Type"; Option)
        {
            OptionCaption = 'Others,USAID';
            OptionMembers = Others,USAID;
        }
        field(190; "Main Bank"; Code[20])
        {
            TableRelation = "PR Bank Accounts"."Bank Code";
        }
        field(191; "Branch Bank"; Code[20])
        {
            TableRelation = "PR Bank Accounts"."Bank Name";
        }
        field(192; "Lock Bank Details"; Boolean)
        {
        }
        field(193; "Bank Account Number"; Code[20])
        {
        }
        field(195; "Payroll Code"; Code[20])
        {
        }
        field(196; "Holiday Days Entitlement"; Decimal)
        {
        }
        field(197; "Holiday Days Used"; Decimal)
        {
        }
        field(198; "Payment Mode"; Option)
        {
            Description = 'Bank Transfer,Cheque,Cash,SACCO';
            OptionMembers = " ","Bank Transfer",Cheque,Cash,FOSA;
        }
        field(199; "Hourly Rate"; Decimal)
        {
        }
        field(200; "Daily Rate"; Decimal)
        {
        }
        field(300; "Social Security No."; Code[20])
        {
        }
        field(301; "Pension House"; Code[20])
        {
            TableRelation = "prInstitutional Membership"."Institution No" where("Group No" = const('PENSION'));
        }
        field(302; "Salary Notch/Step"; Code[20])
        {
        }
        field(303; "Status Change Date"; Date)
        {
        }
        field(304; "Previous Month Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(305; "Current Month Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(306; "Prev. Basic Pay"; Decimal)
        {
            FieldClass = Normal;
        }
        field(307; "Curr. Basic Pay"; Decimal)
        {
            FieldClass = Normal;
        }
        field(308; "Prev. Gross Pay"; Decimal)
        {
            FieldClass = Normal;
        }
        field(309; "Curr. Gross Pay"; Decimal)
        {
            FieldClass = Normal;
        }
        field(310; "Gross Income Variation"; Decimal)
        {
            FieldClass = Normal;
        }
        field(311; "Basic Pay 2"; Decimal)
        {
            Editable = false;
        }
        field(312; "Net Pay"; Decimal)
        {
        }
        field(313; "Transaction Amount"; Decimal)
        {
        }
        field(314; "Transaction Code Filter"; Text[30])
        {
            FieldClass = FlowFilter;
            TableRelation = "Bank Bal. Alert Buffer"."Line No.";
        }
        field(317; "Account Type"; Option)
        {
            OptionCaption = ' ,Savings,Current';
            OptionMembers = " ",Savings,Current;
        }
        field(318; "Location/Division Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('LOC/DIV'));
        }
        field(319; "Department Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('DEPARTMENT'));
        }
        field(320; "Cost Centre Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('COSTCENTRE'));
        }
        field(323; "Payroll Type"; Option)
        {
            Description = 'General,Consultants,Seconded Staff';
            OptionCaption = 'General,Consultants,Seconded Staff';
            OptionMembers = General,Consultants,"Seconded Staff";
        }
        field(324; "Employee Classification"; Code[20])
        {
            Description = 'Service';
            TableRelation = "Employee Class".Code;
        }
        field(328; "Department Name"; Text[50])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 2 Code")));
            FieldClass = FlowField;
        }
        field(329; "County Name"; Text[30])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 1 Code")));
            FieldClass = FlowField;
        }
        field(2004; "Total Leave Taken"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Staff No." = field("No."),
                                                                             "Leave Entry Type" = const(Negative),
                                                                             Closed = const(false),
                                                                             "Leave Type" = const('ANNUAL'),
                                                                             "Leave Calendar Code" = const('2021/2022'),
                                                                             "Journal Batch Name" = const('POSITIVE')));
            DecimalPlaces = 2 : 2;
            FieldClass = FlowField;
        }
        field(2006; "Total (Leave Days)"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            Editable = false;
        }
        field(2007; "Cash - Leave Earned"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(2008; "Reimbursed Leave Days"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Staff No." = field("No."),
                                                                             "Posting Date" = filter(07;
            DecimalPlaces = 2 : 2;
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                Validate("Allocated Leave Days");
            end;
        }
        field(2009; "Cash per Leave Day"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(2023; "Allocated Leave Days"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Staff No." = field("No."),
                                                                             "Posting Date" = filter(07;
            FieldClass = FlowField;

            trigger OnValidate()
            begin


                CalcFields("Leave Balance");
                "Leave Balance" := "Total (Leave Days)" - "Total Leave Taken";

            end;
        }
        field(2024; "End of Contract Date"; Date)
        {
        }
        field(2040; "Leave Period Filter"; Code[20])
        {
        }
        field(3899; "Mutliple Bank A/Cs"; Boolean)
        {
        }
        field(3900; "No. Of Bank A/Cs"; Integer)
        {
            CalcFormula = count("HR Employee Bank Accounts" where("Bank  Code" = filter(<> ''),
                                                                   "Branch Code" = filter(<> ''),
                                                                   "A/C  Number" = filter(<> ''),
                                                                   "Employee Code" = field("No.")));
            FieldClass = FlowField;
        }
        field(3971; "Annual Leave Account"; Decimal)
        {
        }
        field(3972; "Compassionate Leave Acc."; Decimal)
        {
        }
        field(3973; "Maternity Leave Acc."; Decimal)
        {
        }
        field(3974; "Paternity Leave Acc."; Decimal)
        {
        }
        field(3975; "Sick Leave Acc."; Decimal)
        {
        }
        field(3976; "Study Leave Acc"; Decimal)
        {
        }
        field(3977; "Appraisal Method"; Option)
        {
            OptionCaption = ' ,Normal Appraisal,360 Appraisal';
            OptionMembers = " ","Normal Appraisal","360 Appraisal";
        }
        field(3978; "Employee Type Primary"; Option)
        {
            OptionMembers = " ",Primary,Secondary,Board;
        }
        field(3988; "Leave Type"; Code[20])
        {
            //TableRelation = Table39005570.Field1;
        }
        field(3989; "Employee Type"; Option)
        {
            OptionMembers = Normal,Deployed;
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
        }
        field(39003903; HR; Boolean)
        {
        }
        field(39003904; "Date Of Joining the Company"; Date)
        {
        }
        field(39003905; "Date Of Leaving the Company"; Date)
        {
        }
        field(39003906; "Termination Grounds"; Option)
        {
            OptionCaption = ' ,Resignation,Non-Renewal Of Contract,Dismissal,Retirement,Death,Other';
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Death,Other;
        }
        field(39003907; "Cell Phone Number"; Text[20])
        {
            ExtendedDatatype = PhoneNo;
        }
        field(39003908; Grade; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const(Grade));
        }
        field(39003909; "Employee UserID"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(39003910; "Leave Balance"; Decimal)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days" where("Staff No." = field("No."),
                                                                             "Posting Date" = field("Date Filter"),
                                                                             Closed = const(false),
                                                                             "Leave Type" = const('ANNUAL'),
                                                                             "Leave Calendar Code" = filter('2021/2022')));
            FieldClass = FlowField;
        }
        field(39003911; "Leave Status"; Option)
        {
            OptionCaption = ' ,On Leave,Resumed';
            OptionMembers = " ","On Leave",Resumed;
        }
        field(39003912; "Pension Scheme Join Date"; Date)
        {
        }
        field(39003913; "Medical Scheme Join Date"; Date)
        {
        }
        field(39003914; "Leave Type Filter"; Code[20])
        {
            TableRelation = "HR Leave Types";
        }
        field(39003915; "Acrued Leave Days"; Decimal)
        {
        }
        field(39003916; Supervisor; Boolean)
        {
        }
        field(39003918; "Grant/Compliance Officer"; Boolean)
        {
        }
        field(39003921; Dim3; Text[10])
        {
        }
        field(39003922; Dim4; Text[10])
        {
        }
        field(39003923; IsPayrollPeriodCreator; Boolean)
        {
        }
        field(39003925; "Basic Pay"; Decimal)
        {
            CalcFormula = lookup("PR Salary Card"."Basic Pay" where("Employee Code" = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(39003926; "Other Name"; Text[20])
        {
        }
        field(39003927; "Exist IN User Setup"; Boolean)
        {
            CalcFormula = exist("User Setup" where("User ID" = field("User ID")));
            FieldClass = FlowField;
        }
        field(39003928; "Commisioner?"; Boolean)
        {
        }
        field(39003929; "No. of Employees"; Integer)
        {
            CalcFormula = count("HR Employees" where("Commisioner?" = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(39003930; "On Leave"; Boolean)
        {
        }
        field(39003931; "Job Group Range"; Code[20])
        {
        }
        field(39003932; "Contract Duration"; Code[10])
        {

            trigger OnValidate()
            begin
                "Contract End Date" := 0D;

                //IF ("Contract Type" = "Contract Type"::Contract) AND ("Contract Duration" <> '') THEN
                //BEGIN
                "Contract End Date" := CalcDate("Contract Duration", "Contract Start Date");
                //END;

                if ("Contract Type" = "contract type"::Probation) then begin
                    //  "Contract Duration":='6M';
                    //  "Contract End Date":=CALCDATE("Contract Duration","Date Of Joining the Company");
                end;
            end;
        }
        field(39003933; DAge; Text[20])
        {

            trigger OnValidate()
            begin
                if DAge <= '18Y' then
                    Error('The Staff Is UnderAge');
            end;
        }
        field(39003934; DPension; Text[40])
        {
        }
        field(39003935; "New Basic Pay"; Decimal)
        {
        }
        field(39003936; "Incremental Month"; Option)
        {
            OptionMembers = "None",January,February,March,April,May,June,July,August,September,October,November,December;
        }
        field(39003937; "Approval Status"; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved;
        }
        field(39003938; "Passport Expiry Date"; Date)
        {
        }
        field(39003939; "Date of Current Employment"; Date)
        {
        }
        field(39003940; "Type of Employee"; Option)
        {
            OptionMembers = Primary,Secondary;
        }
        field(39003941; "Residential status"; Option)
        {
            OptionMembers = Resident,"Non-Resident";
        }
        field(39003944; "Is Driver"; Boolean)
        {
        }
        field(39003945; "Exemption Certificate No."; Code[20])
        {
        }
        field(39003946; "Stop Pay"; Boolean)
        {
        }
        field(39003947; "Contract Start Date"; Date)
        {

            trigger OnValidate()
            begin
                "Contract End Date" := 0D;

                if ("Contract Type" = "contract type"::Contract) and ("Contract Duration" <> '') then begin
                    "Contract End Date" := CalcDate("Contract Duration", "Contract Start Date");
                end;

                if ("Contract Type" = "contract type"::Probation) then begin
                    //  "Contract Duration":='6M';
                    //  "Contract End Date":=CALCDATE("Contract Duration","Date Of Joining the Company");
                end;
            end;
        }
        field(39003948; "Specify Other Reasons"; Text[23])
        {
        }
        field(39003949; "Home District"; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = filter("Home District"));
        }
        field(39003950; Division; Text[30])
        {
        }
        field(39003951; Location; Text[30])
        {
        }
        field(39003952; "Sub Location"; Text[20])
        {
        }
        field(39003953; Ethnicity; Text[20])
        {
        }
        field(39003954; "Blood Group"; Option)
        {
            OptionCaption = ' ,A,B,AB,O-,O+';
            OptionMembers = " ",A,B,AB,"O-","O+";
        }
        field(39003955; Weight; Decimal)
        {
        }
        field(39003956; Height; Decimal)
        {
        }
        field(39003957; "Place Of Birth"; Text[10])
        {
        }
        field(39003958; "Job ID1"; Code[20])
        {
            TableRelation = "HR Jobs"."Job ID";

            trigger OnValidate()
            begin
                objJobs.Reset;
                objJobs.SetRange(objJobs."Job ID", "Job ID1");
                if objJobs.Find('-') then begin
                    "Job Title1" := objJobs."Job Description";
                end;
            end;
        }
        field(39003959; "Job ID2"; Code[20])
        {
            TableRelation = "HR Jobs"."Job ID";

            trigger OnValidate()
            begin
                objJobs.Reset;
                objJobs.SetRange(objJobs."Job ID", "Job ID2");
                if objJobs.Find('-') then begin
                    "Job Title2" := objJobs."Job Description";
                end;
            end;
        }
        field(39003960; "Job ID3"; Code[20])
        {
            TableRelation = "HR Jobs"."Job ID";

            trigger OnValidate()
            begin
                objJobs.Reset;
                objJobs.SetRange(objJobs."Job ID", "Job ID3");
                if objJobs.Find('-') then begin
                    "Job Title3" := objJobs."Job Description";
                end;
            end;
        }
        field(39003961; "Job ID4"; Code[20])
        {
            TableRelation = "HR Jobs"."Job ID";

            trigger OnValidate()
            begin
                objJobs.Reset;
                objJobs.SetRange(objJobs."Job ID", "Job ID4");
                if objJobs.Find('-') then begin
                    "Job Title4" := objJobs."Job Description";
                end;
            end;
        }
        field(39003962; "Job Title1"; Text[10])
        {
            Editable = true;
        }
        field(39003963; "Job Title2"; Text[10])
        {
            Editable = true;
        }
        field(39003964; "Job Title3"; Text[10])
        {
            Editable = true;
        }
        field(39003965; "Job Title4"; Text[10])
        {
            Editable = true;
        }
        field(39003966; Grade1; Code[10])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const(Grade));
        }
        field(39003967; Grade2; Code[10])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const(Grade));
        }
        field(39003968; Grade3; Code[10])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const(Grade));
        }
        field(39003969; Grade4; Code[10])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const(Grade));
        }
        field(39003970; "From Payroll4"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
        }
        field(39003971; "To Payroll4"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
        }
        field(39003972; "From Payroll1"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
        }
        field(39003973; "To payroll1"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
        }
        field(39003974; "From payroll2"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
        }
        field(39003975; "To Payroll2"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
        }
        field(39003976; "From payroll3"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
        }
        field(39003977; "To payroll3"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
        }
        field(39003978; "Show On Payslip"; Boolean)
        {
        }
        field(39003979; Acting; Boolean)
        {
        }
        field(39003980; "Job ID5"; Code[15])
        {
            TableRelation = "HR Jobs"."Job ID";

            trigger OnValidate()
            begin

                objJobs.Reset;
                objJobs.SetRange(objJobs."Job ID", "Job ID5");
                if objJobs.Find('-') then begin
                    "Job Title5" := objJobs."Job Description";
                end;
            end;
        }
        field(39003981; "Job Title5"; Text[30])
        {
            Editable = false;
        }
        field(39003982; Grade5; Code[10])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const(Grade));
        }
        field(39003983; "From Payroll5"; Date)
        {
        }
        field(39003984; "To Payroll5"; Date)
        {
        }
        field(39003985; "Reason For Acting"; Option)
        {
            OptionCaption = ' ,Demise,Resignation,Termination,Suspension';
            OptionMembers = " ",Demise,Resignation,Termination,Suspension;
        }
        field(39003986; "Responsibility Centre2"; Code[15])
        {
            TableRelation = "Responsibility Center BR NEW".Code;
        }
        field(39003987; "If Acted?"; Boolean)
        {
        }
        field(39003988; "Sitting C.E.O"; Boolean)
        {
        }
        field(39003989; DRetirement; Decimal)
        {
        }
        field(39003990; "Payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
        }
        field(39003991; Reason; Text[100])
        {
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
        fieldgroup(DropDown; "No.", Initials, "First Name", "Middle Name", "Last Name")
        {
        }
    }

    trigger OnDelete()
    begin
        //ERROR('Sorry, Deleting of an Existing Employee is stricktly not permitted');
    end;

    trigger OnInsert()
    begin
        //mm
        if "No." = '' then begin
            HrSetup.Get;
            HrSetup.TestField("Employee Nos.");
            NoSeriesMgt.InitSeries(HrSetup."Employee Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        //mm end
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
        Res: Record Resource;
        PostCode: Record "Post Code";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        OK: Boolean;
        User: Record "User Setup";
        ERROR1: label 'Employee Career History Starting Information already exist.';
        MSG1: label 'Employee Career History Starting Information successfully created.';
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
        EmpFullName: Text;
        SPACER: label ' ';
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
        Text0005: label 'Please note that ALL PAYROLL TRANSACTIONS PROCESSED for [EMPLOYEE  :: %1 - %2  ] in the [CURRENT PAYROLL PERIOD :: %3 ] will be deleted. \\Proceed?';
        PRSalaryCard: Record "PR Salary Card";
        Ref_Date: Date;
        NDays: Integer;
        ag: Integer;


    procedure AssistEdit(): Boolean
    begin
        GetHRSetup;
        HrSetup.TestField("Employee Nos.");
        if NoSeriesMgt.SelectSeries(HrSetup."Employee Nos.", xRec."No. Series", "No. Series") then begin
            NoSeriesMgt.SetSeries("No.");
            exit(true);
        end;
    end;


    procedure FullName(): Text[100]
    begin
        if "Middle Name" = '' then
            exit("Known As" + ' ' + "Last Name")
        else
            exit("Known As" + ' ' + "Middle Name" + ' ' + "Last Name");
    end;


    procedure CurrentPayDetails()
    begin
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
        if not HasHRSetup then begin
            HrSetup.Get;
            HasHRSetup := true;
        end;
    end;
}

 */