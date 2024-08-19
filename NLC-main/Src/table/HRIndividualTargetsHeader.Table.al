#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193502 "HR Individual Targets Header"
{
    Caption = 'HR Individual Targets Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Appraisal No"; Code[20])
        {
            Caption = 'Appraisal No';
            trigger OnValidate()
            begin
                /*IF "Appraisal no" <> xRec."Appraisal no" THEN BEGIN
                  HRSetup.GET;
                  NoSeriesMgt.TestManual(HRSetup."Appraisal Nos");
                  "No series" := '';
                END; */




                if "Appraisal No" <> xRec."Appraisal No" then begin
                    HRSetup.Get();
                    NoSeriesMgt.TestManual(HRSetup."Appraisal Nos");
                    "No series" := '';
                end;

            end;
        }
        field(2; "Appraisal Period"; Date)
        {
            Editable = false;
            TableRelation = "HR Appraisal Period"."Appraisal Period" where(Closed = const(false));
            Caption = 'Appraisal Period';
        }
        field(3; "Appraisal Date"; Date)
        {
            Caption = 'Appraisal Date';
        }
        field(4; "Employee No"; Code[20])
        {
            Editable = false;
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee No';
        }
        field(5; "Financial Targeted Score"; Decimal)
        {
            CalcFormula = sum("HR Individual Target Line"."Targeted Score" where("Perspective Type" = filter("Financial Stewardship"),
                                                                                  "Appraisal No" = field("Appraisal No")));
            FieldClass = FlowField;
            Caption = 'Financial Targeted Score';
            Editable = false;
        }
        field(7; "Achieved Financial  Score"; Decimal)
        {
            FieldClass = Normal;
            Caption = 'Achieved Financial  Score';
        }
        field(8; "Unachieved Targets"; Decimal)
        {
            CalcFormula = sum("HR Individual Target Line"."Unachieved Targets" where("Appraisal No" = field("Appraisal No")));
            FieldClass = FlowField;
            Caption = 'Unachieved Targets';
            Editable = false;
        }
        field(9; "Employee Name"; Text[200])
        {
            Caption = 'Employee Name';
        }
        field(10; "Training Targeted Score"; Decimal)
        {
            CalcFormula = sum("HR Individual Target Line"."Targeted Score" where("Perspective Type" = filter("Training and Development"),
                                                                                  "Appraisal No" = field("Appraisal No")));
            FieldClass = FlowField;
            Caption = 'Training Targeted Score';
            Editable = false;
        }
        field(11; "Service Delivery Target Score"; Decimal)
        {
            CalcFormula = sum("HR Individual Target Line"."Targeted Score" where("Perspective Type" = filter("Service Delivery"),
                                                                                  "Appraisal No" = field("Appraisal No")));
            FieldClass = FlowField;
            Caption = 'Service Delivery Target Score';
            Editable = false;
        }
        field(12; "Customer Target Score"; Decimal)
        {
            CalcFormula = sum("HR Individual Target Line"."Targeted Score" where("Perspective Type" = filter("Customer and Sales"),
                                                                                  "Appraisal No" = field("Appraisal No")));
            FieldClass = FlowField;
            Caption = 'Customer Target Score';
            Editable = false;
        }
        field(13; "Customer Achieved  Score"; Decimal)
        {
            Caption = 'Customer Achieved  Score';
        }
        field(14; "Service Delivery Achieved"; Decimal)
        {
            Caption = 'Service Delivery Achieved';
        }
        field(15; "Training Achieved  Score"; Decimal)
        {
            Caption = 'Training Achieved  Score';
        }
        field(16; Status; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Pending Approval,Discussed,Approved,Posted';
            OptionMembers = Open,"Pending Approval",Discussed,Approved,Posted;
            Caption = 'Status';
        }
        field(17; "Responsibility Center"; Code[20])
        {
            Editable = true;
            TableRelation = "Responsibility Center BR 2";
            Caption = 'Responsibility Center';
        }
        field(18; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(19; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(20; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(21; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
        }
        field(22; "Appraisal Type"; Option)
        {
            Editable = false;
            OptionCaption = 'Appraisal Review,Target Setting,End Year Appraisal';
            OptionMembers = "Appraisal Review","Target Setting","End Year Appraisal";
            Caption = 'Appraisal Type';
        }
        field(23; "No series"; Code[30])
        {
            Caption = 'No series';
        }
        field(24; "Appraisal Year"; Integer)
        {
            Editable = true;
            Caption = 'Appraisal Year';
        }
        field(25; "Finance Rating"; Decimal)
        {
            CalcFormula = sum("HR Individual Target Line"."Agreed Rating" where("Appraisal No" = field("Appraisal No"),
                                                                                 "Perspective Code" = const(1)));
            FieldClass = FlowField;
            Caption = 'Finance Rating';
            Editable = false;
            trigger OnValidate()
            begin
                test := HRIndividualTargetLine.Count;
                Message('%1', test);
            end;
        }
        field(26; "Customer Rating"; Decimal)
        {
            CalcFormula = sum("HR Individual Target Line"."Agreed Rating" where("Appraisal No" = field("Appraisal No"),
                                                                                 "Perspective Code" = const(2)));
            FieldClass = FlowField;
            Caption = 'Customer Rating';
            Editable = false;
        }
        field(27; "Training Rating"; Decimal)
        {
            CalcFormula = sum("HR Individual Target Line"."Agreed Rating" where("Appraisal No" = field("Appraisal No"),
                                                                                 "Perspective Code" = const(3)));
            FieldClass = FlowField;
            Caption = 'Training Rating';
            Editable = false;
        }
        field(28; "Service Rating"; Decimal)
        {
            CalcFormula = sum("HR Individual Target Line"."Agreed Rating" where("Appraisal No" = field("Appraisal No"),
                                                                                 "Perspective Code" = const(4)));
            FieldClass = FlowField;
            Caption = 'Service Rating';
            Editable = false;
        }
        field(29; "Overall Rating"; Decimal)
        {
            CalcFormula = sum("HR Individual Target Line"."Agreed Rating" where("Appraisal No" = field("Appraisal No")));
            FieldClass = FlowField;
            Caption = 'Overall Rating';
            Editable = false;
        }
        field(30; "Finance Perc Score"; Decimal)
        {
            Caption = 'Finance Perc Score';
        }
        field(31; "Customer Perc Score"; Decimal)
        {
            Caption = 'Customer Perc Score';
        }
        field(32; "Training Perc Score"; Decimal)
        {
            Caption = 'Training Perc Score';
        }
        field(33; "Service Perc Score"; Decimal)
        {
            Caption = 'Service Perc Score';
        }
        field(34; "Overall Perc Score"; Decimal)
        {
            Caption = 'Overall Perc Score';
        }
        field(36; Finance; Integer)
        {
            CalcFormula = count("HR Individual Target Line" where("Appraisal No" = field("Appraisal No"),
                                                                   "Perspective Code" = const(1)));
            FieldClass = FlowField;
            Caption = 'Finance';
            Editable = false;
        }
        field(37; Customer; Integer)
        {
            CalcFormula = count("HR Individual Target Line" where("Appraisal No" = field("Appraisal No"),
                                                                   "Perspective Code" = const(2)));
            FieldClass = FlowField;
            Caption = 'Customer';
            Editable = false;
        }
        field(38; Training; Integer)
        {
            CalcFormula = count("HR Individual Target Line" where("Appraisal No" = field("Appraisal No"),
                                                                   "Perspective Code" = const(3)));
            FieldClass = FlowField;
            Caption = 'Training';
            Editable = false;
        }
        field(39; Service; Integer)
        {
            CalcFormula = count("HR Individual Target Line" where("Appraisal No" = field("Appraisal No"),
                                                                   "Perspective Code" = const(4)));
            FieldClass = FlowField;
            Caption = 'Service';
            Editable = false;
        }
        field(40; "User ID"; Code[100])
        {
            Caption = 'User ID';
        }
    }

    keys
    {
        key(Key1; "Appraisal No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        if "Appraisal No" = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Appraisal Nos");
            NoSeriesMgt.InitSeries(HRSetup."Appraisal Nos", xRec."No series", 0D, "Appraisal No", "No series");
        end;

        //check if period is for capturing target setting or achievement then fill the necessary fields----
        HRSetup.Reset();
        HRSetup.Get();
        "Appraisal Type" := fnAppraisalType();
        "Appraisal Period" := fnAppraisalDate();

        "Appraisal Date" := Today;
        "Employee No" := CurrentEmployee();
        "User ID" := UserId;
        "Employee Name" := EmployeeNames;
        Status := Status::Open;
        "Appraisal Year" := "Appraisal YR";

        //Get the set target for the year and load them----
        if "Appraisal Type" <> "Appraisal Type"::"Target Setting" then
            loadtheyearsTarget();
    end;


    var
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        HREmp: Record "HR Employees";
        BaseCalendarChange: Record "prEmployee Salary Ledger";
        mSubject: Text[250];
        ApplicantsEmail: Text[30];
        //SMTP: Codeunit "SMTP Mail";
        HRAppraisalJournalLine: Record "HR Appraisal Journal Line";
        URL: Text[500];
        HREmailParameters: Record "HR E-Mail Parameters";
        HRPeriods: Record "HR Leave Periods";
        HRJournalBatch: Record "HR Leave Journal Batch";
        HRLeaveEntries: Record "HR Appraisal Ledger Entries";
        intEntryNo: Integer;
        "LineNo.": Integer;
        HRIndividualTargetLine: Record "HR Individual Target Line";
        AppraisalPeriod: Record "HR Appraisal Period";
        AppraisalPeriodDate: Date;
        "Appraisal YR": Integer;
        EmployeeNames: Text;
        test: Integer;
        i: Integer;
        HRIndividualTargetsHeader: Record "HR Individual Targets Header";
        HRIndividualTargetLine_2: Record "HR Individual Target Line";


    procedure CreateLedgerEntries()
    begin
        if (Status = Status::Approved) and ("Appraisal Type" = "Appraisal Type"::"Target Setting") then
            Error('Appraisal has already been posted');


        HRSetup.Reset();
        if HRSetup.Find('-') then begin
            HRSetup.TestField(HRSetup."Appraisal Template");
            HRSetup.TestField(HRSetup."Appraisal Batch");
            HRSetup.TestField(HRSetup."Appraisal Posting Period[FROM]");
            HRSetup.TestField(HRSetup."Appraisal Posting Period[TO]");

            HRAppraisalJournalLine.Reset();
            HRAppraisalJournalLine.SetRange("Journal Template Name", HRSetup."Appraisal Template");
            HRAppraisalJournalLine.SetRange("Journal Batch Name", HRSetup."Appraisal Batch");
            HRAppraisalJournalLine.DeleteAll();

            HREmp.Reset();
            HREmp.Get("Employee No");

            "LineNo." := 10000;
            //Get the lines
            HRIndividualTargetLine.Reset();
            HRIndividualTargetLine.SetRange(HRIndividualTargetLine."Appraisal No", "Appraisal No");
            if HRIndividualTargetLine.Find('-') then
                repeat
                    //Populate Journal
                    "LineNo." := "LineNo." + 10000;
                    HRAppraisalJournalLine.Init();
                    HRAppraisalJournalLine."Journal Template Name" := HRSetup."Appraisal Template";
                    HRAppraisalJournalLine."Journal Batch Name" := HRSetup."Appraisal Batch";
                    HRAppraisalJournalLine."Line No." := "LineNo.";
                    HRAppraisalJournalLine."Appraisal Period" := Format(HRSetup."Appraisal Posting Period[FROM]") + ' '
                                                              + Format(HRSetup."Appraisal Posting Period[TO]");
                    HRAppraisalJournalLine."Appraisal No." := "Appraisal No";
                    HRAppraisalJournalLine."Document No." := "Appraisal No";
                    HRAppraisalJournalLine."Staff No." := "Employee No";
                    HRAppraisalJournalLine.Validate(HRAppraisalJournalLine."Staff No.");
                    HRAppraisalJournalLine."Posting Date" := Today;
                    HRAppraisalJournalLine."Appraisal Approval Date" := Today;
                    HRAppraisalJournalLine.Description := 'BSC';
                    //HRIndividualTargetLine.CALCFIELDS(HRIndividualTargetLine."Perspective Type");
                    HRAppraisalJournalLine."Appraisal Type" := HRIndividualTargetLine."Perspective Type";
                    HRAppraisalJournalLine."Appraisal Period Start Date" := HRSetup."Appraisal Posting Period[FROM]";
                    HRAppraisalJournalLine."Appraisal Period End Date" := HRSetup."Appraisal Posting Period[TO]";
                    HRAppraisalJournalLine.Score := HRIndividualTargetLine."Targeted Score";
                    HRAppraisalJournalLine."Self Rating" := HRIndividualTargetLine."Self Rating";
                    HRAppraisalJournalLine."Supervisor Rating" := HRIndividualTargetLine."Supervisor Rating";
                    HRAppraisalJournalLine."Agreed Rating" := HRIndividualTargetLine."Agreed Rating";
                    HRAppraisalJournalLine.Insert(true);
                until HRIndividualTargetLine.Next() = 0;
            //Post Journal
            HRAppraisalJournalLine.Reset();
            HRAppraisalJournalLine.SetRange("Journal Template Name", HRSetup."Appraisal Template");
            HRAppraisalJournalLine.SetRange("Journal Batch Name", HRSetup."Appraisal Batch");
            if HRAppraisalJournalLine.Find('-') then
                Codeunit.Run(Codeunit::"HR Appraisal Jnl.-Post", HRAppraisalJournalLine);

            Status := Status::Posted;
            Modify();

        end;
    end;


    procedure fnAppraisalDate() dtBSCdate: Date
    begin
        /*
        dtBSCdate:=0D;
        "Appraisal YR":=0;
        AppraisalPeriod.RESET;
        AppraisalPeriod.SETRANGE(AppraisalPeriod.Closed,FALSE);
        IF AppraisalPeriod.FIND('-') THEN
        BEGIN
            dtBSCdate:=AppraisalPeriod."Appraisal Period" ;
            "Appraisal YR":=AppraisalPeriod."Appraisal Year";
        END
        ELSE ERROR('no open period is available please Contact the administrator');
        */

    end;


    procedure CurrentEmployee() EmployeeCD: Code[50]
    begin
        HREmp.Reset();
        HREmp.SetRange(HREmp."User ID", UserId);
        if HREmp.Find('-') then begin
            EmployeeCD := HREmp."No.";
            EmployeeNames := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
        end else
            Error('The user id has not been setup in the HR offices');
    end;


    procedure loadtheyearsTarget()
    begin
        i := 0;
        HRIndividualTargetLine.Reset();
        HRIndividualTargetLine.FindLast();
        i := HRIndividualTargetLine."Line No" + 1;

        HRIndividualTargetsHeader.Reset();
        HRIndividualTargetsHeader.SetRange(HRIndividualTargetsHeader."Appraisal Year", "Appraisal Year");
        HRIndividualTargetsHeader.SetRange(HRIndividualTargetsHeader."Employee No", "Employee No");
        HRIndividualTargetsHeader.SetRange(HRIndividualTargetsHeader."Appraisal Type", HRIndividualTargetsHeader."Appraisal Type"::"Target Setting");
        if HRIndividualTargetsHeader.Find('-') then begin
            HRIndividualTargetLine.Reset();
            HRIndividualTargetLine.SetRange(HRIndividualTargetLine."Appraisal No", HRIndividualTargetsHeader."Appraisal No");
            if HRIndividualTargetLine.Find('-') then
                repeat
                    HRIndividualTargetLine_2.Init();
                    HRIndividualTargetLine_2."Line No" := i;
                    HRIndividualTargetLine_2."Appraisal No" := "Appraisal No";
                    HRIndividualTargetLine_2."Perspective Code" := HRIndividualTargetLine."Perspective Code";
                    HRIndividualTargetLine_2."Targeted Score" := HRIndividualTargetLine."Targeted Score";
                    HRIndividualTargetLine_2."Unachieved Targets" := HRIndividualTargetLine."Unachieved Targets";
                    HRIndividualTargetLine_2."Appraisee Comments" := HRIndividualTargetLine."Appraisee Comments";
                    HRIndividualTargetLine_2.Objective := HRIndividualTargetLine.Objective;
                    HRIndividualTargetLine_2."Start Date" := HRIndividualTargetLine."Start Date";
                    HRIndividualTargetLine_2."End Date" := HRIndividualTargetLine."End Date";
                    HRIndividualTargetLine_2."Appraisal Period" := "Appraisal Period";
                    HRIndividualTargetLine_2."Perspective Description" := HRIndividualTargetLine."Perspective Description";
                    HRIndividualTargetLine_2."Perspective Type" := HRIndividualTargetLine."Perspective Type";
                    HRIndividualTargetLine_2.Insert();
                    i := i + 1;
                until HRIndividualTargetLine.Next() = 0
        end
    end;


    procedure fnAppraisalType() AppraisalType: Integer
    begin
        AppraisalPeriod.Reset();
        AppraisalPeriod.SetRange(AppraisalPeriod.Closed, false);
        if AppraisalPeriod.Find('-') then
            AppraisalType := AppraisalPeriod."Appraisal Type"
        else
            Error('NO Open Appraisal Period is available please Contact the administrator');
    end;
}
