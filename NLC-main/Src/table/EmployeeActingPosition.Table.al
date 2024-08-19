table 59100 "Employee Acting Position"
{
    Caption = 'Employee Acting Position';
    DataClassification = CustomerContent;
    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'No';
        }
        field(2; Position; Code[30])
        {
            TableRelation = "HR Jobs";
            Caption = 'Position';
            trigger OnValidate()
            begin

                Jobs.Reset();
                Jobs.SetRange("Job ID", Position);
                if Jobs.Find('-') then
                    "Job Description" := Jobs."Job Description";
            end;

        }
        field(3; "Relieved Employee"; Code[30])
        {
            TableRelation = Employee."No.";
            Caption = 'Relieved Employee';
            trigger OnValidate()
            begin

                Employee.Reset();
                Employee.SetRange("No.", "Relieved Employee");
                if Employee.Find('-') then
                    "Relieved Name" := (Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name");
            end;
        }
        field(4; "Relieved Name"; Text[60])
        {
            Caption = 'Relieved Name';
        }
        field(5; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(6; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(8; Name; Text[30])
        {
            Caption = 'Name';
        }
        field(9; Status; Option)
        {
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
            Caption = 'Status';
        }
        field(10; "No Series"; Code[30])
        {
            Caption = 'No Series';
        }
        field(11; Reason; Text[200])
        {
            Caption = 'Reason';
        }
        field(12; Promoted; Boolean)
        {
            Caption = 'Promoted';
        }
        field(13; "Job Description"; Text[60])
        {
            Caption = 'Job Title';
        }
        field(14; "Employee No."; Code[30])
        {
            TableRelation = Employee."No.";
            Caption = 'Employee No.';
            trigger OnValidate()
            begin
                Employee.Reset();
                Employee.SetRange("No.", "Employee No.");
                if Employee.Find('-') then begin
                    Name := (Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name");
                    PLWD := Employee.Disabled = Employee.Disabled::Yes;
                    "Current Duty Station" := Employee."Current Duty Station";
                end;
                if "Promotion Type" = "Promotion Type"::"Acting Position" then begin
                    Acting.Reset();
                    Acting.SetRange("Employee No.", "Employee No.");
                    Acting.SetRange(Status, Acting.Status::Approved);
                    Acting.SetFilter("End Date", '=%1|>%2', 0D, Today);
                    if Acting.Find('-') then
                        Error('This Employee is on an acting capacity')
                    else begin
                        if Employee.Get("Employee No.") then;
                        Name := (Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name");
                        // Qualified := true;
                        // Validate(Qualified);
                        SalaryCard.Reset();
                        SalaryCard.SetRange(SalaryCard."Employee Code", "Employee No.");
                        if SalaryCard.Find('-') then begin
                            "Basic Pay" := SalaryCard."Basic Pay";
                            "Acting Amount" := 0.15 * SalaryCard."Basic Pay";
                        end;

                        //         PayPeriod.RESET;
                        //         PayPeriod.SETRANGE(Closed, FALSE);
                        //         IF PayPeriod.FINDFIRST THEN BEGIN
                        //             AssignMatrix.RESET;
                        //             AssignMatrix.SETRANGE("Payroll Period", PayPeriod."Starting Date");
                        //             AssignMatrix.SETRANGE("Employee No", "Employee No.");
                        //             AssignMatrix.SETRANGE("Basic Salary Code", TRUE);
                        //             IF AssignMatrix.FIND('-') THEN BEGIN
                        //                 "Basic Pay" := AssignMatrix.Amount;
                        //                 CurrPeriod := PayPeriod."Starting Date";
                        //             END;
                        //         END;
                        //         Earnings.reset;
                        //         Earnings.SetRange("Acting Allowance", true);
                        //         if Earnings.FindFirst() then begin
                        //             case Earnings."Calculation Method" of
                        //                 Earnings."Calculation Method"::"Flat amount":
                        //                     "Acting Amount" := Earnings."Flat Amount";

                        //                 // % Of Basic Pay
                        //                 Earnings."Calculation Method"::"% of Basic pay":
                        //                     begin
                        //                         Employee.Reset();
                        //                         Employee.SetRange("No.", "Employee No.");
                        //                         Employee.SetRange("Pay Period Filter", CurrPeriod);
                        //                         Employee.CalcFields("Basic Pay", "Basic Arrears");
                        //                         "Acting Amount" := Earnings.Percentage / 100 * (Employee."Basic Pay" - Employee."Basic Arrears");
                        //                         "Acting Amount" := PayrollRounding("Acting Amount");
                        //                     end;
                        //                 // % Of Insurance Amount
                        //                 Earnings."Calculation Method"::"% of Insurance Amount":
                        //                     begin
                        //                         Employee.Reset();
                        //                         Employee.SetRange("No.", "Employee No.");
                        //                         Employee.SetRange("Pay Period Filter", CurrPeriod);
                        //                         Employee.CalcFields("Insurance Premium");
                        //                     end;

                        //                 // % F Gross Pay
                        //                 Earnings."Calculation Method"::"% of Gross pay":
                        //                     begin
                        //                         Employee.Reset();
                        //                         Employee.SetRange("No.", "Employee No.");
                        //                         Employee.SetRange("Pay Period Filter", CurrPeriod);
                        //                         Employee.CalcFields("Basic Pay", "Total Allowances");
                        //                         "Acting Amount" := ((Earnings.Percentage / 100) * (Employee."Total Allowances"));
                        //                         "Acting Amount" := PayrollRounding("Acting Amount");
                        //                     end;

                        //                 // % of Taxable Income
                        //                 Earnings."Calculation Method"::"% of Taxable income":
                        //                     begin
                        //                         Employee.Reset();
                        //                         Employee.SetRange("No.", "Employee No.");
                        //                         Employee.SetRange("Pay Period Filter", CurrPeriod);
                        //                         Employee.CalcFields("Taxable Allowance");
                        //                         "Acting Amount" := ((Earnings.Percentage / 100) * (Employee."Taxable Allowance"));
                        //                         "Acting Amount" := PayrollRounding("Acting Amount");
                        //                     end;




                        //                 //% of Other Earnings
                        //                 Earnings."Calculation Method"::"% of Other Earnings":
                        //                     begin
                        //                         TotalOtherEarnings := 0;
                        //                         Employee.Reset();
                        //                         Employee.SetRange("No.", "Employee No.");
                        //                         Employee.SetRange("Pay Period Filter", CurrPeriod);
                        //                         if Employee.FindFirst() then begin
                        //                             OtherEarnings.Reset;
                        //                             OtherEarnings.SetRange("Main Earning", Earnings.Code);
                        //                             if OtherEarnings.Find('-') then
                        //                                 repeat
                        //                                     AssignMatrix.Reset;
                        //                                     AssignMatrix.SetRange(AssignMatrix.Code, OtherEarnings."Earning Code");
                        //                                     AssignMatrix.SetRange(AssignMatrix."Payroll Period", CurrPeriod);
                        //                                     AssignMatrix.SetRange(AssignMatrix.Type, AssignMatrix.Type::Payment);
                        //                                     AssignMatrix.SetRange(AssignMatrix."Employee No", "Employee No.");
                        //                                     if AssignMatrix.Find('-') then
                        //                                         TotalOtherEarnings += Abs(AssignMatrix.Amount);
                        //                                 until OtherEarnings.Next = 0;
                        //                             Earnings.TestField(Percentage);
                        //                             "Acting Amount" := ((TotalOtherEarnings / 100) * Earnings.Percentage);
                        //                             "Acting Amount" := PayrollRounding("Acting Amount");
                        //                         end;
                        //                     end;

                        //                 Earnings."Calculation Method"::"% of Annual Basic":
                        //                     begin
                        //                         Employee.Reset();
                        //                         Employee.SetRange("No.", "Employee No.");
                        //                         Employee.SetRange("Pay Period Filter", CurrPeriod);
                        //                         Employee.CalcFields("Basic Pay");
                        //                         "Acting Amount" := ((Earnings.Percentage / 100) * (Employee."Basic Pay" * 12));
                        //                         "Acting Amount" := PayrollRounding("Acting Amount");

                        //                     end;
                        //             end;
                        // IF Qualified = TRUE THEN BEGIN
                        //     Earnings.RESET;
                        //     Earnings.SETRANGE("Acting Allowance", TRUE);
                        //     IF Earnings.FINDFIRST THEN
                        //         "Acting Amount" := ((Earnings.Percentage / 100) * ("Basic Pay"));
                        // END ELSE BEGIN
                        //     Earnings.RESET;
                        //     Earnings.SETRANGE("Special Duty", TRUE);
                        //     IF Earnings.FINDFIRST THEN
                        //         "Acting Amount" := ((Earnings.Percentage / 100) * ("Basic Pay"));
                        // END;

                        //         end;
                    end;
                end;




                if "Promotion Type" = "Promotion Type"::Promotion then begin
                    Employee.Reset();
                    Employee.SetRange("No.", "Employee No.");
                    if Employee.FindFirst() then begin
                        Name := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                        "Current Scale" := Employee."Salary Grade";
                        "Current Pointer" := Employee."Salary Notch/Step";
                    end;
                end;

            end;
        }
        field(15; "Promotion Type"; Option)
        {
            OptionCaption = ' ,Acting Position,Promotion';
            OptionMembers = " ","Acting Position",Promotion;
            Caption = 'Promotion Type';
        }
        field(16; "Requested By"; Code[30])
        {
            Caption = 'Requested By';
        }
        field(17; "Request Name"; Text[60])
        {
            Caption = 'Request Name';
        }
        field(18; "Request Date"; Date)
        {
            Caption = 'Request Date';
        }
        field(19; "Desired Position"; Code[30])
        {
            TableRelation = "HR Jobs";
            Caption = 'Desired Position';
            trigger OnValidate()
            begin

                Jobs.Reset();
                Jobs.SetRange("Job ID", "Desired Position");
                if Jobs.Find('-') then
                    "Position Name" := Jobs."Job Description";
            end;
        }
        field(20; "Position Name"; Text[60])
        {
            Caption = 'Position Name';
        }
        field(21; "Basic Pay"; Decimal)
        {
            Caption = 'Basic Pay';
        }
        field(22; "Acting Amount"; Decimal)
        {
            Caption = 'Acting Amount';
        }
        field(23; Qualified; Boolean)
        {
            Caption = 'Qualified';

            // trigger OnValidate()
            // begin
            //     PayPeriod.Reset;
            //     PayPeriod.SetRange(Closed, false);
            //     if PayPeriod.FindFirst then begin
            //         AssignMatrix.Reset;
            //         AssignMatrix.SetRange("Payroll Period", PayPeriod."Starting Date");
            //         AssignMatrix.SetRange("Employee No", "Employee No.");
            //         // AssignMatrix.SetRange("Basic Salary Code", true);
            //         if AssignMatrix.Find('-') then begin
            //             AssignMatrix.CalcSums(Amount);
            //             "Basic Pay" := AssignMatrix.Amount;
            //         end;
            //     end;
            //     if Qualified = true then begin
            //         Earnings.Reset;
            //         Earnings.SetRange("Acting Allowance", true);
            //         if Earnings.FindFirst then
            //             "Acting Amount" := ((Earnings.Percentage / 100) * ("Basic Pay"));

            //     end;
            // end;
        }
        field(24; "Current Scale"; Code[10])
        {
            TableRelation = "Salary Scales";
            Caption = 'Current Scale';
        }
        field(25; "Current Pointer"; Code[10])
        {
            TableRelation = "Salary Pointers";
            Caption = 'Current Pointer';
        }
        field(26; "Current Benefits"; Decimal)
        {
            CalcFormula = sum("Scale Benefits".Amount where("Salary Scale" = field("Current Scale"),
                                                             "Salary Pointer" = field("Current Pointer")));
            FieldClass = FlowField;
            Caption = 'Current Benefits';
            Editable = false;
        }
        field(27; "New Scale"; Code[10])
        {
            TableRelation = "Salary Scales";
            Caption = 'New Scale';
        }
        field(28; "New Pointer"; Code[10])
        {
            TableRelation = "Salary Pointers"."Salary Pointer";
            Caption = 'New Pointer';
        }
        field(29; "New Benefits"; Decimal)
        {
            CalcFormula = sum("Scale Benefits".Amount where("Salary Scale" = field("New Scale"),
                                                             "Salary Pointer" = field("New Pointer")));
            FieldClass = FlowField;
            Caption = 'New Benefits';
            Editable = false;
        }
        field(30; "User ID"; Code[30])
        {
            Caption = 'User ID';
        }
        field(70025; PLWD; Boolean)
        {
            Editable = false;
            Caption = 'PLWD';
        }
        field(69601; "Current Duty Station"; Code[30])
        {
            TableRelation = "Duty Station";
            Editable = false;
            Caption = 'Current Duty Station';
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
            HRSetup.TestField("Acting Nos");
            NoSeriesMgt.InitSeries(HRSetup."Acting Nos", xRec."No Series", 0D, No, "No Series");
        end;

        "Request Date" := Today;

        "User ID" := UserId;
        PLWD := false;

        UserSetup.Reset();
        UserSetup.SetRange("User ID", "User ID");
        if UserSetup.Find('-') then begin
            Employee.Reset();
            Employee.SetRange("User ID", "User ID");
            if Employee.Find('-') then begin
                "Requested By" := Employee."No.";
                "Request Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                PLWD := Employee.Disabled = Employee.Disabled::Yes;
                "Current Duty Station" := Employee."Current Duty Station";
            end;
        end;
    end;

    var
        Jobs: Record "HR Jobs";
        Employee: Record "HR Employees";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRSetup: Record "Human Resources Setup";
        Acting: Record "Employee Acting Position";
        UserSetup: Record "User Setup";
        SalaryCard: Record "PR Salary Card";

    //OtherEarnings: Record "Other Earnings";

    procedure PayrollRounding(var Amount: Decimal) PayrollRounding: Decimal
    var
        HRsetup: Record "Human Resources Setup";
    begin

        HRsetup.Get();
        if HRsetup."Payroll Rounding Precision" = 0 then
            Error('You must specify the rounding precision under HR setup');

        if HRsetup."Payroll Rounding Type" = HRsetup."Payroll Rounding Type"::Nearest then
            PayrollRounding := Round(Amount, HRsetup."Payroll Rounding Precision", '=');

        if HRsetup."Payroll Rounding Type" = HRsetup."Payroll Rounding Type"::Up then
            PayrollRounding := Round(Amount, HRsetup."Payroll Rounding Precision", '>');

        if HRsetup."Payroll Rounding Type" = HRsetup."Payroll Rounding Type"::Down then
            PayrollRounding := Round(Amount, HRsetup."Payroll Rounding Precision", '<');
    end;
}

