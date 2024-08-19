#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193734 "Grant Surrender Header"
{
    DrillDownPageId = "Grant Surr List";
    LookupPageId = "Grant Surr List";
    Caption = 'Grant Surrender Header';
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
                    NoSeriesMgt.TestManual(GenLedgerSetup."Grant Surrender Nos");
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
            Caption = 'Cheque Type';
            //TableRelation = Table0;
        }
        field(8; "Bank Code"; Code[20])
        {
            Caption = 'Bank Code';
            //TableRelation = Table39005891;
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
            TableRelation = "Project Partners".PartnerID where("Grant No" = field(Grant),
                                                                "Disbursed Amount (LCY)" = filter(<> 0));

            trigger OnValidate()
            begin
                /*
                "Account Name":='';
                RecPayTypes.RESET;
                RecPayTypes.SETRANGE(RecPayTypes.Code,Type);
                RecPayTypes.SETRANGE(RecPayTypes.Type,RecPayTypes.Type::Payment);

                IF "Account Type" IN ["Account Type"::"G/L Account","Account Type"::Customer,"Account Type"::Vendor,"Account Type"::"IC Partner"]
                THEN

                CASE "Account Type" OF
                  "Account Type"::"G/L Account":
                    BEGIN
                      GLAcc.GET("Account No.");
                      "Account Name":=GLAcc.Name;
                      "VAT Code":=RecPayTypes."VAT Code";
                      "Withholding Tax Code":=RecPayTypes."Withholding Tax Code";
                      "Global Dimension 1 Code":='';
                    END;
                  "Account Type"::Customer:
                    BEGIN
                      Cust.GET("Account No.");
                      "Account Name":=Cust.Name;
                //      "VAT Code":=Cust."Default Withholding Tax Code";
                //      "Withholding Tax Code":=Cust."Default Withholding Tax Code";
                      "Global Dimension 1 Code":=Cust."Global Dimension 1 Code";
                    END;
                  "Account Type"::Vendor:
                    BEGIN
                      Vend.GET("Account No.");
                      "Account Name":=Vend.Name;
                //      "VAT Code":=Vend."Default VAT Code";
                //      "Withholding Tax Code":=Vend."Default Withholding Tax Code";
                      "Global Dimension 1 Code":=Vend."Global Dimension 1 Code";
                    END;
                  "Account Type"::"Bank Account":
                    BEGIN
                      BankAcc.GET("Account No.");
                      "Account Name":=BankAcc.Name;
                      "VAT Code":=RecPayTypes."VAT Code";
                      "Withholding Tax Code":=RecPayTypes."Withholding Tax Code";
                      "Global Dimension 1 Code":=BankAcc."Global Dimension 1 Code";

                    END;
                    {
                  "Account Type"::"Fixed Asset":
                    BEGIN
                      FA.GET("Account No.");
                      "Account Name":=FA.Description;
                      "VAT Code":=FA."Default VAT Code";
                      "Withholding Tax Code":=FA."Default Withholding Tax Code";
                       "Global Dimension 1 Code":=FA."Global Dimension 1 Code";
                    END;
                    }
                END;
                */

                if Cust.Get("Account No.") then
                    "Account Name" := Cust.Name
                else
                    "Account Name" := '';

            end;
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
        field(19; "Posted By"; Code[20])
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
                    "Function Name" := DimVal.Name
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
                    "Budget Center Name" := DimVal.Name
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
            Editable = false;
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
        field(42; "Apply to ID"; Code[20])
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
        field(46; "Payment Voucher Doc. No"; Code[20])
        {
            Caption = 'Payment Voucher Doc. No';
            TableRelation = "Payment Line".No where(Status = const(Posted),
                                                     "Account No." = field(Grant));

            trigger OnValidate()
            begin


                /*Copy the details from the payments header table to the grant surrender table to enable the user work on the same document*/
                /*Retrieve the header details using the get statement*/

                PayHeader.Reset();
                PayHeader.Get(Rec."Payment Voucher Doc. No");

                /*Copy the details to the user interface*/
                "Paying Bank Account" := PayHeader."Paying Bank Account";
                Payee := PayHeader.Payee;
                PayHeader.CalcFields(PayHeader."Net Amount");

                Amount := PayHeader."Net Amount";
                "Amount Surrendered LCY" := PayHeader."Total Amount Advanced";
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
                "Imprest Issue Date" := PayHeader."Surrender Date";

                //Get Line No
                if ImpSurrLine.FindLast() then
                    LineNo := ImpSurrLine."Line No." + 1
                else
                    LineNo := LineNo + 1;
                /*
                {Copy the detail lines from the imprest details table in the database}
                PayLine.RESET;
                PayLine.SETRANGE(PayLine.No,"Payment Voucher Doc. No");
                IF PayLine.FIND('-') THEN {Copy the lines to the line table in the database}
                  BEGIN
                    REPEAT
                        ImpSurrLine.INIT;
                        ImpSurrLine."Surrender Doc No.":=Rec.No;
                        ImpSurrLine."Account No:":=PayLine."Account No.";
                        ImpSurrLine."Imprest Type":=PayLine."Advance Type";
                        ImpSurrLine.VALIDATE(ImpSurrLine."Account No:");
                        ImpSurrLine."Account Name":=PayLine."Account Name";
                        ImpSurrLine.Amount:=PayLine.Amount;
                        ImpSurrLine."Due Date":=PayLine."Due Date";
                        ImpSurrLine."Advance Holder":=PayLine."Advance Holder";
                        ImpSurrLine."Actual Spent":=PayLine."Actual Spent";
                        ImpSurrLine."Apply to":=PayLine."Apply to";
                        ImpSurrLine."Apply to ID":=PayLine."Apply to ID";
                        ImpSurrLine."Surrender Date":=PayLine."Surrender Date";
                        ImpSurrLine.Surrendered:=PayLine.Surrendered;
                        ImpSurrLine."Cash Receipt No":=PayLine."M.R. No";
                        ImpSurrLine."Date Issued":=PayLine."Date Issued";
                        ImpSurrLine."Type of Surrender":=PayLine."Type of Surrender";
                        ImpSurrLine."Dept. Vch. No.":=PayLine."Dept. Vch. No.";
                        ImpSurrLine."Currency Factor":=PayLine."Currency Factor";
                        ImpSurrLine."Currency Code":=PayLine."Currency Code";
                        ImpSurrLine."Imprest Req Amt LCY":=PayLine."Amount LCY";
                        ImpSurrLine."Budgetary Control A/C":=PayLine."Budgetary Control A/C";
                        ImpSurrLine."Shortcut Dimension 1 Code":=PayLine."Global Dimension 1 Code";
                        ImpSurrLine."Shortcut Dimension 2 Code":=PayLine."Shortcut Dimension 2 Code";
                        ImpSurrLine."Shortcut Dimension 3 Code":=PayLine."Shortcut Dimension 3 Code";
                        ImpSurrLine."Shortcut Dimension 4 Code":=PayLine."Shortcut Dimension 4 Code";
                        ImpSurrLine."Line on Original Document":=TRUE;
                        LineNo+=1;
                        ImpSurrLine."Line No.":=LineNo;
                        ImpSurrLine.INSERT;
                    UNTIL PayLine.NEXT=0;
                  END;
                 */

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
                    "Budget Center Name" := DimVal.Name
            end;
        }
        field(59; "Function Name"; Text[50])
        {
            Caption = 'Function Name';
        }
        field(60; "Budget Center Name"; Text[50])
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
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

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
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

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

            trigger OnValidate()
            begin
                if "Currency Code" <> xRec."Currency Code" then
                    if Status <> Status::Posted then
                        CurrencyUpdateLines()
                    else
                        Error(Text000, FieldCaption("Currency Code"), TableCaption);

                TestField(Status, Status::Pending);
            end;
        }
        field(87; "Responsibility Center"; Code[20])
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
            FieldClass = Normal;
            Caption = 'Amount Surrendered LCY';
        }
        field(89; "Actual Spent"; Decimal)
        {
            CalcFormula = sum("Grant Surrender Details"."Actual Spent" where("Surrender Doc No." = field(No)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Actual Spent';
        }
        field(90; "No. Printed"; Integer)
        {
            Caption = 'No. Printed';
        }
        field(91; "Surrender Posting Date"; Date)
        {
            Caption = 'Surrender Posting Date';
            trigger OnValidate()
            begin
                //Changed to ensure Posting date is not less than the Surrender Date entered
                if "Surrender Posting Date" < "Surrender Date" then
                    Error('The Surrender Posting Date cannot be lesser than the Surrender Date');
            end;
        }
        field(92; "Total Amount Advanced"; Decimal)
        {
            Caption = 'Total Amount Advanced';
        }
        field(95; "Allow Overexpenditure"; Boolean)
        {
            Editable = false;
            Caption = 'Allow Overexpenditure';
        }
        field(96; "Open for Overexpenditure by"; Code[20])
        {
            Editable = false;
            Caption = 'Open for Overexpenditure by';
        }
        field(97; "Date opened for OvExpenditure"; Date)
        {
            Editable = false;
            Caption = 'Date opened for OvExpenditure';
        }
        field(98; "Cash Receipt Amount"; Decimal)
        {
            FieldClass = Normal;
            Caption = 'Cash Receipt Amount';
        }
        field(99; "Actual Amount (LCY)"; Decimal)
        {
            FieldClass = Normal;
            Caption = 'Actual Amount (LCY)';
        }
        field(100; "Commitment Status"; Boolean)
        {
            Caption = 'Commitment Status';
        }
        field(101; Grant; Code[20])
        {
            TableRelation = Jobs where("Approval Status" = const(Approved),
                                        Status = const(Project));
            Caption = 'Grant';

        }
        field(102; "Grant Phase"; Code[10])
        {
            TableRelation = "Grant Phases";
            Caption = 'Grant Phase';
        }
        field(103; "Disbursed Cost"; Decimal)
        {
            Editable = false;
            FieldClass = Normal;
            Caption = 'Disbursed Cost';
        }
        field(104; "Questioned Cost"; Decimal)
        {
            Editable = false;
            FieldClass = Normal;
            Caption = 'Questioned Cost';
        }
        field(105; "Job-Planning Line No"; Integer)
        {
            TableRelation = "Job-Planning Line"."Line No." where("Grant No." = field(Grant));
            Caption = 'Job-Planning Line No';
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

            GenLedgerSetup.TestField(GenLedgerSetup."Grant Surrender Nos");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Grant Surrender Nos", xRec."No. Series", 0D, No, "No. Series");
        end;

        "Account Type" := "Account Type"::Customer;
        "Surrender Date" := Today;
        Cashier := UserId;
        Validate(Cashier);
        /*
        IF UserSetup.GET(USERID)THEN BEGIN
        UserSetup.TESTFIELD("Staff Travel Account");
        "Account No.":=UserSetup."Staff Travel Account";
        VALIDATE("Account No.");
        END ELSE
            ERROR('User must be setup under User Setup and their respective Account Entered');
        */

    end;

    trigger OnModify()
    begin
        if Status = Status::Posted then
            Error('Cannot Modify Document is already Posted');
    end;

    var
        ImpSurrLine: Record "Grant Surrender Details";
        PayHeader: Record "Grant Surrender Header";
        PayLine: Record "Grant Surrender Details";
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
        LoadImprestDetails: Record "Grant Surrender Details";
        TotAmt: Decimal;
        ImprestDetForm: Page "Proposal List";
        DimVal: Record "Dimension Value";
        "VAT Code": Code[20];
        RespCenter: Record "Responsibility Center";
        UserMgt: Codeunit "User Setup Management";
        LineNo: Integer;
        UserSetup: Record "User Setup";
        Job: Record Jobs;
        Text001: Label 'Your identification is set up to process from %1 %2 only.';
        Text000: Label 'You cannot change %1 because one or more entries are associated with this %2.';


    procedure CurrencyUpdateLines()
    var
        PlaningLine: Record "Job-Planning Line";
    begin
        /*
        PayLine.SETRANGE(PayLine."Surrender Doc No.",No);
        IF Payline.FIND('-') THEN
          REPEAT
            IF posted THEN
              ERROR(Text000,FIELDCAPTION("Currency Code"),TABLECAPTION);
            payline.VALIDATE("Currency Code","Currency Code");
            payline.VALIDATE("Currency Date");
            payline.MODIFY;
          UNTIL payline.NEXT = 0;
        */

    end;
}
