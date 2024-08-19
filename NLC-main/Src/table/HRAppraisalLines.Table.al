#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193519 "HR Appraisal Lines"
{
    Caption = 'HR Appraisal Lines';
    DataClassification = CustomerContent;
    //               HRAppraisalGoalSettingH.GET("Appraisal No");
    //                 "Employee No":=HRAppraisalGoalSettingH."Employee No";
    //                 HRAppraisalGoalSettingH.TESTFIELD(HRAppraisalGoalSettingH."Appraisal Period");
    //                 "Appraisal Period":=HRAppraisalGoalSettingH."Appraisal Period"


    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No';
        }
        field(2; "Appraisal No"; Code[30])
        {
            TableRelation = "HR Appraisal Header"."Appraisal No";
            Caption = 'Appraisal No';
        }
        field(3; "Appraisal Period"; Code[20])
        {
            NotBlank = true;
            TableRelation = "HR Lookup Values".Code where(Type = filter("Appraisal Period"),
                                                           Closed = const(false));
            Caption = 'Appraisal Period';
        }
        field(4; "Employee No"; Code[20])
        {
            NotBlank = true;
            TableRelation = "HR Employees";
            Caption = 'Employee No';
        }
        field(5; Sections; Option)
        {
            OptionCaption = 'Objectives,Core Responsibilities/Duties,Last year''s goals,Things learnt From Training,Value Added From Training,Attendance&Punctuality,Communication,Cooperation,Internal/External Clients,Initiative,Planning & Organization,Quality,Team Work,Sales Skills,Leadership,Performance Coaching';
            OptionMembers = Objectives,"Core Responsibilities/Duties","Last year's goals","Things learnt From Training","Value Added From Training","Attendance&Punctuality",Communication,Cooperation,"Internal/External Clients",Initiative,"Planning & Organization",Quality,"Team Work","Sales Skills",Leadership,"Performance Coaching";
            Caption = 'Sections';
        }
        field(6; "Perfomance Goals and Targets"; Text[250])
        {
            Caption = 'Perfomance Goals and Targets';
        }
        field(7; "Self Rating"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Caption = 'Self Rating';
            trigger OnValidate()
            begin
                if "Self Rating" > maxRating() then
                    Error('[%1 %2] should have a Maximum Score of [%3]', FieldCaption("Self Rating"), "Self Rating", maxRating());
                if "Min. Target Score" > "Max Target Score" then
                    Error('%1 cannot be greater than %2', Rec."Min. Target Score", rec."Max Target Score");
            end;
        }
        field(8; "Peer Rating"; Decimal)
        {
            Caption = 'Peer Rating';
            trigger OnValidate()
            begin
                if "Peer Rating" > maxRating() then
                    Error('The score %1 should have a max Score of %2', "Peer Rating", maxRating());
            end;
        }
        field(9; "Supervisor Rating"; Decimal)
        {
            Caption = 'Supervisor Rating';
            trigger OnValidate()
            begin
                if "Supervisor Rating" > maxRating() then
                    Error('The score %1 should have a max Score of %2', "Supervisor Rating", maxRating());
            end;
        }
        field(10; "Sub-ordinates Rating"; Decimal)
        {
            Caption = 'Sub-ordinates Rating';
            trigger OnValidate()
            begin
                if "Sub-ordinates Rating" > maxRating() then
                    Error('The score %1 should have a max Score of %2', "Sub-ordinates Rating", maxRating());
            end;
        }
        field(11; "Outside Agencies Rating"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Caption = 'Outside Agencies Rating';
            trigger OnValidate()
            begin
                if "Outside Agencies Rating" > maxRating() then
                    Error('The score %1 should have a max Score of %2', "Outside Agencies Rating", maxRating());
            end;
        }
        field(17; "Agreed Rating"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Caption = 'Agreed Rating';
            trigger OnValidate()
            begin
                if "Agreed Rating" > maxRating() then
                    Error('The score %1 should have a max Score of %2', "Agreed Rating", maxRating());
            end;
        }
        field(18; "Agreed Rating x Weighting"; Decimal)
        {
            Caption = 'Agreed Rating x Weighting';
        }
        field(19; "Employee Comments"; Text[250])
        {
            Caption = 'Employee Comments';
        }
        field(21; "Peer Comments"; Text[250])
        {
            Caption = 'Peer Comments';
        }
        field(22; "Supervisor Comments"; Text[250])
        {
            Caption = 'Supervisor Comments';
        }
        field(23; "Subordinates Comments"; Text[200])
        {
            Caption = 'Subordinates Comments';
        }
        field(25; "Approval Status"; Option)
        {
            OptionMembers = "Pending Approval",Approved;
            Caption = 'Approval Status';
        }
        field(26; "Categorize As"; Option)
        {
            OptionCaption = ' ,Employee''s Subordinates,Employee''s Peers,External Sources,Job Specific,Self Evaluation,Personal Goals/Objectives';
            OptionMembers = " ","Employee's Subordinates","Employee's Peers","External Sources","Job Specific","Self Evaluation","Personal Goals/Objectives";
            Caption = 'Categorize As';
        }
        field(27; "Sub Category"; Option)
        {
            OptionCaption = ' ,Objectives,Core Responsibilities / Duties,Attendance & Punctuality,Communication,Cooperation,Planning & Organization,Quality,Team Work,Sales Skills,Leadership,Performance Coaching,Personal Goals';
            OptionMembers = " ",Objectives,"Core Responsibilities / Duties","Attendance & Punctuality",Communication,Cooperation,"Planning & Organization",Quality,"Team Work","Sales Skills",Leadership,"Performance Coaching","Personal Goals";
            Caption = 'Sub Category';
        }
        field(28; "External Source Rating"; Decimal)
        {
            Caption = 'External Source Rating';
        }
        field(29; "External Source Comments"; Text[250])
        {
            Caption = 'External Source Comments';
        }
        field(30; "Min. Target Score"; Decimal)
        {
            Caption = 'Min. Target Score';
            trigger OnValidate()
            begin
                if "Min. Target Score" > maxRating() then
                    Error('The score %1 should have a max Score of %2', "Min. Target Score", maxRating());
            end;
        }
        field(31; "Max Target Score"; Decimal)
        {
            Caption = 'Max Target Score';
            trigger OnValidate()
            begin
                if "Max Target Score" > maxRating() then
                    Error('The score %1 should have a max Score of %2', "Max Target Score", maxRating());
            end;
        }
    }

    keys
    {
        key(Key1; "Appraisal No", "Appraisal Period", "Employee No", "Categorize As")
        {
            Clustered = true;
        }
        key(Key2; Sections) { }
    }

    fieldgroups { }

    var
        Employee: Record "HR Employees";
        HRAppraisalGoalSettingH: Record "HR Appraisal Header";
        AppraisalScores: Record "HR Appraisal Lines";
        mycurrStatus: Boolean;
        objHRSetup: Record "HR Setup";
        Vendor: Record Vendor;
        Customer: Record Customer;


    procedure maxRating() maxRating: Decimal
    begin
        maxRating := 0;
        objHRSetup.Get();
        maxRating := objHRSetup."Max Appraisal Rating";
    end;
}
