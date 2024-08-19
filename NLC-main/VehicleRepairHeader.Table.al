table 50005 "Vehicle Repair Header"
{
    Caption = 'Vehicle Repair Header';
    DataClassification = ToBeClassified;
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
                    NoSeriesMgt.TestManual(HRSetup."Leave Application Nos.");
                    "No series" := '';
                end;
            end;
        }
        field(2; "Registration No"; Code[20])
        {
            Caption = 'Vehicle Reg No';
        }

        field(32; Posted; Boolean)
        {
            Caption = 'Posted';
        }
        field(33; "Posted By"; Text[250])
        {
            Caption = 'Posted By';
        }
        field(34; "Date Posted"; Date)
        {
            Caption = 'Date Posted';
        }
        field(35; "Time Posted"; Time)
        {
            Caption = 'Time Posted';

        }
        field(17; "No series"; Code[30])
        {
            Caption = 'No series';
        }
        field(3959; "User ID"; Code[50])
        {
            Caption = 'User ID';
        }
    }
    keys
    {
        key(PK; "Application Code")
        {
            Clustered = true;
        }
    }
    var
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HREmp: Record "HR Employees";
        varDaysApplied: Integer;
        HRLeaveTypes: Record "HR Leave Types";
        BaseCalendarChange: Record "prEmployee Salary Ledger";
        ReturnDateLoop: Boolean;
        mSubject: Text[250];
        ApplicantsEmail: Text[30];
        //SMTP: Codeunit "SMTP Mail";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        HRJournalLine: Record "HR Leave Journal Line";
        "LineNo.": Integer;
        ApprovalComments: Record "Approval Comment Line";
        URL: Text[500];
        sDate: Record Date;
        Customized: Record "HR Calendar List";
        HREmailParameters: Record "HR E-Mail Parameters";

    trigger OnInsert()
    begin
        //No. Series
        if "Application Code" = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Leave Application Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Leave Application Nos.", xRec."No series", 0D, "Application Code", "No series");
        end;
    end;


}

