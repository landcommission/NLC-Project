#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193634 "Payments Header"
{
    DrillDownPageId = "Payment Vouchers List";
    LookupPageId = "Payment Vouchers List";
    Caption = 'Payments Header';
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
                    NoSeriesMgt.TestManual(GenLedgerSetup."Normal Payments No");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Date; Date)
        {
            Description = 'Stores the date when the payment voucher was inserted into the system';
            Caption = 'Date';
            trigger OnValidate()
            begin
                if PayLinesExist() then
                    Error('You first need to delete the existing Payment lines before changing the Currency Code'
                    )
                else begin
                    "Paying Bank Account" := '';
                    Validate("Paying Bank Account");
                end;
                if "Currency Code" = xRec."Currency Code" then
                    UpdateCurrencyFactor();

                if "Currency Code" <> xRec."Currency Code" then
                    UpdateCurrencyFactor()
                else
                    if "Currency Code" <> '' then
                        UpdateCurrencyFactor();

                //Update Payment Lines
                UpdateLines();
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
            Enabled = true;
            TableRelation = Currency;

            trigger OnValidate()
            begin
                if PayLinesExist() then
                    Error('You first need to delete the existing Payment lines before changing the Currency Code'
                    )
                else begin
                    "Paying Bank Account" := '';
                    Validate("Paying Bank Account");
                end;
                if "Currency Code" = xRec."Currency Code" then
                    UpdateCurrencyFactor();

                if "Currency Code" <> xRec."Currency Code" then
                    UpdateCurrencyFactor()
                else
                    if "Currency Code" <> '' then
                        UpdateCurrencyFactor();

                //Update Payment Lines
                UpdateLines();
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
            TableRelation = if ("Payment Type" = filter(<> "Petty Cash")) "Bank Account"."No." where("Currency Code" = field("Currency Code"))
            else
            if ("Payment Type" = const("Petty Cash")) "Bank Account"."No." where("Currency Code" = field("Currency Code"),
                                                                                                     "Bank Type" = const(Cash));
            Caption = 'Paying Bank Account';
            trigger OnValidate()
            begin

                BankAcc.Reset();
                "Bank Name" := '';
                if BankAcc.Get("Paying Bank Account") then begin
                    if "Pay Mode" = "Pay Mode"::Cash then
                        if BankAcc."Bank Type" <> BankAcc."Bank Type"::Cash then
                            Error('This Payment can only be made against Banks Handling Cash');
                    "Bank Name" := BankAcc.Name;
                    //"Currency Code":=BankAcc."Currency Code";
                    // VALIDATE("Currency Code");
                end;
                PLine.Reset();
                PLine.SetRange(PLine.No, "No.");
                PLine.SetRange(PLine."Account Type", PLine."Account Type"::"Bank Account");
                PLine.SetRange(PLine."Account No.", "Paying Bank Account");
                if PLine.FindFirst() then
                    Error(Text002);
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
                UpdateLines();

                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
            end;
        }
        field(35; Status; Option)
        {
            Description = 'Stores the status of the record in the database';
            OptionMembers = Pending,"1st Approval","2nd Approval","Cheque Printing",Posted,Cancelled,Checking,VoteBook,"Pending Approval",Approved;
            Caption = 'Status';
        }
        field(38; "Payment Type"; Option)
        {
            OptionCaption = 'Normal,Petty Cash,Express,Cash Purchase';
            OptionMembers = Normal,"Petty Cash",Express,"Cash Purchase";
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
                UpdateLines();
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
            CalcFormula = sum("Payment Line"."Net Amount" where(No = field("No.")));
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
            trigger OnValidate()
            begin
                if "Pay Mode" = "Pay Mode"::Cash then
                    Error('You CANNOT insert cheque No. If the Pay Mode is Cash');
            end;
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
        field(79; "Total Payment Amount LCY"; Decimal)
        {
            CalcFormula = sum("Payment Line"."NetAmount LCY" where(No = field("No.")));
            FieldClass = FlowField;
            Caption = 'Total Payment Amount LCY';
            Editable = false;
        }
        field(80; "Document Type"; Option)
        {
            OptionMembers = "Payment Voucher","Petty Cash","Cash Purchase";
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
                //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                DimVal.SetRange(DimVal.Code, "Shortcut Dimension 4 Code");
                if DimVal.Find('-') then
                    Dim4 := DimVal.Name
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

                if PayLinesExist() then
                    Error('You first need to delete the existing Payment lines before changing the Responsibility Center')
                else begin
                    "Currency Code" := '';
                    Validate("Currency Code");
                    "Paying Bank Account" := '';
                    Validate("Paying Bank Account");
                end;

                if not UserMgt.CheckRespCenter(1, "Responsibility Center") then
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
        field(86; "Cheque Type"; Option)
        {
            OptionMembers = " ","Computer Check","Manual Check";
            Caption = 'Cheque Type';
        }
        field(87; "Total Retention Amount"; Decimal)
        {
            CalcFormula = sum("Payment Line"."Retention  Amount" where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Total Retention Amount';
        }
        field(88; "Payment Narration"; Text[50])
        {
            Caption = 'Payment Narration';
        }
        field(100; "Invoice No"; Code[20])
        {
            Description = 'Holds The Purchase invoice number if it is related to purch invoice, does not post';
            Caption = 'Invoice No';
        }
        field(105; "Creation Doc No."; Code[20])
        {
            Caption = 'Creation Doc No.';
        }
        field(106; "Creation Doc Type"; Option)
        {
            OptionCaption = 'Advance,Claim,Payment Request';
            OptionMembers = Advance,Claim,"Payment Request";
            Caption = 'Creation Doc Type';
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
        field(481; "External Doc No"; Code[20])
        {
            Caption = 'External Doc No';
        }
        /* field(50000;"VAT Wthheld six %";Decimal)
        {
            CalcFormula = sum("Payment Line".Field15814164 where (No=field("No.")));
            FieldClass = FlowField;
        } */
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Responsibility Center") { }
    }

    fieldgroups { }

    trigger OnDelete()
    begin
        if (Status = Status::Approved) or (Status = Status::Posted) or (Status = Status::"Pending Approval") then
            Error('You Cannot Delete this record');
    end;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            GenLedgerSetup.Get();
            if "Payment Type" = "Payment Type"::Normal then begin
                GenLedgerSetup.TestField(GenLedgerSetup."Normal Payments No");
                NoSeriesMgt.InitSeries(GenLedgerSetup."Normal Payments No", xRec."No. Series", 0D, "No.", "No. Series");
            end
            else
                if "Payment Type" = "Payment Type"::"Cash Purchase" then begin
                    GenLedgerSetup.TestField(GenLedgerSetup."Cash Purchases");
                    NoSeriesMgt.InitSeries(GenLedgerSetup."Cash Purchases", xRec."No. Series", 0D, "No.", "No. Series");
                end else begin
                    GenLedgerSetup.TestField(GenLedgerSetup."Petty Cash Payments No");
                    NoSeriesMgt.InitSeries(GenLedgerSetup."Petty Cash Payments No", xRec."No. Series", 0D, "No.", "No. Series");
                end;

        end;

        UserTemplate.Reset();
        UserTemplate.SetRange(UserTemplate.UserID, UserId);
        if UserTemplate.FindFirst() then begin
            if "Payment Type" = "Payment Type"::"Petty Cash" then begin
                //UserTemplate.TESTFIELD(UserTemplate."Default Petty Cash Bank");
                // "Paying Bank Account":=UserTemplate."Default Petty Cash Bank";
            end else
                "Paying Bank Account" := UserTemplate."Default Payment Bank";
            Validate("Paying Bank Account");
        end;

        Date := Today;
        Validate(Date);
        Cashier := UserId;
        Validate(Cashier);
    end;

    trigger OnModify()
    begin
        if Status = Status::Pending then
            UpdateLines();

        /*IF (Status=Status::Approved) OR (Status=Status::Posted) THEN
           ERROR('You Cannot modify an already approved/posted document');*/

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
        PLine: Record "Payment Line";
        RespCenter: Record "Responsibility Center BR 2";
        UserMgt: Codeunit "User Setup Management BR";
        Text001: Label 'Your identification is set up to process from %1 %2 only.';
        CurrExchRate: Record "Currency Exchange Rate";
        PayLine: Record "Payment Line";
        Text002: Label 'There is an Account number on the  payment lines the same as Paying Bank Account you are trying to select.';
        DimMgt: Codeunit DimensionManagement;

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


    procedure UpdateLines()
    begin
        PLine.Reset();
        PLine.SetRange(PLine.No, "No.");
        if PLine.FindFirst() then
            repeat
                PLine."Global Dimension 1 Code" := "Global Dimension 1 Code";
                PLine."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                //pLine."Shortcut Dimension 3 Code":="Shortcut Dimension 3 Code";
                PLine."Dimension Set ID" := "Dimension Set ID";
                PLine."Currency Factor" := "Currency Factor";
                PLine."Paying Bank Account" := "Paying Bank Account";
                PayLine."Payment Type" := "Payment Type";
                PLine.Validate("Currency Factor");
                PLine.Modify();
            until PLine.Next() = 0;
    end;


    procedure PayLinesExist(): Boolean
    begin
        PayLine.Reset();
        PayLine.SetRange("Payment Type", "Payment Type");
        PayLine.SetRange(No, "No.");
        exit(PayLine.FindFirst());
    end;

    local procedure TestNoSeries(): Boolean
    begin
        if "Payment Type" = "Payment Type"::"Petty Cash" then
            GenLedgerSetup.TestField(GenLedgerSetup."Petty Cash Payments No")
        else
            if "Payment Type" = "Payment Type"::Express then
                GenLedgerSetup.TestField(GenLedgerSetup."Payment Request Nos")
            else
                GenLedgerSetup.TestField(GenLedgerSetup."Normal Payments No");
    end;

    local procedure GetNoSeriesCode(): Code[10]
    var
        NoSeriesCode: Code[20];
    begin
        if "Payment Type" = "Payment Type"::"Petty Cash" then
            NoSeriesCode := GenLedgerSetup."Petty Cash Payments No"
        else
            if "Payment Type" = "Payment Type"::Express then
                NoSeriesCode := GenLedgerSetup."Payment Request Nos"
            else
                NoSeriesCode := GenLedgerSetup."Normal Payments No";

        exit(GetNoSeriesRelCode(NoSeriesCode));
    end;


    procedure ShowDimensions()
    begin
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', 'Payments', "No."));
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
