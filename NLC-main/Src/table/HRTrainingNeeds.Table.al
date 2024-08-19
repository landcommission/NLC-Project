#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193497 "HR Training Needs"
{
    DataCaptionFields = "Code", Description;
    DrillDownPageId = "HR Training Needs List";
    LinkedObject = false;
    LookupPageId = "HR Training Needs List";
    Caption = 'HR Training Needs';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            trigger OnValidate()
            var
                myInt: Integer;
                SeriesSetup: Record "HR Setup";
                NoSeriesMgt: Codeunit NoSeriesManagement;
            begin
                if Code <> xRec.Code then begin
                    SeriesSetup.Get;
                    NoSeriesMgt.TestManual(SeriesSetup."Traning Needs Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Description; Text[200])
        {
            Caption = 'Description';
        }
        field(3; "Start Date"; Date)
        {
            Caption = 'Start Date';
            trigger OnValidate()
            begin
                "Captured By" := UserId;
                if rec."Start Date" < Today then
                    Error('Training date cannot be back dated');
                CalculateDate();
            end;
        }
        field(4; "End Date"; Date)
        {
            Editable = false;
            Caption = 'End Date';
        }
        field(5; Duration; DateFormula)
        {
            Caption = 'Duration';
            trigger OnValidate()
            begin
                CalculateDate();
            end;
        }
        field(6; Costs; Decimal)
        {
            CalcFormula = sum("HR Training Cost".Cost where("Training ID" = field(Code)));
            FieldClass = FlowField;
            Caption = 'Costs';
            Editable = false;
        }
        field(7; Location; Text[100])
        {
            Caption = 'Location';
        }
        field(8; "Re-Assessment Date"; Date)
        {
            Caption = 'Re-Assessment Date';

        }
        field(9; "Need Source"; Option)
        {
            OptionCaption = '  ,Appraisal,Succesion,Training,Employee,Employee Skill Plan';
            OptionMembers = "  ",Appraisal,Succesion,Training,Employee,"Employee Skill Plan";
            Caption = 'Need Source';
        }
        field(10; Provider; Code[20])
        {
            TableRelation = Vendor."No.";
            Caption = 'Provider';
            trigger OnValidate()
            var
                myInt: Integer;
                VendorRec: Record Vendor;
            begin
                if VendorRec.Get(rec.Provider) then
                    rec."Provider Name" := VendorRec.Name;
            end;
        }
        field(11; Posted; Boolean)
        {
            Editable = false;
            Caption = 'Posted';
        }
        field(12; Closed; Boolean)
        {
            Editable = false;
            Caption = 'Closed';
        }
        field(13; "Qualification Code"; Code[20])
        {
            TableRelation = "HR Job Qualifications".Code where("Qualification Type" = field("Qualification Type"));
            Caption = 'Qualification Code';
            trigger OnValidate()
            var
                myInt: Integer;
                HRJobes: Record "HR Job Qualifications";
            begin
                rec.TestField("Qualification Type");
                HRJobes.Reset();
                HRJobes.SetRange(Code, rec."Qualification Code");
                if HRJobes.FindFirst() then
                    rec."Qualification Description" := HRJobes.Description;

            end;
        }
        field(14; "Qualification Type"; Code[30])
        {
            NotBlank = true;
            TableRelation = "HR Lookup Values".Code where(Type = const("Qualification Type"));
            Caption = 'Qualification Type';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                "Qualification Code" := '';
                "Qualification Description" := '';
            end;
        }
        field(15; "Qualification Description"; Text[150])
        {
            Caption = 'Qualification Description';
        }
        field(16; "Provider Name"; Text[100])
        {
            // CalcFormula = lookup(Vendor.Name where("No." = field(Provider)));
            Editable = false;
            //FieldClass = FlowField;
            Caption = 'Provider Name';
        }
        field(17; "Responsibility Center"; Code[10])
        {
            //TableRelation = "Responsibility Center BR NEW".Code;
            //Caption = 'Responsibility Center';
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
        field(18; "Bondage Start Date"; Date)
        {
            //Editable = false;
            Caption = 'Bondage Start Date';
        }
        field(19; "Bondage Duration"; DateFormula)
        {
            Caption = 'Bondage Duration';
            trigger OnValidate()
            begin
                "Bondage Release Date" := CalcDate("Bondage Duration", "Bondage Start Date");
            end;
        }
        field(20; "Bondage Release Date"; Date)
        {
            Editable = false;
            Caption = 'Bondage Release Date';
        }
        field(21; "Inclusive of Non Working Days"; Boolean)
        {
            Caption = 'Inclusive of Non Working Days';
            trigger OnValidate()
            begin
                CalculateDate();
            end;
        }
        field(22; "Bondage Required?"; Boolean)
        {
            Caption = 'Bondage Required?';
            trigger OnValidate()
            begin
                TestField("Start Date");
                TestField("End Date");

                Clear("Bondage Start Date");
                Clear("Bondage Duration");
                Clear("Bondage Release Date");

                if "Bondage Required?" then begin
                    "Bondage Start Date" := "End Date";
                    Validate("Bondage Duration");
                end;
            end;
        }
        field(23; "No. of Training Cost Items"; Integer)
        {
            Caption = 'No. of Training Cost Items';
        }
        field(24; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Cancelled,Approved';
            OptionMembers = Open,"Pending Approval",Cancelled,Approved,Rejected;
            Caption = 'Status';
        }
        field(25; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(26; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            trigger OnValidate()
            var
                myInt: Integer;
                Dimvalue: Record "Dimension Value";
            begin
                Dimvalue.Reset();
                Dimvalue.SetRange(Code, Rec."Global Dimension 2 Code");
                if Dimvalue.FindFirst() then
                    "Directorate Name" := Dimvalue.Name;

            end;
        }
        field(27; "Currency Code"; Code[20])
        {
            TableRelation = Currency.Code;
            Caption = 'Currency Code';
        }
        field(28; "Early Bonded Exit?"; Boolean)
        {
            Caption = 'Early Bonded Exit?';
        }
        field(30; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }
        field(29; "Employee No"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee No';
        }
        field(33; "Rejected By"; Code[70])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Department Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Directorate Name"; Text[160])
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Course Title"; Code[250])
        {
            Caption = 'Course Title';
            TableRelation = "Appraisal Training Development"."Appraisal Code";
            trigger OnValidate()
            var
                AppraisaTrai: Record "Appraisal Training Development";
            begin
                AppraisaTrai.Reset();
                AppraisaTrai.SetRange("Appraisal Code", rec."Course Title");
                IF AppraisaTrai.FindFirst() then
                    Rec."Course Description" := AppraisaTrai."Skills Gap";
            end;
        }
        field(37; "Course Description"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Estimated Cost"; Decimal)
        {
            Caption = 'Estimated Cost';
            AutoFormatType = 1;
            CalcFormula = sum("HR Training Cost".Cost where("Training ID" = field(Code)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(39; "Captured By"; Text[120])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        "Captured By" := UserId;

        if Code = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Training Needs Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Training Needs Nos.", xRec."No. Series", 0D, Code, "No. Series");
        end;

        if HREmp.Get(Rec."Employee No") then begin

            "Responsibility Center" := HREmp."Responsibility Center";
        end;

    end;

    var
        HRSetup: Record "HR Setup";

        HREmp: Record "HR Employees";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    local procedure CalculateDate()
    var
        HRDates: Codeunit "HR Dates";
    begin
        TestField("Start Date");

        if "Start Date" <> 0D then begin
            "Re-Assessment Date" := 0D;
            "End Date" := CalcDate(Duration, "Start Date");
        end;
    end;
}
