#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193714 "HRBack To Office Form"
{

    Caption = 'HRBack To Office Form';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Document No"; Code[20])
        {
            Editable = true;
            Caption = 'Document No';
            trigger OnValidate()
            begin
                HRSetup.Get();
                //NoSeriesMgt.TestManual(HRSetup."Back To Office Nos.");
                "No. Series" := '';
            end;
        }
        field(2; "Course Title"; Code[20])
        {
            NotBlank = true;
            Caption = 'Course Title';

        }
        field(3; "From Date"; Date)
        {
            Editable = true;
            Caption = 'From Date';
        }
        field(4; "To Date"; Date)
        {
            Editable = true;
            Caption = 'To Date';
        }
        field(5; "Duration Units"; Option)
        {
            Editable = true;
            OptionMembers = Hours,Days,Weeks,Months,Years;
            Caption = 'Duration Units';
        }
        field(6; Duration; Decimal)
        {
            Editable = true;
            Caption = 'Duration';
            trigger OnValidate()
            begin



                if (Duration <> 0) and ("From Date" <> 0D) then
                    //"To Date" :=HRTrainApp.DetermineLeaveReturnDate("From Date",Duration);
                    Modify();
            end;
        }
        field(7; "Cost Of Training"; Decimal)
        {
            DecimalPlaces = 0 : 0;
            Editable = true;
            Caption = 'Cost Of Training';
        }
        field(8; Location; Text[30])
        {
            Editable = true;
            Caption = 'Location';
        }
        field(12; Description; Text[250])
        {
            Editable = true;
            Caption = 'Description';
        }
        field(28; "Training Evaluation Results"; Option)
        {
            OptionMembers = "Not Evaluated",Passed,Failed;
            Caption = 'Training Evaluation Results';
            trigger OnValidate()
            begin
                if "Training Status" <> "Training Status"::"Completed Successfully" then
                    Error(mcontent4);
            end;
        }
        field(30; Provider; Code[10])
        {
            Editable = true;
            TableRelation = Vendor."No.";
            Caption = 'Provider';
            trigger OnValidate()
            begin
                Vend.Reset();
                Vend.SetRange(Vend."No.", Provider);
                if Vend.Find('-') then
                    "Provider Name" := Vend.Name;
            end;
        }
        field(31; "Purpose of Training"; Text[100])
        {
            Caption = 'Purpose of Training';
        }
        field(32; Status; Option)
        {
            Editable = true;
            OptionCaption = 'New,Pending Approval,Approved,Rejected.';
            OptionMembers = New,"Pending Approval",Approved,"Rejected.";
            Caption = 'Status';
        }
        field(33; "Employee No."; Code[50])
        {
            NotBlank = false;
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee No.';
            trigger OnValidate()
            begin
                if "Training category" <> "Training category"::Group then begin
                    HREmp.Get("Employee No.");
                    Directorate := HREmp."Department Name";
                    "Employee Name" := HREmp.FullName();
                end;
            end;
        }
        field(36; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
        }
        field(40; "User ID"; Code[50])
        {
            Caption = 'User ID';
        }
        field(41; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center BR 2".Code;
            Caption = 'Responsibility Center';
        }
        field(42; Directorate; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Caption = 'Directorate';
            trigger OnValidate()
            begin
                Dimn.SetRange(Dimn.Code, Directorate);
                if Dimn.Find('-') then
                    "Directorate Name" := Dimn.Name;
            end;
        }
        field(43; "Employee Name"; Text[50])
        {
            Caption = 'Employee Name';
        }
        field(44; "Provider Name"; Text[50])
        {
            Caption = 'Provider Name';
        }
        field(45; "Training category"; Option)
        {
            OptionCaption = 'Individual,Group';
            OptionMembers = Individual,Group;
            Caption = 'Training category';
        }
        field(46; "Table ID"; Integer)
        {
            Caption = 'Table ID';
        }
        field(47; Supervisor; Code[50])
        {
            Caption = 'Supervisor';
        }
        field(48; "Supervisor Name"; Text[100])
        {
            Caption = 'Supervisor Name';
        }
        field(50000; Department; Code[30])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
            Caption = 'Department';
            trigger OnValidate()
            begin
                Dimn.SetRange(Dimn.Code, Department);
                if Dimn.Find('-') then
                    "Department Name" := Dimn.Name;

                /*
                HREmp.RESET;
                HREmp.SETRANGE(HREmp."No.","Employee No.");
                HREmp.SETRANGE(HREmp."Department Code",Directorate);
                HREmp.SETRANGE(HREmp.County,Department);
                IF HREmp.FIND() THEN BEGIN
                IF TranPart.GET("Document No")THEN BEGIN
                 TranPart.INIT;
                 TranPart."Employee Code":=HREmp."No.";
                 TranPart."Employee name":=HREmp."First Name"+'-'+HREmp."Middle Name"+'-'+HREmp."Last Name";
                 TranPart.INSERT;
                END;
                END;
                */

            end;
        }
        field(50002; Station; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            Caption = 'Station';
            trigger OnValidate()
            begin
                Dimn.SetRange(Dimn.Code, Station);
                if Dimn.Find('-') then
                    "Station Name" := Dimn.Name;
            end;
        }
        field(50003; "Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            Caption = 'Period Filter';
        }
        field(50005; "Training Status"; Option)
        {
            OptionCaption = ' ,Suspended,Deferred,Cancelled,Completed Successfully';
            OptionMembers = " ",Suspended,Deferred,Cancelled,"Completed Successfully";
            Caption = 'Training Status';
            trigger OnValidate()
            begin
                if Status <> Status::Approved then
                    Error(mcontent5);
            end;
        }
        field(50006; "Text 1"; Text[200])
        {
            Caption = 'Text 1';
        }
        field(50007; "Text 2"; Text[200])
        {
            Caption = 'Text 2';
        }
        field(50008; "Text 3"; Text[200])
        {
            Caption = 'Text 3';
        }
        field(50009; "Text 4"; Text[200])
        {
            Caption = 'Text 4';
        }
        field(50010; "Text 5"; Text[200])
        {
            Caption = 'Text 5';
        }
        field(50011; "Text 6"; Text[200])
        {
            Caption = 'Text 6';
        }
        field(50012; "Text 9"; Text[200])
        {
            Caption = 'Text 9';
        }
        field(50013; "Text 10"; Text[200])
        {
            Caption = 'Text 10';
        }
        field(50014; "Department Name"; Text[50])
        {
            Caption = 'Department Name';
        }
        field(50015; "Station Name"; Text[50])
        {
            Caption = 'Station Name';
        }
        field(50016; "Directorate Name"; Text[50])
        {
            Caption = 'Directorate Name';
        }
        field(50017; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
        field(50018; "Training Application No"; Code[20])
        {
            Editable = true;
            Caption = 'Training Application No';
            trigger OnValidate()
            begin

                if "Employee No." <> xRec."Employee No." then begin
                    HRSetup.Get();
                    NoSeriesMgt.TestManual(HRSetup."Training Application Nos.");
                    "No. Series" := '';
                end;
            end;
        }
    }

    keys
    {
        key(Key1; "Document No")
        {
            Clustered = true;
        }

    }

    fieldgroups { }


    trigger OnInsert()
    begin
        if "Document No" = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Back To Office Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Back To Office Nos.", xRec."No. Series", 0D, "Document No", "No. Series");
        end;

        "User ID" := UserId;


        "Table ID" := Database::"HR Employees";
        "User ID" := UserId;

        if "Training category" <> "Training category"::Group then begin
            //TESTFIELD("Employee No.");
            HREmp.Reset();
            HREmp.SetRange(HREmp."User ID", UserId);
            /*
            IF HREmp.FIND('-') THEN BEGIN
            "Employee No.":=HREmp."No.";
            HREmp.GET(HREmp."No.");
            "Employee Name":=HREmp."Full Name";

            "User ID":=USERID;
            END ELSE BEGIN
            ERROR('User Must be Setup as an employee first. Consult the HR Officer so as to be setup as an employee')
            END;
            */

        end;

        UserSetup.Reset();
        if UserSetup.Get(UserId) then begin
            Supervisor := UserSetup."Approver ID";
            UserSetup.Reset();
            if UserSetup.Get(Supervisor) then
                "Supervisor Name" := UserSetup."E-Mail";
        end;

    end;


    var
        HRTrainingNeeds: Record "HR Training Needs";
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        mcontent: Label 'Status must be new on Training Application No.';
        mcontent2: Label 'You cannot modify approved request, Please cancel the approval request and try again';
        HREmp: Record "HR Employees";
        Vend: Record Vendor;
        UserSetup: Record "User Setup";
        mcontent3: Label 'Training category must be ''Group'' to allow for training application';
        HRTrainApp: Record "HR Training App Header";
        TranPart: Record "HR Training Participants";
        mcontent4: Label 'You cannot evaluate a training which is not successfully completed.';
        mcontent5: Label 'You cannot change training status if the status is not approved';
        Dimn: Record "Dimension Value";
}

