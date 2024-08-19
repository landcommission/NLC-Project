#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193667 "Staff Claim Lines"
{
    Caption = 'Staff Claim Lines';
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
            TableRelation = "G/L Account"."No." where(test = field(Grouping));
            Caption = 'Account No:';
            trigger OnValidate()
            begin
                if GLAcc.Get("Account No:") then
                    "Account Name" := GLAcc.Name;
                GLAcc.TestField("Direct Posting", true);
                "Budgetary Control A/C" := GLAcc."Budget Controlled";
                Pay.SetRange(Pay."No.", No);
                if Pay.FindFirst() then
                    if Pay."Account No." <> '' then
                        "Imprest Holder" := Pay."Account No."
                    else
                        Error('Please Enter the Customer/Account Number');
            end;
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

                ImprestHeader.Reset();
                ImprestHeader.SetRange(ImprestHeader."No.", No);
                if ImprestHeader.FindFirst() then begin
                    "Date Taken" := ImprestHeader.Date;
                    ImprestHeader.TestField("Responsibility Center");
                    ImprestHeader.TestField("Global Dimension 1 Code");
                    ImprestHeader.TestField("Shortcut Dimension 2 Code");
                    "Global Dimension 1 Code" := ImprestHeader."Global Dimension 1 Code";
                    "Shortcut Dimension 2 Code" := ImprestHeader."Shortcut Dimension 2 Code";
                    //"Shortcut Dimension 3 Code":=ImprestHeader."Shortcut Dimension 3 Code";
                    //"Shortcut Dimension 4 Code":=ImprestHeader."Shortcut Dimension 4 Code";
                    "Dimension Set ID" := ImprestHeader."Dimension Set ID";
                    "Currency Factor" := ImprestHeader."Currency Factor";
                    "Currency Code" := ImprestHeader."Currency Code";
                    if Purpose = '' then
                        Purpose := ImprestHeader.Purpose;

                end;

                if "Currency Factor" <> 0 then
                    "Amount LCY" := Amount / "Currency Factor"
                else
                    "Amount LCY" := Amount;
            end;
        }
        field(5; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(6; "Imprest Holder"; Code[20])
        {
            Editable = false;
            TableRelation = Customer."No.";
            Caption = 'Imprest Holder';
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
            Caption = 'Claim Type';
            TableRelation = "Receipts and Payment Types".Code where(Type = const(Claim),
                                                                     Blocked = const(false));

            trigger OnValidate()
            begin
                ImprestHeader.Reset();
                ImprestHeader.SetRange(ImprestHeader."No.", No);
                if ImprestHeader.FindFirst() then
                    if
                     (ImprestHeader.Status = ImprestHeader.Status::Approved) or
                     (ImprestHeader.Status = ImprestHeader.Status::Posted) then
                        //        (ImprestHeader.Status=ImprestHeader.Status::"Pending Approval") THEN
                        Error('You Cannot Insert a new record when the status of the document is not Pending');

                RecPay.Reset();
                RecPay.SetRange(RecPay.Code, "Advance Type");
                RecPay.SetRange(RecPay.Type, RecPay.Type::Claim);
                if RecPay.Find('-') then begin
                    Grouping := RecPay."Default Grouping";
                    "Account No:" := RecPay."G/L Account";
                    Validate("Account No:");
                end;
            end;
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
        field(102; "Job No."; Code[10])
        {
            TableRelation = Job."No.";
            Caption = 'Job No.';
            trigger OnValidate()
            begin
                CheckWipAccount()
            end;
        }
        field(103; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No."));

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
        field(50006; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Staff,None';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Staff,None;
        }
    }

    keys
    {
        key(Key1; "Line No.", No)
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
            if
            //(ImprestHeader.Status=ImprestHeader.Status::Approved)
            (ImprestHeader.Status = ImprestHeader.Status::Posted) or
            (ImprestHeader.Status = ImprestHeader.Status::"Pending Approval") then
                Error('You Cannot Delete this record its status is not Pending');
        TestField(Committed, false);
    end;

    trigger OnInsert()
    begin
        ImprestHeader.Reset();
        ImprestHeader.SetRange(ImprestHeader."No.", No);
        if ImprestHeader.FindFirst() then begin
            "Date Taken" := ImprestHeader.Date;
            ImprestHeader.TestField("Responsibility Center");
            ImprestHeader.TestField("Global Dimension 1 Code");
            ImprestHeader.TestField("Shortcut Dimension 2 Code");
            Validate("Global Dimension 1 Code", ImprestHeader."Global Dimension 1 Code");
            Validate("Shortcut Dimension 2 Code", ImprestHeader."Shortcut Dimension 2 Code");
            //VALIDATE("Shortcut Dimension 3 Code",ImprestHeader."Shortcut Dimension 3 Code");
            //VALIDATE("Shortcut Dimension 4 Code",ImprestHeader."Shortcut Dimension 4 Code");
            "Dimension Set ID" := ImprestHeader."Dimension Set ID";
            "Currency Factor" := ImprestHeader."Currency Factor";
            "Currency Code" := ImprestHeader."Currency Code";
            if Purpose = '' then
                Purpose := ImprestHeader.Purpose;
        end;
    end;

    trigger OnModify()
    begin
        ImprestHeader.Reset();
        ImprestHeader.SetRange(ImprestHeader."No.", No);
        if ImprestHeader.FindFirst() then begin
            if
            // (ImprestHeader.Status=ImprestHeader.Status::"Pending Approval") or
                (ImprestHeader.Status = ImprestHeader.Status::Posted) or
                (ImprestHeader.Status = ImprestHeader.Status::Approved) then
                Error('You Cannot Modify this record its status is not Pending');

            "Date Taken" := ImprestHeader.Date;
            //    "Global Dimension 1 Code":=ImprestHeader."Global Dimension 1 Code";
            //    "Shortcut Dimension 2 Code":=ImprestHeader."Shortcut Dimension 2 Code";
            //    "Shortcut Dimension 3 Code":=ImprestHeader."Shortcut Dimension 3 Code";
            //    "Shortcut Dimension 4 Code":=ImprestHeader."Shortcut Dimension 4 Code";
            "Currency Factor" := ImprestHeader."Currency Factor";
            "Currency Code" := ImprestHeader."Currency Code";
            if Purpose = '' then
                Purpose := ImprestHeader.Purpose;

        end;

        TestField(Committed, false);
    end;

    var
        GLAcc: Record "G/L Account";
        Pay: Record "Staff Claims Header";
        ImprestHeader: Record "Staff Claims Header";
        RecPay: Record "Receipts and Payment Types";
        DimMgt: Codeunit DimensionManagement;


    procedure ShowDimensions()
    begin
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', 'Receipt', "Line No."));
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


    procedure CheckWipAccount()
    var
        FAWIPJob: Record Job;
        FAWIPJobPostingGrp: Record "Job Posting Group";
    begin
        FAWIPJob.Get("Job No.");
        FAWIPJobPostingGrp.Get(FAWIPJob."Job Posting Group");
        TestField("Account Type", "Account Type"::"G/L Account");
        if "Account No:" <> FAWIPJobPostingGrp."WIP Costs Account" then
            Error('Insert the right WIP Account %1', FAWIPJobPostingGrp."WIP Costs Account");
    end;
}
