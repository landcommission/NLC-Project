#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193520 "HR Appraisal Eval Areas"
{
    Caption = 'HR Appraisal Eval Areas';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Assign To"; Code[20])
        {
            TableRelation = "HR Jobs";
            Caption = 'Assign To';
        }
        field(2; "Code"; Code[20])
        {
            NotBlank = false;
            Caption = 'Code';
            trigger OnValidate()
            var
                HRAppEvalAreas: Record "HR Appraisal Eval Areas";
            begin
                HRAppEvalAreas.Reset();
                HRAppEvalAreas.SetRange(HRAppEvalAreas.Code, Code);
                if HRAppEvalAreas.Find('-') then
                    Error('Code [%1] already exist, Please use another code', Code);
            end;
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
            Caption = 'Line No.';
        }
        field(4; "Categorize As"; Option)
        {
            OptionCaption = ' ,Employee''s Subordinates,Employee''s Peers,External Sources,Job Specific,Self Evaluation';
            OptionMembers = " ","Employee's Subordinates","Employee's Peers","External Sources","Job Specific","Self Evaluation";
            Caption = 'Categorize As';
        }
        field(5; "Sub Category"; Option)
        {
            OptionCaption = ' ,Objectives,Core Responsibilities / Duties,Attendance & Punctuality,Communication,Cooperation,Planning & Organization,Quality,Team Work,Sales Skills,Leadership,Performance Coaching';
            OptionMembers = " ",Objectives,"Core Responsibilities / Duties","Attendance & Punctuality",Communication,Cooperation,"Planning & Organization",Quality,"Team Work","Sales Skills",Leadership,"Performance Coaching";
            Caption = 'Sub Category';
        }
        field(6; Description; Text[250])
        {
            NotBlank = false;
            Caption = 'Description';
        }
        field(7; "Include in Evaluation Form"; Boolean)
        {
            Caption = 'Include in Evaluation Form';
        }
        field(8; "External Source Type"; Option)
        {
            OptionCaption = ' ,Vendor,Customer';
            OptionMembers = " ",Vendor,Customer;
            Caption = 'External Source Type';
        }
        field(9; "External Source Code"; Code[10])
        {
            TableRelation = if ("External Source Type" = const(Customer)) Customer."No."
            else
            if ("External Source Type" = const(Vendor)) Vendor."No.";
            Caption = 'External Source Code';
        }
        field(10; "External Source Name"; Text[100])
        {
            FieldClass = Normal;
            Caption = 'External Source Name';
        }
        field(11; "Assigned To"; Text[100])
        {
            CalcFormula = lookup("HR Jobs"."Job Description" where("Job ID" = field("Assign To")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Assigned To';
        }
        field(12; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(13; "Appraisal Period"; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = filter("Appraisal Period"),
                                                           Closed = const(false));
            Caption = 'Appraisal Period';
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
