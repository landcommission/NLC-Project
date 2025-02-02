#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193518 "HR Appraisal Header"
{
    Caption = 'HR Appraisal Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Appraisal No"; Code[30])
        {
            Caption = 'Appraisal No';
        }
        field(2; Supervisor; Text[100])
        {
            Editable = true;
            Caption = 'Supervisor';
            trigger OnValidate()
            begin
                HREmp.Reset();
                HREmp.SetRange(HREmp."No.", Supervisor);
                if HREmp.Find('-') then
                    "Supervisor Name" := HREmp."Full Name"
                else
                    "Supervisor Name" := '';
            end;
        }
        field(3; "Appraisal Type"; Code[30])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const("Appraisal Type"));
            Caption = 'Appraisal Type';
        }
        field(4; "Appraisal Period"; Code[30])
        {
            TableRelation = "HR Lookup Values".Description where(Type = filter("Appraisal Period"));
            Caption = 'Appraisal Period';

        }
        field(5; Status; Option)
        {
            Editable = true;
            OptionCaption = 'Appraisee,Immediate Supervisor,Immediate Supervisor Reviewed,Appraisee Reviewed,Supervisor,Approved/Closed/HR,Rejected';
            OptionMembers = Appraisee,"Immediate Supervisor","Immediate Supervisor Reviewed","Appraisee Reviewed",Supervisor,"Approved/Closed/HR",Rejected;
            Caption = 'Status';
        }
        field(6; Recommendations; Text[250])
        {
            Caption = 'Recommendations';
        }
        field(7; "No Series"; Code[20])
        {
            Caption = 'No Series';
        }
        field(8; "Appraisal Stage"; Option)
        {
            OptionCaption = 'Target Setting,Target Approval,End Year Evalauation';
            OptionMembers = "Target Setting","Target Approval","End Year Evalauation";
            Caption = 'Appraisal Stage';
        }
        field(9; Sent; Option)
        {
            OptionCaption = 'Appraisee,Supervisor,Completed,Rated';
            OptionMembers = Appraisee,Supervisor,Completed,Rated;
            Caption = 'Sent';
        }
        field(10; "User ID"; Code[100])
        {
            TableRelation = "User Setup"."User ID";
            Caption = 'User ID';
        }
        field(11; Picture; Blob)
        {
            Subtype = Bitmap;
            Caption = 'Picture';
        }
        field(12; "Employee No"; Code[30])
        {
            Editable = true;
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee No';
            trigger OnValidate()
            begin
                HREmp.Reset();
                HREmp.SetRange(HREmp."No.", "Employee No");
                if HREmp.Find('-') then begin
                    HREmp.CalcFields(HREmp.Picture);
                    rec.Picture := HREmp.Picture;
                    "Employee Name" := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
                    //    Department:=;
                    "Job Title" := HREmp."Job ID";
                    Rec."Job Description" := HREmp."Job Title";
                    rec."User ID" := HREmp."User ID";
                    //  Gender:=HREmp.Gender;
                    "Date of Employment" := HREmp."Date Of Join";

                end;
            end;
        }
        field(13; "Employee Name"; Text[60])
        {
            Editable = false;
            Caption = 'Employee Name';
        }
        field(14; "Date of Employment"; Date)
        {
            Caption = 'Date of Employment';
        }
        field(15; "Job Title"; Code[100])
        {
            Editable = true;

            TableRelation = "HR Jobs"."Job ID";
            Caption = 'Job ID';
        }
        field(16; Department; Code[20])
        {
            TableRelation = "HR Appraisal Company Target".Code;
            Caption = 'Department';

        }
        field(17; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(18; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(19; "Comments Appraisee"; Text[250])
        {
            Caption = 'Comments Appraisee';
        }
        field(20; "Comments Supervisor"; Text[250])
        {
            Caption = 'Comments Supervisor';
        }
        field(21; "Appraisal Date"; Date)
        {
            Caption = 'Appraisal Date';
        }
        field(22; "Evaluation Period Start"; Date)
        {
            Caption = 'Evaluation Period Start';
        }
        field(23; "Evaluation Period End"; Date)
        {
            Caption = 'Evaluation Period End';
        }
        field(24; "Target Type"; Option)
        {
            OptionCaption = ' ,Company Targets,Individual Targets,Peer Targets,Surbodinates Targets,Out Agencies Targets,Company Rating,Individual Rating,Peer Rating,Surbodinates Rating,Out Agencies Rating';
            OptionMembers = " ","Company Targets","Individual Targets","Peer Targets","Surbodinates Targets","Out Agencies Targets","Company Rating","Individual Rating","Peer Rating","Surbodinates Rating","Out Agencies Rating";
            Caption = 'Target Type';
        }
        field(25; "Responsibility/Duties Agrd Sco"; Decimal)
        {
            CalcFormula = sum("HR Appraisal Lines"."Agreed Rating" where("Appraisal No" = field("Appraisal No"),
                                                                          "Appraisal Period" = field("Appraisal Period"),
                                                                          "Employee No" = field("Employee No"),
                                                                          Sections = filter("Core Responsibilities/Duties")));
            Caption = 'Responsibility/Duties Agreed Score';
            ExtendedDatatype = Ratio;
            FieldClass = FlowField;
            Editable = false;
        }
        field(26; "Attendance&Punctuality Agr Sco"; Decimal)
        {
            CalcFormula = sum("HR Appraisal Lines"."Agreed Rating" where("Appraisal No" = field("Appraisal No"),
                                                                          "Appraisal Period" = field("Appraisal Period"),
                                                                          "Employee No" = field("Employee No"),
                                                                          Sections = filter("Attendance&Punctuality")));
            Caption = 'Attendance & Punctuality Agreed Score';
            FieldClass = FlowField;
            Editable = false;
        }
        field(27; "Communication Agreed Score"; Decimal)
        {
            CalcFormula = sum("HR Appraisal Lines"."Agreed Rating" where("Appraisal No" = field("Appraisal No"),
                                                                          "Appraisal Period" = field("Appraisal Period"),
                                                                          "Employee No" = field("Employee No"),
                                                                          Sections = filter(Communication)));
            ExtendedDatatype = Ratio;
            FieldClass = FlowField;
            Caption = 'Communication Agreed Score';
            Editable = false;
        }
        field(28; "Cooperation Agreed Score"; Decimal)
        {
            CalcFormula = sum("HR Appraisal Lines"."Agreed Rating" where("Appraisal No" = field("Appraisal No"),
                                                                          "Appraisal Period" = field("Appraisal Period"),
                                                                          "Employee No" = field("Employee No"),
                                                                          Sections = filter(Cooperation)));
            FieldClass = FlowField;
            Caption = 'Cooperation Agreed Score';
            Editable = false;
        }
        field(29; "Customer Service Agreed Score"; Decimal)
        {
            CalcFormula = sum("HR Appraisal Lines"."Agreed Rating" where("Appraisal No" = field("Appraisal No"),
                                                                          "Appraisal Period" = field("Appraisal Period"),
                                                                          "Employee No" = field("Employee No"),
                                                                          Sections = filter("Internal/External Clients")));
            FieldClass = FlowField;
            Caption = 'Customer Service Agreed Score';
            Editable = false;
        }
        field(30; "Initiative Agreed Score"; Decimal)
        {
            CalcFormula = sum("HR Appraisal Lines"."Agreed Rating" where("Appraisal No" = field("Appraisal No"),
                                                                          "Appraisal Period" = field("Appraisal Period"),
                                                                          "Employee No" = field("Employee No"),
                                                                          Sections = filter(Initiative)));
            FieldClass = FlowField;
            Caption = 'Initiative Agreed Score';
            Editable = false;
        }
        field(31; "Quality Agreed Score"; Decimal)
        {
            CalcFormula = sum("HR Appraisal Lines"."Agreed Rating" where("Appraisal No" = field("Appraisal No"),
                                                                          "Appraisal Period" = field("Appraisal Period"),
                                                                          "Employee No" = field("Employee No"),
                                                                          Sections = filter(Quality)));
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
            Caption = 'Quality Agreed Score';
            Editable = false;
        }
        field(32; "Teamwork Agreed Score"; Decimal)
        {
            CalcFormula = sum("HR Appraisal Lines"."Agreed Rating" where("Appraisal No" = field("Appraisal No"),
                                                                          "Appraisal Period" = field("Appraisal Period"),
                                                                          "Employee No" = field("Employee No"),
                                                                          Sections = filter("Team Work")));
            ExtendedDatatype = Ratio;
            FieldClass = FlowField;
            Caption = 'Teamwork Agreed Score';
            Editable = false;
        }
        field(33; "Sales Skills Agreed Score"; Decimal)
        {
            CalcFormula = sum("HR Appraisal Lines"."Agreed Rating" where("Appraisal No" = field("Appraisal No"),
                                                                          "Appraisal Period" = field("Appraisal Period"),
                                                                          "Employee No" = field("Employee No"),
                                                                          Sections = filter("Sales Skills")));
            FieldClass = FlowField;
            Caption = 'Sales Skills Agreed Score';
            Editable = false;
        }
        field(34; "Leadership Agreed Score"; Decimal)
        {
            CalcFormula = sum("HR Appraisal Lines"."Agreed Rating" where("Appraisal No" = field("Appraisal No"),
                                                                          "Appraisal Period" = field("Appraisal Period"),
                                                                          "Employee No" = field("Employee No"),
                                                                          Sections = filter(Leadership)));
            FieldClass = FlowField;
            Caption = 'Leadership Agreed Score';
            Editable = false;
        }
        field(35; "Performance Coaching Agreed Sc"; Decimal)
        {
            CalcFormula = sum("HR Appraisal Lines"."Agreed Rating" where("Appraisal No" = field("Appraisal No"),
                                                                          "Appraisal Period" = field("Appraisal Period"),
                                                                          "Employee No" = field("Employee No"),
                                                                          Sections = filter("Performance Coaching")));
            Caption = 'Performance Coaching Agreed Score';
            FieldClass = FlowField;
            Editable = false;
        }
        field(36; "Action Recomended"; Integer)
        {
            Caption = 'Action Recomended';
        }
        field(37; "Job Specific Agreed Score"; Decimal)
        {
            CalcFormula = sum("HR Appraisal Lines"."Self Rating" where("Appraisal No" = field("Appraisal No"),
                                                                        "Appraisal Period" = field("Appraisal Period"),
                                                                        "Employee No" = field("Employee No")));
            FieldClass = FlowField;
            Caption = 'Job Specific Agreed Score';
            Editable = false;
        }
        field(38; "Employee Subordinates"; Decimal)
        {
            CalcFormula = sum("HR Appraisal Lines"."Sub-ordinates Rating" where("Appraisal No" = field("Appraisal No"),
                                                                                 "Appraisal Period" = field("Appraisal Period"),
                                                                                 "Employee No" = field("Employee No")));
            Caption = 'Employee Subordinates Agreed Score';
            FieldClass = FlowField;
            Editable = false;
        }
        field(39; "Employee Peers"; Decimal)
        {
            CalcFormula = sum("HR Appraisal Lines"."Peer Rating" where("Appraisal No" = field("Appraisal No"),
                                                                        "Appraisal Period" = field("Appraisal Period"),
                                                                        "Employee No" = field("Employee No")));
            Caption = 'Employee Peers Agreed Score';
            FieldClass = FlowField;
            Editable = false;
        }
        field(40; "Job Description"; Text[100])
        {
            // CalcFormula = lookup("HR Jobs"."Job Description" where("Job ID" = field("Job Title")));
            Editable = false;
            // FieldClass = FlowField;
            Caption = 'Job Title';
        }
        field(41; "Appraisal Method"; Option)
        {
            OptionCaption = ' ,Normal Appraisal,360 Appraisal';
            OptionMembers = " ","Normal Appraisal","360 Appraisal";
            Caption = 'Appraisal Method';
        }
        field(42; "Supervisor ID"; Code[40])
        {
            Editable = true;
            TableRelation = "User Setup"."User ID";
            Caption = 'Supervisor ID';
        }
        field(43; "Supervisor Job Title"; Text[50])
        {
            CalcFormula = lookup("HR Employees"."Job ID" where("Employee UserID" = field("Supervisor ID")));
            Editable = true;
            FieldClass = FlowField;
            Caption = 'Supervisor Job Title';
        }
        field(50000; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center BR 2";
        }
        field(50011; "Contract Type"; Option)
        {
            OptionMembers = Permanent,"Temporary",Voluntary,Probation,Contract;
            Caption = 'Contract Type';
        }
        field(50014; "Appraisal Approval Status"; Option)
        {
            OptionMembers = "Pending Approval",Approved;
            Caption = 'Appraisal Approval Status';
        }
        field(50015; "Supervisor UserID"; Code[50])
        {
            TableRelation = User."User Name";
            Caption = 'Supervisor UserID';
        }
        field(50020; "Prev Appraisal Code"; Code[50])
        {
            Caption = 'Prev Appraisal Code';
        }
        field(50021; "Agreed Goals 1"; Text[30])
        {
            Description = 'Agreed goals for the year ahead';
            Caption = 'Agreed Goals 1';
        }
        field(50022; "Responsibility/Duties Comment"; Text[100])
        {
            Caption = 'Responsibility/Duties Agreed Score';
            FieldClass = Normal;
        }
        field(50023; "Attendance&Punctuality Comment"; Text[30])
        {
            Caption = 'Attendance & Punctuality Agreed Score';
            FieldClass = Normal;
        }
        field(50024; "Communication Agreed Comment"; Text[30])
        {
            FieldClass = Normal;
            Caption = 'Communication Agreed Comment';
        }
        field(50025; "Cooperation Agreed Comment"; Text[30])
        {
            FieldClass = Normal;
            Caption = 'Cooperation Agreed Comment';
        }
        field(50026; "Customer Service Agr Comment"; Text[30])
        {
            FieldClass = Normal;
            Caption = 'Customer Service Agr Comment';
        }
        field(50027; "Initiative Agreed Comment"; Text[30])
        {
            FieldClass = Normal;
            Caption = 'Initiative Agreed Comment';
        }
        field(50028; "Quality Agreed Comment"; Text[30])
        {
            FieldClass = Normal;
            Caption = 'Quality Agreed Comment';
        }
        field(50029; "Teamwork Agreed Comment"; Text[30])
        {
            FieldClass = Normal;
            Caption = 'Teamwork Agreed Comment';
        }
        field(50030; "Sales Skills Agreed Comment"; Text[30])
        {
            FieldClass = Normal;
            Caption = 'Sales Skills Agreed Comment';
        }
        field(50031; "Leadership Agreed Comment"; Text[30])
        {
            FieldClass = Normal;
            Caption = 'Leadership Agreed Comment';
        }
        field(50032; "Performance Coaching Comment"; Text[30])
        {
            Caption = 'Performance Coaching Agreed Score';
            FieldClass = Normal;
        }
        field(50033; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
        field(50034; "Explored By Appraisee"; Boolean)
        {
            Caption = 'Explored By Appraisee';
        }
        field(50035; "Explored By Supervisor"; Boolean)
        {
            Caption = 'Explored By Supervisor';
        }
        field(50036; "Second Supervisor"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Second Supervisor';
        }
        field(50037; "Second Supervisor UserID"; Code[50])
        {
            Caption = 'Second Supervisor UserID';
        }
        field(50038; "Second Supervisor Comments"; Text[250])
        {
            Caption = 'Second Supervisor Comments';
        }
        field(50039; "Explored By Second Supervisor"; Boolean)
        {
            Caption = 'Explored By Second Supervisor';
        }
        field(50040; "Supervisor Recomendations"; Text[250])
        {
            Caption = 'Supervisor Recomendations';
        }
        field(50041; "SecSupervisor Recomendations"; Text[250])
        {
            Caption = 'SecSupervisor Recomendations';
        }
        field(50042; "SecSupervisor Comments"; Text[250])
        {
            Caption = 'SecSupervisor Comments';
        }
        field(50043; "Supervisor Name"; Text[100])
        {
            Caption = 'Supervisor Name';
        }
        field(50044; "Appraisal Score"; Decimal)
        {
            CalcFormula = average("HR Objectives Targets"."Agreed Ratings" where("Appraisal Code" = field("Appraisal No")));
            FieldClass = FlowField;
            Caption = 'Appraisal Score';
            Editable = false;
        }
        field(50045; "Second Supervisor Name"; Text[100])
        {
            CalcFormula = lookup("HR Employees"."Full Name" where("No." = field("Second Supervisor")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Second Supervisor Name';
        }
        field(50046; "Mid Year Review"; Option)
        {
            OptionCaption = 'MidYearAppriasee,MidYearSupervisor,EndMidYearReview';
            OptionMembers = MidYearAppriasee,MidYearSupervisor,EndMidYearReview;
            Caption = 'Mid Year Review';
        }
        field(50047; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(50048; "Responsibility Centre"; Code[30])
        {
            CalcFormula = lookup("HR Employees"."Responsibility Center" where("No." = field("Employee No")));
            FieldClass = FlowField;
            Caption = 'Responsibility Centre';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Appraisal No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Appraisal No", "Employee No", "Employee Name")
        {

        }
    }

    trigger OnDelete()
    begin
        /*
        TESTFIELD(Status,Status::Appraisee);
        */
        //Also delete lines
        HRGoalSettingL.Reset();
        HRGoalSettingL.SetRange(HRGoalSettingL."Appraisal No", "Appraisal No");
        if HRGoalSettingL.Find('-') then
            HRGoalSettingL.DeleteAll();

        //   ERROR('disabled');

    end;

    trigger OnInsert()
    begin
        if "Appraisal No" = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Appraisal Nos");
            NoSeriesMgt.InitSeries(HRSetup."Appraisal Nos", xRec."No Series", 0D, "Appraisal No", "No Series");
        end;
        "Appraisal Date" := Today;

        //GET APPLICANT DETAILS FROM HR EMPLOYEES TABLE AND COPY THEM TO THE GOAL SETTING TABLE
        HREmp.Reset();

        /*
        //HREmp.SETRANGE(HREmp."User ID",USERID);
        HREmp.SETRANGE(HREmp."User ID","User ID");
        IF HREmp.FIND('-') THEN
        BEGIN
            "Employee No":=HREmp."No.";
            "Employee Name":=HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
            "Date of Employment":=HREmp."Date Of Joining the Company";
            "Global Dimension 1 Code":=HREmp."Global Dimension 1 Code";
            "Global Dimension 2 Code":=HREmp."Global Dimension 2 Code";
            "Job Title":=HREmp."Job ID";
            "Contract Type":= HREmp."Contract Type" ;
            "User ID":=USERID;
            //Supervisor:=HREmpCard.GetSupervisor("User ID");
            HREmp.CALCFIELDS(HREmp.Picture);
            Picture:=HREmp.Picture;
            "Appraisal Stage":="Appraisal Stage"::"Target Setting";

        {
            //For 360
            HRSetup.RESET;
            IF HRSetup.GET THEN
            BEGIN
                HRSetup.TESTFIELD(HRSetup."Min. Leave App. Months");
            END;

            IF HREmp."Appraisal Method" = HREmp."Appraisal Method"::" " THEN
            BEGIN
                //Default to value in HR Setup if not filled
                "Appraisal Method":=HRSetup."Min. Leave App. Months";
            END ELSE
            BEGIN
                //Select appraisal from Employee PIF
                "Appraisal Method":=HREmp."Appraisal Method";
            END;
            //End for 360
        }


        END ELSE
        BEGIN
            //ERROR('User ID'+' '+USERID+' '+'is not assigned to any employee. Consult the HR Officer so as to be setup as an employee')
            ERROR('User ID'+' ' + "User ID" + ' '+'is not assigned to any employee. Consult the HR Officer so as to be setup as an employee')
        END;
        */

        //Put the open appraisal period

        /*
        HRLookUpValues.RESET;
        HRLookUpValues.SETRANGE(HRLookUpValues.Type,HRLookUpValues.Type::"Appraisal Period");
        HRLookUpValues.SETRANGE(HRLookUpValues.Closed,FALSE);
        IF HRLookUpValues.FIND('-') THEN BEGIN
          "Appraisal Period":=HRLookUpValues.Code;
          "Appraisal Stage":=HRLookUpValues."Appraisal Stage";
          "Evaluation Period Start":=HRLookUpValues.From;
          "Evaluation Period End":=HRLookUpValues."To";
        END
        ELSE
        BEGIN
            ERROR('There are no open Appraisal Periods, Please define one in HR Lookup Values');
        END;
        */

    end;

    var
        HREmp: Record "HR Employees";
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HREmpCard: Page "HR Employee Card";
        HRAppraisalRatings: Record "HR Appraisal Company Target";
        HRAppraisalGoalSettingH: Record "HR Appraisal Header";
        HRGoalSettingL: Record "HR Appraisal Lines";
        HRGoalSettingLNext: Record "HR Appraisal Lines";
        HRLookUpValues: Record "HR Lookup Values";
        LastAppraisal: Record "HR Appraisal Header";
        CompanyScoreAppraisee: Decimal;
        KPIScoreAppraisee: Decimal;
        PFScoreAppraisee: Decimal;
        PFBase: Decimal;
        HrRatings: Record "HR Appraisal Company Target";
        UserSetup: Record "User Setup";
        Approver: Record "User Setup";
        KPIScoreAppraiser: Decimal;
        KPIScoreMgt: Decimal;
        PFScoreAppraiser: Decimal;
        PFScoreMgt: Decimal;
}
