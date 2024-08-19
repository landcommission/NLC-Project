#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193774 "Close Out Check List"
{
    DrillDownPageId = "Staff Advance Lines";
    LookupPageId = "Staff Advance Lines";
    Caption = 'Close Out Check List';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Grant No"; Code[20])
        {
            TableRelation = Jobs."No.";
            Caption = 'Grant No';
            trigger OnValidate()
            begin
                objJobs.Reset();
                objJobs.SetRange(objJobs."No.", "Grant No");
                if objJobs.Find('-') then begin
                    Description := objJobs.Description;
                    User := UserId;
                    "Responsibility Center" := objJobs."Responsibility Center";
                    "Donor/Sponsor Code" := objJobs."Main Donor";
                    Date := Today;
                    PI := objJobs."Principal Investigator";
                    objResource.Reset();
                    objResource.SetRange(objResource."No.", objJobs."Principal Investigator");
                    if objResource.Find('-') then
                        "PI Name" := objResource.Name;
                    Modify();
                end;
            end;
        }
        field(2; "Compliance Code"; Code[20])
        {
            Caption = 'Compliance Code';
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(4; Compliance; Boolean)
        {
            Caption = 'Compliance';
        }
        field(5; User; Code[50])
        {
            TableRelation = User."User Name";
            Caption = 'User';
        }
        field(6; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(7; Comments; Text[250])
        {
            Caption = 'Comments';
        }
        field(8; Status; Option)
        {
            Editable = false;
            OptionMembers = Open,"Pending Approval",Approved;
            Caption = 'Status';
        }
        field(9; "Closeout No."; Code[50])
        {
            Caption = 'Closeout No.';
            trigger OnValidate()
            begin
                if "Closeout No." <> xRec."Closeout No." then begin
                    JobSetup.Get();
                    NoSeriesMgt.TestManual(JobSetup."Closeout Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(10; "Responsibility Center"; Code[20])
        {
            Caption = 'Responsibility Center';
            //TableRelation = Table39005929;
        }
        field(11; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(12; "Donor/Sponsor Code"; Code[100])
        {
            Caption = 'Donor/Sponsor Code';
        }
        field(13; "Subcontractor no"; Text[70])
        {
            Caption = 'Subcontractor no';
        }
        field(14; Date; Date)
        {
            Caption = 'Date';
        }
        field(15; Subcontractor; Text[70])
        {
            Caption = 'Subcontractor';
        }
        field(16; PI; Code[50])
        {
            Caption = 'PI';
        }
        field(17; "PI Name"; Text[200])
        {
            Caption = 'PI Name';
        }
    }

    keys
    {
        key(Key1; "Closeout No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        if "Closeout No." = '' then begin
            JobSetup.Get();
            JobSetup.TestField(JobSetup."Closeout Nos");
            NoSeriesMgt.InitSeries(JobSetup."Closeout Nos", xRec."No. Series", 0D, "Closeout No.", "No. Series");
        end;
    end;

    var
        JobSetup: Record "Jobs-Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        objJobs: Record Jobs;
        objResource: Record Resource;
}
