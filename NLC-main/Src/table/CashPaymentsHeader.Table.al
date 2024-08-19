#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193621 "Cash Payments Header"
{
    LookupPageId = "Released PR Store Requisition";
    Caption = 'Cash Payments Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "No."; Code[20])
        {
            Description = 'Stores the reference of the payment voucher in the database';
            NotBlank = false;
            Caption = 'No.';
        }
        field(2; Date; Date)
        {
            Description = 'Stores the date when the payment voucher was inserted into the system';
            Caption = 'Date';
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
            Editable = false;
            Enabled = true;
            TableRelation = Currency;
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
        field(19; "Posted By"; Code[20])
        {
            Description = 'Stores the name of the person who posted the payment voucher';
            Caption = 'Posted By';
        }
        field(20; "Total Amount"; Decimal)
        {
            CalcFormula = sum("Cash Payment Line".Amount where(No = field("No."),
                                                                "Account Type" = filter(<> Staff)));
            Description = 'Stores the amount of the payment voucher';
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Total Amount';
        }
        field(28; "Paying Bank Account"; Code[20])
        {
            Description = 'Stores the name of the paying bank account in the database';
            TableRelation = "Bank Account"."No." where("Bank Type" = const(Cash));
            Caption = 'Paying Bank Account';
            trigger OnValidate()
            begin
                BankAcc.Reset();
                "Bank Name" := '';
                if BankAcc.Get("Paying Bank Account") then begin
                    "Bank Name" := BankAcc.Name;
                    "Currency Code" := BankAcc."Currency Code";
                    Validate("Currency Code");
                end;
            end;
        }
        field(30; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            Description = 'Stores the reference to the first global dimension in the database';
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
        field(35; Status; Option)
        {
            Description = 'Stores the status of the record in the database';
            OptionMembers = Pending,"1st Approval","2nd Approval","Cheque Printing",Posted,Cancelled,Checking,VoteBook;
            Caption = 'Status';
        }
        field(38; "Payment Type"; Option)
        {
            OptionMembers = Normal,"Petty Cash";
            Caption = 'Payment Type';
        }
        field(56; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
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
            CalcFormula = sum("Cash Payment Line"."VAT Amount" where(No = field("No."),
                                                                      "Account Type" = filter(<> Staff)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Total VAT Amount';
        }
        field(63; "Total Witholding Tax Amount"; Decimal)
        {
            CalcFormula = sum("Cash Payment Line"."Withholding Tax Amount" where(No = field("No."),
                                                                                  "Account Type" = filter(<> Staff)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Total Witholding Tax Amount';
        }
        field(64; "Total Net Amount"; Decimal)
        {
            CalcFormula = sum("Cash Payment Line"."Net Amount" where(No = field("No."),
                                                                      "Account Type" = filter(<> Staff)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Total Net Amount';
        }
        field(65; "Total Pending Voucher Amount"; Decimal)
        {
            CalcFormula = sum("Cash Payment Line"."Net Amount" where(No = field("No."),
                                                                      "Account Type" = const(Staff)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Total Pending Voucher Amount';
        }
        field(66; "No. Printed"; Integer)
        {
            Caption = 'No. Printed';
        }
        field(67; "Current Source A/C Bal."; Decimal)
        {
            Caption = 'Current Source A/C Bal.';
        }
        field(68; "Register Number"; Integer)
        {
            Caption = 'Register Number';
        }
        field(69; "From Entry No."; Integer)
        {
            Caption = 'From Entry No.';
        }
        field(70; "To Entry No."; Integer)
        {
            Caption = 'To Entry No.';
        }
        field(81; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";

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
            GenLedgerSetup.Get();
            if "Payment Type" = "Payment Type"::Normal then begin
                GenLedgerSetup.TestField(GenLedgerSetup."Normal Payments No");
                NoSeriesMgt.InitSeries(GenLedgerSetup."Normal Payments No", xRec."No. Series", 0D, "No.", "No. Series");
            end
            else begin
                GenLedgerSetup.TestField(GenLedgerSetup."Petty Cash Payments No");
                NoSeriesMgt.InitSeries(GenLedgerSetup."Petty Cash Payments No", xRec."No. Series", 0D, "No.", "No. Series");
            end;
        end;
        UserTemplate.Reset();
        UserTemplate.SetRange(UserTemplate.UserID, UserId);
        if UserTemplate.FindFirst() then begin
            "Paying Bank Account" := UserTemplate."Default Petty Cash Bank";
            Validate("Paying Bank Account");
        end;
        Date := Today;
        Cashier := UserId;
        Validate(Cashier);
    end;

    trigger OnModify()
    begin
        //get the details of the dimensions and transfer the same to the lines
        CashPLine.Reset();
        CashPLine.SetRange(CashPLine.No, "No.");
        if CashPLine.FindFirst() then
            repeat
                CashPLine."Global Dimension 1 Code" := "Global Dimension 1 Code";
                CashPLine."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                CashPLine.Modify();
            until CashPLine.Next() = 0;
    end;

    var
        CashPLine: Record "Cash Payment Line";
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
        Committed: Record Committment;
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
        CommitmentEntries: Record Committment;
        CommittedAmount: Decimal;
        MonthBudget: Decimal;
        Expenses: Decimal;
        Header: Text[250];
        "Date From": Text[30];
        "Date To": Text[30];
        LastDay: Date;
        TotAmt: Decimal;
        DimVal: Record "Dimension Value";
        RespCenter: Record "Responsibility Center";
        UserMgt: Codeunit "User Setup Management";
        Text001: Label 'Your identification is set up to process from %1 %2 only.';
}
