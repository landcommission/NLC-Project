#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193531 "PR Transaction Codes"
{
    DataCaptionFields = "Transaction Name";
    DrillDownPageId = "PR Transaction Codes List";
    LookupPageId = "PR Transaction Codes List";
    Caption = 'PR Transaction Codes';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Transaction Code"; Code[50])
        {
            Description = 'Unique Trans line code';
            Caption = 'Transaction Code';
            trigger OnValidate()
            begin

                if "Transaction Code" <> xRec."Transaction Code" then begin
                    prpayrollsetup.Get();
                    NoSeriesMgt.TestManual(prpayrollsetup."Allowances Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(3; "Transaction Name"; Text[100])
        {
            Description = 'Description';
            Caption = 'Transaction Name';
        }
        field(4; "Balance Type"; Option)
        {
            Description = 'None,Increasing,Reducing';
            OptionMembers = None,Increasing,Reducing;
            Caption = 'Balance Type';
        }
        field(5; "Transaction Type"; Option)
        {
            Description = 'Income,Deduction';
            OptionMembers = Income,Deduction;
            Caption = 'Transaction Type';
        }
        field(6; Frequency; Option)
        {
            Description = 'Fixed,Varied';
            OptionMembers = "Fixed",Varied;
            Caption = 'Frequency';
        }
        field(7; "Is Cash"; Boolean)
        {
            Description = 'Does staff receive cash for this transaction';
            Caption = 'Is Cash';
        }
        field(8; Taxable; Boolean)
        {
            Description = 'Is it taxable or not';
            Caption = 'Taxable';
        }
        field(9; "Is Formula"; Boolean)
        {
            Description = 'Is the transaction based on a formula';
            Caption = 'Is Formula';
        }
        field(10; Formula; Text[200])
        {
            Description = '[Formula] If the above field is "Yes", give the formula';
            Caption = 'Formula';
        }
        field(16; "Amount Preference"; Option)
        {
            Description = 'Either (Posted Amount), (Take Higher) or (Take Lower)';
            OptionMembers = "Posted Amount","Take Higher","Take Lower ";
            Caption = 'Amount Preference';
        }
        field(18; "Special Transactions"; Option)
        {
            Description = 'Represents all Special Transactions';
            OptionMembers = Ignore,"Defined Contribution","Home Ownership Savings Plan","Life Insurance","Owner Occupier Interest","Prescribed Benefit","Salary Arrears","Staff Loan","Value of Quarters",Mortgage,Pension,"Mortgage Relief";
            Caption = 'Special Transactions';
        }
        field(21; "Deduct Premium"; Boolean)
        {
            Description = '[Insurance] Should the Premium be treated as a payroll deduction?';
            Caption = 'Deduct Premium';
        }
        field(26; "Interest Rate"; Decimal)
        {
            DecimalPlaces = 2 : 8;
            Description = '[Loan] If above is "Yes", give the interest rate';
            Caption = 'Interest Rate';
        }
        field(28; "Repayment Method"; Option)
        {
            Description = '[Loan] Reducing,Straight line';
            OptionMembers = Reducing,"Straight line",Amortized;
            Caption = 'Repayment Method';
        }
        field(29; "Fringe Benefit"; Boolean)
        {
            Description = '[Loan] should the loan be treated as a Fringe Benefit?';
            Caption = 'Fringe Benefit';
        }
        field(30; "Employer Deduction"; Boolean)
        {
            Description = 'Caters for Employer Deductions';
            Caption = 'Employer Deduction';
        }
        field(31; isHouseAllowance; Boolean)
        {
            Description = 'Flags if its house allowance - Dennis';
            Caption = 'isHouseAllowance';
        }
        field(32; "Include Employer Deduction"; Boolean)
        {
            Description = 'Is the transaction to include the employer deduction? - Dennis';
            Caption = 'Include Employer Deduction';
        }
        field(33; "Is Formula for employer"; Text[200])
        {
            Description = '[Is Formula for employer] If the above field is "Yes", give the Formula for employer Dennis';
            Caption = 'Is Formula for employer';
        }
        field(34; "Transaction Code old"; Code[50])
        {
            Description = 'Old Unique Trans line code - Dennis';
            Caption = 'Transaction Code old';
        }
        field(35; "GL Account"; Code[50])
        {
            Description = 'to post to GL account - Dennis';
            TableRelation = "G/L Account"."No.";
            Caption = 'GL Account';
        }
        field(36; "GL Employee Account"; Code[50])
        {
            Description = 'to post to GLemployee  account - Dennis';
            Caption = 'GL Employee Account';
        }
        field(37; "coop parameters"; Option)
        {
            Caption = 'Other Categorization';
            Description = 'to be able to report the different coop contributions -Dennis';
            OptionMembers = none,shares,loan,"loan Interest","Emergency loan","Emergency loan Interest","School Fees loan","School Fees loan Interest",Welfare,Pension,NSSF,Overtime;
        }
        field(38; "IsCoop/LnRep"; Boolean)
        {
            Description = 'to be able to report the different coop contributions -Dennis';
            Caption = 'IsCoop/LnRep';
        }
        field(39; "Deduct Mortgage"; Boolean)
        {
            Caption = 'Deduct Mortgage';
        }
        field(40; Subledger; Option)
        {
            OptionMembers = " ",Customer,Vendor;
            Caption = 'Subledger';
        }
        field(41; Welfare; Boolean)
        {
            Caption = 'Welfare';
        }
        field(42; CustomerPostingGroup; Code[20])
        {
            TableRelation = "Customer Posting Group".Code;
            Caption = 'CustomerPostingGroup';
        }
        field(210; "Previous Month Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "PR Payroll Periods"."Date Opened";
            Caption = 'Previous Month Filter';
        }
        field(211; "Current Month Filter"; Date)
        {
            FieldClass = FlowFilter;
            Caption = 'Current Month Filter';
        }
        field(212; "Prev. Amount"; Decimal)
        {
            CalcFormula = sum("PR Period Transactions".Amount where("Payroll Period" = field("Previous Month Filter"),
                                                                     "Transaction Code" = field("Transaction Code"),
                                                                     "Employee Code" = field("Employee Code Filter")));
            FieldClass = FlowField;
            Caption = 'Prev. Amount';
            Editable = false;
        }
        field(213; "Curr. Amount"; Decimal)
        {
            CalcFormula = sum("PR Period Transactions".Amount where("Payroll Period" = field("Current Month Filter"),
                                                                     "Transaction Code" = field("Transaction Code"),
                                                                     "Employee Code" = field("Employee Code Filter")));
            FieldClass = FlowField;
            Caption = 'Curr. Amount';
            Editable = false;
        }
        field(219; "Transaction Category"; Option)
        {
            OptionCaption = ' ,Housing,Transport,Other Allowances,NHF,Pension,Company Loan,Housing Deduction,Personal Loan,Inconvinience,Bonus Special,Other Deductions,Overtime,Entertainment,Leave,Utility,Other Co-deductions,Car Loan,Call Duty,Co-op,Lunch,Compassionate Loan';
            OptionMembers = " ",Housing,Transport,"Other Allowances",NHF,Pension,"Company Loan","Housing Deduction","Personal Loan",Inconvinience,"Bonus Special","Other Deductions",Overtime,Entertainment,Leave,Utility,"Other Co-deductions","Car Loan","Call Duty","Co-op",Lunch,"Compassionate Loan";
            Caption = 'Transaction Category';
        }
        field(220; "Employee Code Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee Code Filter';
        }
        field(221; Suspended; Boolean)
        {
            Caption = 'Suspended';
        }
        field(222; "Include in Net"; Boolean)
        {
            Caption = 'Include in Net';
        }
        field(223; "Taxable Percentage"; Decimal)
        {
            Caption = 'Taxable Percentage';
        }
        field(224; "Created By"; Code[50])
        {
            Caption = 'Created By';
        }
        field(228; "Group Code"; Code[20])
        {
            TableRelation = "PR Trans Codes Groups";
            Caption = 'Group Code';
            trigger OnValidate()
            begin
                "Group Description" := '';

                PRTransCodesGroups.Reset();
                if PRTransCodesGroups.Get("Group Code") then
                    "Group Description" := UpperCase(PRTransCodesGroups."Group Description");
            end;
        }
        field(229; "Group Description"; Text[100])
        {
            Editable = false;
            Caption = 'Group Description';
        }
        field(230; "Exclude Proration?"; Boolean)
        {
            Caption = 'Exclude Proration?';
        }
        field(231; "itax Grouping"; Option)
        {
            OptionMembers = " ","Housing Allowance","Transport Allowance",OT,"Directors Fees",Leave,Basic,Lumpsum,Other;
            Caption = 'itax Grouping';
        }
        field(232; "Is Special Muster"; Boolean)
        {
            Caption = 'Is Special Muster';
        }
        field(233; "Repayment Period"; Integer)
        {
            Caption = 'Repayment Period';
        }
        field(234; "Sort Order"; Integer)
        {
            Caption = 'Sort Order';
        }
        field(235; "No. Series"; Code[20])
        {
            Description = 'Stores the number series in the database';
            Caption = 'No. Series';
        }
        field(236; "Exclude Housing Levy"; Boolean)
        {
            Caption = 'Exclude Housing Levy';
        }
        field(237; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Transaction Code")
        {
            Clustered = true;
        }
        key(Key2; "Transaction Name") { }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Transaction Code", "Transaction Name", Amount) { }
    }


    trigger OnInsert()
    begin


        if "Transaction Code" = '' then begin
            prpayrollsetup.Get();
            prpayrollsetup.TestField(prpayrollsetup."Allowances Nos");
            NoSeriesMgt.InitSeries(prpayrollsetup."Allowances Nos", xRec."No. Series", 0D, "Transaction Code", "No. Series");
        end;

        "Created By" := UserId;
    end;

    var
        PRPeriodTransactions: Record "PR Period Transactions";
        PREmployeeTransactions: Record "PR Employee Transactions";
        PRTransCodesGroups: Record "PR Trans Codes Groups";
        prpayrollsetup: Record "prPayroll Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;


    procedure AssistEdit(OldTransactCode: Record "PR Transaction Codes"): Boolean
    var
        TransCode: Record "PR Transaction Codes";
    begin
        begin
            TransCode := Rec;
            prpayrollsetup.Get();
            prpayrollsetup.TestField("Allowances Nos");
            if NoSeriesMgt.SelectSeries(prpayrollsetup."Allowances Nos", OldTransactCode."No. Series", TransCode."No. Series") then begin
                NoSeriesMgt.SetSeries(TransCode."Transaction Code");
                Rec := TransCode;
                exit(true);
            end;
        end;
    end;
}
