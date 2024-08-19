#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193631 "Imprest Surrender Header"
{
    DrillDownPageId = "Imprest Acct. List";
    LookupPageId = "Imprest Acct. List";
    Caption = 'Imprest Surrender Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'No';
            trigger OnValidate()
            begin

                if No <> xRec.No then begin
                    GenLedgerSetup.Get();
                    NoSeriesMgt.TestManual(GenLedgerSetup."Imprest Surrender No");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Surrender Date"; Date)
        {
            Caption = 'Surrender Date';
        }
        field(3; Type; Code[20])
        {
            TableRelation = "Receipts and Payment Types".Code where(Type = filter(Payment));
            Caption = 'Type';
            trigger OnValidate()
            begin

                "Account No." := '';
                "Account Name" := '';
                Remarks := '';
                RecPayTypes.Reset();
                RecPayTypes.SetRange(RecPayTypes.Code, Type);
                RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Payment);

                if RecPayTypes.Find('-') then
                    Grouping := RecPayTypes."Default Grouping";

                if RecPayTypes.Find('-') then begin
                    "Account Type" := RecPayTypes."Account Type";
                    "Transaction Name" := RecPayTypes.Description;

                    if RecPayTypes."Account Type" = RecPayTypes."Account Type"::"G/L Account" then begin
                        RecPayTypes.TestField(RecPayTypes."G/L Account");
                        "Account No." := RecPayTypes."G/L Account";
                        Validate("Account No.");
                    end;

                    //Banks
                    if RecPayTypes."Account Type" = RecPayTypes."Account Type"::"Bank Account" then begin
                        //RecPayTypes.TESTFIELD(RecPayTypes."G/L Account");
                        "Account No." := RecPayTypes."Bank Account";
                        Validate("Account No.");
                    end;


                end;

                //VALIDATE("Account No.");
            end;
        }
        field(4; "Pay Mode"; Option)
        {
            OptionMembers = " ",Cash,Cheque,EFT,"Custom 1","Custom 2","Custom 3","Custom 4","Custom 5";
            Caption = 'Pay Mode';
        }
        field(5; "Cheque No"; Code[20])
        {
            Caption = 'Cheque No';
        }
        field(6; "Cheque Date"; Date)
        {
            Caption = 'Cheque Date';
        }
        field(7; "Cheque Type"; Code[20])
        {
            TableRelation = Attachments;
            Caption = 'Cheque Type';
        }
        field(8; "Bank Code"; Code[20])
        {
            TableRelation = "Cash Payments Header";
            Caption = 'Bank Code';
        }
        field(9; "Received From"; Text[100])
        {
            Caption = 'Received From';
        }
        field(10; "On Behalf Of"; Text[100])
        {
            Caption = 'On Behalf Of';
        }
        field(11; Cashier; Code[50])
        {
            Caption = 'Cashier';
        }
        field(12; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(13; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = Customer."No.";

        }
        field(14; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(15; "Account Name"; Text[150])
        {
            Caption = 'Account Name';
        }
        field(16; Posted; Boolean)
        {
            Caption = 'Posted';
        }
        field(17; "Date Posted"; Date)
        {
            Caption = 'Date Posted';
        }
        field(18; "Time Posted"; Time)
        {
            Caption = 'Time Posted';
        }
        field(19; "Posted By"; Code[50])
        {
            Caption = 'Posted By';
        }
        field(20; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(21; Remarks; Text[250])
        {
            Caption = 'Remarks';
        }
        field(22; "Transaction Name"; Text[100])
        {
            Caption = 'Transaction Name';
        }
        field(27; "Net Amount"; Decimal)
        {
            Caption = 'Net Amount';
        }
        field(28; "Paying Bank Account"; Code[20])
        {
            Caption = 'Paying Bank Account';
        }
        field(29; Payee; Text[100])
        {
            Caption = 'Payee';
        }
        field(30; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin

                DimVal.Reset();
                DimVal.SetRange(DimVal."Global Dimension No.", 1);
                DimVal.SetRange(DimVal.Code, "Global Dimension 1 Code");
                if DimVal.Find('-') then
                    "Function Name" := DimVal.Name;

                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
            end;
        }
        field(31; "Global Dimension 2 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            Caption = 'Global Dimension 2 Code';
            trigger OnValidate()
            begin

                DimVal.Reset();
                DimVal.SetRange(DimVal."Global Dimension No.", 2);
                DimVal.SetRange(DimVal.Code, "Global Dimension 2 Code");
                if DimVal.Find('-') then
                    "Budget Center Name" := DimVal.Name;

                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
            end;
        }
        field(33; "Bank Account No"; Code[20])
        {
            Caption = 'Bank Account No';
        }
        field(34; "Cashier Bank Account"; Code[20])
        {
            Caption = 'Cashier Bank Account';
        }
        field(35; Status; Option)
        {
            OptionMembers = Pending,"1st Approval","2nd Approval","Cheque Printing",Posted,Cancelled,Checking,VoteBook,"Pending Approval",Approved;
            Caption = 'Status';
        }
        field(37; Grouping; Code[20])
        {
            TableRelation = "Customer Posting Group".Code;
            Caption = 'Grouping';
        }
        field(38; "Payment Type"; Option)
        {
            OptionMembers = Normal,"Petty Cash";
            Caption = 'Payment Type';
        }
        field(39; "Bank Type"; Option)
        {
            OptionMembers = Normal,"Petty Cash";
            Caption = 'Bank Type';
        }
        field(40; "PV Type"; Option)
        {
            OptionMembers = Normal,Other;
            Caption = 'PV Type';
        }
        field(42; "Apply to ID"; Code[50])
        {
            Caption = 'Apply to ID';
        }
        field(44; "Imprest Issue Date"; Date)
        {
            Caption = 'Imprest Issue Date';
        }
        field(45; Surrendered; Boolean)
        {
            Caption = 'Surrendered';
        }
        field(46; "Imprest Issue Doc. No"; Code[20])
        {
            TableRelation = "Imprest Header"."No." where(Posted = const(true),
                                                          "Account No." = field("Account No."),
                                                          "Surrender Status" = const(" "));
            Caption = 'Imprest Issue Doc. No';
            trigger OnValidate()
            begin


                /*Copy the details from the payments header tableto the imprest surrender table to enable the user work on the same document*/
                /*Retrieve the header details using the get statement*/

                PayHeader.Reset();
                PayHeader.Get(Rec."Imprest Issue Doc. No");

                /*Copy the details to the user interface*/
                "Paying Bank Account" := PayHeader."Paying Bank Account";
                Payee := PayHeader.Payee;
                PayHeader.CalcFields(PayHeader."Total Net Amount");
                Amount := PayHeader."Total Net Amount";
                "Amount Surrendered LCY" := PayHeader."Total Net Amount LCY";
                //Currencies
                "Currency Factor" := PayHeader."Currency Factor";
                "Currency Code" := PayHeader."Currency Code";

                "Date Posted" := PayHeader."Date Posted";
                "Global Dimension 1 Code" := PayHeader."Global Dimension 1 Code";
                Validate("Global Dimension 1 Code");
                "Shortcut Dimension 2 Code" := PayHeader."Shortcut Dimension 2 Code";
                Validate("Shortcut Dimension 2 Code");
                "Shortcut Dimension 3 Code" := PayHeader."Shortcut Dimension 3 Code";
                Dim3 := PayHeader.Dim3;
                "Shortcut Dimension 4 Code" := PayHeader."Shortcut Dimension 4 Code";
                Dim4 := PayHeader.Dim4;
                "Imprest Issue Date" := PayHeader.Date;

                //Get Line No
                if ImpSurrLine.FindLast() then
                    LineNo := ImpSurrLine."Line No." + 1
                else
                    LineNo := LineNo + 1;

                /*Copy the detail lines from the imprest details table in the database*/
                PayLine.Reset();
                PayLine.SetRange(PayLine.No, "Imprest Issue Doc. No");
                if PayLine.Find('-') then /*Copy the lines to the line table in the database*/

                    repeat
                        ImpSurrLine.Init();
                        ImpSurrLine."Surrender Doc No." := Rec.No;
                        ImpSurrLine."Account No:" := PayLine."Account No:";
                        ImpSurrLine."Imprest Type" := PayLine."Advance Type";
                        ImpSurrLine.Validate(ImpSurrLine."Account No:");
                        ImpSurrLine."Account Name" := PayLine."Account Name";
                        ImpSurrLine.Amount := PayLine.Amount;
                        ImpSurrLine."Due Date" := PayLine."Due Date";
                        ImpSurrLine."Imprest Holder" := PayLine."Imprest Holder";
                        ImpSurrLine."Actual Spent" := PayLine."Actual Spent";
                        ImpSurrLine."Apply to" := PayLine."Apply to";
                        ImpSurrLine."Apply to ID" := PayLine."Apply to ID";
                        ImpSurrLine."Surrender Date" := PayLine."Surrender Date";
                        ImpSurrLine.Surrendered := PayLine.Surrendered;
                        ImpSurrLine."Cash Receipt No" := PayLine."M.R. No";
                        ImpSurrLine."Date Issued" := PayLine."Date Issued";
                        ImpSurrLine."Type of Surrender" := PayLine."Type of Surrender";
                        ImpSurrLine."Dept. Vch. No." := PayLine."Dept. Vch. No.";
                        ImpSurrLine."Currency Factor" := PayLine."Currency Factor";
                        ImpSurrLine."Currency Code" := PayLine."Currency Code";
                        ImpSurrLine."Imprest Req Amt LCY" := PayLine."Amount LCY";
                        ImpSurrLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                        ImpSurrLine."Shortcut Dimension 2 Code" := PayLine."Shortcut Dimension 2 Code";
                        ImpSurrLine."Dimension Set ID" := PayLine."Dimension Set ID";
                        LineNo += 1;
                        ImpSurrLine."Line No." := LineNo;
                        ImpSurrLine.Insert();
                    until PayLine.Next() = 0;

            end;
        }
        field(47; "Vote Book"; Code[10])
        {
            TableRelation = "G/L Account";
            Caption = 'Vote Book';
        }
        field(48; "Total Allocation"; Decimal)
        {
            Caption = 'Total Allocation';
        }
        field(49; "Total Expenditure"; Decimal)
        {
            Caption = 'Total Expenditure';
        }
        field(50; "Total Commitments"; Decimal)
        {
            Caption = 'Total Commitments';
        }
        field(51; Balance; Decimal)
        {
            Caption = 'Balance';
        }
        field(52; "Balance Less this Entry"; Decimal)
        {
            Caption = 'Balance Less this Entry';
        }
        field(54; "Petty Cash"; Boolean)
        {
            Caption = 'Petty Cash';
        }
        field(56; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                DimVal.Reset();
                DimVal.SetRange(DimVal."Global Dimension No.", 2);
                DimVal.SetRange(DimVal.Code, "Shortcut Dimension 2 Code");
                if DimVal.Find('-') then
                    "Budget Center Name" := DimVal.Name;

                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(59; "Function Name"; Text[30])
        {
            Caption = 'Function Name';
        }
        field(60; "Budget Center Name"; Text[250])
        {
            Caption = 'Budget Center Name';
        }
        field(61; "User ID"; Code[50])
        {
            TableRelation = User."User Name";
            Caption = 'User ID';
        }
        field(62; "Issue Voucher Type"; Option)
        {
            OptionMembers = " ","Cash Voucher","Payment Voucher";
            Caption = 'Issue Voucher Type';
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
                DimVal.SetRange(DimVal."Global Dimension No.", 3);
                DimVal.SetRange(DimVal.Code, "Shortcut Dimension 3 Code");
                if DimVal.Find('-') then
                    Dim3 := DimVal.Name
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
                DimVal.SetRange(DimVal."Global Dimension No.", 4);
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
        field(85; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;
        }
        field(86; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            Editable = true;
            TableRelation = Currency;
        }
        field(87; "Responsibility Center"; Code[10])
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
            end;
        }
        field(88; "Amount Surrendered LCY"; Decimal)
        {
            CalcFormula = sum("Imprest Surrender Details"."Imprest Req Amt LCY" where("Surrender Doc No." = field(No)));
            FieldClass = FlowField;
            Caption = 'Amount Surrendered LCY';
            Editable = false;
        }
        field(89; "Actual Spent"; Decimal)
        {
            CalcFormula = sum("Imprest Surrender Details"."Actual Spent" where("Surrender Doc No." = field(No)));
            FieldClass = FlowField;
            Caption = 'Actual Spent';
            Editable = false;
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
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnDelete()
    begin
        if Status = Status::Posted then
            Error('Cannot Delete Document is already Posted');
    end;

    trigger OnInsert()
    begin
        if No = '' then begin
            GenLedgerSetup.Get();

            GenLedgerSetup.TestField(GenLedgerSetup."Imprest Surrender No");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Imprest Surrender No", xRec."No. Series", 0D, No, "No. Series");
        end;

        "Account Type" := "Account Type"::Customer;
        "Surrender Date" := Today;
        Cashier := UserId;
        Validate(Cashier);
    end;

    trigger OnModify()
    begin
        if Status = Status::Posted then
            Error('Cannot Modify Document is already Posted');
    end;

    var
        ImpSurrLine: Record "Imprest Surrender Details";
        PayHeader: Record "Imprest Header";
        PayLine: Record "Imprest Lines";
        "Withholding Tax Code": Code[200];
        GLAcc: Record "G/L Account";
        Cust: Record Customer;
        Vend: Record Vendor;
        FA: Record "Fixed Asset";
        BankAcc: Record "Bank Account";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GenLedgerSetup: Record "Cash Office Setup";
        RecPayTypes: Record "Receipts and Payment Types";
        CashierLinks: Record "Cash Office User Template";
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
        GenLedSetup: Record "Cash Office Setup";
        "Total Budget": Decimal;
        CommittedAmount: Decimal;
        MonthBudget: Decimal;
        Expenses: Decimal;
        Header: Text[250];
        "Date From": Text[30];
        "Date To": Text[30];
        LastDay: Date;
        ImprestReqDet: Record "Imprest Details-User";
        LoadImprestDetails: Record "Cash Payment Line";
        TotAmt: Decimal;
        DimVal: Record "Dimension Value";
        "VAT Code": Code[20];
        RespCenter: Record "Responsibility Center BR 2";
        UserMgt: Codeunit "User Setup Management BR";
        Text001: Label 'Your identification is set up to process from %1 %2 only.';
        LineNo: Integer;
        DimMgt: Codeunit DimensionManagement;


    procedure ShowDimensions()
    begin
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', 'Imprest', No));
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
