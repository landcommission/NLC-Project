#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193876 "HR Batches"
{
    Caption = 'HR Batches';
    DataClassification = CustomerContent;
    //DrillDownPageID = UnknownPage39005682;
    //LookupPageID = UnknownPage39005682;

    fields
    {
        field(1; "Batch No."; Code[20])
        {
            NotBlank = false;
            Caption = 'Batch No.';
            trigger OnValidate()
            begin
                if "Batch No." <> xRec."Batch No." then begin
                    SalesSetup.Get();
                    NoSeriesMgt.TestManual(SalesSetup."Loan Batch Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Description/Remarks"; Text[30])
        {
            Caption = 'Description/Remarks';
        }
        field(3; Posted; Boolean)
        {
            Caption = 'Posted';
        }
        field(4; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,,Approved,Rejected';
            OptionMembers = Open,"Pending Approval",,Approved,Rejected;
            Caption = 'Status';
        }
        field(5; "Date Created"; Date)
        {
            Caption = 'Date Created';
        }
        field(6; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            trigger OnValidate()
            begin
                if "Posting Date" > Today then
                    Error('Posting Date cannot be in the future');
            end;
        }
        field(7; "Posted By"; Code[20])
        {
            Caption = 'Posted By';
        }
        field(8; "Prepared By"; Code[20])
        {
            Caption = 'Prepared By';
        }
        field(9; "Batch Date"; Date)
        {
            Caption = 'Batch Date';
        }
        field(10; "Mode Of Disbursement"; Option)
        {
            OptionCaption = ',Individual Cheques,Cheque,Transfer to FOSA,FOSA Loans';
            OptionMembers = ,"Individual Cheques",Cheque,"Transfer to FOSA","FOSA Loans";
            Caption = 'Mode Of Disbursement';

            /*         trigger OnValidate()
                    begin
                        if ("Mode Of Disbursement" = "mode of disbursement"::"Individual Cheques") or
                        ("Mode Of Disbursement" = "mode of disbursement"::Cheque) then
        ; */
        }
        field(11; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(12; "BOSA Bank Account"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
            Caption = 'BOSA Bank Account';

            /* trigger OnValidate()
            begin
                if ("Mode Of Disbursement" = "mode of disbursement"::"Individual Cheques") or ("Mode Of Disbursement" = "mode of disbursement"::Cheque) then
; */
        }
        field(13; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(14; "Approvals Remarks"; Text[150])
        {
            Caption = 'Approvals Remarks';
        }
        field(15; "Total Loan Amount"; Decimal)
        {
            CalcFormula = sum("HR Staff Loan Request"."Amount to Disperse" where(Status = filter(Approved),
                                                                                  "Batch No." = field("Batch No."),
                                                                                  Selected = const(true)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Total Loan Amount';
        }
        field(17; "Cheque No."; Code[20])
        {
            Caption = 'Cheque No.';
        }
        field(18; "Batch Type"; Option)
        {
            OptionMembers = ,Loans,Imprest,Overtime;
            Caption = 'Batch Type';
            trigger OnValidate()
            begin
                EntryNo := 0;


                /*
                ApprovalsSetup.RESET;
                ApprovalsSetup.SETRANGE(ApprovalsSetup."Approval Type","Batch Type");
                IF ApprovalsSetup.FIND('-') THEN BEGIN
                MovementTracker.INIT;
                MovementTracker."Entry No.":=EntryNo;
                MovementTracker."Document No.":="Batch No.";
                MovementTracker."Approval Type":=ApprovalsSetup."Approval Type";
                MovementTracker.Stage:=ApprovalsSetup.Stage;
                MovementTracker."Current Location":=TRUE;
                MovementTracker.Status:=MovementTracker.Status::"Being Processed";
                MovementTracker.Description:=ApprovalsSetup.Description;
                MovementTracker.Station:=ApprovalsSetup.Station;
                MovementTracker."Date/Time In":=CREATEDATETIME(TODAY,TIME);
                MovementTracker.INSERT(TRUE);*/




                /*IF "Batch Type" = "Batch Type"::Loans THEN
                "Mode Of Disbursement":="Mode Of Disbursement"::"Individual Cheques";*/

            end;
        }
        field(19; "Special Advance Posted"; Boolean)
        {
            Caption = 'Special Advance Posted';
        }
        field(20; "FOSA Bank Account"; Code[20])
        {
            TableRelation = "Bank Account"."No.";
            Caption = 'FOSA Bank Account';
        }
        field(21; "No of Loans"; Integer)
        {
            CalcFormula = count("HR Staff Loan Request" where("Batch No." = field("Batch No."),
                                                               Selected = const(true)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'No of Loans';
        }
        field(22; "Post to Loan Control"; Boolean)
        {
            Caption = 'Post to Loan Control';

        }
        field(23; "Total Appeal Amount"; Decimal)
        {
            Editable = false;
            Caption = 'Total Appeal Amount';
        }
        field(24; Source; Option)
        {
            OptionCaption = 'BOSA,FOSA,MICRO';
            OptionMembers = BOSA,FOSA,MICRO;
            Caption = 'Source';
        }
        field(26; "Finance Approval"; Boolean)
        {
            Caption = 'Finance Approval';
        }
        field(27; "Audit Approval"; Boolean)
        {
            Caption = 'Audit Approval';
        }
        field(28; "Responcibility Center"; Code[30])
        {
            TableRelation = "Responsibility Center BR 2".Code;
            Caption = 'Responcibility Center';
        }
    }

    keys
    {
        key(Key1; "Batch No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnDelete()
    begin
        if Posted = true then
            Error('You can not delete a posted batch.');
    end;

    trigger OnInsert()
    begin
        if "Batch No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField(SalesSetup."Loan Batch Nos.");
            NoSeriesMgt.InitSeries(SalesSetup."Loan Batch Nos.", xRec."No. Series", 0D, "Batch No.", "No. Series");

        end;
        //ERROR('You dont have permission to create %1 batches',"Batch Type")
    end;

    trigger OnModify()
    begin
        if Posted = true then
            Error('You can not modify a posted batch.');
    end;

    var
        SalesSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        EntryNo: Integer;
}

