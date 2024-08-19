#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69600 "Company Positions"
{
    // DrillDownPageID = "Positions Lists";
    // LookupPageID = "Positions Lists";

    fields
    {
        field(1; "Position ID"; Code[20])
        {
            // NotBlank = true;
            Caption = 'Position No';
        }
        field(2; "Job Title"; Text[250])
        {
        }
        field(3; "Directly Reports To"; Code[30])
        {
            Caption = 'Hierarchically (Directly) Reports To';
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions";
        }
        field(4; "Indirectly Reports To"; Code[30])
        {
            Caption = 'Functionally (Indirectly) Reports To';
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions";
        }
        field(5; "Executive Summary/Job Purpose"; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Designation Group"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Designation Groups";
        }
        field(7; "Job Grade ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salary Scales";
            Caption = 'Job Grade';
        }
        field(8; "Overall Appointment Authority"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;// where("Blocked?" = const(false),
                                                         //     "Operating Unit Type" = filter(Authority));
        }
        field(9; "Seniority Level"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Entry-Level,Mid-Level,Senior-Level,Executive,Supervisory Level';
            OptionMembers = ,"Entry-Level","Mid-Level","Senior Level",Executive,"Supervisory Level";
        }
        field(10; "Default Terms of Service"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Terms of Service";
        }
        field(11; "Employment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer';
            OptionMembers = Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer;
        }
        field(12; Directorate; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;//] where("Operating Unit Type" = filter(Directorate),
                                                         //       "Blocked?" = const(false));
        }
        field(13; Department; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;// where("Operating Unit Type" = filter("Department/Center"),
                                                         //       "Blocked?" = const(false));
        }
        field(14; "Minimum Academic Qualification"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Qualification where("Qualification Category" = filter(Academic),
                                                 Blocked = filter(false));

            trigger OnValidate()
            begin
                if Qualification.Get("Minimum Academic Qualification") then
                    "Academic Hierarchy Code" := Qualification."Academic Hierachy Code";
            end;
        }
        field(15; "Minimum Work Experience"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Minimum Mngmnt Experience"; Integer)
        {
            Caption = 'Minimum Management Experience';
            DataClassification = ToBeClassified;
        }
        field(17; "Default Probation Period"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Default Duty Station"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Duty Station";

            trigger OnValidate()
            begin
                if DesignationGroups.Get("Default Duty Station") then begin
                    "Job Grade ID" := DesignationGroups."Job Grade";
                end;
            end;
        }
        field(19; "Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Travel Frequency"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'None,Occassional,Frequent';
            OptionMembers = "None",Occassional,Frequent;
        }
        field(21; "Default Work Shift"; Code[30])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Employee Work Shift";

            trigger OnValidate()
            begin
                //   if EmployeeWorkShift.Get("Default Work Shift") then
                //      "Work Shift Description" := EmployeeWorkShift.Description;
            end;
        }
        field(22; "Work Shift Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Additional Responsibilities"; Boolean)
        {
            Caption = 'Additional Responsibilities may be added';
            DataClassification = ToBeClassified;
        }
        field(24; "Loc Relocation/Transfers"; Boolean)
        {
            Caption = 'Local Relocation/Transfers Apply';
            DataClassification = ToBeClassified;
        }
        field(25; "Int Relocation/Transfers"; Boolean)
        {
            Caption = 'International Relocation/Transfers Apply';
            DataClassification = ToBeClassified;
        }
        field(26; "Qualifies for Overtime"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Direct Hire Unit Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Average Monthly Salary (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Approved Establishment"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "No of Active Contracts"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "No. of Terminated Contracts"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnLookup()
            begin
                ShowDimensions;
            end;

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", Directorate, Department);
            end;
        }
        field(33; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Academic Hierarchy Code"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(35; "Position Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Employee,Resource,Intern,Management Trainee';
            OptionMembers = Employee,Resource,Intern,"Management Trainee";
        }
        field(36; "Cadre Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Cadre Groups Setup".Code;
        }
        field(37; "Maximum Monthly Salary (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(38; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Approved,Not Approved';
            OptionMembers = " ",Approved,"Not Approved";
        }
        field(39; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(40; "No. Series"; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Created By"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(42; "Document Date"; date)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(Key1; "Position ID")
        {
            Clustered = true;
        }
        key(Key2; "Job Title")
        {

        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Position ID", "Job Title")
        {
        }
    }
    trigger OnInsert()
    begin
        if "Position ID" = '' then begin
            HumanResourcesSetup.Get;
            HumanResourcesSetup.TestField("Job Position No.s");
            NoSeriesManagement.InitSeries(HumanResourcesSetup."Job Position No.s", xRec."No. Series", 0D, "Position ID", "No. Series");
        end;
        "Created By" := UserId;
        "Document Date" := Today;
    end;

    var
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        CompanyPositions: Record "Company Positions";
        NoOfPosts: Decimal;
        HREmp: Record Employee;
        SalaryScales: Record "Salary Scales";
        // EmployeeWorkShift: Record "Employee Work Shift";
        DimMgt: Codeunit DimensionManagement;
        Qualification: Record Qualification;
        DesignationGroups: Record "Designation Groups";

    procedure ShowDimensions()
    var
        DimMgt: Codeunit DimensionManagement;
    begin
        DimMgt.ShowDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', TableCaption, "Position ID"));
    end;
}

