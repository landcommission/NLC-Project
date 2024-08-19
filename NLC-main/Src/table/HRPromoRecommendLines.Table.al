#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193509 "HR Promo. Recommend Lines"
{
    Caption = 'HR Promo. Recommend Lines';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee Abilities"; Text[250])
        {
            Caption = 'Employee Abilities';
        }
        field(3; Experience; Text[250])
        {
            Caption = 'Experience';
        }
        field(4; "Document No"; Code[20])
        {
            Caption = 'Document No';
        }
        field(5; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }

        field(6; "Employee No."; Code[20])
        {
            TableRelation = "HR Employees"."No." where(Status = filter(Active));
            Caption = 'Employee No.';
            trigger OnValidate()
            begin
                "New Salary Grade" := '';
                Reason := '';

                HREmployees.Reset();
                HREmployees.SetRange(HREmployees."No.", "Employee No.");
                if HREmployees.Find('-') then begin
                    //You can only promote confirmed employees
                    //IF HREmployees.Confirmed = FALSE THEN ERROR(Text001);

                    "Employee Name" := HREmployees."Full Name";
                    "Shortcut Dimension code1" := HREmployees."Global Dimension 1 Code";
                    "Shortcut Dimension code2" := HREmployees."Global Dimension 2 Code";
                    "Global Dimension 1 Code" := HREmployees."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := HREmployees."Global Dimension 2 Code";
                    "Job Title" := HREmployees."Job Title";
                    "Salary Grade" := HREmployees.Grade;
                    "New Global Dimension 1 Code" := HREmployees.County;
                    "County Name" := HREmployees."County Name";
                    "Responsibility Center" := HREmployees."Responsibility Center";
                    "Job ID" := HREmployees."Job ID";

                end else begin
                    "Employee Name" := '';
                    "Shortcut Dimension code1" := '';
                    "Shortcut Dimension code2" := '';
                    "Job ID" := '';
                    "Job Title" := '';
                    "Salary Grade" := '';
                    "Global Dimension 1 Code" := '';
                    "Global Dimension 2 Code" := '';
                end;
            end;
        }
        field(7; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
        }
        field(8; "Shortcut Dimension code1"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Caption = 'Shortcut Dimension code1';
        }
        field(9; "Shortcut Dimension code2"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            Caption = 'Shortcut Dimension code2';
        }
        field(10; "Date of Recommendation"; Date)
        {
            Caption = 'Date of Recommendation';
        }
        field(11; Reason; Text[100])
        {
            Caption = 'Reason';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                //rec.TestField("Effective Date Of Transfer");
            end;
        }
        field(12; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility Center BR NEW".Code;
            Caption = 'Responsibility Center';
        }
        field(13; "Promotion Criteria"; Option)
        {
            OptionCaption = ',Employee Performance,Higher Qualifications,Acting Appointment,After Interview';
            OptionMembers = " ","Employee Performance","Higher Qualifications","Acting Appointment","After Interview";
            Caption = 'Promotion Criteria';
        }
        field(14; "Development Areas"; Text[250])
        {
            Caption = 'Development Areas';
        }
        field(15; "Job Title"; Text[50])
        {
            Editable = false;
            Caption = 'Job Title';
        }
        field(16; "Salary Grade"; Code[20])
        {
            Caption = 'Salary Grade';
        }
        field(17; "New Job ID"; Code[20])
        {
            TableRelation = "HR Jobs"."Job ID";
            Caption = 'New Job ID';
            trigger OnValidate()
            begin

                Jobs.Reset();
                Jobs.SetRange(Jobs."Job ID", "New Job ID");
                if Jobs.Find('-') then
                    "New Job Title" := Jobs."Job Description";
                "New Salary Grade" := Jobs.Grade;
                rec.Validate("New Salary Grade");
            end;
        }
        field(18; "New Job Title"; Text[50])
        {
            Editable = false;
            Caption = 'New Job Title';
        }
        field(19; "New Salary Grade"; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const(Grade));
            Caption = 'New Salary Grade';
            trigger OnValidate()
            var
                myInt: Integer;
                HrLookups: Record "HR Lookup Values";
                HrSetup: Record "HR Setup";
                Prcodes: Record "PR Transaction Codes";
            begin
                HrSetup.Get();
                HrSetup.TestField(HrSetup."Promotion Allowance");
                HrLookups.Reset();
                HrLookups.SetRange(HrLookups.Code, Rec."New Salary Grade");
                if HrLookups.FindFirst() then begin
                    rec."Transaction Code" := HrSetup."Promotion Allowance";
                    Rec.Amount := HrLookups."Basic Salary";
                    Prcodes.Reset();
                    Prcodes.SetRange("Transaction Code", Rec."Transaction Code");
                    if Prcodes.FindFirst() then
                        rec."Transaction Name" := Prcodes."Transaction Name";
                    //Rec.Modify();
                end;

            end;
        }
        field(20; Promoted; Boolean)
        {
            Caption = 'Promoted';
        }
        field(21; "County Promoted"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            Caption = 'County Promoted';
        }
        field(22; "From payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened" where(Closed = const(false));
            Caption = 'From payroll Period';
        }
        field(23; "To Payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened" where(Closed = const(false));
            Caption = 'To Payroll Period';
        }
        field(24; "Job ID"; Code[30])
        {
            Description = 'To put description on Job title field';
            TableRelation = "HR Jobs"."Job ID";
            Caption = 'Job ID';
            trigger OnValidate()
            begin

                objJobs.Reset();
                objJobs.SetRange(objJobs."Job ID", "Job ID");
                if objJobs.Find('-') then
                    "Job Title" := objJobs."Job Description";
            end;
        }
        field(25; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(26; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(27; "New Global Dimension 1 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            trigger OnValidate()
            var
                myInt: Integer;
                Dimensi: Record "Dimension Value";
            begin
                Dimensi.Reset();
                Dimensi.SetRange(Code, rec."New Global Dimension 1 Code");
                if Dimensi.FindFirst() then
                    rec."County Name" := Dimensi.Name;
            end;
        }
        field(28; "New Global Dimension 2 Code"; Code[20])
        {
            Caption = 'New Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            trigger OnValidate()
            var
                Dimn: Record "Dimension Value";
            begin
                Dimn.SetRange(Dimn.Code, "New Global Dimension 2 Code");
                if Dimn.Find('-') then
                    "Directorate Name" := Dimn.Name;
            end;
        }
        field(29; "New Responsibility Center"; Code[20])
        {
            Caption = 'New Responsibility Center';
            TableRelation = "Responsibility Center BR NEW".Code;
        }
        field(30; "County Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Directorate Name"; Text[120])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Effective Date Of Transfer"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Effective Date Of Transfer';
            //ClosingDates
        }
        field(34; "Transaction Code"; Code[20])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code" where("Transaction Type" = const(Income));
            Caption = 'Transaction Code';
            trigger OnValidate()
            var
                PRTransCode: Record "PR Transaction Codes";
            begin


                "Transaction Name" := '';

                PRTransCode.Reset();
                PRTransCode.SetRange(PRTransCode."Transaction Code", "Transaction Code");
                if PRTransCode.Find('-') then begin
                    "Transaction Name" := UpperCase(PRTransCode."Transaction Name");
                    Amount := PRTransCode.Amount;
                end;
            end;
        }
        field(35; "Transaction Name"; Text[100])
        {
            Editable = false;
            Caption = 'Transaction Name';
        }
        field(36; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    var
        HRSetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HREmployees: Record "HR Employees";
        Jobs: Record "HR Jobs";
        objJobs: Record "HR Jobs";
}
