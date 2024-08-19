#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193634 "Imprest Surrender"
{
    Caption = 'Imprest Surrender';
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Approvals,Cancellation,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Imprest Surrender Header";
    SourceTableView = where(Posted = const(false));
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Visible = DocNoVisible;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Surrender Date"; Rec."Surrender Date")
                {
                    ApplicationArea = Basic;
                    Editable = "Surrender DateEditable";
                    ToolTip = 'Specifies the value of the Surrender Date field.';
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = "Account No.Editable";
                    ToolTip = 'Specifies the value of the Account No. field.';
                    trigger OnValidate()
                    begin
                        AccountName := GetCustName(Rec."Account No.");
                    end;
                }
                field(AccountName; AccountName)
                {
                    ApplicationArea = Basic;
                    Caption = 'Account Name';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Imprest Issue Doc. No"; Rec."Imprest Issue Doc. No")
                {
                    ApplicationArea = Basic;
                    Editable = "Imprest Issue Doc. NoEditable";
                    ToolTip = 'Specifies the value of the Imprest Issue Doc. No field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Imprest Issue Date"; Rec."Imprest Issue Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Imprest Issue Date field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                    trigger OnValidate()
                    begin
                        DimName1 := GetDimensionName(Rec."Global Dimension 1 Code", 1);
                    end;
                }
                field(DimName1; DimName1)
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                    trigger OnValidate()
                    begin
                        DimName2 := GetDimensionName(Rec."Shortcut Dimension 2 Code", 2);
                    end;
                }
                field(DimName2; DimName2)
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field(Dim3; Rec.Dim3)
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                }
                field(Dim4; Rec.Dim4)
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Date Posted"; Rec."Date Posted")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Posted field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Cashier; Rec.Cashier)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cashier field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = "Responsibility CenterEditable";
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
            }
            label(Control1102755001)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19053222;
                Style = Standard;
                StyleExpr = true;
            }
            part(ImprestLines; "Imprest Surrender Details")
            {
                Editable = ImprestLinesEditable;
                SubPageLink = "Surrender Doc No." = field(No);
            }
            systempart(Control2; Links)
            {
                Visible = true;
            }
            systempart(Control1; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        DocumentType := DocumentType::ImprestSurrender;
                        ApprovalEntries.Setfilters(Database::"Imprest Surrender Header", DocumentType, Rec.No);
                        ApprovalEntries.Run();
                    end;
                }
                separator(Action1102756006) { }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send Approval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                        //ApprovalMgt: Codeunit "Export F/O Consolidation";
                        Txt0001: Label 'Actual Spent and the Cash Receipt Amount should be equal to the amount Issued';
                    begin

                        //First Check whether all amount entered tally
                        ImprestDetails.Reset();
                        ImprestDetails.SetRange(ImprestDetails."Surrender Doc No.", Rec.No);
                        if ImprestDetails.Find('-') then
                            repeat
                                if (ImprestDetails."Cash Receipt Amount" + ImprestDetails."Actual Spent") <> ImprestDetails.Amount then
                                    Error(Txt0001);

                            until ImprestDetails.Next() = 0;

                        //Release the ImprestSurrender for Approval
                        //if ApprovalMgt.SendImprestSURRApprovalRequest(Rec) then;
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Request action.';

                }
                separator(Action1000000000) { }
                action("Cancel Document")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Document';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Cancel Document action.';
                    trigger OnAction()
                    begin
                        //Post Committment Reversals
                        Rec.TestField(Rec.Status, Rec.Status::Approved);
                        if Confirm(Text002, true) then begin
                            Doc_Type := Doc_Type::Imprest;
                            BudgetControl.ReverseEntries(Doc_Type, Rec."Imprest Issue Doc. No");
                            Rec.Status := Rec.Status::Cancelled;
                            Rec.Modify();
                        end;
                    end;
                }
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Caption = 'Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = true;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                var
                    Txt0001: Label 'Actual Spent and the Cash Receipt Amount should be equal to the amount Issued';
                begin
                    Rec.TestField(Rec.Status, Rec.Status::Approved);

                    if Rec.Posted then
                        Error('The transaction has already been posted.');

                    //HOW ABOUT WHERE ONE RETURNS ALL THE AMOUNT??
                    //THERE SHOULD BE NO GENJNL ENTRIES BUT REVERSE THE COMMITTMENTS
                    Rec.CalcFields(Rec."Actual Spent");
                    if Rec."Actual Spent" = 0 then
                        if Confirm(Text000, true) then
                            UpdateforNoActualSpent()
                        else
                            Error(Text001);

                    // DELETE ANY LINE ITEM THAT MAY BE PRESENT
                    if GenledSetup.Get() then begin
                        GenJnlLine.Reset();
                        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", GenledSetup."Surrender Template");
                        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", GenledSetup."Surrender  Batch");
                        GenJnlLine.DeleteAll();
                    end;

                    if DefaultBatch.Get(GenledSetup."Surrender Template", GenledSetup."Surrender  Batch") then
                        DefaultBatch.Delete();

                    DefaultBatch.Reset();
                    DefaultBatch."Journal Template Name" := GenledSetup."Surrender Template";
                    DefaultBatch.Name := GenledSetup."Surrender  Batch";
                    DefaultBatch.Insert();
                    LineNo := 0;

                    ImprestDetails.Reset();
                    ImprestDetails.SetRange(ImprestDetails."Surrender Doc No.", Rec.No);
                    if ImprestDetails.Find('-') then begin
                        repeat
                            //Post Surrender Journal
                            //Compare the amount issued =amount on cash reciecied.
                            //Created new field for zero spent
                            //

                            //ImprestDetails.TESTFIELD("Actual Spent");
                            //ImprestDetails.TESTFIELD("Actual Spent");
                            if (ImprestDetails."Cash Receipt Amount" + ImprestDetails."Actual Spent") <> ImprestDetails.Amount then
                                Error(Txt0001);

                            Rec.TestField(Rec."Global Dimension 1 Code");

                            LineNo := LineNo + 1000;
                            GenJnlLine.Init();
                            GenJnlLine."Journal Template Name" := GenledSetup."Surrender Template";
                            GenJnlLine."Journal Batch Name" := GenledSetup."Surrender  Batch";
                            GenJnlLine."Line No." := LineNo;
                            GenJnlLine."Source Code" := 'PAYMENTJNL';
                            GenJnlLine."Account Type" := GenJnlLine."Account Type"::"G/L Account";
                            GenJnlLine."Account No." := ImprestDetails."Account No:";
                            GenJnlLine.Validate(GenJnlLine."Account No.");
                            //Set these fields to blanks
                            GenJnlLine."Posting Date" := Rec."Surrender Date";
                            GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::" ";
                            GenJnlLine.Validate("Gen. Posting Type");
                            GenJnlLine."Gen. Bus. Posting Group" := '';
                            GenJnlLine.Validate("Gen. Bus. Posting Group");
                            GenJnlLine."Gen. Prod. Posting Group" := '';
                            GenJnlLine.Validate("Gen. Prod. Posting Group");
                            GenJnlLine."VAT Bus. Posting Group" := '';
                            GenJnlLine.Validate("VAT Bus. Posting Group");
                            GenJnlLine."VAT Prod. Posting Group" := '';
                            GenJnlLine.Validate("VAT Prod. Posting Group");
                            GenJnlLine."Document No." := Rec.No;
                            GenJnlLine.Amount := ImprestDetails."Actual Spent";
                            GenJnlLine.Validate(GenJnlLine.Amount);
                            GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::Customer;
                            GenJnlLine."Bal. Account No." := ImprestDetails."Imprest Holder";
                            GenJnlLine.Description := 'Imprest Surrendered by staff';
                            GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                            GenJnlLine."Currency Code" := Rec."Currency Code";
                            GenJnlLine.Validate("Currency Code");
                            //Take care of Currency Factor
                            GenJnlLine."Currency Factor" := Rec."Currency Factor";
                            GenJnlLine.Validate("Currency Factor");

                            GenJnlLine."Shortcut Dimension 1 Code" := Rec."Global Dimension 1 Code";
                            GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                            GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                            GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
                            GenJnlLine.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
                            GenJnlLine.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");

                            //Application of Surrender entries
                            if GenJnlLine."Bal. Account Type" = GenJnlLine."Bal. Account Type"::Customer then begin
                                GenJnlLine."Applies-to Doc. Type" := GenJnlLine."Applies-to Doc. Type"::Invoice;
                                GenJnlLine."Applies-to Doc. No." := Rec."Imprest Issue Doc. No";
                                GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                                GenJnlLine."Applies-to ID" := Rec."Apply to ID";
                            end;

                            if GenJnlLine.Amount <> 0 then
                                GenJnlLine.Insert();

                            //Post Cash Surrender
                            if ImprestDetails."Cash Surrender Amt" > 0 then begin
                                if ImprestDetails."Bank/Petty Cash" = '' then
                                    Error('Select a Bank Code where the Cash Surrender will be posted');
                                LineNo := LineNo + 1000;
                                GenJnlLine.Init();
                                GenJnlLine."Journal Template Name" := GenledSetup."Surrender Template";
                                GenJnlLine."Journal Batch Name" := GenledSetup."Surrender  Batch";
                                GenJnlLine."Line No." := LineNo;
                                GenJnlLine."Account Type" := GenJnlLine."Account Type"::Customer;
                                GenJnlLine."Account No." := ImprestDetails."Imprest Holder";
                                GenJnlLine.Validate(GenJnlLine."Account No.");
                                //Set these fields to blanks
                                GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::" ";
                                GenJnlLine.Validate("Gen. Posting Type");
                                GenJnlLine."Gen. Bus. Posting Group" := '';
                                GenJnlLine.Validate("Gen. Bus. Posting Group");
                                GenJnlLine."Gen. Prod. Posting Group" := '';
                                GenJnlLine.Validate("Gen. Prod. Posting Group");
                                GenJnlLine."VAT Bus. Posting Group" := '';
                                GenJnlLine.Validate("VAT Bus. Posting Group");
                                GenJnlLine."VAT Prod. Posting Group" := '';
                                GenJnlLine.Validate("VAT Prod. Posting Group");
                                GenJnlLine."Posting Date" := Rec."Surrender Date";
                                GenJnlLine."Document No." := Rec.No;
                                GenJnlLine.Amount := -ImprestDetails."Cash Surrender Amt";
                                GenJnlLine.Validate(GenJnlLine.Amount);
                                GenJnlLine."Currency Code" := Rec."Currency Code";
                                GenJnlLine.Validate("Currency Code");
                                //Take care of Currency Factor
                                GenJnlLine."Currency Factor" := Rec."Currency Factor";
                                GenJnlLine.Validate("Currency Factor");

                                GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"Bank Account";
                                GenJnlLine."Bal. Account No." := ImprestDetails."Bank/Petty Cash";
                                GenJnlLine.Description := 'Imprest Surrender by staff';
                                GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                                GenJnlLine."Shortcut Dimension 1 Code" := ImprestDetails."Shortcut Dimension 1 Code";
                                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                                GenJnlLine."Shortcut Dimension 2 Code" := ImprestDetails."Shortcut Dimension 2 Code";
                                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
                                GenJnlLine."Dimension Set ID" := ImprestDetails."Dimension Set ID";
                                //GenJnlLine.ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
                                GenJnlLine."Applies-to ID" := ImprestDetails."Imprest Holder";
                                if GenJnlLine.Amount <> 0 then
                                    GenJnlLine.Insert();

                            end;

                        //End Post Surrender Journal

                        until ImprestDetails.Next() = 0;
                        //Post Entries
                        GenJnlLine.Reset();
                        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", GenledSetup."Surrender Template");
                        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", GenledSetup."Surrender  Batch");
                        //Adjust Gen Jnl Exchange Rate Rounding Balances
                        AdjustGenJnl.Run(GenJnlLine);
                        //End Adjust Gen Jnl Exchange Rate Rounding Balances

                        Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnlLine);
                    end;

                    if JournalPostSuccessful.PostedSuccessfully() then begin
                        Rec.Posted := true;
                        Rec.Status := Rec.Status::Posted;
                        Rec."Date Posted" := Today;
                        Rec."Time Posted" := Time;
                        Rec."Posted By" := UserId;
                        Rec.Modify();
                        //Tag the Source Imprest Requisition as Surrendered
                        ImprestReq.Reset();
                        ImprestReq.SetRange(ImprestReq."No.", Rec."Imprest Issue Doc. No");
                        if ImprestReq.Find('-') then begin
                            ImprestReq."Surrender Status" := ImprestReq."Surrender Status"::Full;
                            ImprestReq.Modify();
                        end;

                        //End Tag
                        //Post Committment Reversals
                        Doc_Type := Doc_Type::Imprest;
                        BudgetControl.ReverseEntries(Doc_Type, Rec."Imprest Issue Doc. No");
                    end;
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.SetFilter(Rec.No, Rec.No);
                    Report.Run(Report::"Imprest Surrender NCA", true, true, Rec);
                    Rec.Reset();
                end;
            }
            action("Get Imprest Document")
            {
                ApplicationArea = Basic;
                Caption = 'Get Imprest Document';
                Image = GetEntries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Get Imprest Document action.';
                trigger OnAction()
                begin
                    if Rec."Imprest Issue Doc. No" = '' then
                        Error('Please Select the Imprest Issue Document Number');

                    PaymentLine.Reset();
                    PaymentLine.SetRange(PaymentLine.No, Rec."Imprest Issue Doc. No");
                    Page.RunModal(39006085, PaymentLine);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //OnAfterGetCurrRecord;
        CurrPageUpdate();
    end;

    trigger OnInit()
    begin
        ImprestLinesEditable := true;
        "Responsibility CenterEditable" := true;
        "Imprest Issue Doc. NoEditable" := true;
        "Account No.Editable" := true;
        "Surrender DateEditable" := true;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        //check if the documenent has been added while another one is still pending
        TravAccHeader.Reset();
        TravAccHeader.SetRange(TravAccHeader.Cashier, UserId);
        TravAccHeader.SetRange(TravAccHeader.Status, Rec.Status::Pending);

        //IF TravAccHeader.COUNT>0 THEN
        //  BEGIN
        // ERROR('There are still some pending document(s) on your account. Please list & select the pending document to use.  ');
        // END;
        //*********************************END ****************************************//

        Rec."User ID" := UserId;
        //CurrPage.UPDATE;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter();
        //OnAfterGetCurrRecord;
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        UpdateControls();
    end;

    trigger OnOpenPage()
    begin
        //SETFILTER(Status,'<>Cancelled');

        if UserMgt.GetPurchasesFilter() <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange(Rec."Responsibility Center", UserMgt.GetPurchasesFilter());
            Rec.FilterGroup(0);
        end;
        AccountName := GetCustName(Rec."Account No.");
        SetDocNoVisible();
    end;

    var
        RecPayTypes: Record "Receipts and Payment Types";
        TarriffCodes: Record "Tariff Codes";
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        CashierLinks: Record "Cash Office User Template";
        LineNo: Integer;
        NextEntryNo: Integer;
        CommitNo: Integer;
        ImprestDetails: Record "Imprest Surrender Details";
        EntryNo: Integer;
        GLAccount: Record "G/L Account";
        IsImprest: Boolean;
        ImprestRequestDet: Record "Payments-Users";
        GenledSetup: Record "Cash Office Setup";
        ImprestAmt: Decimal;
        DimName1: Text[60];
        DimName2: Text[60];
        CashPaymentLine: Record "Cash Payment Line";
        PaymentLine: Record "Imprest Lines";
        CurrSurrDocNo: Code[20];
        JournalPostSuccessful: Codeunit "Journal Post Successful";
        Commitments: Record Committment;
        BCSetup: Record "Budgetary Control Setup";
        BudgetControl: Codeunit "Budgetary Control";
        Doc_Type: Option LPO,Requisition,Imprest,"Payment Voucher";
        ImprestReq: Record "Imprest Header";
        UserMgt: Codeunit "User Setup Management BR";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        AccountName: Text[100];
        Text000: Label 'You have not specified the Actual Amount Spent. This document will only reverse the committment and you will have to receipt the total amount returned.';
        Text001: Label 'Document Not Posted';
        AdjustGenJnl: Codeunit "Adjust Gen. Journal Balance";
        Text002: Label 'Are you sure you want to Cancel this Document?';
        [InDataSet]
        "Surrender DateEditable": Boolean;
        [InDataSet]
        "Account No.Editable": Boolean;
        [InDataSet]
        "Imprest Issue Doc. NoEditable": Boolean;
        [InDataSet]
        "Responsibility CenterEditable": Boolean;
        [InDataSet]
        ImprestLinesEditable: Boolean;
        Text19053222: Label 'Enter Advance Accounting Details below';
        TravAccHeader: Record "Imprest Surrender Header";
        StatusEditable: Boolean;
        DocNoVisible: Boolean;


    procedure GetDimensionName(var "Code": Code[20]; DimNo: Integer) Name: Text[60]
    var
        GLSetup: Record "General Ledger Setup";
        DimVal: Record "Dimension Value";
    begin
        /*Get the global dimension 1 and 2 from the database*/
        Name := '';

        GLSetup.Reset();
        GLSetup.Get();

        DimVal.Reset();
        DimVal.SetRange(DimVal.Code, Code);

        if DimNo = 1 then
            DimVal.SetRange(DimVal."Dimension Code", GLSetup."Global Dimension 1 Code")
        else
            if DimNo = 2 then
                DimVal.SetRange(DimVal."Dimension Code", GLSetup."Global Dimension 2 Code");
        if DimVal.Find('-') then
            Name := DimVal.Name;

    end;


    procedure UpdateControl()
    begin
        if Rec.Status <> Rec.Status::Pending then begin
            "Surrender DateEditable" := false;
            "Account No.Editable" := false;
            "Imprest Issue Doc. NoEditable" := false;
            "Responsibility CenterEditable" := false;
            ImprestLinesEditable := false;
        end else begin
            "Surrender DateEditable" := true;
            "Account No.Editable" := true;
            "Imprest Issue Doc. NoEditable" := true;
            "Responsibility CenterEditable" := true;
            ImprestLinesEditable := true;

        end;
    end;


    procedure GetCustName(No: Code[20]) Name: Text[100]
    var
        Cust: Record Customer;
    begin
        Name := '';
        if Cust.Get(No) then
            Name := Cust.Name;
        exit(Name);
    end;


    procedure UpdateforNoActualSpent()
    begin
        Rec.Posted := true;
        Rec.Status := Rec.Status::Posted;
        Rec."Date Posted" := Today;
        Rec."Time Posted" := Time;
        Rec."Posted By" := UserId;
        Rec.Modify();
        //Tag the Source Imprest Requisition as Surrendered
        ImprestReq.Reset();
        ImprestReq.SetRange(ImprestReq."No.", Rec."Imprest Issue Doc. No");
        if ImprestReq.Find('-') then begin
            ImprestReq."Surrender Status" := ImprestReq."Surrender Status"::Full;
            ImprestReq.Modify();
        end;
        //End Tag
        //Post Committment Reversals
        Doc_Type := Doc_Type::Imprest;
        BudgetControl.ReverseEntries(Doc_Type, Rec."Imprest Issue Doc. No");
    end;


    procedure CompareAllAmounts()
    begin
    end;

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        //Update Controls as necessary
        //SETFILTER(Status,'<>Cancelled');
        UpdateControl();
        DimName1 := GetDimensionName(Rec."Global Dimension 1 Code", 1);
        DimName2 := GetDimensionName(Rec."Shortcut Dimension 2 Code", 2);
        AccountName := GetCustName(Rec."Account No.");
    end;


    procedure UpdateControls()
    begin
        if Rec.Status = Rec.Status::Pending then
            StatusEditable := true
        else
            StatusEditable := false;
    end;


    procedure CurrPageUpdate()
    begin
        xRec := Rec;
        UpdateControls();
        CurrPage.Update();
    end;

    local procedure SetDocNoVisible()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility1400;
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer;
    begin
        DocNoVisible := DocumentNoVisibility.FundsMgtDocumentNoIsVisible(DocType::ImprestSurrender, Rec.No);
    end;
}
