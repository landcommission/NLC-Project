#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193496 "HR Training App Header"
{
    Caption = 'HR Training Application Header';
    DataCaptionFields = "Application No", "Course Title", "Course Description";
    DrillDownPageId = "HR Training Application List";
    LookupPageId = "HR Training Application List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Application No"; Code[20])
        {
            Editable = true;
            Caption = 'Application No';
        }
        field(2; "Created by"; Text[100])
        {
            Caption = 'Created by';
        }
        field(3; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }
        field(4; "Application Date"; Date)
        {
            Caption = 'Application Date';
        }
        field(5; "Course Title"; Code[250])
        {
            Editable = false;
            Caption = 'Course Title';
            TableRelation = "Appraisal Training Development"."Appraisal Code";
            trigger OnValidate()
            var
                AppraisaTrai: Record "Appraisal Training Development";
            begin

                HRTrainingNeeds.Reset();
                HRTrainingNeeds.SetRange("Course Title", rec."Course Title");
                HRTrainingNeeds.SetRange(HRTrainingNeeds.Code, rec."Training Need");
                if HRTrainingNeeds.FindFirst() then begin
                    "Course Description" := HRTrainingNeeds."Course Description";
                    "Start Date" := HRTrainingNeeds."Start Date";
                    "End Date" := HRTrainingNeeds."End Date";
                    Duration := HRTrainingNeeds.Duration;
                    "Bonded Training?" := HRTrainingNeeds."Bondage Required?";
                    "Global Dimension 1 Code" := HRTrainingNeeds."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := HRTrainingNeeds."Global Dimension 2 Code";
                end else begin
                    Clear("Course Description");
                    Clear("Start Date");
                    Clear("End Date");
                    Clear(Duration);
                    Clear("Bonded Training?");
                    Clear("Global Dimension 1 Code");
                    Clear("Global Dimension 2 Code");
                end;
            end;
        }
        field(6; "Course Description"; Text[200])
        {
            Editable = true;
            Caption = 'Course Description';
        }
        field(7; "No. of Participants"; Integer)
        {
            CalcFormula = count("HR Training App Lines" where("Application No." = field("Application No"),
                                                               "Employee No." = filter(<> '')));
            FieldClass = FlowField;
            Caption = 'No. of Participants';
            Editable = false;
        }
        field(8; "Start Date"; Date)
        {
            Caption = 'Start Date';
            trigger OnValidate()
            var
                myInt: Integer;
                DateCa: DateFormula;
            begin
                "End Date" := 0D;
                Evaluate(DateCa, '0D');
                Duration := DateCa;

            end;
        }
        field(9; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(10; Duration; DateFormula)
        {
            Caption = 'Duration';
            trigger OnValidate()
            var
                myInt: Integer;
                DurationText: Text;
            begin
                Rec.TestField("Start Date");
                Evaluate(DurationText, Format(Rec.Duration));
                DurationText := DelChr(Format(DurationText), '=', '-|+|');
                Evaluate(Rec.Duration, DurationText);
                Rec."End Date" := CalcDate(Rec.Duration, rec."Start Date");

            end;
        }
        field(11; "Responsibility Center"; Code[20])
        {
            Editable = true;
            TableRelation = "Responsibility Center BR NEW".Code;
            Caption = 'Responsibility Center';
        }
        field(12; Status; Option)
        {
            OptionMembers = New,"Pending Approval",Approved,Cancelled,Rejected;
            Caption = 'Status';
        }
        field(13; "Training Institution"; Text[50])
        {
            Caption = 'Training Institution';
        }
        field(14; "Training Venue"; Text[50])
        {
            Caption = 'Training Venue';
        }
        field(15; "Training Cost Cstimated"; Decimal)
        {
            Caption = 'Estimated Cost';
            AutoFormatType = 1;
            CalcFormula = sum("HR Training Cost".Cost where("Training ID" = field("Training Need")));
            FieldClass = FlowField;
            Editable = false;

        }
        field(16; "Bonded Training?"; Boolean)
        {
            Editable = false;
            Caption = 'Bonded Training?';
        }
        field(17; "Global Dimension 1 Code"; Code[20])
        {
            //CaptionClass = '1,1,1';
            Caption = 'Workstation';
            Editable = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            trigger OnValidate()
            var
                myInt: Integer;
                DimValue: Record "Dimension Value";
            begin
                DimValue.Reset();
                ;
                DimValue.SetRange(Code, rec."Global Dimension 1 Code");
                if DimValue.FindFirst() then
                    "Workstation Name" := DimValue.Name;

            end;
        }
        field(18; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            Editable = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(19; "Training Status"; Option)
        {
            OptionCaption = ' ,Ongoing,Closed';
            OptionMembers = " ",Ongoing,Closed;
            Caption = 'Training Status';
        }
        field(20; "Actual Start Date"; Date)
        {
            Caption = 'Actual Start Date';
            trigger OnValidate()
            begin
                CalculateDate();
            end;
        }
        field(21; "Actual Duration"; DateFormula)
        {
            Caption = 'Actual Duration';
            trigger OnValidate()
            begin
                CalculateDate();
            end;
        }
        field(22; "Actual End Date"; Date)
        {
            Editable = false;
            Caption = 'Actual End Date';
        }
        field(23; "Course applying"; Code[20])
        {
            Caption = 'Course applying';
        }
        field(24; Justification; Text[250])
        {
            Caption = 'Justification';
        }
        field(25; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
        field(26; "Employee No_"; Code[20])
        {
            Caption = 'Employee No_';
        }
        field(27; UserId; Code[50])
        {
            Caption = 'UserId';
        }
        field(28; "Employee Grade"; Code[20])
        {
            Caption = 'Employee Grade';
        }
        field(29; "Employee Name"; Text[30])
        {
            Caption = 'Employee Name';
        }
        field(30; Location; Text[30])
        {
            Caption = 'Location';
        }
        field(31; "Training Type"; Option)
        {
            OptionMembers = " ","Short Term Training","Long Term Training";
            Caption = 'Training Type';
        }
        field(33; Sponsor; Text[30])
        {
            Caption = 'Sponsor';
        }
        field(34; "Last training"; Text[250])
        {
            Caption = 'Last training';
        }
        field(35; "Time Last Training Attended"; Text[30])
        {
            Caption = 'Time Last Training Attended';
        }
        field(36; "Part of Recommended Trainning"; Text[5])
        {
            Caption = 'Part of Recommended Trainning';
        }
        field(37; Comments; Text[250])
        {
            Caption = 'Comments';
        }
        field(38; "Last Attend From"; Date)
        {
            Caption = 'Last Attend From';
        }
        field(39; "Last Attend To"; Date)
        {
            Caption = 'Last Attend To';
        }
        field(40; MyRecId; RecordId)
        {
            Caption = 'MyRecId';
        }
        field(43; "Training_Category"; Option)
        {
            OptionCaption = 'Individual,Group Training';
            OptionMembers = Individual,"Group Training";
            Caption = 'Training_Category';
            trigger OnValidate()
            var
                myInt: Integer;
                Traininglines: Record "HR Training App Lines";
            begin
                Traininglines.Reset();
                Traininglines.SetRange("Application No.", rec."Application No");
                if Traininglines.Find('-') then
                    Traininglines.DeleteAll();
            end;
        }
        field(44; "Training Need"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Training Needs".Code where(Status = const(Approved));
            trigger OnValidate()
            var
                myInt: Integer;
                Trainings: Record "HR Training Needs";
                Estimated: Decimal;
            begin
                Trainings.Reset();
                Trainings.SetRange(Code, Rec."Training Need");
                if Trainings.FindFirst() then begin
                    Rec."Course Title" := Trainings."Course Title";
                    rec.Validate("Course Title");
                end;
                rec.CalcFields(rec."Training Cost Cstimated");
                Estimated := Rec."Training Cost Cstimated";
                rec."Total Cost" := Estimated;
            end;
        }
        field(45; "Workstation Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(46; "Approved By"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(47; "Include VAT?"; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
                Estimated: Decimal;
                Hrsetup: Record "HR Setup";
            begin
                Estimated := 0;
                Hrsetup.Get();
                rec.CalcFields(rec."Training Cost Cstimated");
                Estimated := Rec."Training Cost Cstimated";
                if Rec."Include VAT?" = true then begin
                    Hrsetup.TestField("VAT %");
                    Estimated := Rec."Training Cost Cstimated";
                    Rec."Total Cost" := Round((Estimated * Hrsetup."VAT %") * 0.01);
                end else
                    rec."Total Cost" := Estimated;
            end;
        }
        field(48; "Total Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }

    }

    keys
    {
        key(Key1; "Application No")
        {
            Clustered = true;
        }

    }

    fieldgroups { }

    trigger OnInsert()
    begin
        if "Application No" = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Training Application Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Training Application Nos.", xRec."No. Series", 0D, "Application No", "No. Series");
        end;

        "Application Date" := Today;
        "Created by" := 'Created by ' + UserId + ' on ' + Format(CreateDateTime(Today, Time));

        HREmp.Reset();
        HREmp.SetRange(HREmp."User ID", UserId);
        if HREmp.Find('-') then begin
            HREmp.TestField(HREmp."Responsibility Center");
            "Responsibility Center" := HREmp."Responsibility Center";
            "Global Dimension 1 Code" := HREmp."Global Dimension 1 Code";
            "Global Dimension 2 Code" := HREmp."Global Dimension 2 Code";
        end else
            Error('UserID %1 not linked to a staff in HR Employees table', UserId);



        UserSetup.Reset();
        UserSetup.SetRange(UserSetup."User ID", UserId);
        if UserSetup.Find('-') then;
        /* if (UserSetup."Approver ID"='') or (UserSetup."Approver ID"=UserId) then
begin
ApprovalTemplates.Reset;
ApprovalTemplates.SetRange(ApprovalTemplates."Document Type",ApprovalTemplates."document type"::"Leave Application");
ApprovalTemplates.SetRange(ApprovalTemplates."Responsibility Center",HREmp."Responsibility Center");
ApprovalTemplates.SetRange(ApprovalTemplates.Enabled,true);
if ApprovalTemplates.Find('-') then
begin
AdditionalApprovers.Reset;
AdditionalApprovers.SetRange(AdditionalApprovers."Approval Code",ApprovalTemplates."Approval Code");
AdditionalApprovers.SetFilter(AdditionalApprovers."Document Type",'%1|%2',
                  AdditionalApprovers."document type"::"Short Train",
                  AdditionalApprovers."document type"::"Long Train");
if AdditionalApprovers.Find('-') then
begin
if (AdditionalApprovers."Approver ID"='') or (AdditionalApprovers."Approver ID"=UserId) then
Error('You must have a Recommender in User Setup or an Approver in Additional Approvers')
end

end;
end; */

        MyRecRef.GetTable(Rec);
        MyRecId := MyRecRef.RecordId;
    end;

    var
        HRTrainingNeeds: Record "HR Training Needs";
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        mcontent: Label 'Status must be new on Training Application No.';
        mcontent2: Label '. Please cancel the approval request and try again';
        HREmp: Record "HR Employees";
        Vend: Record Vendor;
        UserSetup: Record "User Setup";
        //ApprovalTemplates: Record "Approval Templates";
        //AdditionalApprovers: Record "Additional Approvers";
        MyRecRef: RecordRef;

    local procedure CalculateDate()
    var
        HRDates: Codeunit "HR Dates";
    begin
        TestField("Actual Start Date");

        if "Actual Start Date" <> 0D then
            "Actual End Date" := CalcDate("Actual Duration", "Actual Start Date");
    end;
}

