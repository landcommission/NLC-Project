#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193536 "PR Employee Transactions"
{
    DataCaptionFields = "Employee Code", "Transaction Name";
    DrillDownPageId = "PR Employee Transactions";
    LookupPageId = "PR Employee Transactions";
    Caption = 'PR Employee Transactions';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee Code"; Code[30])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee Code';
        }
        field(2; "Transaction Code"; Code[30])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code";
            Caption = 'Transaction Code';
            trigger OnValidate()
            begin
                Transcode.Reset();
                if Transcode.Get("Transaction Code") then begin
                    "Transaction Name" := Transcode."Transaction Name";
                    "#of Repayments" := Transcode."Repayment Period";
                    "Start Date" := Today;
                end;

                //Mm start
                SalCard.Reset();
                SalCard.SetRange(SalCard."Employee Code", "Employee Code");
                if SalCard.Find('-') then begin
                    Transcode.Reset();
                    if Transcode.Get("Transaction Code") then begin
                        HREmp.Reset();
                        HREmp.SetRange(HREmp."No.", "Employee Code");
                        if HREmp.FindFirst() then
                            if Transcode."Transaction Code" = 'D162' then
                                if HREmp."Contract Type" <> HREmp."Contract Type"::"Permanent and Pensionable" then
                                    Error('The Particular Staff Is Not Of Contract Type PERMANENT AND PENSIONABLE');
                    end;
                end;
            end;
        }
        field(3; "Transaction Name"; Text[100])
        {
            Caption = 'Transaction Name';
        }
        field(4; Amount; Decimal)
        {
            Caption = 'Amount';
            trigger OnValidate()
            begin
                //IF "Transaction Code"='E40' THEN
                //Amount :=Amount *(-1) ;


                /*
                HREmp.RESET ;
                HREmp.SETRANGE(HREmp."No.","Employee Code") ;
                IF HREmp.FIND('-') THEN
                BEGIN
                IF HREmp."Contract Type"<> HREmp."Contract Type"::Intern THEN
               BEGIN
               Transcode.RESET;
               Transcode.SETRANGE(Transcode."Transaction Code","Transaction Code");
               IF Transcode.FIND('-') THEN
               BEGIN
                     IF Transcode."Transaction Type" = Transcode."Transaction Type"::Deduction THEN
                     BEGIN
                             //to prevent employee transactions from going below the 1/3 basic pay
                        TotalAmount:=0 ;
                        objPeriod.RESET;
                        objPeriod.SETRANGE(objPeriod.Closed,FALSE);
                        IF objPeriod.FIND('-') THEN
                        BEGIN
                        CurrPeriod:=objPeriod."Date Opened";
                        END;

                               SalCard.RESET;
                               SalCard.SETRANGE(SalCard."Employee Code","Employee Code")  ;
                               IF SalCard.FIND('-') THEN
                               BEGIN
                                  Transcode.RESET;
                                  Transcode.SETRANGE(Transcode."Transaction Type",Transcode."Transaction Type"::Deduction);
                                  BEGIN
                                  REPEAT
                                   EmployeeTrans.RESET;
                                   EmployeeTrans.SETRANGE(EmployeeTrans."Employee Code","Employee Code");
                                   EmployeeTrans.SETRANGE(EmployeeTrans."Transaction Code",Transcode."Transaction Code");
                                   EmployeeTrans.SETRANGE(EmployeeTrans.Stopped,FALSE );
                                   EmployeeTrans.SETRANGE(EmployeeTrans."Payroll Period",CurrPeriod);
                                   IF EmployeeTrans.FIND('-') THEN
                                   REPEAT
                                    TotalAmount+=EmployeeTrans.Amount
                                   UNTIL EmployeeTrans.NEXT=0;


                                  UNTIL Transcode.NEXT=0;
                                   TotalAmount+=Amount
                              END;
                                               AllowedDed:=SalCard."Basic Pay"-SalCard."1/3 Basic" ;
                              IF TotalAmount>AllowedDed THEN
                              ERROR('Total deductions must not be more than 1/3 of basic pay %1',SalCard."1/3 Basic");
                               END;
                       END;
                END;
                END;
                END;
               // //  error( format (TotalAmount))
                       */




                if (Balance > 0) and ("#of Repayments" > 0) then
                    Amount := Balance / "#of Repayments"

            end;
        }
        field(5; Balance; Decimal)
        {
            Caption = 'Balance';
            trigger OnValidate()
            begin
                //"#of Repayments":=0;
                if (Balance > 0) and ("#of Repayments" > 0) then
                    Amount := Balance / "#of Repayments"
            end;
        }
        field(6; "Original Amount"; Decimal)
        {
            Caption = 'Original Amount';
        }
        field(7; "Period Month"; Integer)
        {
            Caption = 'Period Month';
        }
        field(8; "Period Year"; Integer)
        {
            Caption = 'Period Year';
        }
        field(9; "Payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'Payroll Period';
        }
        field(10; "#of Repayments"; Integer)
        {
            Editable = false;
            Caption = '#of Repayments';
            trigger OnValidate()
            begin
                if (Balance > 0) and ("#of Repayments" > 0) then
                    Amount := Balance / "#of Repayments"
            end;
        }
        field(11; Membership; Code[10])
        {
            TableRelation = "prInstitutional Membership"."Institution No";
            Caption = 'Membership';
        }
        field(12; "Reference No"; Text[100])
        {
            Caption = 'Reference No';
        }
        field(13; integera; Integer)
        {
            Caption = 'integera';
        }
        field(14; "Employer Amount"; Decimal)
        {
            Caption = 'Employer Amount';
        }
        field(15; "Employer Balance"; Decimal)
        {
            Caption = 'Employer Balance';
        }
        field(16; "Stop for Next Period"; Boolean)
        {
            Caption = 'Stop for Next Period';
        }
        field(17; "Amortized Loan Total Repay Amt"; Decimal)
        {
            Caption = 'Amortized Loan Total Repay Amt';
        }
        field(18; "Start Date"; Date)
        {
            Editable = false;
            Caption = 'Start Date';
        }
        field(19; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(20; "Loan Number"; Code[10])
        {
            Caption = 'Loan Number';
        }
        field(21; "Payroll Code"; Code[20])
        {
            TableRelation = "prPayroll Type";
            Caption = 'Payroll Code';
        }
        field(22; "No of Units"; Decimal)
        {
            Caption = 'No of Units';
        }
        field(23; Suspended; Boolean)
        {
            Caption = 'Suspended';
        }
        field(24; "Entry No"; Integer)
        {
            AutoIncrement = false;
            Caption = 'Entry No';
        }
        field(38; "IsCoop/LnRep"; Boolean)
        {
            CalcFormula = lookup("PR Transaction Codes"."IsCoop/LnRep" where("Transaction Code" = field("Transaction Code")));
            Description = 'to be able to report the different coop contributions -Dennis';
            FieldClass = FlowField;
            Caption = 'IsCoop/LnRep';
            Editable = false;
        }
        field(39; EmployeePostingG; Code[20])
        {
            CalcFormula = lookup("HR Employees"."Posting Group" where("No." = field("Employee Code")));
            FieldClass = FlowField;
            Caption = 'EmployeePostingG';
            Editable = false;
        }
        field(40; grants; Code[20])
        {
            TableRelation = Jobs."No.";
            Caption = 'grants';
        }
        field(41; Stopped; Boolean)
        {
            Caption = 'Stopped';
        }
        field(42; "Subledger Account"; Code[10])
        {
            TableRelation = if ("Subledger Account" = const('VENDOR')) Vendor."No." where(Blocked = filter(<> All),
                                                                                         "Vendor Posting Group" = const('OTHERS'))
            else
            if ("Subledger Account" = const('CUSTOMER')) Customer."No." where(Blocked = filter(<> All));
            Caption = 'Subledger Account';
        }
        field(43; Subledger; Option)
        {
            OptionCaption = ' ,Customer,Vendor';
            OptionMembers = " ",Customer,Vendor;
            Caption = 'Subledger';
        }
        field(44; "Sacco loan"; Boolean)
        {
            Caption = 'Sacco loan';
        }
        field(45; "Sacco share"; Boolean)
        {
            Caption = 'Sacco share';
        }
        field(46; "Sacco Loan Interest"; Boolean)
        {
            Caption = 'Sacco Loan Interest';
        }
    }

    keys
    {
        key(Key1; "Employee Code", "Transaction Code", "Period Month", "Period Year", "Payroll Period", "Reference No")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
        key(Key2; "Employee Code", "Transaction Code", "Period Month", "Period Year", Suspended) { }
    }

    fieldgroups { }

    var
        Transcode: Record "PR Transaction Codes";
        EmployeeTrans: Record "PR Employee Transactions";
        MonthName: Text[100];
        SalCard: Record "PR Salary Card";
        CurrentYr: Integer;
        objPeriod: Record "PR Payroll Periods";
        TotalAmount: Decimal;
        CurrPeriod: Date;
        AllowedDed: Decimal;
        HREmp: Record "HR Employees";
        TotalIncomeAmount: Decimal;
        AllowedIncome: Decimal;
}
