#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193850 "Employee Separation Lines"
{
    Caption = 'Employee Separation Lines';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Separation No."; Code[30])
        {
            Caption = 'Separation No.';
        }
        field(2; "Staff Code"; Code[50])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Staff Code';
            trigger OnValidate()
            begin
                HREmp.Reset();
                HREmp.SetRange(HREmp."No.", "Staff Code");
                if HREmp.Find('-') then begin
                    "Staff Name" := HREmp."Full Name";
                    "Responsibility Center" := HREmp."Responsibility Center";
                    Department := HREmp."Global Dimension 1 Code";
                    Grade := HREmp.Grade;
                    "Job ID" := HREmp."Job ID";
                    "Job Description" := HREmp."Job Title";
                    "Current Staff Status" := HREmp.Status;
                end
            end;
        }
        field(3; "Staff Name"; Text[100])
        {
            Caption = 'Staff Name';
        }
        field(4; "User ID"; Code[100])
        {
            Editable = false;
            TableRelation = "User Setup"."User ID";
            Caption = 'User ID';
        }
        field(5; "No series"; Code[50])
        {
            Caption = 'No series';
        }
        field(6; "Responsibility Center"; Code[30])
        {
            Caption = 'Responsibility Center';
        }
        field(7; Status; Option)
        {
            Editable = true;
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
            Caption = 'Status';

        }
        field(8; "Reason for Separation"; Option)
        {
            OptionMembers = " ",Resignation,Death,Retirement,Termination,Sickness;
            Caption = 'Reason for Separation';
        }
        field(9; "Date of Leaving"; Date)
        {
            Caption = 'Date of Leaving';
        }
        field(10; "Request Date"; Date)
        {
            Caption = 'Request Date';
        }
        field(11; "HOD Comments"; Text[250])
        {
            Caption = 'HOD Comments';
        }
        field(12; "Director Comments"; Text[250])
        {
            Caption = 'Director Comments';
        }
        field(13; Cleared; Boolean)
        {
            Caption = 'Cleared';
        }
        field(14; Details; Text[250])
        {
            Caption = 'Details';
        }
        field(15; Department; Code[30])
        {
            Editable = false;
            TableRelation = "Dimension Value"."Dimension Code";
            Caption = 'Department';
        }
        field(16; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
        field(17; "Job ID"; Code[20])
        {
            NotBlank = false;
            Caption = 'Job ID';

        }
        field(18; "Job Description"; Text[150])
        {
            Caption = 'Job Description';
        }
        field(19; MyRecId; RecordId)
        {
            Caption = 'MyRecId';
        }
        field(20; Grade; Code[20])
        {
            Caption = 'Grade';
        }
        field(21; "Current Staff Status"; Option)
        {
            Editable = true;
            OptionMembers = Active,Inactive,New,"Pending Approval",Rejected;
            Caption = 'Current Staff Status';

        }
    }

    keys
    {
        key(Key1; "Separation No.", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        if "Separation No." = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Separation Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Separation Nos.", xRec."No series", 0D, "Separation No.", "No series");
        end;

        "User ID" := UserId;
        "Request Date" := Today;

        MyRecRef.GetTable(Rec);
        MyRecId := MyRecRef.RecordId;
    end;

    var
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HREmp: Record "HR Employees";
        MyRecRef: RecordRef;
        ClearanceCertificate: Record "Clearance Certificate";
}
