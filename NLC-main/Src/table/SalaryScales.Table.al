#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 69015 "Salary Scales"
{
    DrillDownPageId = "Salary Scale List";
    LookupPageId = "Salary Scale List";
    Caption = 'Salary Scales';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Scale; Code[10])
        {
            Caption = 'Scale';
        }
        field(2; "Minimum Pointer"; Code[10])
        {
            TableRelation = "Salary Pointers"."Salary Pointer" where("Salary Scale" = field(Scale));
            Caption = 'Minimum Pointer';
        }
        field(3; "Maximum Pointer"; Code[10])
        {
            TableRelation = "Salary Pointers"."Salary Pointer" where("Salary Scale" = field(Scale));
            Caption = 'Maximum Pointer';
        }
        field(4; "Responsibility Allowance"; Decimal)
        {
            Caption = 'Responsibility Allowance';
        }
        field(5; "Commuter Allowance"; Decimal)
        {
            Caption = 'Commuter Allowance';
        }
        field(6; "In Patient Limit"; Decimal)
        {
            Caption = 'In Patient Limit';
        }
        field(7; "Out Patient Limit"; Decimal)
        {
            Caption = 'Out Patient Limit';
        }
        field(8; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(9; "Maximum Cover"; Decimal)
        {
            Caption = 'Maximum Cover';
        }
        field(69600; "Appointment Authority"; Code[30])
        {
            TableRelation = "Responsibility Center";//where("Blocked?" = filter(false), "Operating Unit Type" = filter(Authority));
            Caption = 'Appointment Authority';
        }
        field(69601; "Seniority Level"; Option)
        {
            OptionCaption = ',Entry-Level,Mid-Entry-Level,Level,Senior Level,Executive';
            OptionMembers = ,"Entry-Level","Mid-Entry-Level",Level,"Senior Level",Executive;
            Caption = 'Seniority Level';
        }
        field(69602; "Valid Positions"; Integer)
        {
            CalcFormula = count("HR Jobs" where(Grade = field(Scale)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Valid Positions';
        }
        field(69603; "Active Employees"; Integer)
        {
            Caption = 'Active Employees';
        }
        field(69604; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(69605; "Maximum Car Loan"; Decimal)
        {
            Caption = 'Maximum Car Loan';
        }
        field(69606; "Maximum Mortage Loan"; Decimal)
        {
            Caption = 'Maximum Mortage Loan';
        }
        field(69607; "Bed Limit"; Decimal)
        {
            Caption = 'Bed Limit';
        }
        field(69608; "Maternity Limit"; Decimal)
        {
            Caption = 'Maternity Limit';
        }
        field(69609; "Dental Limit"; Decimal)
        {
            Caption = 'Dental Limit';
        }
        field(69610; "Optical Limit"; Decimal)
        {
            Caption = 'Optical Limit';
        }
        field(69611; "Employee Category"; Code[20])
        {
            Caption = 'Employee Category';
            //TableRelation = "Employee Posting GroupX";
        }
        field(69612; Status; Option)
        {
            OptionMembers = New,"Pending Approval",Approved,"Under Review";
            Caption = 'Status';
        }
        field(69613; "Mobility Transfer Rate"; Decimal)
        {
            Caption = 'Mobility Transfer Rate';
        }

    }

    keys
    {
        key(Key1; Scale)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}

