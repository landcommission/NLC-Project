#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193624 "Payment Line"
{
    DrillDownPageId = "Payment Lines";
    LookupPageId = "Payment Lines";
    Caption = 'Payment Line';
    DataClassification = CustomerContent;
    fields
    {
        field(1; No; Code[20])
        {
            NotBlank = true;
            Caption = 'No';
            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    GenLedgerSetup.Get();
                    if "Payment Type" = "Payment Type"::Normal then
                        NoSeriesMgt.TestManual(GenLedgerSetup."Normal Payments No")
                    else
                        NoSeriesMgt.TestManual(GenLedgerSetup."Petty Cash Payments No");
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
            TableRelation = "Receipts and Payment Types".Code where(Type = filter(Payment),
                                                                     Blocked = const(false));
            Caption = 'Type';
            trigger OnValidate()
            var
                TarrifCode: Record "Tariff Codes";
            begin

                "Account No." := '';
                "Account Name" := '';
                Remarks := '';
                RecPayTypes.Reset();
                RecPayTypes.SetRange(RecPayTypes.Code, Type);
                RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Payment);

                if RecPayTypes.Find('-') then begin
                    Grouping := RecPayTypes."Default Grouping";
                    "Require Surrender" := RecPayTypes."Pending Voucher";
                    "Payment Reference" := RecPayTypes."Payment Reference";
                    "Budgetary Control A/C" := RecPayTypes."Direct Expense";

                    if RecPayTypes."VAT Chargeable" = RecPayTypes."VAT Chargeable"::Yes then begin
                        "VAT Code" := RecPayTypes."VAT Code";
                        if TarrifCode.Get("VAT Code") then
                            "VAT Rate" := TarrifCode.Percentage;
                    end;
                    if RecPayTypes."Withholding Tax Chargeable" = RecPayTypes."Withholding Tax Chargeable"::Yes then begin
                        "Withholding Tax Code" := RecPayTypes."Withholding Tax Code";
                        if TarrifCode.Get("Withholding Tax Code") then
                            "W/Tax Rate" := TarrifCode.Percentage;

                    end;


                    if RecPayTypes."VAT Chargeable" = RecPayTypes."VAT Chargeable"::Yes then begin
                        "VAT Withheld Code" := RecPayTypes."VAT Withheld Code";
                        if TarrifCode.Get("VAT Withheld Code") then
                            "VAT 6% Rate" := TarrifCode.Percentage;
                    end;


                    if RecPayTypes."Calculate Retention" = RecPayTypes."Calculate Retention"::Yes then begin
                        "Retention Code" := RecPayTypes."Retention Code";
                        if TarrifCode.Get("Retention Code") then
                            "Retention Rate" := TarrifCode.Percentage;

                    end;



                end;

                if RecPayTypes.Find('-') then begin
                    "Account Type" := RecPayTypes."Account Type";
                    Validate("Account Type");
                    "Transaction Name" := RecPayTypes.Description;
                    "Budgetary Control A/C" := RecPayTypes."Direct Expense";
                    if RecPayTypes."Account Type" = RecPayTypes."Account Type"::"G/L Account" then begin
                        if RecPayTypes."G/L Account" <> '' then
                            RecPayTypes.TestField(RecPayTypes."G/L Account");
                        "Account No." := RecPayTypes."G/L Account";
                        Validate("Account No.");
                    end;

                    //Banks
                    if RecPayTypes."Account Type" = RecPayTypes."Account Type"::"Bank Account" then begin
                        "Account No." := RecPayTypes."Bank Account";
                        Validate("Account No.");
                    end;
                end;

                PHead.Reset();
                PHead.SetRange(PHead."No.", No);
                if PHead.FindFirst() then begin
                    Date := PHead.Date;
                    PHead.TestField("Responsibility Center");
                    "Global Dimension 1 Code" := PHead."Global Dimension 1 Code";
                    "Shortcut Dimension 2 Code" := PHead."Shortcut Dimension 2 Code";
                    //"Shortcut Dimension 3 Code":=PHead."Shortcut Dimension 3 Code";
                    //"Shortcut Dimension 4 Code":=PHead."Shortcut Dimension 4 Code";
                    "Dimension Set ID" := PHead."Dimension Set ID";
                    "Currency Code" := PHead."Currency Code";
                    "Currency Factor" := PHead."Currency Factor";
                    "Payment Type" := PHead."Payment Type";
                end;
            end;
        }
        field(4; "Pay Mode"; Option)
        {
            OptionMembers = " ",Cash,Cheque,EFT,"Custom 2","Custom 3","Custom 4","Custom 5";
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
        }
        field(8; "Bank Code"; Code[20])
        {
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
                                                                                          "Account Type" = const(Posting),
                                                                                          Blocked = const(false))
            else
            if ("Account Type" = const(Customer)) Customer where("Customer Posting Group" = field(Grouping))
            else
            if ("Account Type" = const(Vendor)) Vendor where("Vendor Posting Group" = field(Grouping))
            else
            if ("Account Type" = const("Bank Account")) "Bank Account"
            else
            if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else
            if ("Account Type" = const("IC Partner")) "IC Partner";

            trigger OnValidate()
            var
                Text0001: Label 'The Account number CANNOT be the same as the Paying Bank Account No.';
            begin
                PH.Reset();
                PH.Get(No);
                "Account Name" := '';
                RecPayTypes.Reset();
                RecPayTypes.SetRange(RecPayTypes.Code, Type);
                RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Payment);

                if "Account Type" in ["Account Type"::"G/L Account", "Account Type"::Customer, "Account Type"::Vendor, "Account Type"::"IC Partner",
                "Account Type"::"Bank Account"]
                then
                    case "Account Type" of
                        "Account Type"::"G/L Account":
                            begin
                                if "Account No." <> '' then
                                    GLAcc.Get("Account No.");
                                "Account Name" := GLAcc.Name;
                                PH.TestField("Global Dimension 1 Code");
                                PH.TestField("Shortcut Dimension 2 Code");
                                //"Global Dimension 1 Code":='';
                                //"Shortcut Dimension 2 Code":='';
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
                                if PH.Payee = '' then begin
                                    PH.Payee := "Account Name";
                                    PH.Modify();
                                end;
                                if PH."On Behalf Of" = '' then begin
                                    PH."On Behalf Of" := "Account Name";
                                    PH.Modify();
                                end;
                            end;
                        "Account Type"::"Bank Account":
                            begin
                                if BankAcc.Get("Account No.") then
                                    "Account Name" := BankAcc.Name;
                                PH.TestField("Paying Bank Account");
                                if PH."Paying Bank Account" = "Account No." then
                                    Error(Text0001);
                                if "Global Dimension 1 Code" = '' then
                                    "Global Dimension 1 Code" := BankAcc."Global Dimension 1 Code";
                            end;
                        "Account Type"::"IC Partner":
                            begin
                                ICPartner.Reset();
                                ICPartner.Get("Account No.");
                                "Account Name" := ICPartner.Name;
                            end;
                    end;
                //Set the application to Invoice if Account type is vendor
                if "Account Type" = "Account Type"::Vendor then
                    "Applies-to Doc. Type" := "Applies-to Doc. Type"::Invoice;
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
                CalculateTax();
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
        field(23; "VAT Code"; Code[20])
        {
            TableRelation = "Tariff Codes".Code where(Type = const(VAT));
            Caption = 'VAT Code';
            trigger OnValidate()
            begin
                if TariffCode.Get("VAT Code") then
                    "VAT Rate" := TariffCode.Percentage
                else
                    "VAT Rate" := 0;
                CalculateTax();
            end;
        }
        field(24; "Withholding Tax Code"; Code[20])
        {
            TableRelation = "Tariff Codes".Code where(Type = const("W/Tax"));
            Caption = 'Withholding Tax Code';
            trigger OnValidate()
            begin
                if TariffCode.Get("Withholding Tax Code") then
                    "W/Tax Rate" := TariffCode.Percentage
                else
                    "W/Tax Rate" := 0;

                CalculateTax();
            end;
        }
        field(25; "VAT Amount"; Decimal)
        {
            Caption = 'VAT Amount';
            trigger OnValidate()
            begin
                //Should not be entered until VAT Code is entered
                TestField("VAT Code");
                "Net Amount" := Amount - ("VAT Amount" + "Withholding Tax Amount");
                Validate("Net Amount");
            end;
        }
        field(26; "Withholding Tax Amount"; Decimal)
        {
            Caption = 'Withholding Tax Amount';
            trigger OnLookup()
            begin
                PHead.Reset();
                PHead.SetRange(PHead."No.", No);
                if PHead.FindFirst() then
                    if (PHead.Status = PHead.Status::Approved) or (PHead.Status = PHead.Status::Posted) or
                     (PHead.Status = PHead.Status::"Pending Approval") or (PHead.Status = PHead.Status::Cancelled) then
                        Error('You Cannot modify documents that are approved/posted/Send for Approval');
            end;

            trigger OnValidate()
            begin
                //Should not be entered until W/Tax code is entered
                TestField("Withholding Tax Code");
                PHead.Reset();
                PHead.SetRange(PHead."No.", No);
                if PHead.FindFirst() then
                    if (PHead.Status = PHead.Status::Approved) or (PHead.Status = PHead.Status::Posted) or
                     (PHead.Status = PHead.Status::"Pending Approval") or (PHead.Status = PHead.Status::Cancelled) then
                        Error('You Cannot modify documents that are approved/posted/Send for Approval');

                "Net Amount" := Amount - ("Withholding Tax Amount" + "VAT Amount");
                Validate("Net Amount");
            end;
        }
        field(27; "Net Amount"; Decimal)
        {
            Caption = 'Net Amount';
            trigger OnValidate()
            begin
                //MESSAGE('"Currency Factor"::'+ FORMAT("Currency Factor"));
                if "Currency Factor" <> 0 then
                    "NetAmount LCY" := "Net Amount" / "Currency Factor"
                else
                    "NetAmount LCY" := "Net Amount";
            end;
        }
        field(28; "Paying Bank Account"; Code[20])
        {
            TableRelation = "Bank Account"."No.";
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
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          "Dimension Value Type" = const(Standard));

            trigger OnValidate()
            begin

                DimVal.Reset();
                DimVal.SetRange(DimVal."Global Dimension No.", 1);
                DimVal.SetRange(DimVal.Code, "Global Dimension 1 Code");
                if DimVal.Find('-') then
                    "Function Name" := DimVal.Name;

                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
                //"Dimension Set ID" := DimMgt.ValidateShortcutDimValues2(1, "Global Dimension 1 Code", "Dimension Set ID");
            end;
        }
        field(31; "Branch Code"; Code[20])
        {
            Description = 'NOt in use please us the shortcut dimension 2 below';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            Caption = 'Branch Code';
            trigger OnValidate()
            begin

                DimVal.Reset();
                DimVal.SetRange(DimVal."Global Dimension No.", 2);
                DimVal.SetRange(DimVal.Code, "Branch Code");
                if DimVal.Find('-') then
                    "Budget Center Name" := DimVal.Name;

                ValidateShortcutDimCode(2, "Branch Code");

                //"Dimension Set ID" := DimMgt.ValidateShortcutDimValues2(2, "Shortcut Dimension 2 Code", "Dimension Set ID");
            end;
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
            OptionMembers = Pending,"1st Approval","2nd Approval","Cheque Printing",Posted,Cancelled,Checking,VoteBook;
            Caption = 'Status';
        }
        field(36; Select; Boolean)
        {
            Caption = 'Select';
        }
        field(37; Grouping; Code[20])
        {
            TableRelation = "Vendor Posting Group".Code;
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
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          "Dimension Value Type" = const(Standard));

            trigger OnValidate()
            begin
                DimVal.Reset();
                DimVal.SetRange(DimVal."Global Dimension No.", 2);
                DimVal.SetRange(DimVal.Code, "Branch Code");
                if DimVal.Find('-') then
                    "Budget Center Name" := DimVal.Name;

                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");

                //"Dimension Set ID" := DimMgt.ValidateShortcutDimValues2(2, "Shortcut Dimension 2 Code", "Dimension Set ID");
            end;
        }
        field(57; "Imprest Request No"; Code[20])
        {
            TableRelation = "Payments-Users" where(Posted = const(false));
            Caption = 'Imprest Request No';

        }
        field(58; "Batched Imprest Tot"; Decimal)
        {
            FieldClass = Normal;
            Caption = 'Batched Imprest Tot';
        }
        field(59; "Function Name"; Text[100])
        {
            Caption = 'Function Name';
        }
        field(60; "Budget Center Name"; Text[100])
        {
            Caption = 'Budget Center Name';
        }
        field(61; "Farmer Purchase No"; Code[20])
        {
            Caption = 'Farmer Purchase No';
        }
        field(62; "Transporter Ananlysis No"; Code[20])
        {
            Caption = 'Transporter Ananlysis No';
        }
        field(63; "User ID"; Code[20])
        {
            Caption = 'User ID';
            //TableRelation = Table2000000002.Field1;
        }
        field(64; "Journal Template"; Code[20])
        {
            Caption = 'Journal Template';
        }
        field(65; "Journal Batch"; Code[20])
        {
            Caption = 'Journal Batch';
        }
        field(66; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(67; "Require Surrender"; Boolean)
        {
            Editable = false;
            Caption = 'Require Surrender';
        }
        field(68; "Commited Ammount"; Decimal)
        {
            FieldClass = FlowFilter;
            Caption = 'Commited Ammount';
            //TableRelation = Table50019.Field4;
        }
        field(69; "Select to Surrender"; Boolean)
        {
            Caption = 'Select to Surrender';
        }
        field(71; "Payment Reference"; Option)
        {
            OptionMembers = Normal,"Farmer Purchase";
            Caption = 'Payment Reference';
        }
        field(72; "ID Number"; Code[8])
        {
            Caption = 'ID Number';
        }
        field(73; "VAT Rate"; Decimal)
        {
            Caption = 'VAT Rate';

        }
        field(74; "Amount With VAT"; Decimal)
        {
            Caption = 'Amount With VAT';
        }
        field(75; "Currency Code"; Code[20])
        {
            Caption = 'Currency Code';
        }
        field(76; "Exchange Rate"; Decimal)
        {
            Caption = 'Exchange Rate';
        }
        field(77; "Currency Reciprical"; Decimal)
        {
            Caption = 'Currency Reciprical';
        }
        field(78; "VAT Prod. Posting Group"; Code[20])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "VAT Product Posting Group".Code;
            Caption = 'VAT Prod. Posting Group';
        }
        field(79; "Budgetary Control A/C"; Boolean)
        {
            Caption = 'Budgetary Control A/C';
        }
        field(83; Committed; Boolean)
        {
            Caption = 'Committed';
        }
        field(84; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            trigger OnValidate()
            begin
                if "Currency Factor" <> 0 then
                    "NetAmount LCY" := "Net Amount" / "Currency Factor"
                else
                    "NetAmount LCY" := "Net Amount";
            end;
        }
        field(85; "NetAmount LCY"; Decimal)
        {
            Caption = 'NetAmount LCY';
        }
        field(86; "Applies-to Doc. Type"; Option)
        {
            Caption = 'Applies-to Doc. Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;

            trigger OnLookup()
            begin
                PHead.Reset();
                PHead.SetRange(PHead."No.", No);
                if PHead.FindFirst() then
                    if (PHead.Status = PHead.Status::Approved) or (PHead.Status = PHead.Status::Posted) or
                     (PHead.Status = PHead.Status::"Pending Approval") or (PHead.Status = PHead.Status::Cancelled) then
                        Error('You Cannot modify documents that are approved/posted/Send for Approval');
            end;

            trigger OnValidate()
            begin
                PHead.Reset();
                PHead.SetRange(PHead."No.", No);
                if PHead.FindFirst() then
                    if (PHead.Status = PHead.Status::Approved) or (PHead.Status = PHead.Status::Posted) or
                     (PHead.Status = PHead.Status::"Pending Approval") or (PHead.Status = PHead.Status::Cancelled) then
                        Error('You Cannot modify documents that are approved/posted/Send for Approval');
            end;
        }
        field(87; "Applies-to Doc. No."; Code[20])
        {
            Caption = 'Applies-to Doc. No.';

            trigger OnLookup()
            var
                VendLedgEntry: Record "Vendor Ledger Entry";
                PayToVendorNo: Code[20];
                OK: Boolean;
                Text000: Label 'You must specify %1 or %2.';
            begin
                //CODEUNIT.RUN(CODEUNIT::"Payment Voucher Apply",Rec);
                PHead.Reset();
                PHead.SetRange(PHead."No.", No);
                if PHead.FindFirst() then
                    if (PHead.Status = PHead.Status::Approved) or (PHead.Status = PHead.Status::Posted) or
                     (PHead.Status = PHead.Status::"Pending Approval") or (PHead.Status = PHead.Status::Cancelled) then
                        Error('You Cannot modify documents that are approved/posted/Send for Approval');

                if (Rec."Account Type" <> Rec."Account Type"::Customer) and (Rec."Account Type" <> Rec."Account Type"::Vendor) then
                    Error('You cannot apply to %1', "Account Type");

                Rec.Amount := 0;
                Rec.Validate(Amount);
                PayToVendorNo := Rec."Account No.";
                VendLedgEntry.SetCurrentKey("Vendor No.", Open);
                VendLedgEntry.SetRange("Vendor No.", PayToVendorNo);
                VendLedgEntry.SetRange(Open, true);
                if Rec."Applies-to ID" = '' then
                    Rec."Applies-to ID" := Rec.No;
                if Rec."Applies-to ID" = '' then
                    Error(
                      Text000,
                      Rec.FieldCaption(No), Rec.FieldCaption("Applies-to ID"));
                //ApplyVendEntries."SetPVLine-Delete"(PVLine,PVLine.FIELDNO("Applies-to ID"));
                ApplyVendEntries.SetPVLine(Rec, VendLedgEntry, Rec.FieldNo("Applies-to ID"));
                ApplyVendEntries.SetRecord(VendLedgEntry);
                ApplyVendEntries.SetTableView(VendLedgEntry);
                ApplyVendEntries.LookupMode(true);
                OK := ApplyVendEntries.RunModal() = Action::LookupOK;
                Clear(ApplyVendEntries);
                if not OK then
                    exit;
                VendLedgEntry.Reset();
                VendLedgEntry.SetCurrentKey("Vendor No.", Open);
                VendLedgEntry.SetRange("Vendor No.", PayToVendorNo);
                VendLedgEntry.SetRange(Open, true);
                VendLedgEntry.SetRange("Applies-to ID", Rec."Applies-to ID");
                if VendLedgEntry.Find('-') then begin
                    Rec."Applies-to Doc. Type" := 0;
                    Rec."Applies-to Doc. No." := '';
                end else
                    Rec."Applies-to ID" := '';

                //Calculate  Total To Apply
                VendLedgEntry.Reset();
                VendLedgEntry.SetCurrentKey("Vendor No.", Open, "Applies-to ID");
                VendLedgEntry.SetRange("Vendor No.", PayToVendorNo);
                VendLedgEntry.SetRange(Open, true);
                VendLedgEntry.SetRange("Applies-to ID", "Applies-to ID");
                if VendLedgEntry.Find('-') then begin
                    VendLedgEntry.CalcSums("Amount to Apply");
                    Amount := Abs(VendLedgEntry."Amount to Apply");
                    Validate(Amount);
                end;
            end;

            trigger OnValidate()
            begin
                //IF "Applies-to Doc. No." <> '' THEN
                //TESTFIELD("Bal. Account No.",'');

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

                PHead.Reset();
                PHead.SetRange(PHead."No.", No);
                if PHead.FindFirst() then
                    if (PHead.Status = PHead.Status::Approved) or (PHead.Status = PHead.Status::Posted) or
                     (PHead.Status = PHead.Status::"Pending Approval") or (PHead.Status = PHead.Status::Cancelled) then
                        Error('You Cannot modify documents that are approved/posted/Send for Approval');
            end;
        }
        field(88; "Applies-to ID"; Code[20])
        {
            Caption = 'Applies-to ID';

            trigger OnLookup()
            begin
                PHead.Reset();
                PHead.SetRange(PHead."No.", No);
                if PHead.FindFirst() then
                    if (PHead.Status = PHead.Status::Approved) or (PHead.Status = PHead.Status::Posted) or
                     (PHead.Status = PHead.Status::"Pending Approval") or (PHead.Status = PHead.Status::Cancelled) then
                        Error('You Cannot modify documents that are approved/posted/Send for Approval');
            end;

            trigger OnValidate()
            var
                TempVendLedgEntry: Record "Vendor Ledger Entry";
            begin
                //IF "Applies-to ID" <> '' THEN
                //  TESTFIELD("Bal. Account No.",'');
                PHead.Reset();
                PHead.SetRange(PHead."No.", No);
                if PHead.FindFirst() then
                    if (PHead.Status = PHead.Status::Approved) or (PHead.Status = PHead.Status::Posted) or
                     (PHead.Status = PHead.Status::"Pending Approval") or (PHead.Status = PHead.Status::Cancelled) then
                        Error('You Cannot modify documents that are approved/posted/Send for Approval');

                if ("Applies-to ID" <> xRec."Applies-to ID") and (xRec."Applies-to ID" <> '') then begin
                    VendLedgEntry.SetCurrentKey("Vendor No.", Open);
                    VendLedgEntry.SetRange("Vendor No.", "Account No.");
                    VendLedgEntry.SetRange(Open, true);
                    VendLedgEntry.SetRange("Applies-to ID", xRec."Applies-to ID");
                    if VendLedgEntry.FindFirst() then
                        VendEntrySetApplID.SetApplId(VendLedgEntry, TempVendLedgEntry, '');

                    VendLedgEntry.Reset();
                end;
            end;
        }
        field(90; "Retention Code"; Code[20])
        {
            TableRelation = "Tariff Codes".Code where(Type = const(Retention));
            Caption = 'Retention Code';
            trigger OnValidate()
            begin
                if TariffCode.Get("Retention Code") then
                    "Retention Rate" := TariffCode.Percentage
                else
                    "Retention Rate" := 0;

                CalculateTax();
            end;
        }
        field(91; "Retention  Amount"; Decimal)
        {
            Caption = 'Retention  Amount';
        }
        field(92; "Retention Rate"; Decimal)
        {
            Caption = 'Retention Rate';
        }
        field(93; "W/Tax Rate"; Decimal)
        {
            Caption = 'W/Tax Rate';
        }
        field(94; "Vendor Bank Account"; Code[20])
        {
            TableRelation = if ("Account Type" = const(Vendor)) "Vendor Bank Account".Code where("Vendor No." = field("Account No."));
            Caption = 'Vendor Bank Account';
            trigger OnLookup()
            begin
                PHead.Reset();
                PHead.SetRange(PHead."No.", No);
                if PHead.FindFirst() then
                    if (PHead.Status = PHead.Status::Approved) or (PHead.Status = PHead.Status::Posted) or
                     (PHead.Status = PHead.Status::"Pending Approval") or (PHead.Status = PHead.Status::Cancelled) then
                        Error('You Cannot modify documents that are approved/posted/Send for Approval');
            end;

            trigger OnValidate()
            begin
                PHead.Reset();
                PHead.SetRange(PHead."No.", No);
                if PHead.FindFirst() then
                    if (PHead.Status = PHead.Status::Approved) or (PHead.Status = PHead.Status::Posted) or
                     (PHead.Status = PHead.Status::"Pending Approval") or (PHead.Status = PHead.Status::Cancelled) then
                        Error('You Cannot modify documents that are approved/posted/Send for Approval');
            end;
        }
        field(95; "Trip No"; Code[20])
        {
            Caption = 'Trip No';
        }
        field(96; "Driver No"; Code[20])
        {
            Caption = 'Driver No';
        }
        field(97; "Loan No"; Integer)
        {
            Caption = 'Loan No';
        }
        field(98; "Grant No"; Code[20])
        {
            TableRelation = Jobs."No." where("Currency Code" = field("Currency Code"),
                                              "Approval Status" = const(Approved),
                                              Status = const(Contract));
            Caption = 'Grant No';
            trigger OnValidate()
            begin
                job.Reset();
                if job.Get("Grant No") then
                    "Account Type" := "Account Type"::Customer;
                //"Account No.":=job."Bill-to Partner No.";
                //VALIDATE("Account No.");
                //"Account Name":=job.Description;
            end;
        }
        field(99; "Grant Phase"; Code[10])
        {
            Caption = 'Grant Phase';
            //TableRelation = Table39004335;
        }
        field(100; "Installment No"; Integer)
        {
            Caption = 'Installment No';
        }
        field(101; "Job-Planning Line No"; Integer)
        {
            Caption = 'Job-Planning Line No';
            //TableRelation = Table39004345.Field1 where (Field2=field("Grant No"),
            //Field50008 =field("Account No."));
        }
        field(102; "Job No."; Code[10])
        {
            TableRelation = Job."No.";
            Caption = 'Job No.';
            trigger OnValidate()
            begin
                CheckWipAccount();
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
                ShowDimensions();
            end;
        }
        field(50000; "Property Code"; Code[30])
        {
            Caption = 'Property Code';
            //TableRelation = Table39006123.Field1;
        }
        field(50001; "Transaction Code"; Code[30])
        {
            Caption = 'Transaction Code';
            //TableRelation = Table39006120.Field1;
        }
        field(50002; "Entry Type[Income/Expense]"; Option)
        {
            OptionCaption = ' ,Income,Expense';
            OptionMembers = " ",Income,Expense;
            Caption = 'Entry Type[Income/Expense]';
        }
        field(50003; "Asset No"; Code[10])
        {
            TableRelation = "Fixed Asset"."No.";
            Caption = 'Asset No';
        }
        field(56000; "Invoice No."; Code[20])
        {
            TableRelation = "Vendor Ledger Entry"."Document No." where(Open = const(true),
                                                                        "Document Type" = const(Invoice),
                                                                        "Vendor No." = field("Account No."));
            Caption = 'Invoice No.';
            trigger OnValidate()
            begin
                VendLedger.Reset();
                VendLedger.SetRange(VendLedger."Document No.", "Invoice No.");
                VendLedger.SetRange(VendLedger."Vendor No.", "Account No.");
                VendLedger.SetRange(VendLedger."Document Type", VendLedger."Document Type"::Invoice);
                if VendLedger.FindFirst() then begin
                    VendLedger.CalcFields("Remaining Amount");
                    Amount := -VendLedger."Remaining Amount";
                    "Due Date" := VendLedger."Due Date";
                end
            end;
        }
        field(56001; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(56002; "VAT Withhelding Amount"; Decimal)
        {
            Caption = 'VAT Withhelding Amount';
        }
        field(56003; "VAT Withheld Code"; Code[10])
        {
            TableRelation = "Tariff Codes".Code where(Type = const(VAT));
            Caption = 'VAT Withheld Code';
        }
        field(56004; "VAT 6% Rate"; Decimal)
        {
            Caption = 'VAT 6% Rate';
        }
    }

    keys
    {
        key(Key1; "Line No.", No, Type)
        {
            Clustered = true;
            SumIndexFields = Amount, "VAT Amount", "Withholding Tax Amount", "Net Amount", "NetAmount LCY", "Retention  Amount";
        }
    }

    fieldgroups { }

    trigger OnDelete()
    begin
        PHead.Reset();
        PHead.SetRange(PHead."No.", No);
        if PHead.FindFirst() then
            if
            (PHead.Status = PHead.Status::Approved) or
             (PHead.Status = PHead.Status::Posted) or
            (PHead.Status = PHead.Status::"Pending Approval") or (PHead.Status = PHead.Status::Cancelled) then
                Error('You Cannot Delete this record its already approved/posted/Send for Approval');
        TestField(Committed, false);
    end;

    trigger OnInsert()
    begin

        if No = '' then begin
            GenLedgerSetup.Get();
            GenLedgerSetup.TestField(GenLedgerSetup."Normal Payments No");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Normal Payments No", xRec."No. Series", 0D, No, "No. Series");
        end;
        PHead.Reset();
        PHead.SetRange(PHead."No.", No);
        if PHead.FindFirst() then begin
            Date := PHead.Date;
            PHead.TestField("Responsibility Center");
            Validate("Global Dimension 1 Code", PHead."Global Dimension 1 Code");
            Validate("Shortcut Dimension 2 Code", PHead."Shortcut Dimension 2 Code");
            //VALIDATE("Shortcut Dimension 3 Code",PHead."Shortcut Dimension 3 Code");
            //VALIDATE("Shortcut Dimension 4 Code",PHead."Shortcut Dimension 4 Code");
            "Dimension Set ID" := PHead."Dimension Set ID";
            "Currency Code" := PHead."Currency Code";
            "Currency Factor" := PHead."Currency Factor";
            "Payment Type" := PHead."Payment Type";
        end;

        //
        PHead.Reset();
        PHead.SetRange(PHead."No.", No);
        if PHead.FindFirst() then
            if
            //  (PHead.Status=PHead.Status::Approved)
            (PHead.Status = PHead.Status::Posted) or
             (PHead.Status = PHead.Status::"Pending Approval") or (PHead.Status = PHead.Status::Cancelled) then
                Error('You Cannot modify documents that are approved/posted/Send for Approval');
        TestField(Committed, false);
    end;

    trigger OnModify()
    begin
        PHead.Reset();
        PHead.SetRange(PHead."No.", No);
        if PHead.FindFirst() then
            if (PHead.Status = PHead.Status::Approved) or (PHead.Status = PHead.Status::Posted) or
             (PHead.Status = PHead.Status::"Pending Approval") then
                Error('You Cannot modify documents that are approved/posted/Send for Approval');
        TestField(Committed, false);
    end;

    var
        PH: Record "Payments Header";
        BSetup: Record "Farmer Purchase Broker Setup";
        VLedgEntry: Record "Vendor Ledger Entry";
        ICPartner: Record "IC Partner";
        FPurch: Record "Purch. Inv. Header";
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
        PHead: Record "Payments Header";
        VendLedgEntry: Record "Vendor Ledger Entry";
        VendEntrySetApplID: Codeunit "Vend. Entry-SetAppl.ID";
        GenJnlApply: Codeunit "Gen. Jnl.-Apply";
        GenJnILine: Record "Gen. Journal Line";
        ApplyVendEntries: Page "Apply Vendor Entries";
        TariffCode: Record "Tariff Codes";
        DimMgt: Codeunit DimensionManagement;
        VendLedger: Record "Vendor Ledger Entry";
        job: Record "HR Employee Qualifications";


    procedure SetAmountToApply(AppliesToDocNo: Code[20]; VendorNo: Code[20])
    var
        VendLedgEntry: Record "Vendor Ledger Entry";
    begin
        VendLedgEntry.SetCurrentKey("Document No.");
        VendLedgEntry.SetRange("Document No.", AppliesToDocNo);
        VendLedgEntry.SetRange("Vendor No.", VendorNo);
        VendLedgEntry.SetRange(Open, true);
        if VendLedgEntry.FindFirst() then begin
            if VendLedgEntry."Amount to Apply" = 0 then begin
                VendLedgEntry.CalcFields("Remaining Amount");
                VendLedgEntry."Amount to Apply" := VendLedgEntry."Remaining Amount";
            end else
                VendLedgEntry."Amount to Apply" := 0;
            VendLedgEntry."Accepted Payment Tolerance" := 0;
            VendLedgEntry."Accepted Pmt. Disc. Tolerance" := false;
            Codeunit.Run(Codeunit::"Vend. Entry-Edit", VendLedgEntry);
        end;
    end;


    procedure CalculateTax()
    var
        CalculationType: Option VAT,"W/Tax",Retention,VAT6;
        TaxCalc: Codeunit "Tax Calculation";
        TotalTax: Decimal;
    begin
        "VAT Amount" := 0;
        "Withholding Tax Amount" := 0;
        "Retention  Amount" := 0;
        TotalTax := 0;
        "Net Amount" := 0;
        if Amount <> 0 then begin
            if "VAT Rate" <> 0 then begin
                "VAT Amount" := TaxCalc.CalculateTax(Rec, CalculationType::VAT);
                TotalTax := TotalTax + "VAT Amount"
            end;

            if "W/Tax Rate" <> 0 then begin
                "Withholding Tax Amount" := TaxCalc.CalculateTax(Rec, CalculationType::"W/Tax");
                TotalTax := TotalTax + "Withholding Tax Amount"
            end;

            if "Retention Rate" <> 0 then begin
                "Retention  Amount" := TaxCalc.CalculateTax(Rec, CalculationType::Retention);
                TotalTax := TotalTax + "Retention  Amount"
            end;

            "VAT Withhelding Amount" := 0;
            if "VAT 6% Rate" <> 0 then
                "VAT Withhelding Amount" := (Amount - "VAT Amount") * ("VAT 6% Rate") / 100;



        end;
        "Net Amount" := Amount - "Withholding Tax Amount" - "VAT Withhelding Amount" - "Retention  Amount";
        //"Net Amount":=Amount-TotalTax;
        Validate("Net Amount");
    end;


    procedure PayLinesExist(): Boolean
    var
        PayLine: Record "Payment Line";
    begin
        PayLine.Reset();
        PayLine.SetRange(No, No);
        exit(PayLine.FindFirst());
    end;


    procedure ShowDimensions()
    begin
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', 'Payment', "Line No."));
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
        if "Account No." <> FAWIPJobPostingGrp."WIP Costs Account" then
            Error('Insert the right WIP Account %1', FAWIPJobPostingGrp."WIP Costs Account");
    end;
}
