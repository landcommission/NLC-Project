#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193602 "Staff Advance Line"
{
    Caption = 'Staff Advance Line';
    DataClassification = CustomerContent;
    fields
    {
        field(1; No; Code[20])
        {
            NotBlank = true;
            Caption = 'No';

        }
        field(2; "Account No:"; Code[10])
        {
            Editable = false;
            NotBlank = false;
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account" where(test = field(Grouping))
            else
            if ("Account Type" = const(Vendor)) Vendor where("Vendor Posting Group" = field(Grouping));
            Caption = 'Account No:';

        }
        field(3; "Account Name"; Text[50])
        {
            Caption = 'Account Name';
        }
        field(4; Amount; Decimal)
        {
            Caption = 'Amount';
            trigger OnValidate()
            begin

                "No.of Months to Repay" := 12;

                ImprestHeader.CalcFields("Payroll Deduction Month");
                PRPeriod.Reset();
                PRPeriod.SetRange(PRPeriod."Employee Code", "Employee No");
                PRPeriod.SetRange(PRPeriod."Transaction Code", 'GPAY');
                PRPeriod.SetRange(PRPeriod."Payroll Period", ImprestHeader."Payroll Deduction Month");
                if PRPeriod.Find('-') then begin
                    "A Third Basic Pay" := Round(3 * PRPeriod.Amount, 0.01, '>');
                    "Gross Pay" := Round(PRPeriod.Amount, 0.01, '>');
                    "Emeployee Gross Pay" := "Gross Pay";
                end;

                if Amount > "A Third Basic Pay" then
                    Error('The Salary advance Amount Requested is higher than 3 times your Gross Pay');

                ImprestHeader.CalcFields("Payroll Deduction Month");
                PRPeriod.Reset();
                PRPeriod.SetRange(PRPeriod."Employee Code", "Employee No");
                PRPeriod.SetRange(PRPeriod."Transaction Code", 'NPAY');
                PRPeriod.SetRange(PRPeriod."Payroll Period", ImprestHeader."Payroll Deduction Month");
                if PRPeriod.Find('-') then
                    "Net Pay" := Round(PRPeriod.Amount, 0.01, '>');

                //if Amount > "A Third Basic Pay"  then
                //  Error('The Salary advance Amount Requested is higher than 3 times your Gross Pay');
                "A Third Rule" := 1 / 3 * "Gross Pay";
                "Max.Amount Per 1/3 Rule" := "Net Pay" - "A Third Rule";


                if "No.of Months to Repay" <> 0 then
                    "Monthly Repayment Amount" := Amount / "No.of Months to Repay";
                if "Monthly Repayment Amount" <> 0 then
                    if "Net Pay" - "Monthly Repayment Amount" < (1 / 3 * "Gross Pay") then
                        Error('Total deductions must not be more than 1/3 of Gross pay %1', (Format(1 / 3 * "Gross Pay")));
            end;
        }
        field(5; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(6; "Advance Holder"; Code[20])
        {
            Editable = false;
            TableRelation = Customer."No.";
            Caption = 'Advance Holder';
        }
        field(7; "Actual Spent"; Decimal)
        {
            Caption = 'Actual Spent';
        }
        field(30; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            Description = 'Stores the reference to the first global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          "Dimension Value Type" = const(Standard));

            trigger OnValidate()
            begin
                DimVal.Reset();
                DimVal.SetRange(DimVal."Global Dimension No.", 1);
                DimVal.SetRange(DimVal.Code, "Global Dimension 1 Code");
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
                //"Dimension Set ID" := DimMgt.ValidateShortcutDimValues2(1,"Global Dimension 1 Code","Dimension Set ID");
            end;
        }
        field(41; "Apply to"; Code[20])
        {
            Caption = 'Apply to';
        }
        field(42; "Apply to ID"; Code[20])
        {
            Caption = 'Apply to ID';
        }
        field(44; "Surrender Date"; Date)
        {
            Caption = 'Surrender Date';
        }
        field(45; Surrendered; Boolean)
        {
            Caption = 'Surrendered';
        }
        field(46; "M.R. No"; Code[20])
        {
            Caption = 'M.R. No';
        }
        field(47; "Date Issued"; Date)
        {
            Caption = 'Date Issued';
        }
        field(48; "Type of Surrender"; Option)
        {
            OptionMembers = " ",Cash,Receipt;
            Caption = 'Type of Surrender';
        }
        field(49; "Dept. Vch. No."; Code[20])
        {
            Caption = 'Dept. Vch. No.';
        }
        field(50; "Cash Surrender Amt"; Decimal)
        {
            Caption = 'Cash Surrender Amt';
        }
        field(51; "Bank/Petty Cash"; Code[20])
        {
            TableRelation = "Bank Account";
            Caption = 'Bank/Petty Cash';
        }
        field(52; "Surrender Doc No."; Code[20])
        {
            Caption = 'Surrender Doc No.';
        }
        field(53; "Date Taken"; Date)
        {
            Caption = 'Date Taken';
        }
        field(54; Purpose; Text[250])
        {
            Caption = 'Purpose';
        }
        field(56; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          "Dimension Value Type" = const(Standard));

            trigger OnValidate()
            begin
                DimVal.Reset();
                DimVal.SetRange(DimVal."Global Dimension No.", 2);
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
                //"Dimension Set ID" := DimMgt.ValidateShortcutDimValues2(2,"Shortcut Dimension 2 Code","Dimension Set ID");
            end;
        }
        field(79; "Budgetary Control A/C"; Boolean)
        {
            Caption = 'Budgetary Control A/C';
        }
        field(83; Committed; Boolean)
        {
            Caption = 'Committed';
        }
        field(84; "Advance Type"; Code[20])
        {
            TableRelation = "Receipts and Payment Types".Code where(Type = const(Advance),
                                                                     Blocked = const(false));
            Caption = 'Advance Type';

        }
        field(85; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Currency Factor" <> 0 then
                    "Amount LCY" := Amount / "Currency Factor"
                else
                    "Amount LCY" := Amount;
            end;
        }
        field(86; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            Editable = true;
            TableRelation = Currency;
        }
        field(87; "Amount LCY"; Decimal)
        {
            Caption = 'Amount LCY';
        }
        field(88; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(89; "Claim Receipt No"; Code[20])
        {
            Caption = 'Claim Receipt No';
        }
        field(90; "Expenditure Date"; Date)
        {
            Caption = 'Expenditure Date';
        }
        field(91; "Attendee/Organization Names"; Text[250])
        {
            Caption = 'Attendee/Organization Names';
        }
        field(92; Grouping; Code[20])
        {
            Description = 'Stores Expense Code';
            Caption = 'Grouping';
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions()
            end;
        }
        field(50004; Status; Option)
        {
            CalcFormula = lookup("Staff Advance Header".Status where("No." = field(No)));
            Description = 'Stores the status of the record in the database';
            FieldClass = FlowField;
            OptionMembers = Pending,"1st Approval","2nd Approval","Cheque Printing",Posted,Cancelled,Checking,VoteBook,"Pending Approval",Approved,Rejected;
            Caption = 'Status';
            Editable = false;
        }
        field(50006; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Staff,None';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Staff,None;
        }
        field(50007; "Employee No"; Code[20])
        {
            Caption = 'Employee No';

        }
        field(50008; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
        }
        field(50009; "Payroll Deduct Month"; Date)
        {
            CalcFormula = lookup("PR Payroll Periods"."Date Opened" where(Closed = const(false)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Payroll Deduct Month';
        }
        field(50010; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center BR 2";

        }
        field(50011; "A Third Basic Pay"; Decimal)
        {
            Editable = false;
            Caption = 'A Third Basic Pay';
        }
        field(50012; "No.of Months to Repay"; Decimal)
        {
            Caption = 'No.of Months to Repay';
            trigger OnValidate()
            begin

                if "No.of Months to Repay" <> 0
                then
                    "Monthly Repayment Amount" := Amount / "No.of Months to Repay";
            end;
        }
        field(50013; "Monthly Repayment Amount"; Decimal)
        {
            Editable = false;
            Caption = 'Monthly Repayment Amount';
        }
        field(50014; "Net Pay"; Decimal)
        {
            Editable = false;
            Caption = 'Net Pay';
        }
        field(50015; "A Third Rule"; Decimal)
        {
            Editable = false;
            Caption = 'A Third Rule';
        }
        field(50016; "Max.Amount Per 1/3 Rule"; Decimal)
        {
            Editable = true;
            Caption = 'Max.Amount Per 1/3 Rule';
        }

        field(50020; "Emeployee Gross Pay"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = 'Gross Pay';
        }
    }

    keys
    {
        key(Key1; No, "Employee No")
        {
            Clustered = true;
            SumIndexFields = Amount, "Amount LCY";
        }
    }

    fieldgroups { }

    trigger OnDelete()
    begin
        ImprestHeader.Reset();
        ImprestHeader.SetRange(ImprestHeader."No.", No);
        if ImprestHeader.FindFirst() then
            if (ImprestHeader.Status = ImprestHeader.Status::Approved) or
            (ImprestHeader.Status = ImprestHeader.Status::Posted) or
            (ImprestHeader.Status = ImprestHeader.Status::"Pending Approval") then
                Error('You Cannot Delete this record its status is not Pending');

        ////TESTFIELD(Committed,FALSE);
    end;

    trigger OnInsert()
    var
        HREmplrecors: Record "HR Employees";
    begin

        "No.of Months to Repay" := 12;

        ImprestHeader.CalcFields("Payroll Deduction Month");
        if HREmplrecors.get(Rec."Employee No") then begin
            Rec."Employee Name" := HREmplrecors."Full Name";
        end;

        ImprestHeader.Reset();
        ImprestHeader.SetRange(ImprestHeader."No.", No);
        if ImprestHeader.FindFirst() then begin
            "Date Taken" := ImprestHeader.Date;
            ImprestHeader.TestField("Responsibility Center");
            "Employee No" := ImprestHeader."Employee No";
            "Employee Name" := ImprestHeader."Employee Names";
            Purpose := ImprestHeader."Reasons for Advance Amount";
            //"Payroll Deduct Month":=ImprestHeader."Payroll Deduction Month";
            "Responsibility Center" := ImprestHeader."Responsibility Center";
            if Purpose = '' then
                Purpose := ImprestHeader.Purpose;
        end;
        ImprestHeader.CalcFields("Payroll Deduction Month");
        PRPeriod.Reset();
        PRPeriod.SetRange(PRPeriod."Employee Code", "Employee No");
        PRPeriod.SetRange(PRPeriod."Transaction Code", 'GPAY');
        PRPeriod.SetRange(PRPeriod."Payroll Period", ImprestHeader."Payroll Deduction Month");
        if PRPeriod.Find('-') then
            "A Third Basic Pay" := Round(3 * PRPeriod.Amount, 0.01, '>');

    end;

    trigger OnModify()
    begin
        ImprestHeader.Reset();
        ImprestHeader.SetRange(ImprestHeader."No.", No);
        if ImprestHeader.FindFirst() then begin
            if
             (ImprestHeader.Status = ImprestHeader.Status::Approved) or
                (ImprestHeader.Status = ImprestHeader.Status::Posted) then
                //  OR
                //   (ImprestHeader.Status=ImprestHeader.Status::"Pending Approval") THEN
                Error('You Cannot Modify this record its status is not Pending');

            "Date Taken" := ImprestHeader.Date;
            //"Global Dimension 1 Code":=ImprestHeader."Global Dimension 1 Code";
            //"Shortcut Dimension 2 Code":=ImprestHeader."Shortcut Dimension 2 Code";
            //"Shortcut Dimension 3 Code":=ImprestHeader."Shortcut Dimension 3 Code";
            //"Shortcut Dimension 4 Code":=ImprestHeader."Shortcut Dimension 4 Code";
            "Currency Factor" := ImprestHeader."Currency Factor";
            "Currency Code" := ImprestHeader."Currency Code";
            if Purpose = '' then
                Purpose := ImprestHeader.Purpose;

        end;

        ////TESTFIELD(Committed,FALSE);
    end;

    var
        GLAcc: Record "G/L Account";
        Pay: Record "Staff Advance Headers";
        ImprestHeader: Record "Staff Advance Headers";
        RecPay: Record "Receipts and Payment Types";
        DimVal: Record "Dimension Value";
        DimMgt: Codeunit DimensionManagement;
        PRPeriod: Record "PR Period Transactions";
        "Gross Pay": Decimal;


    procedure ShowDimensions()
    begin
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', 'Staff advance lines', "Line No."));
        //VerifyItemLineDim;
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Global Dimension 1 Code", "Shortcut Dimension 2 Code");
    end;


    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
    end;


    procedure LookupShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.LookupDimValueCode(FieldNumber, ShortcutDimCode);
        ValidateShortcutDimCode(FieldNumber, ShortcutDimCode);
    end;


    procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    begin
        DimMgt.GetShortcutDimensions("Dimension Set ID", ShortcutDimCode);
    end;
}
