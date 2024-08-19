#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69217 "HR Leave Planner Header"
{
    DrillDownPageID = "HR Leave Planner List";
    LookupPageID = "HR Leave Planner List";

    fields
    {
        field(1; "Application Code"; Code[20])
        {
            Editable = false;

            trigger OnValidate()
            begin
                //TEST IF MANUAL NOs ARE ALLOWED
                if "Application Code" <> xRec."Application Code" then begin
                    HRSetup.Get;
                    NoSeriesMgt.TestManual(HRSetup."Leave Planner Nos.");
                    "No series" := '';
                end;
            end;
        }
        field(2; Status; Enum "HR Leave Plan Status")
        {
            Editable = false;

            trigger OnValidate()
            var
                ConsolidatedLeavePlan: Record "HR Leave Planner Header";
                HRLeavePlanLines: Record "HR Leave Planner Lines";
                ConsHRLeavePlanLines: Record "HR Leave Planner Lines";
            begin
                // if Rec.Status = Rec.Status::Approved then begin
                //     //Insert Header
                //     ConsolidatedLeavePlan.init;
                //     ConsolidatedLeavePlan.TransferFields(Rec);
                //     ConsolidatedLeavePlan.Type := ConsolidatedLeavePlan.Type::Consolidated;
                //     ConsolidatedLeavePlan.Insert();
                //     //Insert Lines
                //     HRLeavePlanLines.Reset();
                //     HRLeavePlanLines.SetRange("Application Code", Rec."Application Code");
                //     if HRLeavePlanLines.FindSet() then
                //         repeat
                //             ConsHRLeavePlanLines.Init();
                //             ConsHRLeavePlanLines.TransferFields(HRLeavePlanLines);
                //             ConsHRLeavePlanLines."Application Code" := ConsolidatedLeavePlan."Application Code";
                //             ConsHRLeavePlanLines.Insert();
                //         until HRLeavePlanLines.Next() = 0;
                // end;
            end;
        }
        field(3; "No series"; Code[30])
        {
        }
        field(4; Picture; Blob)
        {
        }
        field(5; Names; Text[100])
        {
        }
        field(6; "Supervisor Email"; Text[50])
        {
        }
        field(7; "Job Tittle"; Text[50])
        {
        }
        field(8; "User ID"; Code[100])
        {
        }
        field(9; "Employee No"; Code[50])
        {
            TableRelation = "HR Employees"."No.";
            trigger OnValidate()
            var
                myInt: Integer;
                hremplo: Record "HR Employees";
            begin
                if hremplo.Get(Rec."Employee No") then begin
                    Rec."User ID" := hremplo."User ID";
                    Rec.Names := hremplo."Full Name";
                    Rec."Job Tittle" := hremplo."Job Title";
                end;
            end;
        }
        field(10; Supervisor; Code[50])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(11; "Responsibility Center"; Code[10])
        {
            //TableRelation = Table39005929.Field1;
        }
        field(13; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Department Code';
            Description = 'Stores the reference to the first global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
            end;
        }
        field(14; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
            end;
        }
        field(15; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin

            end;
        }
        field(16; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
            end;
        }
        field(17; "Job Description"; Text[100])
        {
        }
        field(18; "Document Type"; Option)
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,Payment Voucher,Petty Cash,Imprest,Requisition,ImprestSurrender,Interbank,Receipt,Staff Claim,Staff Advance,AdvanceSurrender,Store Requisition,Employee Requisition,Leave Application,Transport Requisition,Training Requisition,Job Approval,Induction Approval,Disciplinary Approvals,Activity Approval,Exit Approval,Medical Claim Approval,Jv,BackToOffice ,Training Needs,EmpTransfer,LeavePlanner';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Store Requisition","Employee Requisition","Leave Application","Transport Requisition","Training Requisition","Job Approval","Induction Approval","Disciplinary Approvals","Activity Approval","Exit Approval","Medical Claim Approval",Jv,"BackToOffice ","Training Needs",EmpTransfer,LeavePlanner;
        }

        field(30; "Type"; Enum "Leave Planner Type")
        {
            Caption = 'Type';
            DataClassification = CustomerContent;
        }
        field(31; "Re-Opened By"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Application Date"; Date)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "Application Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Application Code", "Employee No", "Job Tittle", "Job Description")
        {

        }
    }

    trigger OnInsert()
    begin
        //GENERATE NEW NUMBER FOR THE DOCUMENT
        if "Application Code" = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Leave Planner Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Leave Planner Nos.", xRec."No series", 0D, "Application Code", "No series");
        end;

        //GET APPLICANT DETAILS FROM HR EMPLOYEES TABLE AND COPY THEM TO THE LEAVE APPLICATION TABLE
        // HREmp.Reset;
        // HREmp.SetRange(HREmp."User ID", UserId);
        // if HREmp.Find('-') then begin
        //     "Employee No" := HREmp."No.";
        //     Names := HREmp.FullName;
        //     "Job Tittle" := HREmp."Job Title";
        //     HREmp.Get(HREmp."No.");
        //     // HREmp.CalcFields(HREmp.Picture);
        //     // Picture := HREmp.Picture;
        //     "User ID" := UserId;
        // end else
        //     Error('User id' + ' ' + '[' + UserId + ']' + ' has not been assigned to any employee. Please consult the HR officer for assistance');
        // //GET LEAVE APPROVER DETAILS FROM USER SETUP TABLE COPY THEM TO THE LEAVE APPLICATION TABLE
        // UserSetup.Reset;
        // if UserSetup.Get(UserId) then begin
        //     UserSetup.TestField(UserSetup."Approver ID");
        //     Supervisor := UserSetup."Approver ID";
        //     UserSetup.Reset;
        //     if UserSetup.Get(Supervisor) then
        //         "Supervisor Email" := UserSetup."E-Mail";
        // end;
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        HREmp: Record "HR Employees";
        varDaysApplied: Integer;
        HRLeaveTypes: Record "HR Leave Types";
        BaseCalendarChange: Record "Base Calendar Change";
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
        DimVal: Record "Dimension Value";
        TEXT001: label 'Days Approved cannot be more than applied days';


    procedure NotifyApplicant()
    begin
        HREmp.Get("Employee No");
        HREmp.TestField(HREmp."Company E-Mail");

        //GET E-MAIL PARAMETERS FOR GENERAL E-MAILS
        HREmailParameters.Reset;
        HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."associate with"::General);
        if HREmailParameters.Find('-') then begin


            HREmp.TestField(HREmp."Company E-Mail");
            //SMTP.Create(HREmailParameters."Sender Name", HREmailParameters."Sender Address", HREmp."Company E-Mail",
            // HREmailParameters.Subject, 'Dear' + ' ' + HREmp."First Name" + ' ' +
            // HREmailParameters.Body + ' ' + "Application Code" + ' ' + HREmailParameters."Body 2", true);
            // //SMTP.Send();


            Message('Leave applicant has been notified successfully');
        end;
    end;
}

