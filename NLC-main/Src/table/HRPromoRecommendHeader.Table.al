#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193508 "HR Promo. Recommend Header"
{
    DrillDownPageId = "HR Promotion Recommend List";
    LookupPageId = "HR Promotion Recommend List";
    Caption = 'HR Promo. Recommend Header';

    // DataClassification = CustomerContent;
    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'No';

        }
        field(2; "Employee No."; Code[20])
        {
            TableRelation = "HR Employees"."No." where(Status = filter(Active));
            Caption = 'Employee No.';
            trigger OnValidate()
            var
                myInt: Integer;
                Hremploy: Record "HR Employees";

            begin
                Hremploy.Reset();
                Hremploy.SetRange("No.", Rec."Employee No.");
                if Hremploy.FindFirst() then
                    Rec."Employee Name" := Hremploy.FullName;
            end;
        }
        field(3; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
        }
        field(4; "Shortcut Dimension code1"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Caption = 'Shortcut Dimension code1';
        }
        field(5; "Shortcut Dimension code2"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            Caption = 'Shortcut Dimension code2';
        }
        field(6; "Date of Recommendation"; Date)
        {
            Caption = 'Date of Recommendation';
        }
        field(7; Reason; Text[250])
        {
            Caption = 'Reason';
        }
        field(8; Status; Option)
        {
            OptionMembers = New,"Pending Approval",Approved,Rejected;
            OptionCaption = ' New,"Pending Approval",Approved,Rejected';
            Caption = 'Status';
            trigger OnValidate()
            var
                PRSalary: Record "PR Employee Transactions";
                JobHistory: Record "HR Employee Info Change";
                Linenum: Integer;
                EmploRec: Record "HR Employees";
            begin
                if Status = Status::Approved then begin

                    TransferLines.Reset();
                    TransferLines.SetRange(TransferLines."Document No", rec.No);
                    if TransferLines.FindFirst() then begin
                        repeat
                            HRRec.Reset();
                            HRRec.SetRange("No.", TransferLines."Employee No.");
                            if HRRec.FindFirst() then begin
                                HRRec.Grade := TransferLines."Salary Grade";
                                if TransferLines."New Job ID" <> '' then begin
                                    HRRec."Job ID" := TransferLines."New Job ID";
                                    HRRec.Validate("Job ID");
                                end;
                                // HRRec."Job Title" := TransferLines."New Job ID Name";
                                HRRec."Current Duty Station" := TransferLines."County Name";
                                HRRec.County := TransferLines."New Global Dimension 1 Code";
                                HRRec."County Name" := TransferLines."County Name";
                                //HRRec."Global Dimension 1 Code" := TransferLines."New Global Dimension 2 Code";
                                HRRec."Salary Grade" := TransferLines."New Salary Grade";
                                HRRec.Grade := TransferLines."New Salary Grade";
                                //HRRec."EMP Transfer Date" := TransferLines."Date of Recommendation";
                                HRRec."Last Date Modified" := Today;
                                JobHistory.Reset();
                                JobHistory.SetRange("No.", TransferLines."Employee No.");
                                if JobHistory.FindLast() then begin
                                    EmploRec.Reset();
                                    EmploRec.SetRange("No.", TransferLines."Employee No.");
                                    if EmploRec.FindFirst() then begin
                                        JobHistory.Init();
                                        JobHistory."Line No." := JobHistory."Line No." + 1;
                                        JobHistory."E-Mail" := HRRec."Company E-Mail";
                                        JobHistory."No." := HRRec."No.";
                                        JobHistory."Department Code" := EmploRec."Responsibility Center";
                                        JobHistory."Department Name" := EmploRec."Department Name";
                                        JobHistory."Country Code" := EmploRec.County;
                                        JobHistory."County Name" := EmploRec."County Name";
                                        JobHistory.Grade := TransferLines."New Salary Grade";
                                        JobHistory."Period Filter" := TransferLines."From payroll Period";
                                        JobHistory."Job ID" := TransferLines."New Job ID";
                                        JobHistory.Validate(JobHistory."Job ID");
                                        JobHistory.Insert();
                                    end;
                                end;
                                PRSalary.Reset();
                                PRSalary.SetRange(PRSalary."Employee Code", TransferLines."Employee No.");
                                PRSalary.SetRange(PRSalary."Transaction Code", TransferLines."Transaction Code");
                                PRSalary.SetRange(PRSalary."Payroll Period", TransferLines."From payroll Period");
                                if not PRSalary.Find('-') then begin
                                    PRSalary.Init();
                                    PRSalary."Employee Code" := TransferLines."Employee No.";
                                    PRSalary."Payroll Period" := TransferLines."From payroll Period";
                                    PRSalary."Transaction Code" := TransferLines."Transaction Code";
                                    PRSalary."Transaction Name" := TransferLines."Transaction Name";
                                    PRSalary.Amount := TransferLines.Amount;
                                    PRSalary.Insert();
                                end else begin
                                    if PRSalary.Find('-') then begin
                                        PRSalary."Employee Code" := TransferLines."Employee No.";
                                        PRSalary."Payroll Period" := TransferLines."From payroll Period";
                                        PRSalary."Transaction Code" := TransferLines."Transaction Code";
                                        PRSalary."Transaction Name" := TransferLines."Transaction Name";
                                        PRSalary.Amount := TransferLines.Amount;
                                        PRSalary."Payroll Period" := TransferLines."From payroll Period";
                                        PRSalary.Modify();
                                    end;
                                end;
                                HRRec.Modify();
                            end;
                        until TransferLines.Next() = 0;
                    end;
                end;
                Message('Employee details has been validate');
            end;
        }
        field(9; "No Series"; Code[20])
        {
            Caption = 'No Series';
        }
        field(10; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility Center BR NEW".Code;
            Caption = 'Responsibility Center';
        }
        field(11; "Promotion Criteria"; Option)
        {
            OptionCaption = ',Employee Performance,Higher Qualifications,Acting Appointment,After Interview';
            OptionMembers = " ","Employee Performance","Higher Qualifications","Acting Appointment","After Interview";
            Caption = 'Promotion Criteria';
        }
        field(12; "Development Areas"; Text[250])
        {
            Caption = 'Development Areas';
        }
        field(13; "Job Title"; Text[50])
        {
            Caption = 'Job Title';
        }
        field(14; "Salary Grade"; Code[20])
        {
            Caption = 'Salary Grade';
        }
        field(15; "New Job ID"; Code[20])
        {
            TableRelation = "HR Jobs"."Job ID";
            Caption = 'New Job ID';

        }
        field(16; "New Job Title"; Text[50])
        {
            Caption = 'New Job Title';
        }
        field(17; "New Salary Grade"; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const(Grade));
            Caption = 'New Salary Grade';
        }
        field(18; "New Salary Notch"; Code[20])
        {
            Enabled = false;
            Caption = 'New Salary Notch';
        }
        field(19; Promoted; Boolean)
        {
            Caption = 'Promoted';
        }
        field(20; "Salary Notch"; Code[20])
        {
            Enabled = false;
            Caption = 'Salary Notch';
        }
        field(21; "User ID"; Code[100])
        {
            Caption = 'User ID';
        }
        field(22; "County Promoted"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Caption = 'County Promoted';
        }
        field(23; "Created By"; Code[100])
        {
            Caption = 'Created By';
        }
        field(24; "Employee Info Updated"; Boolean)
        {
            Caption = 'Employee Info Updated';
        }

        field(40; "Effective Date Of Transfer"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Date Of Promotion';
            //ClosingDates
        }
        field(41; "Approved By"; Text[90])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        if No = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Employee Promotion No.");
            NoSeriesMgt.InitSeries(HRSetup."Employee Promotion No.", xRec."No Series", 0D, No, "No Series");
        end;
        "Date of Recommendation" := Today;
        "Created By" := UserId;
        //Responsibility Center":='hrd';
        //VALIDATE("Responsibility Center");
    end;

    procedure LinesExists(): Boolean
    var
        PayLines: Record "HR Promo. Recommend Lines";
        HasLines: Boolean;
    begin

        HasLines := false;
        PayLines.Reset();
        PayLines.SetRange(PayLines."Document No", Rec.No);
        if PayLines.Find('-') then begin
            HasLines := true;
            exit(HasLines);
        end;
    end;

    var
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HREmployees: Record "HR Employees";
        Jobs: Record "HR Jobs";
        Text001: Label 'You can only promote employees once they have been confirmed';
        TransferLines: Record "HR Promo. Recommend Lines";
        HRRec: Record "HR Employees";
}
