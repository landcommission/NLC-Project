#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69207 "HR Leave Planner Lines"
{

    fields
    {
        field(1; "Application Code"; Code[20])
        {
        }
        field(3; "Leave Type"; Code[50])
        {
            TableRelation = "HR Leave Types".Code where(Code = filter('ANNUAL'));

            trigger OnValidate()
            begin
                LeaveHeader.Reset();
                LeaveHeader.SetRange("Application Code", Rec."Application Code");
                if LeaveHeader.Find('-') then
                    "Employee No" := LeaveHeader."Employee No";
            end;
        }
        field(4; "Days Applied"; Decimal)
        {
            DecimalPlaces = 2 : 2;

            trigger OnValidate()
            var
                HRLeave: Record "HR Leave Application";
            begin
                TestField("Leave Type");
                //CALCULATE THE END DATE AND RETURN DATE
                begin

                    if ("Days Applied" <> 0) and ("Start Date" <> 0D) then
                        //"Return Date" := DetermineLeaveReturnDate("Start Date", "Days Applied");
                    "Return Date" := HRLeave.DetermineLeaveReturnDate_Portal("Start Date", "Days Applied", Rec."Leave Type");
                    "End Date" := DeterminethisLeaveEndDate("Return Date");
                    //Modify;
                end;
            end;
        }
        field(5; "Start Date"; Date)
        {

            trigger OnValidate()
            var
                PlanLines: Record "HR Leave Planner Lines";

            begin
                PlanLines.Reset();
                PlanLines.SetRange("Application Code", Rec."Application Code");
                PlanLines.SetRange("Employee No", Rec."Employee No");
                if PlanLines.Find('-') then begin
                    repeat
                        if (rec."Start Date" >= PlanLines."Start Date") and (rec."Start Date" <= PlanLines."End Date") then
                            Error('You cannot have  starting date in between the selected leave plan days');
                    until PlanLines.Next() = 0
                end;

                if "Start Date" = 0D then begin
                    "Return Date" := 0D;
                    exit;
                end else begin
                    if DetermineIfIsNonWorking("Start Date") = true then begin
                        Error('Start date must be a working day');
                    end;
                    Validate("Days Applied");
                end;
            end;
        }
        field(6; "Return Date"; Date)
        {
            Caption = 'Return Date';
            Editable = false;
        }
        field(7; "Application Date"; Date)
        {
        }
        field(15; "Applicant Comments"; Text[250])
        {
        }
        field(17; "No series"; Code[30])
        {
        }
        field(28; Selected; Boolean)
        {
        }
        field(31; "Current Balance"; Decimal)
        {
            FieldClass = Normal;
        }
        field(3900; "End Date"; Date)
        {
            Editable = false;
        }
        field(3901; "Total Taken"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(3902; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3921; "E-mail Address"; Date)
        {
            Editable = false;
        }
        field(3924; "Entry No"; Integer)
        {
        }
        field(3929; "Start Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(3936; "Cell Phone Number"; Text[50])
        {
        }
        field(3937; "Request Leave Allowance"; Boolean)
        {
        }
        field(3939; Picture; Blob)
        {
        }
        field(3940; Names; Text[100])
        {
        }
        field(3942; "Leave Allowance Entittlement"; Boolean)
        {
        }
        field(3943; "Leave Allowance Amount"; Decimal)
        {
        }
        field(3945; "Details of Examination"; Text[200])
        {
        }
        field(3947; "Date of Exam"; Date)
        {
        }
        field(3949; Reliever; Code[50])
        {
            TableRelation = "HR Employees"."No.";

            trigger OnValidate()
            begin
                //DISPLAY RELEIVERS NAME
                if HREmp.Get(Reliever) then
                    "Reliever Name" := HREmp.FullName;
            end;
        }
        field(3950; "Reliever Name"; Text[100])
        {
        }
        field(3952; Description; Text[30])
        {
        }
        field(3956; "Number of Previous Attempts"; Text[200])
        {
        }
        field(3961; "Employee No"; Code[50])
        {
        }
        field(3969; "Responsibility Center"; Code[10])
        {
            //  TableRelation = Table39006016.Field1;
        }
        field(3970; "Approved days"; Integer)
        {

            trigger OnValidate()
            begin
                if "Approved days" > "Days Applied" then
                    Error(TEXT001);
            end;
        }
        field(3971; "Annual Leave Account"; Decimal)
        {
        }
        field(3972; "Compassionate Leave Acc."; Decimal)
        {
        }
        field(3973; "Maternity Leave Acc."; Decimal)
        {
        }
        field(3974; "Paternity Leave Acc."; Decimal)
        {
        }
        field(3975; "Sick Leave Acc."; Decimal)
        {
        }
        field(3976; "Study Leave Acc"; Decimal)
        {
        }
        field(3977; OffDays; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Line No.", "Application Code", "Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        HREmp: Record "HR Employees";
        varDaysApplied: Integer;
        HRLeaveTypes: Record "HR Leave Types";
        BaseCalendarChange: Record "Base Calendar";
        ReturnDateLoop: Boolean;
        mSubject: Text[250];
        ApplicantsEmail: Text[30];
        SMTP: Codeunit "Email Message";
        LeaveGjline: Record "HR Leave Journal Line";
        "LineNo.": Integer;
        ApprovalComments: Record "Approval Comment Line";
        URL: Text[500];
        sDate: Record Date;
        Customized: Record "Base Calendar";
        HREmailParameters: Record "Hr E-Mail Parameters";
        HRLeavePeriods: Record "HR Leave Periods";
        HRJournalBatch: Record "HR Leave Journal Batch";
        LeaveHeader: Record "HR Leave Planner Header";
        TEXT001: label 'Days Approved cannot be more than applied days';
        Names: Text[100];


    procedure DetermineLeaveReturnDate(var fBeginDate: Date; var fDays: Decimal) fReturnDate: Date
    begin
        varDaysApplied := fDays;
        fReturnDate := fBeginDate;
        repeat
            if DetermineIfIncludesNonWorking("Leave Type") = false then begin
                fReturnDate := CalcDate('1D', fReturnDate);
                if DetermineIfIsNonWorking(fReturnDate) then
                    varDaysApplied := varDaysApplied + 1
                else
                    varDaysApplied := varDaysApplied;
                varDaysApplied := varDaysApplied - 1
            end
            else begin
                fReturnDate := CalcDate('1D', fReturnDate);
                varDaysApplied := varDaysApplied - 1;
            end;
        until varDaysApplied = 0;
        exit(fReturnDate);
    end;


    procedure DetermineIfIncludesNonWorking(var fLeaveCode: Code[10]): Boolean
    begin
        if HRLeaveTypes.Get(fLeaveCode) then
            if HRLeaveTypes."Inclusive of Non Working Days" = true then
                exit(true);
    end;


    procedure DetermineIfIsNonWorking(var bcDate: Date) Isnonworking: Boolean
    var
        CustomizedCal: Record "HR Calendar List";
    begin

        CustomizedCal.Reset();
        CustomizedCal.SetRange(CustomizedCal.Date, bcDate);
        if CustomizedCal.FindFirst() then
            if CustomizedCal."Non Working" = true then
                exit(true)
            else
                exit(false);
    end;


    procedure DeterminethisLeaveEndDate(var fDate: Date) fEndDate: Date
    begin
        ReturnDateLoop := true;
        fEndDate := fDate;
        if fEndDate <> 0D then begin
            fEndDate := CalcDate('-1D', fEndDate);
            while (ReturnDateLoop) do
                if DetermineIfIsNonWorking(fEndDate) then
                    fEndDate := CalcDate('-1D', fEndDate)
                else
                    ReturnDateLoop := false;
        end;
        exit(fEndDate);
    end;


    procedure NotifyApplicant()
    begin
        /*
        HREmp.GET("Employee No");
        HREmp.TESTFIELD(HREmp."Company E-Mail");
        
        //GET E-MAIL PARAMETERS FOR GENERAL E-MAILS
        HREmailParameters.RESET;
        HREmailParameters.SETRANGE(HREmailParameters."Employee Code",HREmailParameters."Employee Code"::"2");
        IF HREmailParameters.FIND('-') THEN
        BEGIN
        
        
             HREmp.TESTFIELD(HREmp."Company E-Mail");
             //SMTP.Create(HREmailParameters."Transaction Code",HREmailParameters."Transaction Name",HREmp."Company E-Mail",
             HREmailParameters.Balance,'Dear'+' '+ HREmp."First Name" +' '+
             HREmailParameters."Period Month"+' '+"Application Code"+' '+ HREmailParameters."Period Year",TRUE);
             //SMTP.Send();
        
        
        MESSAGE('Leave applicant has been notified successfully');
        END;
                                                     */

    end;
}

