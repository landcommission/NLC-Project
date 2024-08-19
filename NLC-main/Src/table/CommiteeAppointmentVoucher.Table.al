#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 69638 "Commitee Appointment Voucher"
{
    DrillDownPageId = "Commitee Appointment Vouchers";
    LookupPageId = "Commitee Appointment Vouchers";
    Caption = 'Commitee Appointment Voucher';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Document No."; Code[30])
        {
            Caption = 'Document No.';
        }
        field(2; "Document Type"; Option)
        {
            OptionCaption = 'Appointment,Termination';
            OptionMembers = Appointment,Termination;
            Caption = 'Document Type';
        }
        field(3; "Committee Type ID"; Code[30])
        {
            TableRelation = "Committee Type";
            Caption = 'Committee Type ID';
            trigger OnValidate()
            begin
                CommitteeType.Reset();
                CommitteeType.SetRange(Code, "Committee Type ID");
                if CommitteeType.FindFirst() then begin
                    if "Document Type" = "Document Type"::Appointment then begin
                        Description := Format("Document Type"::Appointment) + ' ' + 'of' + ' ' + CommitteeType.Description;
                        "Appointing Authority" := CommitteeType."Title of Appointing Officer";
                    end;
                    if "Document Type" = "Document Type"::Termination then begin
                        Description := Format("Document Type"::Termination) + ' ' + 'of' + ' ' + CommitteeType.Description;
                        "Appointing Authority" := CommitteeType."Title of Appointing Officer";
                    end
                end
            end;
        }
        field(4; "Original Appointment No."; Code[30])
        {
            TableRelation = "Commitee Appointment Voucher" where("Document Type" = filter(Appointment));
            Caption = 'Original Appointment No.';
        }
        field(5; "Termination Category"; Option)
        {
            OptionCaption = ' ,Normal Staff Exit,Tenure Expiry,Other';
            OptionMembers = " ","Normal Staff Exit","Tenure Expiry",Other;
            Caption = 'Termination Category';
        }
        field(6; "Termination Details"; Text[100])
        {
            Caption = 'Termination Details';
        }
        field(7; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(8; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(9; "Appointment Effective Date"; Date)
        {
            Caption = 'Appointment Effective Date';
        }
        field(10; "Tenure End Date"; Date)
        {
            Caption = 'Tenure End Date';
        }
        field(11; "Appointing Authority"; Code[30])
        {
            Caption = 'Appointing Authority';
        }
        field(12; "Raised By"; Code[30])
        {
            Caption = 'Raised By';
        }
        field(13; "Staff ID"; Code[30])
        {
            TableRelation = Employee;
            Caption = 'Staff ID';
        }
        field(14; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(15; Region; Code[30])
        {
            TableRelation = "Responsibility Center";// where("Operating Unit Type" = filter(Region));
            Caption = 'Region';
        }
        field(16; "Branch/Centre"; Code[30])
        {
            Caption = 'Branch/Centre';
        }
        field(17; Directorate; Code[30])
        {
            TableRelation = "Responsibility Center";// where("Operating Unit Type" = filter(Directorate));
            Caption = 'Directorate';
        }
        field(18; Department; Code[30])
        {
            TableRelation = "Responsibility Center";// where("Operating Unit Type" = filter("Department/Center"));
            Caption = 'Department';
        }
        field(19; "Approval Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
            Caption = 'Approval Status';
        }
        field(20; "Required No. of Members"; Integer)
        {
            Caption = 'Minimimum Required No. of Members';
        }
        field(21; "Appointed Members"; Integer)
        {
            Caption = 'Actual No. of Appointed Members';
        }
        field(22; "Terminated Members"; Integer)
        {
            Caption = 'Actual No. of Terminated Members';
        }
        field(23; "No. Series"; Code[30])
        {
            Caption = 'No. Series';
        }
        field(24; "Vacancy ID"; Code[30])
        {
            Caption = 'Vacancy ID';
            //TableRelation = "Recruitment Requisition Header"."Document No." where("Document Type" = const("Job Vacancy"));
        }
        field(25; "Terms of Reference"; Text[2000])
        {
            Caption = 'Terms of Reference';
        }
        field(26; Venue; Text[100])
        {
            Caption = 'Venue';
        }
        field(27; "Additional Brief"; Text[2000])
        {
            Caption = 'Additional Brief';
        }
        field(28; Noassigned; Integer)
        {
            FieldClass = FlowField;
            Caption = 'Noassigned';
            Editable = false;
            // CalcFormula = count("Candidate Interview Line" where("Assigned Panel ID" = field("Document No."), "Vacancy ID" = field("Vacancy ID")));

        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        if "Document Type" = "Document Type"::Appointment then
            if "Document No." = '' then begin
                HumanResourcesSetup.Get();
                HumanResourcesSetup.TestField("Committee Terminate Nos.");
                NoSeriesMgt.InitSeries(HumanResourcesSetup."Committee Terminate Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
            end;

        if "Document Type" = "Document Type"::Termination then
            if "Document No." = '' then begin
                HumanResourcesSetup.Get();
                HumanResourcesSetup.TestField("Committee Terminate Nos.");
                NoSeriesMgt.InitSeries(HumanResourcesSetup."Committee Terminate Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
            end;
        "Document Date" := Today;
        "Raised By" := UserId;
        UserSetup.Reset();
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet() then begin
            //"Staff ID" := UserSetup."Employee No.";
            // Name := UserSetup."Employee Name";
            Department := UserSetup."Responsibility Center";
            //Region := UserSetup."Region Code";
            "Appointing Authority" := 'CHIEF EXECUTIVE OFFICER';
            "Appointment Effective Date" := Today;

        end;
    end;

    var
        CommitteeType: Record "Committee Type";
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
}

