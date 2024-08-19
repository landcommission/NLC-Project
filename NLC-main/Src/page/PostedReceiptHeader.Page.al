#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193726 "Posted Receipt Header"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = Document;
    SourceTable = "Receipts Header";
    SourceTableView = where("Receipt Type" = const(Bank),
                            Posted = const(true));
    ApplicationArea = All;
    Caption = 'Posted Receipt Header';
    layout
    {
        area(Content)
        {
            group(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                    trigger OnValidate()
                    begin
                        FunctionName := '';
                        DimVal.Reset();
                        DimVal.SetRange(DimVal."Global Dimension No.", 1);
                        DimVal.SetRange(DimVal.Code, Rec."Global Dimension 1 Code");
                        if DimVal.Find('-') then
                            FunctionName := DimVal.Name;
                    end;
                }
                field(FunctionName; FunctionName)
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                    trigger OnValidate()
                    begin
                        BudgetCenterName := '';
                        DimVal.Reset();
                        DimVal.SetRange(DimVal."Global Dimension No.", 2);
                        DimVal.SetRange(DimVal.Code, Rec."Shortcut Dimension 2 Code");
                        if DimVal.Find('-') then
                            BudgetCenterName := DimVal.Name;
                    end;
                }
                field(BudgetCenterName; BudgetCenterName)
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Bank Code field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Amount Recieved"; Rec."Amount Recieved")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Amount Recieved field.';
                }
                field("Received From"; Rec."Received From")
                {
                    ApplicationArea = Basic;
                    Editable = StatusEditable;
                    ToolTip = 'Specifies the value of the Received From field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field(Cashier; Rec.Cashier)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cashier field.';
                }
                field("Date Posted"; Rec."Date Posted")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Posted field.';
                }
                field("Time Posted"; Rec."Time Posted")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Time Posted field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
            }
            part(Control1000000000; "Receipts Line")
            {
                Editable = StatusEditable;
                SubPageLink = No = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    if Rec.Posted = false then
                        Error('Post the receipt before printing.');
                    Rec.Reset();
                    Rec.SetFilter(Rec."No.", Rec."No.");
                    Report.Run(39005883, true, true, Rec);
                    Rec.Reset();
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Caption = 'Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    //Check Post Dated
                    if CheckPostDated() then
                        Error('One of the Receipt Lines is Post Dated');

                    //Post the transaction into the database
                    PerformPost();
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //OnAfterGetCurrRecord;
        CurrPageUpdate();
    end;


    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetSalesFilter();
        //Add dimensions if set by default here
        Rec."Global Dimension 1 Code" := UserMgt.GetSetDimensions(UserId, 1);
        Rec."Shortcut Dimension 2 Code" := UserMgt.GetSetDimensions(UserId, 2);
        Rec."Shortcut Dimension 3 Code" := UserMgt.GetSetDimensions(UserId, 3);
        Rec.Validate(Rec."Shortcut Dimension 3 Code");
        Rec."Shortcut Dimension 4 Code" := UserMgt.GetSetDimensions(UserId, 4);
        Rec.Validate(Rec."Shortcut Dimension 4 Code");
        Rec.Status := Rec.Status::" ";
        Rec."Receipt Type" := Rec."Receipt Type"::Bank;

        UpdateControls();
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        UpdateControls();
    end;

    trigger OnOpenPage()
    begin

        UserSetup.Reset();

        if UserSetup.Get(UserId) then begin
            JTemplate := UserSetup."Receipt Journal Template";
            JBatch := UserSetup."Receipt Journal Batch";
        end;
        if (JTemplate = '') or (JBatch = '') then;
        //ERROR('Please contact the system administrator to be setup as a receipting user');
        if UserSetup."Default Receipts Bank" = '' then;
        //ERROR('Please contact the system administrator to be setup as a receipting user');

        //***************************JACK***************************//
        //  SETRANGE("Created By",USERID);
        if UserMgt.GetSalesFilter() <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange(Rec."Responsibility Center", UserMgt.GetSalesFilter());
            Rec.FilterGroup(0);
        end;

        //***************************END ***************************//
    end;

    var
        GenJnlLine: Record "Gen. Journal Line";
        ReceiptLine: Record "Receipt Line";
        tAmount: Decimal;
        DefaultBatch: Record "Gen. Journal Batch";
        FunctionName: Text[100];
        BudgetCenterName: Text[100];
        BankName: Text[100];
        Rcpt: Record "Receipts Header";
        RcptNo: Code[20];
        DimVal: Record "Dimension Value";
        BankAcc: Record "Bank Account";
        UserSetup: Record "Cash Office User Template";
        JTemplate: Code[10];
        JBatch: Code[10];
        GLine: Record "Gen. Journal Line";
        LineNo: Integer;
        BAmount: Decimal;
        SRSetup: Record "Sales & Receivables Setup";
        PCheck: Codeunit "Posting Check FP";
        Post: Boolean;
        USetup: Record "Cash Office User Template";
        RegMgt: Codeunit "Register Management";
        RegisterNumber: Integer;
        FromNumber: Integer;
        ToNumber: Integer;
        StrInvoices: Text[250];
        Appl: Record "Workplan Activities";
        UserMgt: Codeunit "User Setup Management BR";
        JournalPosted: Codeunit "Journal Post Successful";
        AdjustGenJnl: Codeunit "Adjust Gen. Journal Balance";
        IsCashAccount: Boolean;
        StatusEditable: Boolean;


    procedure PerformPost()
    begin
        //get all the invoices that have been paid for using the receipt
        StrInvoices := '';
        Appl.Reset();
        ///Appl.SETRANGE(Appl."Activity Code",Appl."Activity Code"::"1");
        Appl.SetRange(Appl."Activity Description", Rec."No.");
        if Appl.FindFirst() then
            repeat
            ///     StrInvoices:=StrInvoices + ',' + Appl."Date Filter";
            until Appl.Next() = 0;

        //Cater for Cash Accounts
        IsCashAccount := false;
        BankAcc.Reset();
        if BankAcc.Get(Rec."Bank Code") then
            if BankAcc."Bank Type" = BankAcc."Bank Type"::Cash then
                IsCashAccount := true;

        if IsCashAccount then
            Rec.TestField(Rec.Date, WorkDate());
        //End Cater for Cash Account


        USetup.Reset();
        USetup.SetRange(USetup.UserID, UserId);
        if USetup.FindFirst() then begin
            if USetup."Receipt Journal Template" = '' then
                Error('Please ensure that the Administrator sets you up as a cashier');
            if USetup."Receipt Journal Batch" = '' then
                Error('Please ensure that the Administrator sets you up as a cashier');
            if USetup."Default Receipts Bank" = '' then
                Error('Please ensure that the Administrator sets you up as a cashier');
        end
        else
            Error('Please ensure that the Administrator sets you up as a cashier');


        //check if the receipt has any post dated cheques.
        //check if the amounts are similar

        Rec.CalcFields(Rec."Total Amount");
        if Rec."Total Amount" <> Rec."Amount Recieved" then
            Error('Please note that the Total Amount and the Amount Received Must be the same');

        //if any then the amount to be posted must be less the post dated amount
        if Rec.Posted = true then
            Error('A Transaction Posted cannot be posted again');

        //check if the person received from has been selected
        Rec.TestField(Rec.Date);
        Rec.TestField(Rec."Bank Code");
        Rec.TestField(Rec."Global Dimension 1 Code");
        Rec.TestField(Rec."Shortcut Dimension 2 Code");
        Rec.TestField(Rec."Received From");
        /*Check if the amount received is equal to the total amount*/
        tAmount := 0;

        //Check Bank
        CheckBnkCurrency(Rec."Bank Code", Rec."Currency Code");

        ReceiptLine.Reset();
        ReceiptLine.SetRange(ReceiptLine.No, Rec."No.");
        if ReceiptLine.Find('-') then
            repeat
                if ReceiptLine."Pay Mode" = ReceiptLine."Pay Mode"::" " then
                    Error('Paymode is Mandatory on the Receipt Line');

                if ReceiptLine."Pay Mode" = ReceiptLine."Pay Mode"::"Deposit Slip" then begin
                    if ReceiptLine."Cheque/Deposit Slip No" = '' then
                        Error('The Cheque/Deposit Slip No must be inserted');
                    if ReceiptLine."Cheque/Deposit Slip Date" = 0D then
                        Error('The Cheque/Deposit Date must be inserted');
                    if ReceiptLine."Transaction No." = '' then
                        Error('Please ensure that the Transaction Number is inserted');
                    if ReceiptLine.Type = '' then
                        Error('Please ensure that the Receipt Type is inserted');

                end;

                if ReceiptLine."Pay Mode" = ReceiptLine."Pay Mode"::Cheque then begin
                    if ReceiptLine."Cheque/Deposit Slip No" = '' then
                        Error('The Cheque/Deposit Slip No must be inserted');
                    if ReceiptLine."Cheque/Deposit Slip Date" = 0D then
                        Error('The Cheque/Deposit Date must be inserted');
                    /*
                    IF ReceiptLine."Pay Mode"=ReceiptLine."Pay Mode"::Cheque THEN
                      BEGIN
                        IF STRLEN(ReceiptLine."Cheque/Deposit Slip No")<>6 THEN
                          BEGIN
                            ERROR ('Invalid Cheque Number inserted');
                          END;
                      END;
                    */
                end;
                tAmount := tAmount + ReceiptLine.Amount;
            until ReceiptLine.Next() = 0;



        // DELETE ANY LINE ITEM THAT MAY BE PRESENT
        GenJnlLine.Reset();
        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
        GenJnlLine.DeleteAll();

        if DefaultBatch.Get(JTemplate, JBatch) then
            DefaultBatch.Delete();

        DefaultBatch.Reset();
        DefaultBatch."Journal Template Name" := JTemplate;
        DefaultBatch.Name := JBatch;
        DefaultBatch.Insert();

        /*Insert the bank transaction*/
        if BAmount < tAmount then begin
            GenJnlLine.Init();
            GenJnlLine."Journal Template Name" := JTemplate;
            GenJnlLine."Journal Batch Name" := JBatch;
            GenJnlLine."Source Code" := 'CASHRECJNL';
            GenJnlLine."Line No." := 1;
            GenJnlLine."Posting Date" := Rec.Date;
            GenJnlLine."Document No." := Rec."No.";
            GenJnlLine."Document Date" := Rec."Document Date";
            GenJnlLine."Account Type" := GenJnlLine."Account Type"::"Bank Account";

            GenJnlLine."Account No." := Rec."Bank Code";//USetup."Default Receipts Bank";
            GenJnlLine.Validate(GenJnlLine."Account No.");
            GenJnlLine."Currency Code" := Rec."Currency Code";
            GenJnlLine.Validate(GenJnlLine."Currency Code");
            GenJnlLine.Amount := (tAmount);
            GenJnlLine.Validate(GenJnlLine.Amount);

            GenJnlLine."Shortcut Dimension 1 Code" := Rec."Global Dimension 1 Code";
            GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
            GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
            GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
            GenJnlLine.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
            GenJnlLine.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");

            GenJnlLine.Description := CopyStr('On Behalf Of:' + Rec."Received From" + 'Invoices:' + StrInvoices, 1, 50);
            GenJnlLine.Validate(GenJnlLine.Description);
            if GenJnlLine.Amount <> 0 then
                GenJnlLine.Insert();




            //insert the transaction lines into the database
            ReceiptLine.Reset();
            ReceiptLine.SetRange(ReceiptLine.No, Rec."No.");
            ReceiptLine.SetRange(ReceiptLine.Posted, false);

            if ReceiptLine.Find('-') then
                repeat
                    if ReceiptLine.Amount = 0 then
                        Error('Please enter amount.');

                    if ReceiptLine.Amount < 0 then
                        Error('Amount cannot be less than zero.');

                    ReceiptLine.TestField(ReceiptLine."Global Dimension 1 Code");

                    ReceiptLine.TestField(ReceiptLine."Shortcut Dimension 2 Code");

                    //get the last line number from the general journal line
                    GLine.Reset();
                    GLine.SetRange(GLine."Journal Template Name", JTemplate);
                    GLine.SetRange(GLine."Journal Batch Name", JBatch);
                    LineNo := 0;
                    if GLine.Find('+') then
                        LineNo := GLine."Line No.";
                    LineNo := LineNo + 1;
                    if ReceiptLine."Pay Mode" <> ReceiptLine."Pay Mode"::Cheque then begin
                        GenJnlLine.Init();
                        GenJnlLine."Journal Template Name" := JTemplate;
                        GenJnlLine."Journal Batch Name" := JBatch;
                        GenJnlLine."Source Code" := 'CASHRECJNL';
                        GenJnlLine."Line No." := LineNo;
                        GenJnlLine."Posting Date" := Rec.Date;
                        GenJnlLine."Document No." := ReceiptLine.No;
                        GenJnlLine."Document Date" := Rec."Document Date";
                        /*IF ReceiptLine."Customer Payment On Account" THEN
                          BEGIN
                            {SRSetup.GET();
                            GenJnlLine."Account Type":=GenJnlLine."Account Type"::"G/L Account";
                            GenJnlLine."Account No.":=SRSetup."Receivable Batch Account";}

                            GenJnlLine."Account Type":=ReceiptLine."Account Type";
                            GenJnlLine."Account No.":=ReceiptLine."Account No.";

                          END
                        ELSE
                          BEGIN
                            GenJnlLine."Account Type":=ReceiptLine."Account Type";
                            GenJnlLine."Account No.":=ReceiptLine."Account No.";
                          END;*/
                        GenJnlLine."Account Type" := ReceiptLine."Account Type";
                        GenJnlLine."Account No." := ReceiptLine."Account No.";

                        GenJnlLine.Validate(GenJnlLine."Account No.");
                        GenJnlLine."External Document No." := ReceiptLine."Cheque/Deposit Slip No";
                        GenJnlLine."Currency Code" := Rec."Currency Code";
                        GenJnlLine.Validate(GenJnlLine."Currency Code");

                        GenJnlLine.Amount := -ReceiptLine.Amount;
                        GenJnlLine.Validate(GenJnlLine.Amount);

                        if ReceiptLine."Customer Payment On Account" = false then begin
                            //GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
                            GenJnlLine."Applies-to Doc. No." := ReceiptLine."Applies-to Doc. No.";
                            GenJnlLine.Validate("Applies-to Doc. No.");
                            GenJnlLine."Applies-to ID" := ReceiptLine."Applies-to ID";
                            GenJnlLine.Validate(GenJnlLine."Applies-to ID");
                        end;

                        GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                        GenJnlLine.Description := CopyStr(ReceiptLine."Account Name" + ':' + Format(ReceiptLine."Pay Mode") +
                          ' Invoices:' + StrInvoices, 1, 50);
                        GenJnlLine."Shortcut Dimension 1 Code" := ReceiptLine."Global Dimension 1 Code";
                        GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                        GenJnlLine."Shortcut Dimension 2 Code" := ReceiptLine."Shortcut Dimension 2 Code";
                        GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
                        GenJnlLine.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
                        GenJnlLine.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");

                        if GenJnlLine.Amount <> 0 then
                            GenJnlLine.Insert();
                    end
                    else
                        if ReceiptLine."Pay Mode" = ReceiptLine."Pay Mode"::Cheque then
                            if ReceiptLine."Cheque/Deposit Slip Date" <= Today then begin
                                GenJnlLine.Init();
                                GenJnlLine."Journal Template Name" := JTemplate;
                                GenJnlLine."Journal Batch Name" := JBatch;
                                GenJnlLine."Source Code" := 'CASHRECJNL';
                                GenJnlLine."Line No." := LineNo;
                                GenJnlLine."Posting Date" := Rec.Date;
                                GenJnlLine."Document No." := ReceiptLine.No;
                                GenJnlLine."Document Date" := Rec."Document Date";
                                /*IF ReceiptLine."Customer Payment On Account" THEN
                                  BEGIN
                                    SRSetup.GET();
                                    GenJnlLine."Account Type":=GenJnlLine."Account Type"::"G/L Account";
                                    GenJnlLine."Account No.":=SRSetup."Receivable Batch Account";
                                  END
                                ELSE
                                  BEGIN
                                    GenJnlLine."Account Type":=ReceiptLine."Account Type";
                                    GenJnlLine."Account No.":=ReceiptLine."Account No.";
                                  END;*/

                                GenJnlLine."Account Type" := ReceiptLine."Account Type";
                                GenJnlLine."Account No." := ReceiptLine."Account No.";
                                GenJnlLine.Validate(GenJnlLine."Account No.");
                                GenJnlLine."External Document No." := ReceiptLine."Cheque/Deposit Slip No";
                                GenJnlLine."Currency Code" := Rec."Currency Code";
                                GenJnlLine.Validate(GenJnlLine."Currency Code");

                                GenJnlLine.Amount := -ReceiptLine.Amount;
                                GenJnlLine.Validate(GenJnlLine.Amount);

                                if ReceiptLine."Customer Payment On Account" = false then begin
                                    //GenJnlLine."Applies-to Doc. Type":=GenJnlLine."Applies-to Doc. Type"::Invoice;
                                    GenJnlLine."Applies-to Doc. No." := ReceiptLine."Applies-to Doc. No.";
                                    GenJnlLine.Validate("Applies-to Doc. No.");
                                    GenJnlLine."Applies-to ID" := ReceiptLine."Applies-to ID";
                                    GenJnlLine.Validate(GenJnlLine."Applies-to ID");
                                end;
                                GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                                GenJnlLine.Description := CopyStr(ReceiptLine."Account Name" + ':' + Format(ReceiptLine."Pay Mode")
                                + ' Invoices:' + StrInvoices, 1, 50);
                                GenJnlLine."Shortcut Dimension 1 Code" := ReceiptLine."Global Dimension 1 Code";
                                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                                GenJnlLine."Shortcut Dimension 2 Code" := ReceiptLine."Shortcut Dimension 2 Code";
                                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
                                GenJnlLine.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
                                GenJnlLine.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");

                                if GenJnlLine.Amount <> 0 then
                                    GenJnlLine.Insert();
                            end;
                until ReceiptLine.Next() = 0;

            /*Post the transactions*/
            Post := false;
            GenJnlLine.Reset();
            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
            //Adjust Gen Jnl Exchange Rate Rounding Balances
            AdjustGenJnl.Run(GenJnlLine);
            //End Adjust Gen Jnl Exchange Rate Rounding Balances

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post Line", GenJnlLine);
            if JournalPosted.PostedSuccessfully() then begin
                //Update Header
                Rec.Cashier := UserId;
                //"Bank Code":=USetup."Default Receipts Bank";
                Rec.Posted := true;
                Rec."Date Posted" := Today;
                Rec."Time Posted" := Time;
                Rec."Posted By" := UserId;
                Rec.Modify();
                //Update Lines
                ReceiptLine.Reset();
                ReceiptLine.SetRange(ReceiptLine.No, Rec."No.");
                ReceiptLine.SetRange(ReceiptLine.Posted, false);
                if ReceiptLine.Find('-') then
                    repeat
                        ReceiptLine.Posted := true;
                        ReceiptLine."Date Posted" := Today;
                        ReceiptLine."Time Posted" := Time;
                        ReceiptLine."Posted By" := UserId;
                        ReceiptLine.Modify();
                    until ReceiptLine.Next() = 0;

                Message('Receipt Posted Successfully');

            end;
        end;

    end;


    procedure PerformPostLine()
    begin
    end;


    procedure CheckPostDated() Exists: Boolean
    begin
        //get the sum total of the post dated cheques is any
        //reset the bank amount first
        Exists := false;
        BAmount := 0;
        ReceiptLine.Reset();
        ReceiptLine.SetRange(ReceiptLine.No, Rec."No.");
        ReceiptLine.SetRange(ReceiptLine."Pay Mode", ReceiptLine."Pay Mode"::Cheque);
        if ReceiptLine.Find('-') then
            repeat
                if ReceiptLine."Cheque/Deposit Slip Date" > Today then begin
                    Exists := true;
                    exit;
                    //cheque is post dated
                    // BAmount:=BAmount + ReceiptLine.Amount;
                end;
            until ReceiptLine.Next() = 0;
    end;


    procedure CheckBnkCurrency(BankAcc: Code[20]; CurrCode: Code[20])
    var
        BankAcct: Record "Bank Account";
    begin
        BankAcct.Reset();
        BankAcct.SetRange(BankAcct."No.", BankAcc);
        if BankAcct.Find('-') then
            if BankAcct."Currency Code" <> CurrCode then
                if BankAcct."Currency Code" = '' then
                    Error('This bank [%1:- %2] can only transact in LOCAL Currency', BankAcct."No.", BankAcct.Name)
                else
                    Error('This bank [%1:- %2] can only transact in %3', BankAcct."No.", BankAcct.Name, BankAcct."Currency Code");
    end;

    local procedure OnAfterGetCurrRecord()
    begin
        //xRec := Rec;
        FunctionName := '';
        DimVal.Reset();
        DimVal.SetRange(DimVal."Global Dimension No.", 1);
        DimVal.SetRange(DimVal.Code, Rec."Global Dimension 1 Code");
        if DimVal.Find('-') then
            FunctionName := DimVal.Name;
        BudgetCenterName := '';
        DimVal.Reset();
        DimVal.SetRange(DimVal."Global Dimension No.", 2);
        DimVal.SetRange(DimVal.Code, Rec."Shortcut Dimension 2 Code");
        if DimVal.Find('-') then
            BudgetCenterName := DimVal.Name;
        BankName := '';
        BankAcc.Reset();
        BankAcc.SetRange(BankAcc."No.", Rec."Bank Code");
        if BankAcc.Find('-') then
            BankName := BankAcc.Name;
    end;


    procedure UpdateControls()
    begin
        if Rec.Posted = false then
            StatusEditable := true
        else
            StatusEditable := false;
    end;


    procedure CurrPageUpdate()
    begin
        xRec := Rec;
        UpdateControls();
        //OnAfterGetCurrRecord;
        CurrPage.Update();
    end;
}
