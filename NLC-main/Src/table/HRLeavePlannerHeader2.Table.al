#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193458 "HR Leave Planner Header2"
{
    Caption = 'HR Leave Planner Header';
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
                    NoSeriesMgt.TestManual(HRSetup."Leave Planner Nos.");
                    "No series" := '';
                end;
            end;
        }
        field(2; Status; Option)
        {
            Editable = false;
            OptionCaption = 'New,Pending Approval,HOD Approval,HR Approval,Final Approval,Rejected,Canceled,Approved,On leave,Resumed,Posted';
            OptionMembers = New,"Pending Approval","HOD Approval","HR Approval",MDApproval,Rejected,Canceled,Approved,"On leave",Resumed,Posted;
            Caption = 'Status';
        }
        field(3; "No series"; Code[30])
        {
            Caption = 'No series';
        }
        field(4; Picture; Blob)
        {
            Caption = 'Picture';
        }
        field(5; Names; Text[100])
        {
            Caption = 'Names';
        }
        field(6; "Supervisor Email"; Text[30])
        {
            Caption = 'Supervisor Email';
        }
        field(7; "Job Tittle"; Text[50])
        {
            Caption = 'Job Tittle';
        }
        field(8; "User ID"; Code[50])
        {
            Caption = 'User ID';
        }
        field(9; "Employee No"; Code[20])
        {
            Caption = 'Employee No';
        }
        field(10; Supervisor; Code[20])
        {
            TableRelation = "User Setup"."User ID";
            Caption = 'Supervisor';
        }
        field(11; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center BR 2".Code;
            Caption = 'Responsibility Center';
        }
        field(13; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Department Code';
            Description = 'Stores the reference to the first global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

        }
        field(14; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

        }
        field(15; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

        }
        field(16; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

        }
        field(17; "Job Description"; Text[100])
        {
            Caption = 'Job Description';
        }
        field(18; "Document Type"; Option)
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,Payment Voucher,Petty Cash,Imprest,Requisition,ImprestSurrender,Interbank,Receipt,Staff Claim,Staff Advance,AdvanceSurrender,Store Requisition,Employee Requisition,Leave Application,Transport Requisition,Training Requisition,Job Approval,Induction Approval,Disciplinary Approvals,Activity Approval,Exit Approval,Medical Claim Approval,Jv,BackToOffice ,Training Needs,EmpTransfer,LeavePlanner';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Store Requisition","Employee Requisition","Leave Application","Transport Requisition","Training Requisition","Job Approval","Induction Approval","Disciplinary Approvals","Activity Approval","Exit Approval","Medical Claim Approval",Jv,"BackToOffice ","Training Needs",EmpTransfer,LeavePlanner;
            Caption = 'Document Type';
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
        LeaveGjline: Record "HR Leave Journal Line";
        "LineNo.": Integer;
        ApprovalComments: Record "Approval Comment Line";
        URL: Text[500];
        sDate: Record Date;
        Customized: Record "HR Calendar List";
        HREmailParameters: Record "HR E-Mail Parameters";
        HRLeavePeriods: Record "HR Leave Periods";
        HRJournalBatch: Record "HR Leave Journal Batch";
        DimVal: Record "Dimension Value";
}
