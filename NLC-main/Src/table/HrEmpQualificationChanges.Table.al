#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 50006 "HR Emp Qualification Changes"
{
    DataCaptionFields = "Employee No.";
    DrillDownPageId = "Hr Emp Qualification Changes";
    LookupPageId = "Hr Emp Qualification Changes";
    Caption = 'HR Employee Qualifications';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            NotBlank = true;
            TableRelation = "HR Employees"."No.";
            trigger OnValidate()
            var
                myInt: Integer;
                EmpRec: Record "HR Employees";
            begin
                EmpRec.Reset();
                EmpRec.SetRange("No.", Rec."Employee No.");
                if EmpRec.FindFirst() then begin
                    ;
                    rec."Employee Name" := EmpRec."Full Name";
                    rec."Employee Status" := EmpRec.Status;
                end;
            end;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(4; "From Date"; Date)
        {
            Caption = 'From Date';
        }
        field(5; "To Date"; Date)
        {
            Caption = 'To Date';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if rec."To Date" <= "From Date" then
                    Error('Completion date cannot be equal or less than Start date');
            end;
        }
        field(6; Type; Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,Internal,External,Previous Position';
            OptionMembers = " ",Internal,External,"Previous Position";
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(8; "Institution/Company"; Text[100])
        {
            Caption = 'Institution/Company';
        }
        field(9; Cost; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Cost';
        }
        field(10; "Course Grade"; Text[30])
        {
            Caption = 'Course Grade';
        }
        field(11; "Employee Status"; Option)
        {
            Caption = 'Employee Status';
            Editable = false;
            OptionCaption = 'Active,Inactive,Terminated';
            OptionMembers = Active,Inactive,Terminated;
        }
        field(12; Comment; Boolean)
        {
            CalcFormula = exist("Human Resource Comment Line" where("Table Name" = const("Employee Qualification"),
                                                                     "No." = field("Employee No."),
                                                                     "Table Line No." = field("Line No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; "Expiration Date"; Date)
        {
            Caption = 'Expiration Date';
        }
        field(14; "Qualification Type"; Code[20])
        {
            NotBlank = false;
            TableRelation = "HR Lookup Values".Code where(Type = filter("Qualification Type"), Level = const('ACADEMIC'));
            Caption = 'Qualification Type';
        }
        field(15; "Qualification Code"; Code[30])
        {
            Editable = true;
            NotBlank = true;
            TableRelation = "HR Job Qualifications".Code where("Qualification Type" = field("Qualification Type"));
            Caption = 'Qualification Code';
            trigger OnValidate()
            begin
                if HRQualifications.Get("Qualification Type", "Qualification Code") then
                    rec."Qualification Description" := HRQualifications.Description;
            end;
        }
        field(16; "Qualification Description"; Text[200])
        {
            Caption = 'Qualification Description';
        }
        field(19; Test; Text[100])
        {
            Caption = 'Test';
        }
        field(50000; "Course of Study"; Text[100])
        {
            TableRelation = "HR Employee Course of Study".Code;
            Caption = 'Course of Study';
            trigger OnValidate()
            var
                myInt: Integer;
                HrEmpCou: Record "HR Employee Course of Study";
            begin
                HrEmpCou.Reset();
                HrEmpCou.SetRange(Code, Rec."Course of Study");
                if HrEmpCou.FindFirst() then
                    rec."Course of Study" := HrEmpCou.Description;

            end;
        }
        field(50001; Score; Decimal)
        {
            Caption = 'Score';
        }
        field(50002; "Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,"Pending Approval",Approved,Rejected;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if rec.Status = Status::Approved then begin
                    UpdateQualifications(rec."Qualfi Code");
                end;

            end;
        }
        field(50003; "Employee Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50004; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50005; "Qualfi Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
                SeriesSetup: Record "HR Setup";
                NoSeriesMgt: Codeunit NoSeriesManagement;
            begin
                if "Qualfi Code" <> xRec."Qualfi Code" then begin
                    SeriesSetup.Get;
                    NoSeriesMgt.TestManual(SeriesSetup."EducaQual Setup");
                    "No. Series" := '';
                end;

            end;
        }
        field(50006; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Qualfi Code", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(dropdown; "Qualfi Code", "Employee No.", Type, "Qualification Code", "Qualification Description")
        {

        }
    }

    trigger OnDelete()
    begin
        if Comment then
            Error(Text000);
    end;

    trigger OnInsert()
    var
        SeriesSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if Employee.Get(Rec."Employee No.") then
            rec."Employee Status" := Employee.Status;
        if "Qualfi Code" = '' then begin
            SeriesSetup.Get;
            SeriesSetup.TestField(SeriesSetup."EducaQual Setup");
            NoSeriesMgt.InitSeries(SeriesSetup."EducaQual Setup", xRec."No. Series", 0D, "Qualfi Code", "No. Series");
        end;
    end;

    procedure UpdateQualifications(QualfiCode: code[30]): text
    var
        myInt: Integer;
        HRQualicati: Record "HR Emp Qualification Changes";
        HrQuali: Record "HR Employee Qualifications";
        LinenUm: Integer;
    begin
        HRQualicati.Reset();
        HRQualicati.SetRange("Qualfi Code", QualfiCode);
        if HRQualicati.FindFirst() then begin
            HrQuali.Reset();
            if HrQuali.FindLast() then
                LinenUm := HrQuali."Line No." + 1;
            HrQuali.Reset();
            if HrQuali.FindLast() then begin
                HrQuali.Init();
                HrQuali."Employee No." := HRQualicati."Employee No.";
                HrQuali."Course Grade" := HRQualicati."Course Grade";
                HrQuali."Line No." := LinenUm;
                HrQuali.Score := HRQualicati.Score;
                HrQuali."Qualification Code" := HRQualicati."Qualification Code";
                HrQuali."Qualification Type" := HRQualicati."Qualification Type";
                HrQuali."Qualification Description" := HRQualicati."Qualification Description";
                HrQuali.Comment := HRQualicati.Comment;
                HrQuali."From Date" := HRQualicati."From Date";
                HrQuali."To Date" := HRQualicati."To Date";
                HrQuali."Institution/Company" := HRQualicati."Institution/Company";
                HrQuali.Insert(true);
            end else begin
                HrQuali.Init();
                HrQuali."Employee No." := HRQualicati."Employee No.";
                HrQuali."Course Grade" := HRQualicati."Course Grade";
                HrQuali."Line No." := HrQuali."Line No." + 1;
                HrQuali.Score := HRQualicati.Score;
                HrQuali."Qualification Code" := HRQualicati."Qualification Code";
                HrQuali."Qualification Type" := HRQualicati."Qualification Type";
                HrQuali."Qualification Description" := HRQualicati."Qualification Description";
                HrQuali.Comment := HRQualicati.Comment;
                HrQuali."From Date" := HRQualicati."From Date";
                HrQuali."To Date" := HRQualicati."To Date";
                HrQuali."Institution/Company" := HRQualicati."Institution/Company";
                HrQuali.Insert(true);
            end;
            Message('Qualifications Added successfully');
        end;


    end;

    var
        Text000: Label 'You cannot delete employee qualification information if there are comments associated with it.';
        HRLookupValues: Record "HR Lookup Values";
        Employee: Record "HR Employees";
        HRQualifications: Record "HR Job Qualifications";
}
