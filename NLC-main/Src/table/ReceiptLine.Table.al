#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193623 "Receipt Line"
{
    DrillDownPageId = "Receipts Line";
    LookupPageId = "Receipts Line";
    Caption = 'Receipt Line';
    DataClassification = CustomerContent;
    fields
    {
        field(1; No; Code[20])
        {
            NotBlank = false;
            TableRelation = "Receipts Header"."No.";
            Caption = 'No';
        }
        field(2; Date; Date)
        {
            CalcFormula = lookup("Receipts Header".Date where("No." = field(No)));
            FieldClass = FlowField;
            Caption = 'Date';
            Editable = false;
        }
        field(3; Type; Code[20])
        {
            TableRelation = "Receipts and Payment Types".Code where(Type = filter(Receipt),
                                                                     Blocked = const(false));
            Caption = 'Type';
            trigger OnValidate()
            begin
                "Account No." := '';
                "Account Name" := '';
                Remarks := '';
                RecPayTypes.Reset();
                RecPayTypes.SetRange(RecPayTypes.Code, Type);
                RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Receipt);

                if RecPayTypes.Find('-') then begin
                    "Account Type" := RecPayTypes."Account Type";
                    "Transaction Name" := RecPayTypes.Description;
                    Grouping := RecPayTypes."Default Grouping";
                    Remarks := RecPayTypes."Transation Remarks";
                    "Customer Payment On Account" := RecPayTypes."Customer Payment On Account";

                    if RecPayTypes."Account Type" = RecPayTypes."Account Type"::"G/L Account" then begin
                        if "Account No." <> '' then
                            RecPayTypes.TestField(RecPayTypes."G/L Account");
                        "Account No." := RecPayTypes."G/L Account";
                        if "Account No." <> '' then
                            Validate("Account No.");
                    end;
                end;

                //Check if the batch account has been inserted it the "Customer Payment On Account" is true
                RecPayTypes.Reset();
                RecPayTypes.SetRange(RecPayTypes.Code, Type);
                RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Receipt);
                /*
                IF RecPayTypes.FIND('-') THEN
                  BEGIN
                    //check if the receipt type has Customer Payment On Account as True
                      IF RecPayTypes."Customer Payment On Account"=TRUE THEN
                        BEGIN
                          //check if the Receivable Batch Account is entered
                          SRSetup.GET();
                          SRSetup.TESTFIELD(SRSetup."Receivable Batch Account");
                        END;

                  END;
                  */

                RHead.Reset();
                RHead.SetRange(RHead."No.", No);
                if RHead.FindFirst() then begin
                    "Global Dimension 1 Code" := RHead."Global Dimension 1 Code";
                    "Shortcut Dimension 2 Code" := RHead."Shortcut Dimension 2 Code";
                    "Dimension Set ID" := RHead."Dimension Set ID";
                end;

            end;
        }
        field(4; "Pay Mode"; Option)
        {
            OptionMembers = " ",Cash,Cheque,EFT,"Deposit Slip","Banker's Cheque",RTGS,Custom3;
            Caption = 'Pay Mode';
            trigger OnValidate()
            begin
                GenLedgerSetup.Reset();
                GenLedgerSetup.Get();

                if "Pay Mode" = "Pay Mode"::"Deposit Slip" then
                    "Bank Account" := GenLedgerSetup."Default Bank Deposit Slip A/C";
            end;
        }
        field(5; "Cheque/Deposit Slip No"; Code[20])
        {
            Caption = 'Cheque/Deposit Slip No';
            trigger OnValidate()
            begin
                CheckSlipDetails();
            end;
        }
        field(6; "Cheque/Deposit Slip Date"; Date)
        {
            Caption = 'Cheque/Deposit Slip Date';

        }
        field(7; "Cheque/Deposit Slip Type"; Option)
        {
            OptionMembers = " "," Local","Up Country";
            Caption = 'Cheque/Deposit Slip Type';
        }
        field(8; "Bank Code"; Code[20])
        {
            TableRelation = "Bank Account"."No." where("Global Dimension 2 Code" = field("Shortcut Dimension 2 Code"));
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
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account" where("Direct Posting" = const(true),
                                                                                          test = field(Grouping))
            else
            if ("Account Type" = const(Customer)) Customer where("Customer Posting Group" = field(Grouping))
            else
            if ("Account Type" = const(Vendor)) Vendor where("Vendor Posting Group" = field(Grouping))
            else
            if ("Account Type" = const("Bank Account")) "Bank Account" where("Bank Acc. Posting Group" = field(Grouping))
            else
            if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else
            if ("Account Type" = const("IC Partner")) "IC Partner";

            trigger OnValidate()
            begin
                "Account Name" := '';

                if "Account Type" in ["Account Type"::"G/L Account", "Account Type"::Customer,
                "Account Type"::Vendor, "Account Type"::"IC Partner"] then
                    case "Account Type" of
                        "Account Type"::"G/L Account":
                            begin
                                GLAcc.Get("Account No.");
                                "Account Name" := GLAcc.Name;
                                "Global Dimension 1 Code" := GLAcc."Global Dimension 1 Code";

                                "VAT Bus. Posting Group" := GLAcc."VAT Bus. Posting Group";
                                "VAT Prod. Posting Group" := GLAcc."VAT Prod. Posting Group";
                                "Gen. Posting Type" := GLAcc."Gen. Posting Type";
                                "Gen. Bus. Posting Group" := GLAcc."Gen. Bus. Posting Group";
                                "Gen. Prod. Posting Group" := GLAcc."Gen. Prod. Posting Group";
                                VATSetup.Reset();
                                VATSetup.SetRange(VATSetup."VAT Bus. Posting Group", "VAT Bus. Posting Group");
                                VATSetup.SetRange(VATSetup."VAT Prod. Posting Group", "VAT Prod. Posting Group");
                                if VATSetup.Find('-') then
                                    "VAT %" := VATSetup."VAT %";
                            end;
                        "Account Type"::Customer:
                            begin
                                Cust.Get("Account No.");
                                "Account Name" := Cust.Name;
                                if "Global Dimension 1 Code" = '' then
                                    "Global Dimension 1 Code" := Cust."Global Dimension 1 Code";
                            end;
                        "Account Type"::Vendor:
                            begin
                                Vend.Get("Account No.");
                                "Account Name" := Vend.Name;
                                if "Global Dimension 1 Code" = '' then
                                    "Global Dimension 1 Code" := Vend."Global Dimension 1 Code";
                            end;
                        "Account Type"::"Bank Account":
                            begin
                                BankAcc.Get("Account No.");
                                "Account Name" := BankAcc.Name;
                                if "Global Dimension 1 Code" = '' then
                                    "Global Dimension 1 Code" := BankAcc."Global Dimension 1 Code";
                            end;
                        "Account Type"::"Fixed Asset":
                            begin
                                FA.Get("Account No.");
                                "Account Name" := FA.Description;
                                "Global Dimension 1 Code" := FA."Global Dimension 1 Code";
                            end;
                        "Account Type"::"IC Partner":
                            begin
                                ICPartner.Reset();
                                ICPartner.Get("Account No.");
                                "Account Name" := ICPartner.Name;
                            end;
                    end;
                /*
                {Check if the global dimension 1 code has een selected by the user}
                IF ("Global Dimension 1 Code"='') AND ("Account Type"<>"Account Type"::"G/L Account")THEN
                  BEGIN
                    ERROR('Please ensure that the Function code is selected');
                  END;
                */

                CreateDim(
                  DimMgt.TypeToTableID1("Account Type"), "Account No.");

                /*
                CreateDim(
                  DimMgt.TypeToTableID1("Account Type"),"Account No.",
                  DimMgt.TypeToTableID1("Bal. Account Type"),"Bal. Account No.",
                  DATABASE::Job,"Job No.",
                  DATABASE::"Salesperson/Purchaser","Salespers./Purch. Code",
                  DATABASE::Campaign,"Campaign No.");
                 */

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
        field(19; "Posted By"; Code[50])
        {
            Caption = 'Posted By';
        }
        field(20; Amount; Decimal)
        {
            Caption = 'Amount';
            trigger OnValidate()
            begin
                "VAT Amount" := (Amount * "VAT %") / 100;
                "VAT Amount" := Round("VAT Amount", 0.05, '=');
                //"Total Amount":=Amount + "VAT Amount";
                "Total Amount" := Amount;
            end;
        }
        field(21; Remarks; Text[250])
        {
            Caption = 'Remarks';
        }
        field(22; "Transaction Name"; Text[100])
        {
            Caption = 'Transaction Name';
        }
        field(23; "Branch Code"; Code[20])
        {
            Caption = 'Branch Code';
        }
        field(24; "Agent Code"; Code[20])
        {
            Caption = 'Agent Code';
        }
        field(25; Grouping; Code[20])
        {
            TableRelation = "Customer Posting Group".Code;
            Caption = 'Grouping';
        }
        field(26; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            Editable = true;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          "Dimension Value Type" = const(Standard));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
            end;
        }
        field(27; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Editable = true;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(28; "VAT %"; Decimal)
        {
            Caption = 'VAT %';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MaxValue = 100;
            MinValue = 0;
        }
        field(29; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(30; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;
        }
        field(31; "VAT Bus. Posting Group"; Code[10])
        {
            Caption = 'VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";

            trigger OnValidate()
            begin
                if "Account Type" in ["Account Type"::Customer, "Account Type"::Vendor, "Account Type"::"Bank Account"] then
                    TestField("VAT Bus. Posting Group", '');
                Validate("VAT Prod. Posting Group");
            end;
        }
        field(32; "VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";

            trigger OnValidate()
            begin
                if "Account Type" in ["Account Type"::Customer, "Account Type"::Vendor, "Account Type"::"Bank Account"] then
                    TestField("VAT Prod. Posting Group", '');

                "VAT %" := 0;
                "VAT Calculation Type" := "VAT Calculation Type"::"Normal VAT";
                if "Gen. Posting Type" <> 0 then begin
                    if not VATPostingSetup.Get("VAT Bus. Posting Group", "VAT Prod. Posting Group") then
                        VATPostingSetup.Init();
                    "VAT Calculation Type" := VATPostingSetup."VAT Calculation Type";
                    case "VAT Calculation Type" of
                        "VAT Calculation Type"::"Normal VAT":
                            "VAT %" := VATPostingSetup."VAT %";
                        "VAT Calculation Type"::"Full VAT":
                            case "Gen. Posting Type" of
                                "Gen. Posting Type"::Sale:
                                    begin
                                        VATPostingSetup.TestField("Sales VAT Account");
                                        TestField("Account No.", VATPostingSetup."Sales VAT Account");
                                    end;
                                "Gen. Posting Type"::Purchase:
                                    begin
                                        VATPostingSetup.TestField("Purchase VAT Account");
                                        TestField("Account No.", VATPostingSetup."Purchase VAT Account");
                                    end;
                            end;
                    end;
                end;
                Validate("VAT %");
            end;
        }
        field(33; "Gen. Posting Type"; Option)
        {
            Caption = 'Gen. Posting Type';
            OptionCaption = ' ,Purchase,Sale,Settlement';
            OptionMembers = " ",Purchase,Sale,Settlement;

            trigger OnValidate()
            begin
                if "Account Type" in ["Account Type"::Customer, "Account Type"::Vendor, "Account Type"::"Bank Account"] then
                    TestField("Gen. Posting Type", "Gen. Posting Type"::" ");
                if ("Gen. Posting Type" = "Gen. Posting Type"::Settlement) and (CurrFieldNo <> 0) then
                    Error(Text001, "Gen. Posting Type");

                if "Gen. Posting Type" > 0 then
                    Validate("VAT Prod. Posting Group");
            end;
        }
        field(34; "Gen. Bus. Posting Group"; Code[10])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";

            trigger OnValidate()
            begin

                if "Account Type" in ["Account Type"::Customer, "Account Type"::Vendor, "Account Type"::"Bank Account"] then
                    TestField("Gen. Bus. Posting Group", '');
                if xRec."Gen. Bus. Posting Group" <> "Gen. Bus. Posting Group" then
                    if GenBusPostingGrp.ValidateVatBusPostingGroup(GenBusPostingGrp, "Gen. Bus. Posting Group") then
                        Validate("VAT Bus. Posting Group", GenBusPostingGrp."Def. VAT Bus. Posting Group");
            end;
        }
        field(35; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";

            trigger OnValidate()
            begin

                if "Account Type" in ["Account Type"::Customer, "Account Type"::Vendor, "Account Type"::"Bank Account"] then
                    TestField("Gen. Prod. Posting Group", '');
                if xRec."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group" then
                    if GenProdPostingGrp.ValidateVatProdPostingGroup(GenProdPostingGrp, "Gen. Prod. Posting Group") then
                        Validate("VAT Prod. Posting Group", GenProdPostingGrp."Def. VAT Prod. Posting Group");
            end;
        }
        field(36; "VAT Calculation Type"; Option)
        {
            Caption = 'VAT Calculation Type';
            Editable = false;
            OptionCaption = 'Normal VAT,Reverse Charge VAT,Full VAT,Sales Tax';
            OptionMembers = "Normal VAT","Reverse Charge VAT","Full VAT","Sales Tax";
        }
        field(37; "VAT Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'VAT Amount';
        }
        field(38; "Total Amount"; Decimal)
        {
            Editable = false;
            Caption = 'Total Amount';
        }
        field(39; "User ID"; Code[50])
        {
            Caption = 'User ID';
        }
        field(40; "Apply to"; Code[20])
        {
            Caption = 'Apply to';
        }
        field(41; "Apply to ID"; Code[20])
        {
            Editable = true;
            Caption = 'Apply to ID';
        }
        field(42; "Dest Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            Editable = true;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(43; "Dest Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(44; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(45; "Print No."; Integer)
        {
            Caption = 'Print No.';
        }
        field(46; Status; Option)
        {
            OptionMembers = " ",Normal,"Post Dated",Posted;
            Caption = 'Status';
        }
        field(47; "Deposit Slip Time"; Time)
        {
            Caption = 'Deposit Slip Time';
            trigger OnValidate()
            begin
                CheckSlipDetails();
            end;
        }
        field(48; "Teller ID"; Code[50])
        {
            Caption = 'Teller ID';
            trigger OnValidate()
            begin
                CheckSlipDetails();
            end;
        }
        field(49; "Customer Payment On Account"; Boolean)
        {
            Caption = 'Customer Payment On Account';
        }
        field(50; Select; Boolean)
        {
            Caption = 'Select';
        }
        field(51; "Batch Posted"; Boolean)
        {
            Caption = 'Batch Posted';
        }
        field(52; "Transaction No."; Code[20])
        {
            Caption = 'Transaction No.';
        }
        field(53; "Cheque/Deposit Slip Bank"; Code[20])
        {
            TableRelation = Banks;
            Caption = 'Cheque/Deposit Slip Bank';
        }
        field(54; "Bank Account"; Code[30])
        {
            TableRelation = "Bank Account"."No.";
            Caption = 'Bank Account';
        }
        field(55; Confirmed; Boolean)
        {
            Caption = 'Confirmed';
        }
        field(56; Reconciled; Boolean)
        {
            Caption = 'Reconciled';
        }
        field(57; "Orig. Cashier"; Code[50])
        {
            CalcFormula = lookup("Receipts Header".Cashier where("No." = field(No)));
            FieldClass = FlowField;
            Caption = 'Orig. Cashier';
            Editable = false;
        }
        field(58; Cancelled; Boolean)
        {
            Caption = 'Cancelled';
        }
        field(59; "Cancelled By"; Code[50])
        {
            Caption = 'Cancelled By';
        }
        field(60; "Cancelled Date"; Date)
        {
            Caption = 'Cancelled Date';
        }
        field(61; "Cancelled Time"; Time)
        {
            Caption = 'Cancelled Time';
        }
        field(62; "Post Dated"; Boolean)
        {
            Caption = 'Post Dated';
        }
        field(63; "Cheque Retrieved"; Boolean)
        {
            Caption = 'Cheque Retrieved';
        }
        field(64; "Register Number"; Integer)
        {
            Caption = 'Register Number';
        }
        field(65; "From Entry No"; Integer)
        {
            Caption = 'From Entry No';
        }
        field(66; "To Entry No"; Integer)
        {
            Caption = 'To Entry No';
        }
        field(67; "Batch Posted UserID"; Code[50])
        {
            Caption = 'Batch Posted UserID';
        }
        field(68; "BD Register Number"; Integer)
        {
            Caption = 'BD Register Number';
        }
        field(69; "BD From Number"; Integer)
        {
            Caption = 'BD From Number';
        }
        field(70; "BD To Number"; Integer)
        {
            Caption = 'BD To Number';
        }
        field(71; "Reversal By"; Code[50])
        {
            Caption = 'Reversal By';
        }
        field(72; "Reversal Date"; Date)
        {
            Caption = 'Reversal Date';
        }
        field(73; "Reversal Time"; Time)
        {
            Caption = 'Reversal Time';
        }
        field(74; "Reversal Register No."; Integer)
        {
            Caption = 'Reversal Register No.';
        }
        field(75; "Reversal From Entry No."; Integer)
        {
            Caption = 'Reversal From Entry No.';
        }
        field(76; "Reversal To Entry No."; Integer)
        {
            Caption = 'Reversal To Entry No.';
        }
        field(77; Reversed; Boolean)
        {
            Caption = 'Reversed';
        }
        field(85; "Applies-to Doc. Type"; Option)
        {
            Caption = 'Applies-to Doc. Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(86; "Applies-to Doc. No."; Code[20])
        {
            Caption = 'Applies-to Doc. No.';

            trigger OnLookup()
            var
                CustLedgEntry: Record "Cust. Ledger Entry";
                BilToCustNo: Code[20];
                OK: Boolean;
                Text000: Label 'You must specify %1 or %2.';
            begin
                //CODEUNIT.RUN(CODEUNIT::"Receipt Apply",Rec);
                if (Rec."Account Type" <> Rec."Account Type"::Customer) and (Rec."Account Type" <> Rec."Account Type"::Vendor) then
                    Error('You cannot apply to %1', "Account Type");

                Rec.Amount := 0;
                Rec.Validate(Amount);
                BilToCustNo := Rec."Account No.";
                CustLedgEntry.SetCurrentKey("Customer No.", Open);
                CustLedgEntry.SetRange("Customer No.", BilToCustNo);
                CustLedgEntry.SetRange(Open, true);
                if Rec."Applies-to ID" = '' then
                    Rec."Applies-to ID" := Rec.No;
                if Rec."Applies-to ID" = '' then
                    Error(
                      Text000,
                      Rec.FieldCaption(No), Rec.FieldCaption("Applies-to ID"));
                ApplyCustEntries.SetReceipts(Rec, CustLedgEntry, Rec.FieldNo("Applies-to ID"));
                ApplyCustEntries.SetRecord(CustLedgEntry);
                ApplyCustEntries.SetTableView(CustLedgEntry);
                ApplyCustEntries.LookupMode(true);
                OK := ApplyCustEntries.RunModal() = Action::LookupOK;
                Clear(ApplyCustEntries);
                if not OK then
                    exit;
                CustLedgEntry.Reset();
                CustLedgEntry.SetCurrentKey("Customer No.", Open);
                CustLedgEntry.SetRange("Customer No.", BilToCustNo);
                CustLedgEntry.SetRange(Open, true);
                CustLedgEntry.SetRange("Applies-to ID", Rec."Applies-to ID");
                if CustLedgEntry.Find('-') then begin
                    Rec."Applies-to Doc. Type" := 0;
                    Rec."Applies-to Doc. No." := '';
                end else
                    Rec."Applies-to ID" := '';
                //Calculate Total Amount
                CustLedgEntry.Reset();
                CustLedgEntry.SetCurrentKey("Customer No.", Open, "Applies-to ID");
                CustLedgEntry.SetRange("Customer No.", BilToCustNo);
                CustLedgEntry.SetRange(Open, true);
                CustLedgEntry.SetRange("Applies-to ID", "Applies-to ID");
                if CustLedgEntry.Find('-') then begin
                    CustLedgEntry.CalcSums(CustLedgEntry."Amount to Apply");
                    Amount := Abs(CustLedgEntry."Amount to Apply");
                    Validate(Amount);
                end;
            end;

            trigger OnValidate()
            begin

                if ("Applies-to Doc. No." <> xRec."Applies-to Doc. No.") and (xRec."Applies-to Doc. No." <> '') and
                   ("Applies-to Doc. No." <> '')
                then begin
                    SetAmountToApply("Applies-to Doc. No.", "Account No.");
                    SetAmountToApply(xRec."Applies-to Doc. No.", "Account No.");
                end else
                    if ("Applies-to Doc. No." <> xRec."Applies-to Doc. No.") and (xRec."Applies-to Doc. No." = '') then
                        SetAmountToApply("Applies-to Doc. No.", "Account No.")
                    else
                        if ("Applies-to Doc. No." <> xRec."Applies-to Doc. No.") and ("Applies-to Doc. No." = '') then
                            SetAmountToApply(xRec."Applies-to Doc. No.", "Account No.");
            end;
        }
        field(87; "Applies-to ID"; Code[20])
        {
            Caption = 'Applies-to ID';

            trigger OnValidate()
            var
                TempCustLedgEntry: Record "Cust. Ledger Entry";
            begin
                if ("Applies-to ID" <> xRec."Applies-to ID") and (xRec."Applies-to ID" <> '') then begin
                    CustLedgEntry.SetCurrentKey("Customer No.", Open);
                    CustLedgEntry.SetRange("Customer No.", "Account No.");
                    CustLedgEntry.SetRange(Open, true);
                    CustLedgEntry.SetRange("Applies-to ID", xRec."Applies-to ID");
                    if CustLedgEntry.FindFirst() then
                        CustEntrySetApplID.SetApplId(CustLedgEntry, TempCustLedgEntry, '');
                    CustLedgEntry.Reset();
                end;
            end;
        }
        field(88; "Grant No"; Code[20])
        {
            TableRelation = Jobs where(Status = const(Project),
                                        "Approval Status" = const(Approved));
            Caption = 'Grant No';
        }
        field(89; "Installment Number"; Integer)
        {
            Caption = 'Installment Number';
        }
        field(90; "Next Installment Date"; Date)
        {
            Caption = 'Next Installment Date';
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions();
            end;
        }
        field(50000; Donor; Code[30])
        {
            TableRelation = "Project Donors" where("Grant No" = field("Shortcut Dimension 2 Code"),
                                                    "Charge Type" = filter(Cash));
            Caption = 'Donor';
        }
        field(39004244; test; Code[50])
        {
            Caption = 'test';
        }
    }

    keys
    {
        key(Key1; "Line No.", No)
        {
            Clustered = true;
            SumIndexFields = Amount, "Total Amount";
        }
    }

    fieldgroups { }

    trigger OnDelete()
    begin
        if Posted = true then
            Error('The transaction has already been posted and therefore cannot be modified.');
    end;

    trigger OnInsert()
    begin
        RHead.Reset();
        RHead.SetRange(RHead."No.", No);
        if RHead.FindFirst() then begin
            RHead.TestField("Responsibility Center");
            "Global Dimension 1 Code" := RHead."Global Dimension 1 Code";
            "Shortcut Dimension 2 Code" := RHead."Shortcut Dimension 2 Code";
            "Dimension Set ID" := RHead."Dimension Set ID";
        end;
    end;

    trigger OnModify()
    begin

        RHead.Reset();
        RHead.SetRange(RHead."No.", No);
        if RHead.FindFirst() then begin
            "Global Dimension 1 Code" := RHead."Global Dimension 1 Code";
            "Shortcut Dimension 2 Code" := RHead."Shortcut Dimension 2 Code";
            //    "Dimension Set ID":=RHead."Dimension Set ID";
            if RHead.Posted then
                Error('The transaction has already been posted and therefore cannot be modified.');
        end;

        /* IF (Posted=TRUE) AND ("Customer Payment On Account"=FALSE)  THEN
         ERROR('The transaction has already been posted and therefore cannot be modified.');
         IF (Posted=TRUE) AND ("Customer Payment On Account"=TRUE)  AND ("Batch Posted"=TRUE) THEN
         ERROR('The transaction has already been posted and therefore cannot be modified.');*/

    end;

    trigger OnRename()
    begin
        if Posted = true then
            Error('The transaction has already been posted and therefore cannot be modified.');
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
        VATPostingSetup: Record "VAT Posting Setup";
        Text001: Label 'The %1 option can only be used internally in the system.';
        GenBusPostingGrp: Record "Gen. Business Posting Group";
        GenProdPostingGrp: Record "Gen. Product Posting Group";
        Currency: Record Currency;
        CurrExchRate: Record "Currency Exchange Rate";
        Cust2: Record Customer;
        Vend2: Record Vendor;
        BankAcc2: Record "Bank Account";
        BankAcc3: Record "Bank Account";
        Text002: Label 'LCY';
        VATSetup: Record "VAT Posting Setup";
        RecLine: Record "Receipt Line";
        SRSetup: Record "Sales & Receivables Setup";
        ICPartner: Record "IC Partner";
        RHead: Record "Receipts Header";
        CustLedgEntry: Record "Cust. Ledger Entry";
        CustEntrySetApplID: Codeunit "Cust. Entry-SetAppl.ID";
        ApplyCustEntries: Page "Apply Customer Entries";
        DimMgt: Codeunit DimensionManagement;

    local procedure SetCurrencyCode(AccType2: Option "G/L Account",Customer,Vendor,"Bank Account"; AccNo2: Code[20]): Boolean
    begin
        "Currency Code" := '';
        if AccNo2 <> '' then
            case AccType2 of
                AccType2::Customer:
                    if Cust2.Get(AccNo2) then
                        "Currency Code" := Cust2."Currency Code";
                AccType2::Vendor:
                    if Vend2.Get(AccNo2) then
                        "Currency Code" := Vend2."Currency Code";
                AccType2::"Bank Account":
                    if BankAcc2.Get(AccNo2) then
                        "Currency Code" := BankAcc2."Currency Code";
            end;
        exit("Currency Code" <> '');
    end;

    local procedure GetCurrency()
    begin
    end;


    procedure GetShowCurrencyCode(CurrencyCode: Code[10]): Code[10]
    begin
        if CurrencyCode <> '' then
            exit(CurrencyCode)
        else
            exit(Text002);
    end;


    procedure CheckSlipDetails()
    var
        IsExistent: Boolean;
    begin
        //this function checks the details on the deposit slip to ensure no double presentation of slips
        //the checks will be the slip date,slip no,slip time and teller and the account

        IsExistent := false;

        case "Pay Mode" of
            "Pay Mode"::"Deposit Slip", "Pay Mode"::Cheque:
                begin
                    //reset the variable for holding the records
                    RecLine.Reset();
                    //RecLine.SETRANGE(RecLine."Account Type","Account Type");
                    //RecLine.SETRANGE(RecLine."Account No.","Account No.");
                    RecLine.SetRange(RecLine."Pay Mode", "Pay Mode");
                    RecLine.SetRange(RecLine."Cheque/Deposit Slip Type", "Cheque/Deposit Slip Type");
                    RecLine.SetRange(RecLine."Cheque/Deposit Slip No", "Cheque/Deposit Slip No");
                    RecLine.SetRange(RecLine."Cheque/Deposit Slip Date", "Cheque/Deposit Slip Date");
                    RecLine.SetRange(RecLine."Deposit Slip Time", "Deposit Slip Time");
                    RecLine.SetRange(RecLine."Teller ID", "Teller ID");
                    //check if there is a record with the same details
                    if RecLine.Find('-') then
                        repeat
                            if (RecLine."Line No." <> "Line No.") then
                                IsExistent := true;
                        until RecLine.Next() = 0;
                end;
        end;
        //ask for user confirmation is the IsExistent
        if IsExistent then
            if Confirm('Bank Deposit Slip(s) with the same details exist. Continue?', false) = false then
                Error('Operation Cancelled by User Interrupt');
    end;


    procedure SetAmountToApply(AppliesToDocNo: Code[20]; CustomerNo: Code[20])
    var
        CustLedgEntry: Record "Cust. Ledger Entry";
    begin
        CustLedgEntry.SetCurrentKey("Document No.");
        CustLedgEntry.SetRange("Document No.", AppliesToDocNo);
        CustLedgEntry.SetRange("Customer No.", CustomerNo);
        CustLedgEntry.SetRange(Open, true);
        if CustLedgEntry.FindFirst() then begin
            if CustLedgEntry."Amount to Apply" = 0 then begin
                CustLedgEntry.CalcFields("Remaining Amount");
                CustLedgEntry."Amount to Apply" := CustLedgEntry."Remaining Amount";
            end else
                CustLedgEntry."Amount to Apply" := 0;
            CustLedgEntry."Accepted Payment Tolerance" := 0;
            CustLedgEntry."Accepted Pmt. Disc. Tolerance" := false;
            Codeunit.Run(Codeunit::"Cust. Entry-Edit", CustLedgEntry);
        end;
    end;


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


    procedure CreateDim(Type1: Integer; No1: Code[20])
    var
        SourceCodeSetup: Record "Source Code Setup";
        TableID: array[10] of Integer;
        No: array[10] of Code[20];
        OldDimSetID: Integer;
    begin
        SourceCodeSetup.Get();
        TableID[1] := Type1;
        No[1] := No1;
        /*
        TableID[2] := Type2;
        No[2] := No2;
        TableID[3] := Type3;
        No[3] := No3;
        TableID[4] := Type4;
        No[4] := No4;
        */
        "Global Dimension 1 Code" := '';
        "Shortcut Dimension 2 Code" := '';
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
         DimMgt.GetDefaultDimID(TableID, No, 'Receipts', "Global Dimension 1 Code", "Shortcut Dimension 2 Code", 0, 0);
        if (OldDimSetID <> "Dimension Set ID") then
            Modify();
        //UpdateAllLineDim("Dimension Set ID",OldDimSetID);

    end;
}
