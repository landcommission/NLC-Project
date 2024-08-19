#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193630 "Payments-Users"
{
    Caption = 'Payments-Users';
    DataClassification = CustomerContent;
    //DrillDownPageID = UnknownPage50029;
    //LookupPageID = UnknownPage50029;

    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'No';
            trigger OnValidate()
            begin

                if No <> xRec.No then begin
                    GenLedgerSetup.Get();
                    if "Payment Type" = "Payment Type"::Normal then
                        NoSeriesMgt.TestManual(GenLedgerSetup."Normal Payments No")
                    else
                        NoSeriesMgt.TestManual(GenLedgerSetup."Imprest Req No");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Date; Date)
        {
            Caption = 'Date';
        }
        field(3; Type; Code[20])
        {
            NotBlank = true;
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


                end;

                //VALIDATE("Account No.");
            end;
        }
        field(4; "Pay Mode"; Option)
        {
            OptionMembers = ,Cash,Cheque,EFT,"Custom 1","Custom 2","Custom 3","Custom 4","Custom 5";
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
        field(11; Cashier; Code[20])
        {
            Caption = 'Cashier';
            //TableRelation = Table2000000002.Field1;
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
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else
            if ("Account Type" = const(Customer)) Customer where("Customer Posting Group" = field(Grouping))
            else
            if ("Account Type" = const(Vendor)) Vendor
            else
            if ("Account Type" = const("Bank Account")) "Bank Account"
            else
            if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else
            if ("Account Type" = const("IC Partner")) "IC Partner";

            trigger OnValidate()
            begin

                "Account Name" := '';
                RecPayTypes.Reset();
                RecPayTypes.SetRange(RecPayTypes.Code, Type);
                RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Payment);

                if "Account Type" in ["Account Type"::"G/L Account", "Account Type"::Customer, "Account Type"::Vendor, "Account Type"::"IC Partner"]
                then
                    case "Account Type" of
                        "Account Type"::"G/L Account":
                            begin
                                GLAcc.Get("Account No.");
                                "Account Name" := GLAcc.Name;
                                "VAT Code" := RecPayTypes."VAT Code";
                                "Withholding Tax Code" := RecPayTypes."Withholding Tax Code";
                                "Global Dimension 1 Code" := '';
                            end;
                        "Account Type"::Customer:
                            begin
                                Cust.Get("Account No.");
                                "Account Name" := Cust.Name;
                                //      "VAT Code":=Cust."Default Withholding Tax Code";
                                //"Withholding Tax Code":=Cust.Province;
                                "Global Dimension 1 Code" := Cust."Global Dimension 1 Code";
                            end;
                        "Account Type"::Vendor:
                            begin
                                Vend.Get("Account No.");
                                "Account Name" := Vend.Name;
                                //      "VAT Code":=Vend."Default VAT Code";
                                //      "Withholding Tax Code":=Vend."Default Withholding Tax Code";
                                "Global Dimension 1 Code" := Vend."Global Dimension 1 Code";
                            end;
                        "Account Type"::"Bank Account":
                            begin
                                BankAcc.Get("Account No.");
                                "Account Name" := BankAcc.Name;
                                "VAT Code" := RecPayTypes."VAT Code";
                                "Withholding Tax Code" := RecPayTypes."Withholding Tax Code";
                                "Global Dimension 1 Code" := BankAcc."Global Dimension 1 Code";

                            end;
                    /*
                  "Account Type"::"Fixed Asset":
                    BEGIN
                      FA.GET("Account No.");
                      "Account Name":=FA.Description;
                      "VAT Code":=FA."Default VAT Code";
                      "Withholding Tax Code":=FA."Default Withholding Tax Code";
                       "Global Dimension 1 Code":=FA."Global Dimension 1 Code";
                    END;
                    */
                    end;

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
            CalcFormula = sum("Imprest Details-User".Amount where(No = field(No)));
            FieldClass = FlowField;
            Caption = 'Amount';
            Editable = false;
        }
        field(21; Remarks; Text[250])
        {
            Caption = 'Remarks';
        }
        field(22; "Transaction Name"; Text[100])
        {
            Caption = 'Transaction Name';
        }
        field(23; "VAT Code"; Code[20])
        {
            TableRelation = "Tariff Codes";
            Caption = 'VAT Code';
        }
        field(24; "Withholding Tax Code"; Code[20])
        {
            TableRelation = "Tariff Codes";
            Caption = 'Withholding Tax Code';
        }
        field(25; "VAT Amount"; Decimal)
        {
            Caption = 'VAT Amount';
        }
        field(26; "Withholding Tax Amount"; Decimal)
        {
            Caption = 'Withholding Tax Amount';
        }
        field(27; "Net Amount"; Decimal)
        {
            Caption = 'Net Amount';
        }
        field(28; "Paying Bank Account"; Code[20])
        {
            TableRelation = "Bank Account"."No." where(test = field("Bank Type"));
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
        }
        field(31; "Branch Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            Caption = 'Branch Code';
        }
        field(32; "PO/INV No"; Code[20])
        {
            Caption = 'PO/INV No';
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
            OptionMembers = Pending,"1st Approval","2nd Approval","3rd Approval","Fully Approved",Cancelled;
            Caption = 'Status';
        }
        field(36; Select; Boolean)
        {
            Caption = 'Select';
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
        field(41; "Apply to"; Code[20])
        {
            TableRelation = "Vendor Ledger Entry"."Vendor No." where("Vendor No." = field("Account No."));
            Caption = 'Apply to';
        }
        field(42; "Apply to ID"; Code[20])
        {
            Caption = 'Apply to ID';
        }
        field(43; "No of Units"; Decimal)
        {
            Caption = 'No of Units';
        }
        field(44; "Surrender Date"; Date)
        {
            Caption = 'Surrender Date';
        }
        field(45; Surrendered; Boolean)
        {
            Caption = 'Surrendered';
        }
        field(46; "Surrender Doc. No"; Code[20])
        {
            Caption = 'Surrender Doc. No';
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
        field(53; "Applicant Designation"; Text[100])
        {
            Caption = 'Applicant Designation';
        }
        field(54; "Petty Cash"; Boolean)
        {
            Caption = 'Petty Cash';
        }
        field(55; "Supplier Invoice No."; Code[30])
        {
            Caption = 'Supplier Invoice No.';
        }
        field(56; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(57; LineMGERID; Code[20])
        {
            Caption = 'LineMGERID';
            //TableRelation = Table2000000002.Field1;
        }
        field(58; "User ID"; Code[20])
        {
            Caption = 'User ID';
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
            GenLedgerSetup.Get();
            GenLedgerSetup.TestField(GenLedgerSetup."Normal Payments No");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Normal Payments No", xRec."No. Series", 0D, No, "No. Series");
        end;
    end;

    var
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
}
