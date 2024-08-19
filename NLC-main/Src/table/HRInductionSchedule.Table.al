#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193861 "HR Induction Schedule"
{
    Caption = 'HR Induction Schedule';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Induction Code"; Code[10])
        {
            Caption = 'Induction Code';
            trigger OnValidate()
            begin
                if "Induction Code" <> xRec."Induction Code" then begin
                    HRSetup.Get();
                    NoSeriesMgt.TestManual(HRSetup."Induction Nos");
                    "No series" := '';
                end;
            end;
        }
        field(2; "Staff Code"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Staff Code';
            trigger OnValidate()
            begin
                Staff.Reset();
                Staff.SetRange(Staff."No.", "Staff Code");
                if Staff.Find('-') then begin
                    "Staff Names" := Staff."First Name" + ' ' + Staff."Middle Name" + ' ' + Staff."Last Name";
                    "Date of Join" := Staff."Date Of Joining the Company";
                end;
            end;
        }
        field(3; "Staff Names"; Text[100])
        {
            Caption = 'Staff Names';
        }
        field(4; "Staff Department"; Text[100])
        {
            Caption = 'Staff Department';
        }
        field(5; "Date of Join"; Date)
        {
            Caption = 'Date of Join';
        }
        field(6; "Department Code"; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            Caption = 'Department Code';
            trigger OnValidate()
            begin
                Department.Reset();
                Department.SetRange(Department.Code, "Department Code");
                if Department.Find('-') then
                    "Department Name" := Department.Name;
            end;
        }
        field(7; "Department Name"; Text[100])
        {
            Caption = 'Department Name';
        }
        field(8; "Induction Period"; Integer)
        {
            Caption = 'Induction Period';
        }
        field(9; "Induction Start date"; Date)
        {
            Caption = 'Induction Start date';
            trigger OnValidate()
            begin
                Induction.Reset();
                Induction.SetRange(Induction."Staff Code", "Staff Code");

                if Induction.Find('-') then begin
                    Evaluate(RLen, (Format(Induction."Induction Period") + 'D'));
                    Rdate := CalcDate(RLen, "Induction Start date");
                    "Induction End  date" := Rdate;
                end;
            end;
        }
        field(10; "Induction End  date"; Date)
        {
            Caption = 'Induction End  date';
        }
        field(11; Comments; Text[100])
        {
            Caption = 'Comments';
        }
        field(12; Status; Option)
        {
            OptionCaption = 'New,Pending Approval,Approved';
            OptionMembers = New,"Pending Approval",Approved;
            Caption = 'Status';
        }
        field(13; "Document Type"; Option)
        {
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,Payment Voucher,Petty Cash,Imprest,Requisition,ImprestSurrender,Interbank,Receipt,Staff Claim,Staff Advance,AdvanceSurrender,Budget Transfer,Employee Requisition,Leave Application,Transport Requisition,Training Requisition,Job Approval,Induction Approval';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Budget Transfer","Employee Requisition","Leave Application","Transport Requisition","Training Requisition","Job Approval","Induction Approval";
            Caption = 'Document Type';
        }
        field(38; "Table ID"; Integer)
        {
            Caption = 'Table ID';
        }
        field(40; "User ID"; Code[50])
        {
            Caption = 'User ID';
        }
        field(41; Selected; Boolean)
        {
            Caption = 'Selected';
        }
        field(42; "No series"; Code[10])
        {
            Caption = 'No series';
        }
        field(43; Supervisor; Code[10])
        {
            Caption = 'Supervisor';
        }
        field(44; "Application Date"; Date)
        {
            Caption = 'Application Date';
        }
        field(45; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center BR 2";
            Caption = 'Responsibility Center';
        }
    }

    keys
    {
        key(Key1; "Induction Code")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        if "Induction Code" = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Induction Nos");
            NoSeriesMgt.InitSeries(HRSetup."Induction Nos", xRec."No series", 0D, "Induction Code", xRec."No series");
        end;


        "Table ID" := Database::"HR Employees";
        "User ID" := UserId;
        //IF "Training category"<>"Training category"::Group THEN BEGIN
        HREmp.Reset();
        HREmp.SetRange(HREmp."User ID", UserId);
        if HREmp.Find('-') then begin
            "Staff Code" := HREmp."No.";
            //"Job Title":=HREmp."Job Title";
            HREmp.Get(HREmp."No.");
            //HREmp.CALCFIELDS(HREmp.Picture);
            //Picture:=HREmp.Picture;
            "User ID" := UserId;
        end else
            Error('User Must be Setup as an employee first. Consult the HR Officer so as to be setup as an employee');
        //END;

        UserSetup.Reset();
        if UserSetup.Get(UserId) then begin
            Supervisor := UserSetup."Approver ID";
            UserSetup.Reset();
            if UserSetup.Get(Supervisor) then
                //"Supervisor Name":=UserSetup."E-Mail";
                //END;

                //POPULATE FIELDS
                "Application Date" := Today;
        end;
    end;

    var
        Induction: Record "HR Induction Schedule";
        CLen: DateFormula;
        CDate: Date;
        RLen: DateFormula;
        Rdate: Date;
        Staff: Record "HR Employees";
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HREmp: Record "HR Employees";
        UserSetup: Record "User Setup";
        Department: Record "Dimension Value";
}
