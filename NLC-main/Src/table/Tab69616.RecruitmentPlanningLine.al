#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69616 "Recruitment Planning Line"
{

    fields
    {
        field(1; "Recruitment Plan ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Plan";

            // trigger OnValidate()
            // begin
            //     RecruitmentPlan.Reset;
            //     RecruitmentPlan.SetRange("Document No.", "Recruitment Plan ID");
            //     if RecruitmentPlan.FindFirst then begin
            //         "Recruitment Plan Type" := RecruitmentPlan."Recruitment Plan Type";
            //         if RecruitmentPlan."Recruitment Plan Type" = RecruitmentPlan."recruitment plan type"::"Functional Plan" then begin
            //             //auto-populate department
            //             Employee.Reset;
            //             Employee.SetRange("User ID", RecruitmentPlan."Created BY");
            //             if Employee.FindFirst then begin
            //                 Department := Employee."Department Code";
            //                 Directorate := Employee."Directorate Code";
            //             end;
            //         end;
            //     end;
            // end;
        }
        field(2; "Position ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Position Code';
            //  TableRelation = "Establishment Planning Line"."Position ID" where("Duty Station ID" = field(Department), Blcoked = const(false));
            // TableRelation = if ("Position Category" = const(Employee));// "Establishment Planning Line"."Position ID" where("Duty Station ID" = field("Duty Station ID"),
            //  Blcoked = const(false), "Primary Key" = field("Staff Establishement"))
            //else
            //if ("Position Category" = const(Resource)) "Company Positions"."Position ID" where("Position Category" = const(Resource));
            // TestTableRelation = false;
            trigger OnValidate()
            begin
                if "Position Category" = "position category"::Employee then begin
                    if "Recruitment Plan Type" = "recruitment plan type"::"Special Recruitment"
                        then begin
                        CompanyPositions.Reset;
                        CompanyPositions.SetRange("Position ID", "Position ID");
                        if CompanyPositions.FindFirst then begin
                            "Job Title/Designation" := CompanyPositions."Job Title";
                            "Job Grade ID" := CompanyPositions."Job Grade ID";
                            // "Duty Station ID" := CompanyPositions."Default Duty Station";
                            "Average Monthly Salary (LCY)" := CompanyPositions."Average Monthly Salary (LCY)";
                            //"Current Headcount" := CompanyPositions."No of Active Contracts";
                            // "Staff Establishment" := CompanyPositions."Approved Establishment";
                            "Hierarchically Reports To" := CompanyPositions."Directly Reports To";
                            "Functionally  Reports To" := CompanyPositions."Indirectly Reports To";
                        end;
                    end;
                    if "Recruitment Plan Type" = "recruitment plan type"::"Functional Plan"
                       then begin
                        PlanningLine.Reset;
                        // PlanningLine.SetRange("Primary Key", "Staff Establishement");
                        PlanningLine.SetRange("Position ID", "Position ID");
                        PlanningLine.SetRange("Duty Station ID", "Duty Station ID");
                        if PlanningLine.FindSet then begin
                            CompanyPositions.Reset;
                            CompanyPositions.SetRange("Position ID", "Position ID");
                            if CompanyPositions.FindFirst then begin
                                "Job Title/Designation" := CompanyPositions."Job Title";
                                "Job Grade ID" := CompanyPositions."Job Grade ID";
                                //"Duty Station ID" := CompanyPositions."Default Duty Station";
                                "Average Monthly Salary (LCY)" := CompanyPositions."Average Monthly Salary (LCY)";
                                //"Current Headcount" := CompanyPositions."No of Active Contracts";
                                //  "Staff Establishment" := CompanyPositions."Approved Establishment";
                                "Hierarchically Reports To" := CompanyPositions."Directly Reports To";
                                "Functionally  Reports To" := CompanyPositions."Indirectly Reports To";
                            end;
                            // PlanningLine.CalcFields("No. of Active Employees");
                            "Job Title/Designation" := PlanningLine."Job Title/Designation";
                            //"Staff Establishment" := PlanningLine."Optimal Staffing";
                            //"Current Headcount" := PlanningLine."No. of Active Employees";
                            //Department := PlanningLine."Department Code";
                            //Directorate := PlanningLine."Directorate Code";
                            "Work Location Details" := PlanningLine."Work Location Details";

                        end;
                    end;
                    if "Recruitment Plan Type" = "recruitment plan type"::"Annual HR Plan"
                        then begin
                        PlanningLine.Reset;
                        PlanningLine.SetRange("Position ID", "Position ID");
                        if PlanningLine.FindSet then begin
                            CompanyPositions.Reset;
                            CompanyPositions.SetRange("Position ID", "Position ID");
                            if CompanyPositions.FindFirst then begin
                                "Job Title/Designation" := CompanyPositions."Job Title";
                                "Job Grade ID" := CompanyPositions."Job Grade ID";
                                //  "Duty Station ID" := CompanyPositions."Default Duty Station";
                                "Average Monthly Salary (LCY)" := CompanyPositions."Average Monthly Salary (LCY)";
                                // "Current Headcount" := CompanyPositions."No of Active Contracts";
                                // "Staff Establishment" := CompanyPositions."Approved Establishment";
                                "Hierarchically Reports To" := CompanyPositions."Directly Reports To";
                                "Functionally  Reports To" := CompanyPositions."Indirectly Reports To";
                            end;
                            //PlanningLine.CalcFields("No. of Active Employees");
                            "Job Title/Designation" := PlanningLine."Job Title/Designation";
                            //"Staff Establishment" := PlanningLine."Optimal Staffing";
                            // "Current Headcount" := PlanningLine."No. of Active Employees";
                            //Department := PlanningLine."Department Code";
                            // Directorate := PlanningLine."Directorate Code";
                        end;
                    end;
                end;
                // Validate("Recruitment Plan ID");
                if "Position Category" = "position category"::Resource then begin
                    CompanyPositions.Reset;
                    CompanyPositions.SetRange("Position ID", "Position ID");
                    if CompanyPositions.FindFirst then begin
                        "Job Title/Designation" := CompanyPositions."Job Title";
                        "Job Grade ID" := CompanyPositions."Job Grade ID";
                        // "Duty Station ID" := CompanyPositions."Default Duty Station";
                        "Average Monthly Salary (LCY)" := CompanyPositions."Average Monthly Salary (LCY)";
                        // "Current Headcount" := CompanyPositions."No of Active Contracts";
                        // "Staff Establishment" := CompanyPositions."Approved Establishment";
                        "Hierarchically Reports To" := CompanyPositions."Directly Reports To";
                        "Functionally  Reports To" := CompanyPositions."Indirectly Reports To";
                    end;
                end
            end;
        }
        field(3; "Duty Station ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Cost Center Code';
            TableRelation = "Duty Station" where(blocked = const(false));
        }
        field(4; "Staff Establishment"; Integer)
        {
            // CalcFormula = SUM("Establishment Planning Line"."Optimal Staffing" where("Primary Key" = field("Staff Establishement"),
            //"Position ID" = Field("Position ID"), "Duty Station ID" = field("Duty Station ID")));

            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Current Headcount"; Integer)
        {
            CalcFormula = count(Employee where("Job Title" = field("Position ID")));//,
                                                                                    // "Current Duty Station" = field("Duty Station ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "No. of Planned New Hires"; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                HumanResourcesSetup.Get;
                Rec.CalcFields("Staff Establishment");
                if HumanResourcesSetup."Strict Manpower Planning" = true then begin
                    if "No. of Planned New Hires" > "Staff Establishment" then
                        Error(TXT001, "Staff Establishment");
                end;
            end;
        }
        field(7; "Sourcing Method"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Recruitment Agency,Direct Hire';
            OptionMembers = "Recruitment Agency","Direct Hire";
        }
        field(8; "Recruitment Cycle Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Standard,Expedited';
            OptionMembers = Standard,Expedited;

            trigger OnValidate()
            begin
                // HumanResourcesSetup.GET;
                // IF "Recruitment Cycle Type"="Recruitment Cycle Type"::Expedited THEN
                //  BEGIN
                // "Recruitment Lead Time":=HumanResourcesSetup."Expe Recruitment Lead Time";
                //  END ELSE
                //  "Recruitment Lead Time":=HumanResourcesSetup."Standard Recruitment Lead Time";
            end;
        }
        field(9; "Recruitment Lead Time"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Planned Start Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //"Planned End Date":=CALCDATE("Recruitment Lead Time","Planned Start Date");
            end;
        }
        field(11; "Planned End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Primary Recruitment Reason"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Reason Code";
        }
        field(13; "Target Candidate Source"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Limited-Internal Staff,Limited-External Candidates';
            OptionMembers = Open,"Limited-Internal Staff","Limited-External Candidates";
        }
        field(14; "Direct Hire Unit Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Average Monthly Salary (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "No. of Months Recruiter Fees"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Recruiter Fees %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Rec Line Budget Cost (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Designation Group"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Designation Groups";
        }
        field(20; Directorate; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Court Level';
            // TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
            //                           Blocked = CONST(false));
            TableRelation = "Responsibility Center";// where("Operating Unit Type" = filter("Court Levels"));
        }
        field(21; Department; Code[30])
        {
            Caption = 'Directorate/Department/Court station/Office';
            DataClassification = ToBeClassified;
            // TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
            //       Blocked = CONST(false));
            TableRelation = "Responsibility Center";// where("Operating Unit Type" = filter("Department/Center" | Directorate | "Court Stations" | Office));
        }
        field(22; "Region ID"; Code[30])
        {
            Caption = 'County';
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";// where("Operating Unit Type" = filter(Region));
        }
        field(23; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(24; "Planned Employment Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Planned Employment End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Job No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(27; "Job Task No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No."));

            //             trigger OnValidate()
            //             begin
            //                 Job.Reset;
            //                 Job.SetRange("Job No.","Job No.");
            //                 Job.SetRange("Job Task No.","Job Task No.");
            //                 if Job.FindFirst then
            // ;
        }
        field(28; "Funding Source ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Funding Source".Code;
        }
        field(29; "Recruitment Line Budget Cost"; Decimal)
        {
            Caption = 'Recruitment Line Budget Cost(LCY)';
            DataClassification = ToBeClassified;
        }
        field(30; "Average Cost/Hire"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Estimate Annual Salary"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Hierarchically Reports To"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions";
        }
        field(33; "Functionally  Reports To"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions";
        }
        field(34; "Job Grade ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Job Grade';
            TableRelation = "Salary Scales";
        }
        field(35; "Overall Appointment Authority"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Seniority Level"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Entry-Level,Mid-Level,Senior-Level,Executive';
            OptionMembers = ,"Entry-Level","Mid-Level","Senior-Level",Executive;
        }
        field(37; "Default Terms of Service Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Terms of Service";
        }
        field(38; "Employment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Permanent,Contract,Casual,Internship,Attachment';
            OptionMembers = Permanent,Contract,Casual,Internship,Attachment;
        }
        field(39; "Job Title/Designation"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Work Location Details"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Recruitment Justification"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(42; "Recruitment Plan Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Annual HR Plan,Special Recruitment,Project Recruitment,Manpower Forecast,Functional Plan';
            OptionMembers = "Annual HR Plan","Special Recruitment","Project Recruitment","Manpower Forecast","Functional Plan";
        }
        field(43; "Dimension Set ID"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Plan Line No"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Establishment Planning Line"."Entry No.";

            trigger OnValidate()
            begin
                PlanningLine.Reset;
                PlanningLine.SetRange("Position ID", "Position ID");
                PlanningLine.SetRange("Entry No.", "Plan Line No");
                if PlanningLine.FindSet then begin
                    "Duty Station ID" := PlanningLine."Duty Station ID";
                    //"Staff Establishment" := PlanningLine."Optimal Staffing";
                    Department := PlanningLine."Department Code";
                    Directorate := PlanningLine."Directorate Code";
                end
            end;
        }
        field(45; "Position Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Employee,Resource,...';
            OptionMembers = Employee,Resource,"...";
            initvalue = "...";
        }
        field(46; "Staff Establishement"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Staff Establishment Plan";
        }
    }

    keys
    {
        key(Key1; "Recruitment Plan ID", "Duty Station ID", "Recruitment Plan Type", "Line No", "Position ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Position ID", "Job Title/Designation", Department, "No. of Planned New Hires")
        {
        }
    }

    trigger OnInsert()
    var
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
    begin
        RecruitmentPlan.reset();
        RecruitmentPlan.SetRange("Document No.", "Recruitment Plan ID");
        RecruitmentPlan.SetRange("Recruitment Plan Type", RecruitmentPlan."Recruitment Plan Type"::"Functional Plan");
        if RecruitmentPlan.FindFirst() then begin
            // "Duty Station ID" := RecruitmentPlan."Duty Station ID";
            "Staff Establishement" := RecruitmentPlan."Staff Establishement";

        end

    end;

    var
        PlanningLine: Record "Establishment Planning Line";
        HumanResourcesSetup: Record "Human Resources Setup";
        TXT001: label 'The maximum allowable no for this position is %1';
        Employee: Record Employee;
        EstablishmentPlanPosition: Record "Establishment Plan Position";
        RecruitmentPlan: Record "Recruitment Plan";
        CompanyPositions: Record "Company Positions";
        Job: Record "Job Task";
        HRSetup: Record "Human Resources Setup";
}

