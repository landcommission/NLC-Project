#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193668 "Staff Advance Header"
{
    DrillDownPageId = "Staff Advance Request List";
    LookupPageId = "Staff Advance Request List";
    Caption = 'Staff Advance Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "No."; Code[20])
        {
            Description = 'Stores the reference of the payment voucher in the database';
            NotBlank = false;
            Caption = 'No.';
            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    GenLedgerSetup.Get();
                    NoSeriesMgt.TestManual(GenLedgerSetup."Other Staff Advance No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Date; Date)
        {
            Description = 'Stores the date when the payment voucher was inserted into the system';
            Editable = false;
            Caption = 'Date';
            trigger OnValidate()
            begin
                if ImpLinesExist() then
                    Error('You first need to delete the existing imprest lines before changing the Currency Code'
                    );

                if "Currency Code" = xRec."Currency Code" then
                    UpdateCurrencyFactor();

                if "Currency Code" <> xRec."Currency Code" then
                    UpdateCurrencyFactor()
                //RecreatePurchLines(FIELDCAPTION("Currency Code"));
                else
                    if "Currency Code" <> '' then
                        UpdateCurrencyFactor();

                UpdateHeaderToLine();
            end;
        }
        field(3; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;
        }
        field(4; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            Editable = true;
            Enabled = true;
            TableRelation = Currency;

            trigger OnValidate()
            begin
                if ImpLinesExist() then
                    Error('You first need to delete the existing imprest lines before changing the Currency Code'
                    );

                if "Currency Code" = xRec."Currency Code" then
                    UpdateCurrencyFactor();

                if "Currency Code" <> xRec."Currency Code" then
                    UpdateCurrencyFactor()
                //RecreatePurchLines(FIELDCAPTION("Currency Code"));
                else
                    if "Currency Code" <> '' then
                        UpdateCurrencyFactor();

                UpdateHeaderToLine();
            end;
        }
        field(9; Payee; Text[100])
        {
            Description = 'Stores the name of the person who received the money';
            Caption = 'Payee';
        }
        field(10; "On Behalf Of"; Text[100])
        {
            Description = 'Stores the name of the person on whose behalf the payment voucher was taken';
            Caption = 'On Behalf Of';
        }
        field(11; Cashier; Code[50])
        {
            Description = 'Stores the identifier of the cashier in the database';
            Caption = 'Cashier';
        }
        field(16; Posted; Boolean)
        {
            Description = 'Stores whether the payment voucher is posted or not';
            Caption = 'Posted';
        }
        field(17; "Date Posted"; Date)
        {
            Description = 'Stores the date when the payment voucher was posted';
            Caption = 'Date Posted';
        }
        field(18; "Time Posted"; Time)
        {
            Description = 'Stores the time when the payment voucher was posted';
            Caption = 'Time Posted';
        }
        field(19; "Posted By"; Code[50])
        {
            Description = 'Stores the name of the person who posted the payment voucher';
            Caption = 'Posted By';
        }
        field(20; "Total Payment Amount"; Decimal)
        {
            CalcFormula = sum("Payment Line".Amount where(No = field("No.")));
            Description = 'Stores the amount of the payment voucher';
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Total Payment Amount';
        }
        field(28; "Paying Bank Account"; Code[20])
        {
            Description = 'Stores the name of the paying bank account in the database';
            TableRelation = "Bank Account"."No." where("Currency Code" = field("Currency Code"));
            Caption = 'Paying Bank Account';
            trigger OnValidate()
            begin
                BankAcc.Reset();
                "Bank Name" := '';
                if BankAcc.Get("Paying Bank Account") then
                    "Bank Name" := BankAcc.Name;
                // "Currency Code":=BankAcc."Currency Code";   //Currency Being determined first before document is released for approval
                // VALIDATE("Currency Code");
            end;
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
                if DimVal.Find('-') then
                    "Function Name" := DimVal.Name;

                UpdateHeaderToLine();
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
            end;
        }
        field(35; Status; Option)
        {
            Description = 'Stores the status of the record in the database';
            OptionMembers = Pending,"1st Approval","2nd Approval","Cheque Printing",Posted,Cancelled,Checking,VoteBook,"Pending Approval",Approved,Rejected;
            Caption = 'Status';

        }
        field(38; "Payment Type"; Option)
        {
            OptionMembers = Imprest;
            Caption = 'Payment Type';
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
                DimVal.SetRange(DimVal.Code, "Shortcut Dimension 2 Code");
                if DimVal.Find('-') then
                    "Budget Center Name" := DimVal.Name;

                UpdateHeaderToLine();
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(57; "Function Name"; Text[100])
        {
            Description = 'Stores the name of the function in the database';
            Caption = 'Function Name';
        }
        field(58; "Budget Center Name"; Text[100])
        {
            Description = 'Stores the name of the budget center in the database';
            Caption = 'Budget Center Name';
        }
        field(59; "Bank Name"; Text[100])
        {
            Description = 'Stores the description of the paying bank account in the database';
            Caption = 'Bank Name';
        }
        field(60; "No. Series"; Code[20])
        {
            Description = 'Stores the number series in the database';
            Caption = 'No. Series';
        }
        field(61; Select; Boolean)
        {
            Description = 'Enables the user to select a particular record';
            Caption = 'Select';
        }
        field(62; "Total VAT Amount"; Decimal)
        {
            CalcFormula = sum("Payment Line"."VAT Amount" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Total VAT Amount';
        }
        field(63; "Total Witholding Tax Amount"; Decimal)
        {
            CalcFormula = sum("Payment Line"."Withholding Tax Amount" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Total Witholding Tax Amount';
        }
        field(64; "Total Net Amount"; Decimal)
        {
            CalcFormula = sum("Staff Advance Lines".Amount where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Total Net Amount';
        }
        field(65; "Current Status"; Code[20])
        {
            Description = 'Stores the current status of the payment voucher in the database';
            Caption = 'Current Status';
        }
        field(66; "Cheque No."; Code[20])
        {
            Caption = 'Cheque No.';
        }
        field(67; "Pay Mode"; Option)
        {
            OptionMembers = " ",Cash,Cheque,EFT,"Letter of Credit","Custom 3","Custom 4","Custom 5";
            Caption = 'Pay Mode';
        }
        field(68; "Payment Release Date"; Date)
        {
            Caption = 'Payment Release Date';
            trigger OnValidate()
            begin

                //Changed to ensure Release date is not less than the Date entered
                if "Payment Release Date" < Date then
                    Error('The Payment Release Date cannot be lesser than the Document Date');
            end;
        }
        field(69; "No. Printed"; Integer)
        {
            Caption = 'No. Printed';
        }
        field(70; "VAT Base Amount"; Decimal)
        {
            Caption = 'VAT Base Amount';
        }
        field(71; "Exchange Rate"; Decimal)
        {
            Caption = 'Exchange Rate';
        }
        field(72; "Currency Reciprical"; Decimal)
        {
            Caption = 'Currency Reciprical';
        }
        field(73; "Current Source A/C Bal."; Decimal)
        {
            Caption = 'Current Source A/C Bal.';
        }
        field(74; "Cancellation Remarks"; Text[250])
        {
            Caption = 'Cancellation Remarks';
        }
        field(75; "Register Number"; Integer)
        {
            Caption = 'Register Number';
        }
        field(76; "From Entry No."; Integer)
        {
            Caption = 'From Entry No.';
        }
        field(77; "To Entry No."; Integer)
        {
            Caption = 'To Entry No.';
        }
        field(78; "Invoice Currency Code"; Code[10])
        {
            Caption = 'Invoice Currency Code';
            Editable = true;
            TableRelation = Currency;
        }
        field(79; "Total Net Amount LCY"; Decimal)
        {
            CalcFormula = sum("Staff Advance Lines"."Amount LCY" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Total Net Amount LCY';
        }
        field(80; "Document Type"; Option)
        {
            OptionMembers = "Payment Voucher","Petty Cash";
            Caption = 'Document Type';
        }
        field(81; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';

            trigger OnLookup()
            begin
                LookupShortcutDimCode(3, "Shortcut Dimension 3 Code");
                Validate("Shortcut Dimension 3 Code");
            end;

            trigger OnValidate()
            begin
                DimVal.Reset();
                //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                DimVal.SetRange(DimVal.Code, "Shortcut Dimension 3 Code");
                if DimVal.Find('-') then
                    Dim3 := DimVal.Name;

                UpdateHeaderToLine();
            end;
        }
        field(82; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the Third global dimension in the database';

            trigger OnLookup()
            begin
                LookupShortcutDimCode(4, "Shortcut Dimension 4 Code");
                Validate("Shortcut Dimension 4 Code");
            end;

            trigger OnValidate()
            begin
                DimVal.Reset();
                DimVal.SetRange(DimVal.Code, "Shortcut Dimension 4 Code");
                if DimVal.Find('-') then
                    Dim4 := DimVal.Name;

                UpdateHeaderToLine();
            end;
        }
        field(83; Dim3; Text[250])
        {
            Caption = 'Dim3';
        }
        field(84; Dim4; Text[250])
        {
            Caption = 'Dim4';
        }
        field(85; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center BR 2";

            trigger OnValidate()
            begin

                TestField(Status, Status::Pending);
                if not UserMgt.CheckRespCenter(1, "Shortcut Dimension 3 Code") then
                    Error(
                      Text001,
                      RespCenter.TableCaption, UserMgt.GetPurchasesFilter());
                /*
               "Location Code" := UserMgt.GetLocation(1,'',"Responsibility Center");
               IF "Location Code" = '' THEN BEGIN
                 IF InvtSetup.GET THEN
                   "Inbound Whse. Handling Time" := InvtSetup."Inbound Whse. Handling Time";
               END ELSE BEGIN
                 IF Location.GET("Location Code") THEN;
                 "Inbound Whse. Handling Time" := Location."Inbound Whse. Handling Time";
               END;

               UpdateShipToAddress;
                  */
                /*
             CreateDim(
               DATABASE::"Responsibility Center","Responsibility Center",
               DATABASE::Vendor,"Pay-to Vendor No.",
               DATABASE::"Salesperson/Purchaser","Purchaser Code",
               DATABASE::Campaign,"Campaign No.");

             IF xRec."Responsibility Center" <> "Responsibility Center" THEN BEGIN
               RecreatePurchLines(FIELDCAPTION("Responsibility Center"));
               "Assigned User ID" := '';
             END;
               */

            end;
        }
        field(86; "Account Type"; Option)
        {
            Caption = 'Account Type';
            Editable = false;
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(87; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            Editable = true;
            TableRelation = if ("Account Type" = const(Customer)) Customer."No." where("Account Type" = filter("Staff Advance"));

            trigger OnValidate()
            begin
                Cust.Reset();
                if Cust.Get("Account No.") then begin
                    Cust.TestField("Customer Posting Group");
                    Cust.TestField(Blocked, Cust.Blocked::" ");
                    Payee := Cust.Name;
                    "On Behalf Of" := Cust.Name;

                    //Check CreditLimit Here In cases where you have a credit limit set for employees
                    Cust.CalcFields(Cust."Balance (LCY)");
                    //  IF Cust."Credit Limit (LCY)" > 0 THEN
                    //  IF Cust."Balance (LCY)">Cust."Credit Limit (LCY)" THEN
                    //   ERROR('The allowable unaccounted balance of %1 has been exceeded',Cust."Credit Limit (LCY)");

                    //Check Unretired staff Advances Here In cases where you have a limit set for employees
                    StaffAdvances.Reset();
                    StaffAdvances.SetRange(StaffAdvances."Account No.", "Account No.");
                    StaffAdvances.SetRange(StaffAdvances."Surrender Status", StaffAdvances."Surrender Status"::" ");
                    if StaffAdvances.FindSet() then begin
                        if Cust."Credit Limit (LCY)" = 0 then
                            exit;
                        if StaffAdvances.Count > Cust."Credit Limit (LCY)" then
                            if not Confirm('You have exceeded the allowable number of %1 unretired staff advances, You currently have %2 unretired staff advances of %3, Do you want to continue ?',
                            false, Cust."Credit Limit (LCY)", StaffAdvances.Count, Cust."Balance (LCY)") then
                                Error('Current operation has been halted');
                    end
                end;
            end;
        }
        field(88; "Surrender Status"; Option)
        {
            OptionMembers = " ",Full,Partial;
            Caption = 'Surrender Status';
        }
        field(89; Purpose; Text[250])
        {
            Caption = 'Purpose';
        }
        field(90; "Commitment Status"; Boolean)
        {
            Caption = 'Commitment Status';
        }
        field(100; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
            Caption = 'Date Filter';
        }
        field(101; "Responsibility Center Filter"; Code[10])
        {
            Editable = false;
            FieldClass = FlowFilter;
            Caption = 'Responsibility Center Filter';
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
        field(481; "Loan Type"; Option)
        {
            Editable = false;
            OptionCaption = ' ,Salary Advance,Mortgage,Car Loan';
            OptionMembers = " ","Salary Advance",Mortgage,"Car Loan";
            Caption = 'Loan Type';

        }
        field(482; "Employee No"; Code[20])
        {
            Editable = false;
            Caption = 'Employee No';
        }
        field(483; "Employee Names"; Text[100])
        {
            Editable = false;
            Caption = 'Employee Names';
        }
        field(484; "ID No."; Code[8])
        {
            Editable = false;
            Caption = 'ID No.';
        }
        field(485; Designation; Text[100])
        {
            Editable = false;
            Caption = 'Designation';
        }
        field(486; "Advance Amount Requested"; Decimal)
        {
            Caption = 'Advance Amount Requested';
        }
        field(487; "Reasons for Advance Amount"; Text[250])
        {
            Caption = 'Reasons for Advance Amount';
        }
        field(489; Eligible; Boolean)
        {
            Caption = 'Eligible';
        }
        field(490; "Payroll Deduction Month"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened" where(Closed = const(false));
            Caption = 'Payroll Deduction Month';
        }
        field(491; MyRecId; RecordId)
        {
            Caption = 'MyRecId';
        }
        field(492; "Payroll Updated"; Boolean)
        {
            Editable = false;
            Caption = 'Payroll Updated';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }


    trigger OnInsert()
    begin


        if "No." = '' then begin
            prSetup.Get();
            prSetup.TestField("Salary Advance Nos.");
            NoSeriesMgt.InitSeries(prSetup."Salary Advance Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;


        Date := Today;
        Cashier := UserId;

        "Loan Type" := "Loan Type"::"Salary Advance";


        HREmp.Reset();
        HREmp.SetRange(HREmp."User ID", UserId);
        if HREmp.Find('-') then begin
            //Populate fields
            "Employee No" := HREmp."No.";
            "Employee Names" := HREmp."Full Name";
            Designation := HREmp."Job Title";
            "Responsibility Center" := HREmp."Responsibility Center";
        end;


        /*
        IF "No." = '' THEN BEGIN
            GenLedgerSetup.GET;
            TestNoSeries;
            //NoSeriesMgt.InitSeries(GetNoSeriesCode,xRec."No. Series",0D,"No.","No. Series");
        NoSeriesMgt.InitSeries(GenLedgerSetup."Other Staff Advance No.",xRec."No. Series",0D,"No.","No. Series");
        END;
        */

        /*
        UserTemplate.RESET;
        UserTemplate.SETRANGE(UserTemplate.UserID,USERID);
        IF UserTemplate.FINDFIRST THEN
          BEGIN
            "Paying Bank Account":=UserTemplate."Default Payment Bank";
            VALIDATE("Paying Bank Account");
          END;
           */

        /*
        Date:=TODAY;
        Cashier:=USERID;
        VALIDATE(Cashier);
        */

        /*
        //
        IF UserSetup.GET(USERID)THEN BEGIN
        UserSetup.TESTFIELD("Other Advance Staff Account");
        "Account Type":="Account Type"::Customer;
        "Account No.":=UserSetup."Other Advance Staff Account";
        //VALIDATE("Account No.");
        END ELSE
        ERROR('User must be setup under User Setup and their respective Account Entered');
         */

    end;

    trigger OnModify()
    begin
        if Status = Status::Pending then
            UpdateHeaderToLine();

        /* IF (Status=Status::Approved) OR (Status=Status::Posted)OR (Status=Status::"Pending Approval") THEN
            ERROR('You Cannot Modify this record its status is not Pending');
            */

    end;

    var
        CStatus: Code[20];
        PVUsers: Record "W/P Budget Buffer";
        UserTemplate: Record "Cash Office User Template";
        GLAcc: Record "G/L Account";
        Cust: Record Customer;
        Vend: Record Vendor;
        FA: Record "Fixed Asset";
        BankAcc: Record "Bank Account";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GenLedgerSetup: Record "Cash Office Setup";
        RecPayTypes: Record "Receipts and Payment Types";
        CashierLinks: Record "Cashier Link";
        GLAccount: Record "G/L Account";
        EntryNo: Integer;
        SingleMonth: Boolean;
        DateFrom: Date;
        DateTo: Date;
        Budget: Decimal;
        CurrMonth: Code[10];
        CurrYR: Code[10];
        BudgDate: Text[30];
        BudgetDate: Date;
        YrBudget: Decimal;
        BudgetDateTo: Date;
        BudgetAvailable: Decimal;
        GenLedSetup: Record "General Ledger Setup";
        "Total Budget": Decimal;
        CommittedAmount: Decimal;
        MonthBudget: Decimal;
        Expenses: Decimal;
        Header: Text[250];
        "Date From": Text[30];
        "Date To": Text[30];
        LastDay: Date;
        TotAmt: Decimal;
        DimVal: Record "Dimension Value";
        PVSteps: Record "Proc. Method Stage Duration";
        RespCenter: Record "Responsibility Center BR 2";
        UserMgt: Codeunit "User Setup Management BR";
        Text001: Label 'Your identification is set up to process from %1 %2 only.';
        Pline: Record "Imprest Lines";
        CurrExchRate: Record "Currency Exchange Rate";
        ImpLines: Record "Imprest Lines";
        UserSetup: Record "User Setup";
        DimMgt: Codeunit DimensionManagement;
        StaffAdvances: Record "Staff Advance Header";
        prSetup: Record "prPayroll Setup";
        HREmp: Record "HR Employees";
        PRSalary: Record "PR Employee Transactions";
        RequestLines: Record "Staff Advance Lines";


    procedure UpdateHeaderToLine()
    var
        PayLine: Record "Imprest Lines";
    begin
        PayLine.Reset();
        PayLine.SetRange(PayLine.No, "No.");
        if PayLine.Find('-') then
            repeat
                PayLine."Imprest Holder" := "Account No.";
                PayLine."Global Dimension 1 Code" := "Global Dimension 1 Code";
                PayLine."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                PayLine."Dimension Set ID" := "Dimension Set ID";
                PayLine."Currency Code" := "Currency Code";
                PayLine."Currency Factor" := "Currency Factor";
                PayLine.Validate("Currency Factor");
                PayLine.Modify();
            until PayLine.Next() = 0;
    end;

    local procedure UpdateCurrencyFactor()
    var
        CurrencyDate: Date;
    begin
        if "Currency Code" <> '' then begin
            CurrencyDate := Date;
            "Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Currency Code");
        end else
            "Currency Factor" := 0;
    end;


    procedure ImpLinesExist(): Boolean
    begin
        ImpLines.Reset();
        ImpLines.SetRange(No, "No.");
        exit(ImpLines.FindFirst());
    end;

    local procedure TestNoSeries(): Boolean
    begin
        if "Payment Type" = "Payment Type"::Imprest then
            GenLedgerSetup.TestField(GenLedgerSetup."Other Staff Advance No.")
    end;

    local procedure GetNoSeriesCode(): Code[10]
    var
        NoSrsRel: Record "No. Series Relationship";
        NoSeriesCode: Code[20];
    begin
        if "Payment Type" = "Payment Type"::Imprest then
            NoSeriesCode := GenLedgerSetup."Other Staff Advance No.";

        /*
        NoSrsRel.SETRANGE(NoSrsRel.Code,NoSeriesCode);
        //NoSrsRel.SETRANGE(NoSrsRel."Responsibility Center","Responsibility Center");
        IF NoSrsRel.FINDFIRST THEN
        EXIT(NoSrsRel."Series Code")
        ELSE
        EXIT(NoSeriesCode);

        IF NoSrsRel.FINDSET THEN BEGIN
          IF PAGE.RUNMODAL(458,NoSrsRel,NoSrsRel."Series Code") = ACTION::LookupOK THEN
          EXIT(NoSrsRel."Series Code")
        END
        ELSE
        EXIT(NoSeriesCode);
        */
        exit(GetNoSeriesRelCode(NoSeriesCode));

    end;


    procedure ShowDimensions()
    begin
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', 'Staff Advance', "No."));
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


    procedure GetNoSeriesRelCode(NoSeriesCode: Code[20]): Code[10]
    var
        GenLedgerSetup: Record "General Ledger Setup";
        RespCenter: Record "Responsibility Center BR 2";
        DimMgt: Codeunit DimensionManagement;
        NoSrsRel: Record "No. Series Relationship";
    begin
        /*
        //EXIT(GetNoSeriesRelCode(NoSeriesCode));
        GenLedgerSetup.GET;
        CASE GenLedgerSetup."Base No. Series" OF
          GenLedgerSetup."Base No. Series"::"1":
           BEGIN
            NoSrsRel.RESET;
            NoSrsRel.SETRANGE(Code,NoSeriesCode);
            NoSrsRel.SETRANGE("Series Filter","Responsibility Center");
            IF NoSrsRel.FINDFIRST THEN
              EXIT(NoSrsRel."Series Code")
           END;
          GenLedgerSetup."Base No. Series"::"2":
           BEGIN
            NoSrsRel.RESET;
            NoSrsRel.SETRANGE(Code,NoSeriesCode);
            NoSrsRel.SETRANGE("Series Filter","Global Dimension 1 Code");
            IF NoSrsRel.FINDFIRST THEN
              EXIT(NoSrsRel."Series Code")
           END;
          GenLedgerSetup."Base No. Series"::"3":
           BEGIN
            NoSrsRel.RESET;
            NoSrsRel.SETRANGE(Code,NoSeriesCode);
            NoSrsRel.SETRANGE("Series Filter","Shortcut Dimension 2 Code");
            IF NoSrsRel.FINDFIRST THEN
              EXIT(NoSrsRel."Series Code")
           END;
          GenLedgerSetup."Base No. Series"::"4":
           BEGIN
            NoSrsRel.RESET;
            NoSrsRel.SETRANGE(Code,NoSeriesCode);
            NoSrsRel.SETRANGE("Series Filter","Shortcut Dimension 3 Code");
            IF NoSrsRel.FINDFIRST THEN
              EXIT(NoSrsRel."Series Code")
           END;
          GenLedgerSetup."Base No. Series"::"5":
           BEGIN
            NoSrsRel.RESET;
            NoSrsRel.SETRANGE(Code,NoSeriesCode);
            NoSrsRel.SETRANGE("Series Filter","Shortcut Dimension 4 Code");
            IF NoSrsRel.FINDFIRST THEN
              EXIT(NoSrsRel."Series Code")
           END;
          ELSE EXIT(NoSeriesCode);
        END;
        */

    end;
}
