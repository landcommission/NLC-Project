#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193490 "Employee Separation Header"
{
    Caption = 'Employee Separation Header';
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
            var
                Sepration: Record "Employee Separation Header";
            begin
                Sepration.Reset();
                Sepration.SetRange("Staff Code", rec."Staff Code");
                Sepration.SetFilter(Sepration."Separation No.", '<>%1', rec."Separation No.");
                if Sepration.FindFirst() then
                    Error('kindly make use of unsed card No. ', Sepration."Separation No.");
                HREmp.Reset();
                HREmp.SetRange(HREmp."No.", rec."Staff Code");
                if HREmp.Find('-') then begin
                    "Staff Name" := HREmp."Full Name";
                    "Responsibility Center" := HREmp."Responsibility Center";
                    Department := HREmp."Responsibility Center";
                    "department Name" := HREmp."Department Name";
                    Grade := HREmp.Grade;
                    "Job Description" := HREmp."Job Title";
                    rec."Job ID" := HREmp."Job ID";
                end
            end;
        }
        field(3; "Staff Name"; Text[100])
        {
            Caption = 'Staff Name';
        }
        field(4; "User ID"; Code[100])
        {
            Editable = true;
            TableRelation = "User Setup"."User ID";
            Caption = 'User ID';
        }
        field(5; "No series"; Code[50])
        {
            Caption = 'No series';
        }
        field(6; "Responsibility Center"; Code[30])
        {
            TableRelation = "Responsibility Center BR 2".Code;
            Caption = 'Responsibility Center';
        }
        field(7; Status; Option)
        {
            Editable = true;
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
            Caption = 'Status';
            trigger OnValidate()
            var
                myInt: Integer;
                CertificateClearance: Record "Clearance Certificate";
                DocNo: Code[40];
                created: Boolean;
                HREmp: Record "HR Employees";


            begin
                created := false;
                if rec.Status = rec.Status::Approved then begin
                    if rec."Override Exit Process" = false then begin
                        HRSetup.Get;
                        CertificateClearance.Reset();
                        CertificateClearance.Init();
                        HRSetup.TestField("Clearance Nos");
                        DocNo := NoSeriesMgt.GetNextNo(HRSetup."Clearance Nos", 0D, True);
                        CertificateClearance."Clearance No." := DocNo;
                        CertificateClearance."Employee No" := Rec."Staff Code";
                        CertificateClearance.Validate(CertificateClearance."Employee No");
                        CertificateClearance."USER ID" := Rec."User ID";
                        created := true;
                        CertificateClearance.Insert();
                        if created = true then
                            Message('Clearance has been created successfully');
                    end else begin
                        HREmp.Reset();
                        HREmp.SetRange("No.", rec."Staff Code");
                        if HREmp.FindFirst() then begin
                            HREmp.Status := HREmp.Status::Inactive;
                            HREmp."AD Status" := HREmp."AD Status"::Disabled;
                            HREmp."Date Of Leaving" := "Date Of Leaving";
                            HREmp."Termination Grounds" := rec."Reason for Separation";
                            HREmp."Exit Interview Done by" := rec."User ID";
                            CertificateClearance.Init();
                            HRSetup.TestField("Clearance Nos");
                            DocNo := NoSeriesMgt.GetNextNo(HRSetup."Clearance Nos", 0D, True);
                            CertificateClearance."Clearance No." := DocNo;
                            CertificateClearance."Employee No" := Rec."Staff Code";
                            CertificateClearance.Validate(CertificateClearance."Employee No");
                            CertificateClearance."USER ID" := Rec."User ID";
                            created := true;
                            CertificateClearance.Insert();
                            HREmp.Modify();
                            Message('Member status deactivated successfully and clearance generated');
                        end;

                    end;
                end;
            end;

        }
        field(8; "Reason for Separation"; Option)
        {
            OptionMembers = " ",Resignation,Death,Retirement,Termination,Sickness;
            Caption = 'Reason for Separation';
        }
        field(9; "Date of Leaving"; Date)
        {
            Caption = 'Date of Leaving';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if rec."Date of Leaving" < Today then
                    Error('Date of living cannot be backdated');
                if rec."Date of Leaving" <= CalcDate('1M', Today) then
                    Error('Date of living cannot be less  than 1 month from today');
            end;
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
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            Caption = 'Department';
            CaptionClass = '1,1,2';

            trigger OnValidate()
            var
                myInt: Integer;
                Responsblece: Record "Dimension Value";
            begin
                Responsblece.Reset();
                Responsblece.SetRange(Code, Rec."Responsibility Center");
                if Responsblece.FindFirst() then
                    "Department Name" := Responsblece.Name;

            end;
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
        field(21; "department Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Override Exit Process"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Separation No.", "Staff Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(w; "Staff Code", "Staff Name", "Separation No.")
        {

        }

    }

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

        /*
        HREmp.RESET;
        HREmp.SETRANGE(HREmp."User ID",USERID);
        IF HREmp.FIND('-') THEN
        BEGIN
        "Staff Name":=HREmp."Full Name";
        "Responsibility Center":=HREmp."Responsibility Center";
        Department:=HREmp."Global Dimension 1 Code";
        Grade:=HREmp.Grade;
        "Job Description":=HREmp."Job Title";
        END ELSE
        BEGIN
            ERROR('UserID %1 not linked to a staff in HR Employees table',USERID );
        END;
        */

        /*
        HREmp.RESET;
        HREmp.SETRANGE(HREmp."No.","Staff Code");
        IF HREmp.FIND('-') THEN
        BEGIN
        "Staff Name":=HREmp."Full Name";
        "Responsibility Center":=HREmp."Responsibility Center";
        Department:=HREmp."Global Dimension 1 Code";
        Grade:=HREmp.Grade;
        "Job Description":=HREmp."Job Title";
        END
        */

    end;

    trigger OnModify()
    var
        myInt: Integer;
    begin
        "User ID" := UserId;
        "Request Date" := Today;
    end;

    var
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HREmp: Record "HR Employees";
        MyRecRef: RecordRef;
        ClearanceCertificate: Record "Clearance Certificate";
}
