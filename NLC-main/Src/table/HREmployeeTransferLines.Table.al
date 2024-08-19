#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193493 "HR Employee Transfer Lines"
{
    Caption = 'HR Employee Transfer Lines';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Request No"; Code[50])
        {
            Caption = 'Request No';
        }
        field(2; "Employee No"; Code[50])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee No';
            trigger OnValidate()
            var
                Translines: Record "HR Employee Transfer Lines";
                Hrsetup: Record "HR Setup";
            begin
                "New Global Dimension 1 Code" := '';
                "New Region Name" := '';
                "New Global Dimension 2 Code" := '';
                "New Directorate Name" := '';
                Reason := '';
                "Date Of Transfer" := 0D;
                "Hardship Area" := false;
                Hrsetup.Get();
                Hrsetup.TestField("Transfer Allowance");
                Employees.Reset();
                Employees.SetRange(Employees."No.", "Employee No");
                if Employees.Find('-') then begin
                    "Employee Name" := Employees."First Name" + ' ' + Employees."Middle Name" + ' ' + Employees."Last Name";
                    "Global Dimension 1 Code" := Employees."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := Employees."Global Dimension 2 Code";
                    "Current Grade" := Employees.Grade;
                    "New Grade" := Employees.Grade;
                    "New Job ID Name" := Employees."Job Title";
                    "Current Designation Name" := Employees."Job Title";
                    "Responsibility Center" := Employees."Responsibility Center";
                    "Current Designation" := Employees.County;
                    "Current Region Name" := Employees."County Name";
                end;

                HREmployeeBankAcc.Reset();
                HREmployeeBankAcc.SetRange(HREmployeeBankAcc."Employee Code", "Employee No");
                if HREmployeeBankAcc.Find('+') then begin
                    "Bank  Code" := HREmployeeBankAcc."Bank  Code";
                    "Bank Name" := HREmployeeBankAcc."Bank Name";
                    "Branch Code" := HREmployeeBankAcc."Branch Code";
                    "Branch Name" := HREmployeeBankAcc."Branch Name";
                    "A/C  Number" := HREmployeeBankAcc."A/C  Number";
                    "Percentage to Transfer" := HREmployeeBankAcc."Percentage to Transfer";
                    "New Percentage to Transfer" := HREmployeeBankAcc."Percentage to Transfer";
                end;


                // Translines.Reset();
                // Translines.SetRange(Translines."Request No", rec."Request No");
                // Translines.SetRange("Employee No", Rec."Employee No");
                // if Translines.Find('-') then begin
                PRSalary.Reset();
                PRSalary.SetRange(PRSalary."Employee Code", rec."Employee No");
                if PRSalary.Find('-') then begin
                    "Transaction Code" := Hrsetup."Transfer Allowance";
                    rec.Validate("Transaction Code");
                    "HardShip Code" := Hrsetup."Hardship Allowance";
                    rec.Validate("HardShip Code");
                    // "Transaction Name" := 'Transfer Allowance';
                    rec.Amount := Round(PRSalary."Basic Pay", 0.01, '>');
                end;
                //end;
            end;
        }
        field(3; "Employee Name"; Text[100])
        {
            CalcFormula = lookup("HR Employees"."Full Name" where("No." = field("Employee No")));
            FieldClass = FlowField;
            Caption = 'Employee Name';
            Editable = false;
        }
        field(4; "Global Dimension 1 Code"; Code[50])
        {
            Caption = 'Current Directorate Code';
            Description = 'Stores the reference to the first global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(5; "New Global Dimension 1 Code"; Code[50])
        {
            Caption = 'Requested New Directorate Code';
            Description = 'Stores the reference to the New first global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            var
                Dimensi: Record "Dimension Value";
            begin

                Dimensi.Reset();
                Dimensi.SetRange(Code, rec."New Global Dimension 1 Code");
                if Dimensi.FindFirst() then begin
                    rec."New Region Name" := Dimensi.Name;
                    rec."Hardship Area" := Dimensi."Hardship Area";
                    if rec."Hardship Area" = false then
                        rec."Hardship Amount" := 0
                end;
            end;
        }
        field(6; "Global Dimension 2 Code"; Code[50])
        {
            Caption = 'Current Region Code';
            Description = 'Stores the reference of the second global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(7; "New Global Dimension 2 Code"; Code[50])
        {
            Caption = 'New Current Region Code';
            Description = 'Stores the reference of the second global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            var
                Dimn: Record "Dimension Value";
            begin
                Dimn.Reset();
                Dimn.SetRange(Dimn.Code, "New Global Dimension 2 Code");
                if Dimn.Find('-') then
                    "New Directorate Name" := Dimn.Name;
            end;
        }
        field(8; "Shortcut Dimension 3 Code"; Code[50])
        {
            Caption = 'Current Department Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(9; "New Shortcut Dimension 3 Code"; Code[50])
        {
            Caption = 'Requested New Department Code';
            Description = 'Stores the reference of the New Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            var
                Dimn: Record "Dimension Value";
            begin
                Dimn.SetRange(Dimn.Code, "New Shortcut Dimension 3 Code");
                if Dimn.Find('-') then
                    "New Department Name" := Dimn.Name;
            end;
        }
        field(10; "Current Department Name"; Text[100])
        {
            Caption = 'Current Department Name';
        }
        field(11; "New Department Name"; Text[100])
        {
            Caption = 'New Department Name';
        }
        field(12; "Current Region Name"; Text[100])
        {
            Caption = 'Current Region Name';
        }
        field(13; "Current Directorate Name"; Text[100])
        {
            Caption = 'Current Directorate Name';
        }
        field(14; "New Directorate Name"; Text[100])
        {
            // CalcFormula = lookup("Dimension Value".Name where("Global Dimension No." = filter(2),
            //                                                    Code = field("New Global Dimension 2 Code")));
            // FieldClass = FlowField;
            Caption = 'New Directorate Name';
            Editable = false;
        }
        field(15; "New Region Name"; Text[100])
        {
            // CalcFormula = lookup("Dimension Value".Name where("Global Dimension No." = filter(1),
            //                                                    Code = field("New Global Dimension 1 Code")));
            // FieldClass = FlowField;
            Caption = 'New Region Name';
            Editable = false;
        }
        field(16; "Line No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No';
        }
        field(17; "Current Grade"; Code[20])
        {
            Caption = 'Current Grade';
        }
        field(18; "Current Designation"; Code[20])
        {
            TableRelation = "HR Jobs"."Job ID";
            Caption = 'Current Designation';
        }
        field(19; "New Grade"; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const(Grade));
            Caption = 'Grade';
        }
        field(20; "New Designation"; Code[100])
        {
            TableRelation = "HR Jobs"."Job ID";
            Caption = 'New Designation';
            trigger OnValidate()
            begin
                HRJobs.SetRange(HRJobs."Job ID", "New Designation");
                if HRJobs.Find('-') then begin
                    rec."New Designation" := HRJobs."Job ID";
                    rec."New Job ID Name" := HRJobs."Job Description";

                end;
            end;
        }
        field(21; "Date Of Transfer"; Date)
        {
            Caption = 'Date Of Transfer';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if rec."Date Of Transfer" <= Today then
                    Error('Transfer date should not be less or equal to today');

            end;
        }
        field(22; "From payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened" where(Closed = const(false));
            Caption = 'From payroll Period';
            trigger OnValidate()
            begin
                "Period Month" := 0;
                "Period Year" := 0;

                PayrollRec.Reset();
                PayrollRec.SetRange(PayrollRec."Date Opened", "From payroll Period");
                if PayrollRec.Find('-') then
                    "Period Month" := PayrollRec."Period Month";
                "Period Year" := PayrollRec."Period Year";
            end;
        }
        field(23; "To Payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened" where(Closed = const(false));
            Caption = 'To Payroll Period';
        }
        field(24; "Bank  Code"; Code[50])
        {
            TableRelation = "PR Bank Accounts"."Bank Code";
            Caption = 'Bank  Code';
            trigger OnValidate()
            begin

                "Bank Name" := '';
                "Branch Code" := '';
                "Branch Name" := '';

                prBankStructure.Reset();
                prBankStructure.SetRange(prBankStructure."Bank Code", "Bank  Code");
                if prBankStructure.Find('-') then
                    "Bank Name" := prBankStructure."Bank Name";
            end;
        }
        field(25; "Bank Name"; Text[100])
        {
            Editable = false;
            TableRelation = "PR Bank Accounts"."Bank Name";
            Caption = 'Bank Name';
        }
        field(26; "Branch Code"; Code[50])
        {
            TableRelation = "PR Bank Branches"."Branch Code" where("Bank Code" = field("Bank  Code"));
            Caption = 'Branch Code';
            trigger OnValidate()
            begin

                "Branch Name" := '';
                PRBankBranches.Reset();
                PRBankBranches.SetRange(PRBankBranches."Branch Code", "Branch Code");
                if PRBankBranches.Find('-') then
                    "Branch Name" := PRBankBranches."Branch Name";
            end;
        }
        field(27; "Branch Name"; Text[100])
        {
            Editable = false;
            Caption = 'Branch Name';
        }
        field(28; "A/C  Number"; Code[50])
        {
            Caption = 'A/C  Number';
        }
        field(29; "New Bank  Code"; Code[50])
        {
            TableRelation = "PR Bank Accounts"."Bank Code";
            Caption = 'New Bank  Code';
            trigger OnValidate()
            begin

                "New Bank Name" := '';
                "New Branch Code" := '';
                "New Branch Name" := '';

                prBankStructure.Reset();
                prBankStructure.SetRange(prBankStructure."Bank Code", "New Bank  Code");
                if prBankStructure.Find('-') then
                    "New Bank Name" := prBankStructure."Bank Name";
            end;
        }
        field(30; "New Bank Name"; Text[100])
        {
            Editable = false;
            TableRelation = "PR Bank Accounts"."Bank Name";
            Caption = 'New Bank Name';
        }
        field(31; "New Branch Code"; Code[50])
        {
            TableRelation = "PR Bank Branches"."Branch Code" where("Bank Code" = field("New Bank  Code"));
            Caption = 'New Branch Code';
            trigger OnValidate()
            begin

                "New Branch Name" := '';
                PRBankBranches.Reset();
                PRBankBranches.SetRange(PRBankBranches."Branch Code", "New Branch Code");
                if PRBankBranches.Find('-') then
                    "New Branch Name" := PRBankBranches."Branch Name";
            end;
        }
        field(32; "New Branch Name"; Text[100])
        {
            Editable = false;
            Caption = 'New Branch Name';
        }
        field(33; "New A/C  Number"; Code[50])
        {
            Caption = 'New A/C  Number';
        }
        field(34; "Transaction Code"; Code[20])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code" where("Transaction Type" = const(Income));
            Caption = 'Transaction Code';
            trigger OnValidate()
            begin


                "Transaction Name" := '';
                PRTransCode.Reset();
                PRTransCode.SetRange(PRTransCode."Transaction Code", "Transaction Code");
                if PRTransCode.Find('-') then
                    "Transaction Name" := UpperCase(PRTransCode."Transaction Name");
                //Amount := PRTransCode.Amount;

            end;
        }
        field(35; "Transaction Name"; Text[100])
        {
            Editable = false;
            Caption = 'Transaction Name';
        }
        field(36; "Responsibility Center"; Code[20])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center BR NEW".Code;
        }
        field(37; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(38; Reason; Text[100])
        {
            Caption = 'Reason';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                rec.TestField("Date Of Transfer");
            end;
        }
        field(39; "New Responsibility Center"; Code[20])
        {
            Caption = 'New Responsibility Center';
            TableRelation = "Responsibility Center BR NEW".Code;
        }
        field(40; "Current Designation Name"; Text[100])
        {
            Caption = 'Current Designation Name';
        }
        field(41; "Payroll Updated"; Boolean)
        {
            Editable = false;
            Caption = 'Payroll Updated';
        }
        field(42; "Period Month"; Integer)
        {
            Caption = 'Period Month';
        }
        field(43; "Period Year"; Integer)
        {
            Caption = 'Period Year';
        }
        field(44; "New Job ID Name"; Text[150])
        {
            // CalcFormula = lookup("HR Jobs"."Job Description" where("Job ID" = field("New Designation")));
            // FieldClass = FlowField;
            //Caption = 'New Job ID Name';
            Editable = false;
        }
        field(45; "Percentage to Transfer"; Decimal)
        {
            MaxValue = 100;
            Caption = 'Percentage to Transfer';

        }
        field(46; "New Percentage to Transfer"; Decimal)
        {
            MaxValue = 100;
            Caption = 'New Percentage to Transfer';

        }
        field(47; "Hardship Area"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(48; "HardShip Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "PR Transaction Codes"."Transaction Code" where("Transaction Type" = const(Income));
            Caption = 'Hardship Code';
            trigger OnValidate()
            begin

                "HardShip TransName" := '';
                PRTransCode.Reset();
                PRTransCode.SetRange(PRTransCode."Transaction Code", "HardShip Code");
                if PRTransCode.Find('-') then begin
                    "HardShip TransName" := UpperCase(PRTransCode."Transaction Name");
                    rec."Hardship Amount" := PRTransCode.Amount;
                end;


            end;
        }
        field(49; "HardShip TransName"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50; "Hardship Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Request No", "Employee No", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnDelete()
    begin

        TransHeader.Reset();
        if TransHeader.Get(TransHeader."Request No") then
            if TransHeader.Status <> TransHeader.Status::New then
                Error('You are not allowed to delete at this level');
    end;

    var
        hrsetup: Record "HR Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Employees: Record "HR Employees";
        HRJobs: Record "HR Jobs";
        prBankStructure: Record "PR Bank Accounts";
        HREmployeeBankAcc: Record "HR Employee Bank Accounts";
        PRBankBranches: Record "PR Bank Branches";
        PRTransCode: Record "PR Transaction Codes";
        PRSalary: Record "PR Salary Card";
        PayrollRec: Record "PR Payroll Periods";
        TransHeader: Record "HR Employee Transfer Header";
        EmpInfo: Record "HR Employee Info Change";
}
