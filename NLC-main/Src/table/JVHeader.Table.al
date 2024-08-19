#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193687 "JV Header"
{
    Caption = 'JV Header';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';

            trigger OnValidate()
            begin
                if "Document No." <> xRec."Document No." then begin
                    //  GenLedgerSetup.GET;
                    NoSeriesMgt.TestManual("No. Series");
                    "No. Series" := '';
                end;
            end;
        }
        field(3; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";

            trigger OnValidate()
            begin
                if "Account Type" <> xRec."Account Type" then
                    "Account No." := '';
            end;
        }
        field(4; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account" where("Account Type" = const(Posting),
                                                                                          Blocked = const(false),
                                                                                          "Direct Posting" = const(true),
                                                                                          test = field("Expense Code"))
            else
            if ("Account Type" = const(Customer)) Customer
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
                if "Account No." <> xRec."Account No." then
                    Description := GetAccountDescription();
            end;
        }
        field(5; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            ClosingDates = true;
        }
        field(6; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(8; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(10; "VAT %"; Decimal)
        {
            Caption = 'VAT %';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MaxValue = 100;
            MinValue = 0;
        }
        field(12; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(13; Amount; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Amount';
        }
        field(14; "Debit Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Debit Amount';
        }
        field(15; "Credit Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Credit Amount';
        }
        field(16; "Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount (LCY)';
            Editable = false;
        }
        field(17; "Balance (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Balance (LCY)';
            Editable = false;
        }
        field(18; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;
        }
        field(24; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(25; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(35; "Applies-to Doc. Type"; Option)
        {
            Caption = 'Applies-to Doc. Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(36; "Applies-to Doc. No."; Code[20])
        {
            Caption = 'Applies-to Doc. No.';

        }
        field(42; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = Job;
        }
        field(43; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(47; "Payment Terms Code"; Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";
        }
        field(48; "Applies-to ID"; Code[50])
        {
            Caption = 'Applies-to ID';
        }
        field(52; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(76; "Document Date"; Date)
        {
            Caption = 'Document Date';
            ClosingDates = true;
        }
        field(77; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(1001; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No."));
        }
        field(5700; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center BR 2";
        }
        field(39004240; Status; Option)
        {
            Description = 'Stores the status of the record in the database';
            Editable = false;
            OptionMembers = Pending,"Pending Approval",Approved,Posted,Cancelled;
            Caption = 'Status';
        }
        field(39004241; "Net Amount"; Decimal)
        {
            CalcFormula = sum("JV Lines".Amount where("Document No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Net Amount';
        }
        field(39004242; "User Id"; Code[50])
        {
            Caption = 'User Id';
        }
        field(39004243; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }
        field(39004244; "Expense Code"; Code[10])
        {
            TableRelation = "Expense Code".Code;
            Caption = 'Expense Code';
        }
        field(39004245; Posted; Boolean)
        {
            Editable = false;
            Caption = 'Posted';
        }
        field(39004246; "DateTime Posted"; DateTime)
        {
            Caption = 'DateTime Posted';
        }
        field(39004247; "Posted By"; Code[50])
        {
            Caption = 'Posted By';
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        if "Document No." = '' then begin
            CashOfficeSetup.Get();
            TestNoSeries();
            NoSeriesMgt.InitSeries(GetNoSeriesCode(), xRec."No. Series", 0D, "Document No.", "No. Series");
            //     NoSeriesMgt.InitSeries(GenLedgerSetup."Other Staff Advance No.",xRec."No. Series",0D,"No.","No. Series");
        end;
        "Posting Date" := Today;
        "Document Date" := Today;
        "User Id" := UserId;
    end;

    var
        CashOfficeSetup: Record "Cash Office Setup";
        DimMgt: Codeunit DimensionManagement;
        NoSeriesMgt: Codeunit NoSeriesManagement;

    local procedure TestNoSeries(): Boolean
    begin
        CashOfficeSetup.TestField("Journal Voucher Nos")
    end;

    local procedure GetNoSeriesCode(): Code[10]
    var
        NoSrsRel: Record "No. Series Relationship";
        NoSeriesCode: Code[20];
    begin
        NoSeriesCode := CashOfficeSetup."Journal Voucher Nos";

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
          DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', 'Journal Vopucher', "Document No."));
        //VerifyItemLineDim;
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
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
            NoSrsRel.SETRANGE("Series Filter","Shortcut Dimension 1 Code");
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
           //END;
           END;
          ELSE EXIT(NoSeriesCode);
        END;
        */

    end;


    procedure GetAccountDescription(): Text[50]
    var
        GlAcc: Record "G/L Account";
        Vendor: Record Vendor;
        Customer: Record Customer;
        BankAcc: Record "Bank Account";
    begin
        if "Account Type" = "Account Type"::"G/L Account" then
            if GlAcc.Get("Account No.") then
                exit(GlAcc.Name)
            else
                if "Account Type" = "Account Type"::"Bank Account" then
                    if BankAcc.Get("Account No.") then
                        exit(BankAcc.Name)
                    else
                        if "Account Type" = "Account Type"::Vendor then
                            if Vendor.Get("Account No.") then
                                exit(Vendor.Name)
                            else
                                if "Account Type" = "Account Type"::Customer then
                                    if Customer.Get("Account No.") then
                                        exit(Customer.Name)
                                    else
                                        exit('Description');
    end;
}
