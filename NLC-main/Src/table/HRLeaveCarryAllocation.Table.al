#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193446 "HR Leave Carry Allocation"
{
    Caption = 'HR Leave Carry Allocation';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Application Code"; Code[20])
        {
            Caption = 'Application Code';
            trigger OnValidate()
            begin
                //TEST IF MANUAL NOs ARE ALLOWED
                if "Application Code" <> xRec."Application Code" then begin
                    HRSetup.Get();
                    NoSeriesMgt.TestManual(HRSetup."Leave Carry Over App Nos.");
                    Description := '';
                end;
            end;
        }
        field(2; "Application Date"; Date)
        {
            Caption = 'Application Date';
        }
        field(3; Status; Option)
        {
            Editable = false;
            OptionCaption = 'New,Pending Approval,HOD Approval,HR Approval,Final Approval,Rejected,Canceled,Approved,On leave,Resumed,Posted';
            OptionMembers = New,"Pending Approval","HOD Approval","HR Approval",MDApproval,Rejected,Canceled,Approved,"On leave",Resumed,Posted;
            Caption = 'Status';
        }
        field(4; "Applicant Comments"; Text[250])
        {
            Caption = 'Applicant Comments';
        }
        field(5; "No series"; Code[30])
        {
            Caption = 'No series';
        }
        field(6; Selected; Boolean)
        {
            Caption = 'Selected';
        }
        field(8; "Entry No"; Integer)
        {
            Caption = 'Entry No';
        }
        field(9; "Start Date Filter"; Date)
        {
            FieldClass = FlowFilter;
            Caption = 'Start Date Filter';
        }
        field(10; Names; Text[100])
        {
            Caption = 'Names';
        }
        field(11; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(12; "Job Tittle"; Text[50])
        {
            Caption = 'Job Tittle';
        }
        field(13; "User ID"; Code[50])
        {
            Caption = 'User ID';
        }
        field(14; "Employee No"; Code[20])
        {
            Caption = 'Employee No';
            trigger OnValidate()
            begin
                HREmp.Get("Employee No");
                Names := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
            end;
        }
        field(15; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility Center BR 2".Code;
            Caption = 'Responsibility Center';
        }
        field(16; "Approved days"; Integer)
        {
            Caption = 'Approved days';
        }
        field(17; Attachments; Integer)
        {
            CalcFormula = count("Company Documents" where("Doc No." = field("Application Code")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Attachments';
        }
        field(18; "Approval Status"; Option)
        {
            Editable = false;
            OptionMembers = Open,"Pending Approval",Approved;
            Caption = 'Approval Status';
        }
    }

    keys
    {
        key(Key1; "Application Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        //---------GENERATE NEW NUMBER FOR THE DOCUMENT
        if "Application Code" = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Leave Carry Over App Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Leave Carry Over App Nos.", xRec."No series", 0D, "Application Code", "No series");
        end;
        //GET APPLICANT DETAILS FROM HR EMPLOYEES TABLE AND COPY THEM TO THE LEAVE APPLICATION TABLE
        HREmp.Reset();
        HREmp.SetRange(HREmp."User ID", UserId);
        if HREmp.Find('-') then begin
            "Employee No" := HREmp."No.";

            //---------New staff (Upon completing one year of employment)---------Changed to 3 months--------------------------

            if (HREmp."Date Of Joining the Company" <> 0D) and (Today > HREmp."Date Of Joining the Company") then begin
                Calendar.Reset();
                Calendar.SetRange("Period Type", Calendar."Period Type"::Month);
                Calendar.SetRange("Period Start", HREmp."Date Of Joining the Company", Today);
                empMonths := Calendar.Count;
            end else
                empMonths := 0;

            if empMonths < 3 then
                Error('You cannot apply for leave carry over until your are over 3 months old in the company');
            //---------END New staff (Upon completing one year of employment)-----------------------------------

            empMonths := 0;

            HREmp.Get(HREmp."No.");
            HREmp.CalcFields(HREmp.Picture);
            "User ID" := UserId;
        end else
            Error('User id' + ' ' + '[' + UserId + ']' + ' has not been assigned to any employee. Please consult the HR officer for assistance');
        //GET LEAVE APPROVER DETAILS FROM USER SETUP TABLE COPY THEM TO THE LEAVE APPLICATION TABLE
        UserSetup.Reset();
        if UserSetup.Get(UserId) then begin
            UserSetup.TestField(UserSetup."Approver ID");
            "Application Date" := Today;
        end;
    end;

    var
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        HREmp: Record "HR Employees";
        varDaysApplied: Integer;
        HRLeaveTypes: Record "HR Leave Types";
        BaseCalendarChange: Record "Base Calendar Change";
        ReturnDateLoop: Boolean;
        mSubject: Text[250];
        ApplicantsEmail: Text[30];
        //SMTP: Codeunit "SMTP Mail";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        LeaveGjline: Record "HR Leave Journal Line";
        "LineNo.": Integer;
        ApprovalComments: Record "Approval Comment Line";
        URL: Text[500];
        sDate: Record Date;
        Customized: Record "HR Calendar List";
        HREmailParameters: Record "HR E-Mail Parameters";
        HRLeavePeriods: Record "HR Leave Periods";
        HRJournalBatch: Record "HR Leave Journal Batch";
        TEXT001: Label 'Days Approved cannot be more than applied days';
        HRLeaveEntries: Record "HR Leave Ledger Entries";
        intEntryNo: Integer;
        Calendar: Record Date;
        empMonths: Integer;
        objLeaveApps: Record "HR Leave Application";
        mWeekDay: Integer;
        empGender: Option Female;


    procedure NotifyApplicant()
    begin
        HREmp.Get("Employee No");
        HREmp.TestField(HREmp."Company E-Mail");

        //GET E-MAIL PARAMETERS FOR GENERAL E-MAILS
        HREmailParameters.Reset();
        HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."Associate With"::"Interview Invitations");
        if HREmailParameters.Find('-') then begin


            HREmp.TestField(HREmp."Company E-Mail");
            EmailMessage.Create(HREmp."Company E-Mail",
            HREmailParameters.Subject, 'Dear' + ' ' + HREmp."First Name" + ' ' +
            HREmailParameters.Body + ' ' + "Application Code" + ' ' + HREmailParameters."Body 2", true);
            Email.Send(EmailMessage);


            Message('Leave applicant has been notified successfully');
        end;
    end;
}
