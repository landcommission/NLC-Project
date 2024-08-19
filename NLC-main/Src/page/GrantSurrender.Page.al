#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193836 "Grant Surrender"
{
    PageType = Card;
    SourceTable = "Grant Surrender Header";
    SourceTableView = where(Posted = const(false));
    ApplicationArea = All;
    Caption = 'Grant Surrender';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                label(Control1102755004)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19051930;
                    Style = Strong;
                    StyleExpr = true;
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Surrender Date"; Rec."Surrender Date")
                {
                    ApplicationArea = Basic;
                    Editable = "Surrender DateEditable";
                    ToolTip = 'Specifies the value of the Surrender Date field.';
                }
                field(Grant; Rec.Grant)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grant field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = "Account No.Editable";
                    ToolTip = 'Specifies the value of the Account No. field.';
                    trigger OnValidate()
                    begin
                        //AccountName:=GetCustName("Account No.");
                        GrantDetails.Reset();
                        GrantDetails.SetRange(GrantDetails."Surrender Doc No.", Rec.No);
                        GrantDetails.DeleteAll();

                        AutopopulateLines();
                        CurrPage.ImprestLines.Page.refreshform();
                    end;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Grant Phase"; Rec."Grant Phase")
                {
                    ApplicationArea = Basic;
                    Editable = "Grant PhaseEditable";
                    ToolTip = 'Specifies the value of the Grant Phase field.';
                }
                field("Job-Planning Line No"; Rec."Job-Planning Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job-Planning Line No field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = "Currency CodeEditable";
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = GlobalDimension1CodeEditable;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                    trigger OnValidate()
                    begin
                        DimName1 := GetDimensionName(Rec."Global Dimension 1 Code", 1);
                    end;
                }
                field(DimName1; DimName1)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the DimName1 field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = ShortcutDimension2CodeEditable;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                    trigger OnValidate()
                    begin
                        DimName2 := GetDimensionName(Rec."Shortcut Dimension 2 Code", 2);
                    end;
                }
                field(DimName2; DimName2)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the DimName2 field.';
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
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Cashier; Rec.Cashier)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cashier field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = "Responsibility CenterEditable";
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Surrender Posting Date"; Rec."Surrender Posting Date")
                {
                    ApplicationArea = Basic;
                    Editable = "Surrender Posting DateEditable";
                    ToolTip = 'Specifies the value of the Surrender Posting Date field.';
                }
                field("Allow Overexpenditure"; Rec."Allow Overexpenditure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allow Overexpenditure field.';
                }
                field("Open for Overexpenditure by"; Rec."Open for Overexpenditure by")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Open for Overexpenditure by field.';
                }
                field("Date opened for OvExpenditure"; Rec."Date opened for OvExpenditure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date opened for OvExpenditure field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
            }
            part(ImprestLines; "Grant Surrender Details")
            {
                Editable = true;
                SubPageLink = "Surrender Doc No." = field(No);
            }
            group(Statistics)
            {
                Caption = 'Statistics';
                field("Actual Spent"; Rec."Actual Spent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Spent field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Approve)
            {
                ApplicationArea = Basic;
                Caption = 'Approve';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;
                ToolTip = 'Executes the Approve action.';
                trigger OnAction()
                begin
                    if Rec.Status <> Rec.Status::Pending then
                        Error('The document has already been processed.');

                    if Rec.Amount < 0 then
                        Error('Amount cannot be less than zero.');

                    if Rec.Amount = 0 then
                        Error('Please enter amount.');

                    if Confirm('Are you sure you would like to approve the payment?', false) = true then begin
                        Rec.Status := Rec.Status::"2nd Approval";
                        Rec.Modify();
                        Message('Document approved successfully.');
                    end;
                end;
            }
            group(Functions)
            {
                Caption = 'Functions';
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    begin

                        DocumentType := 19;
                        ApprovalEntries.Setfilters(Database::"Grant Surrender Header", DocumentType, Rec.No);
                        ApprovalEntries.Run();
                    end;
                }
                separator(Action1102755058) { }
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
                    var
                        Txt0001: Label 'Actual Spent and the Cash Receipt Amount should be equal to the amount Issued';
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Approved);
                        Rec.TestField(Rec."Surrender Posting Date");

                        if Rec.Posted then
                            Error('The transaction has already been posted.');

                        //Ensure actual spent does not exceed the amount on original document
                        //CALCFIELDS("Actual Spent","Cash Receipt Amount") ;
                        // IF "Actual Spent"+"Cash Receipt Amount" <> Amount THEN
                        //    ERROR('The actual Amount spent should not exceed the amount issued ');

                        //Get the Cash office user template
                        Temp.Get(UserId);
                        SurrBatch := Temp."Advance Surr Batch";
                        SurrTemplate := Temp."Advance Surr Template";


                        //HOW ABOUT WHERE ONE RETURNS ALL THE AMOUNT??
                        //THERE SHOULD BE NO GENJNL ENTRIES BUT REVERSE THE COMMITTMENTS
                        //CALCFIELDS("Actual Spent");
                        if Rec."Actual Spent" = 0 then
                            if Confirm(Text000, true) then
                                UpdateforNoActualSpent()
                            else
                                Error(Text001);

                        // DELETE ANY LINE ITEM THAT MAY BE PRESENT
                        if GenledSetup.Get() then begin
                            GenJnlLine.Reset();
                            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", SurrTemplate);
                            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", SurrBatch);
                            GenJnlLine.DeleteAll();
                        end;

                        if DefaultBatch.Get(SurrTemplate, SurrBatch) then
                            DefaultBatch.Delete();

                        DefaultBatch.Reset();
                        DefaultBatch."Journal Template Name" := SurrTemplate;
                        DefaultBatch.Name := SurrBatch;
                        DefaultBatch.Insert();
                        LineNo := 0;

                        GrantDetails.Reset();
                        GrantDetails.SetRange(GrantDetails."Surrender Doc No.", Rec.No);
                        if GrantDetails.Find('-') then begin
                            repeat
                                //Post Surrender Journal
                                //Compare the amount issued =amount on cash reciecied.
                                //Created new field for zero spent
                                //

                                //GrantDetails.TESTFIELD("Actual Spent");
                                //GrantDetails.TESTFIELD("Actual Spent");
                                /*
                                IF (GrantDetails."Cash Receipt Amount"+GrantDetails."Actual Spent")<>GrantDetails.Amount THEN
                                   ERROR(Txt0001);
                                */
                                Rec.TestField(Rec."Global Dimension 1 Code");


                                LineNo := LineNo + 1000;
                                GenJnlLine.Init();
                                GenJnlLine."Journal Template Name" := SurrTemplate;
                                GenJnlLine."Journal Batch Name" := SurrBatch;
                                GenJnlLine."Line No." := LineNo;
                                GenJnlLine."Source Code" := 'PAYMENTJNL';
                                GenJnlLine."Account Type" := GenJnlLine."Account Type"::"G/L Account";
                                GenJnlLine."Account No." := GrantDetails."Account No:";
                                GenJnlLine.Validate(GenJnlLine."Account No.");
                                //Set these fields to blanks
                                GenJnlLine."Posting Date" := Rec."Surrender Posting Date";
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
                                GenJnlLine.Amount := GrantDetails."Actual Spent";
                                GenJnlLine.Validate(GenJnlLine.Amount);
                                GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::Customer;
                                GenJnlLine."Bal. Account No." := Rec."Account No.";
                                GenJnlLine.Description := 'Grant Surrender';
                                GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                                GenJnlLine."Currency Code" := Rec."Currency Code";
                                GenJnlLine.Validate("Currency Code");
                                //Take care of Currency Factor
                                //  GenJnlLine."Currency Factor":="Currency Factor";
                                //  GenJnlLine.VALIDATE("Currency Factor");

                                GenJnlLine."Shortcut Dimension 1 Code" := Rec."Global Dimension 1 Code";
                                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                                GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
                                GenJnlLine.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
                                GenJnlLine.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");

                                //Application of Surrender entries
                                if GenJnlLine."Bal. Account Type" = GenJnlLine."Bal. Account Type"::Customer then begin
                                    GenJnlLine."Applies-to Doc. Type" := GenJnlLine."Applies-to Doc. Type"::Invoice;
                                    GenJnlLine."Applies-to Doc. No." := Rec."Payment Voucher Doc. No";
                                    GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                                    GenJnlLine."Applies-to ID" := Rec."Apply to ID";
                                end;

                                if GenJnlLine.Amount <> 0 then
                                    GenJnlLine.Insert();
                            //End Post Surrender Journal

                            until GrantDetails.Next() = 0;

                            //Post Entries
                            GenJnlLine.Reset();
                            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", SurrTemplate);
                            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", SurrBatch);
                            //Adjust Gen Jnl Exchange Rate Rounding Balances
                            AdjustGenJnl.Run(GenJnlLine);
                            //End Adjust Gen Jnl Exchange Rate Rounding Balances

                            Codeunit.Run(Codeunit::"Gen. Jnl.-Post Line", GenJnlLine);
                        end;

                        if JournalPostSuccessful.PostedSuccessfully() then begin
                            Rec.Posted := true;
                            Rec.Status := Rec.Status::Posted;
                            Rec."Date Posted" := Today;
                            Rec."Time Posted" := Time;
                            Rec."Posted By" := UserId;
                            Rec.Modify();


                            //tag the lines as posted
                            GrantDetails.SetRange(GrantDetails."Surrender Doc No.", Rec.No);
                            if GrantDetails.Find('-') then
                                repeat
                                    GrantDetails.Posted := true;
                                    GrantDetails.Modify();
                                until GrantDetails.Next() = 0;

                            /*
                            //Tag the Source Imprest Requisition as Surrendered
                            ImprestReq.RESET;
                            ImprestReq.SETRANGE(ImprestReq."No.","Payment Voucher Doc. No");
                            IF ImprestReq.FIND('-') THEN BEGIN
                              ImprestReq."Surrender Status":=ImprestReq."Surrender Status"::Full;
                              ImprestReq.MODIFY;
                            END;
                            */
                            /*
                            //End Tag
                            //Post Committment Reversals
                            Doc_Type:=Doc_Type::GrantSurrender;
                            BudgetControl.ReverseEntries(Doc_Type,No);
                            */
                        end;

                    end;
                }
                separator(Action1102755060) { }
                action("Check Budgetary Availability")
                {
                    ApplicationArea = Basic;
                    Caption = 'Check Budgetary Availability';
                    Visible = false;
                    ToolTip = 'Executes the Check Budgetary Availability action.';
                    trigger OnAction()
                    begin

                        //Ensure actual spent does not exceed the amount on original document
                        Rec.CalcFields(Rec."Actual Spent", Rec."Cash Receipt Amount");
                        if Rec."Actual Spent" + Rec."Cash Receipt Amount" > Rec.Amount then
                            Error('The actual Amount spent should not exceed the amount issued ');
                        /*
                          //Post Committment Reversals of the Staff Advance if it had not been reversed
                            Commitments.RESET;
                            Commitments.SETRANGE(Commitments."Document Type",Commitments."Document Type"::Grant Surrender);
                            Commitments.SETRANGE(Commitments."Document No.","Imprest Issue Doc. No");
                            Commitments.SETRANGE(Commitments.Committed,FALSE);
                              IF NOT Commitments.FIND('-') THEN BEGIN
                               Doc_Type:=Doc_Type::StaffAdvance;
                               BudgetControl.ReverseEntries(Doc_Type,"Imprest Issue Doc. No");
                              END;
                         */
                        //First Check whether other lines are already committed.
                        Commitments.Reset();
                        Commitments.SetRange(Commitments."Document Type", Commitments."Document Type"::"Grant Surrender");
                        Commitments.SetRange(Commitments."Document No.", Rec.No);
                        if Commitments.Find('-') then begin
                            if Confirm('Lines in this Document appear to be committed do you want to re-commit?', false) = false then
                                exit;
                            Commitments.Reset();
                            Commitments.SetRange(Commitments."Document Type", Commitments."Document Type"::"Grant Surrender");
                            Commitments.SetRange(Commitments."Document No.", Rec.No);
                            Commitments.DeleteAll();
                        end;

                        //Check the Budget here
                        CheckBudgetAvail.CheckGrantSurr(Rec);
                        //Update document to Committed
                        Rec."Commitment Status" := true;
                        Rec.Modify();

                    end;
                }
                action("Cancel Budgetary Allocation")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Budgetary Allocation';
                    Visible = false;
                    ToolTip = 'Executes the Cancel Budgetary Allocation action.';
                    trigger OnAction()
                    begin
                        if Confirm('Do you Wish to Cancel the Commitment entries for this document', false) = false then
                            exit;

                        Commitments.Reset();
                        Commitments.SetRange(Commitments."Document Type", Commitments."Document Type"::"Grant Surrender");
                        Commitments.SetRange(Commitments."Document No.", Rec.No);
                        Commitments.DeleteAll();

                        Payline.Reset();
                        Payline.SetRange(Payline."Surrender Doc No.", Rec.No);
                        if Payline.Find('-') then
                            repeat
                                Payline.Committed := false;
                                Payline.Modify();
                            until Payline.Next() = 0;
                        //Update Document to Uncommitted
                        Rec."Commitment Status" := false;
                        Rec.Modify();
                    end;
                }
                separator(Action1102755063) { }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    ToolTip = 'Executes the Send Approval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                        //ApprovalMgt: Codeunit "Export F/O Consolidation";
                        Txt0001: Label 'Actual Spent and the Cash Receipt Amount should be equal to the amount Issued';
                    begin
                        /*

                           //Ensure actual spent does not exceed the amount on original document
                           CALCFIELDS("Actual Spent","Cash Receipt Amount") ;
                           IF "Actual Spent"+"Cash Receipt Amount" <> Amount THEN
                           ERROR('The actual Amount spent should not exceed the amount issued ');
                        */

                        /*
                        //First Check whether all amount entered tally
                        ImprestDetails.RESET;
                        ImprestDetails.SETRANGE(ImprestDetails."Surrender Doc No.",No);
                        IF ImprestDetails.FIND('-') THEN BEGIN
                        REPEAT
                          IF (ImprestDetails."Cash Receipt Amount"+ImprestDetails."Actual Spent")<>ImprestDetails.Amount THEN
                              ERROR(Txt0001);

                        UNTIL ImprestDetails.NEXT = 0;
                        END;
                        */
                        //Ensure No Items That should be committed that are not
                        if LinesCommitmentStatus() then
                            Error('There are some lines that have not been committed');

                        //Release the ImprestSurrender for Approval
                        // if ApprovalMgt.SendGrantSurrApprovalRequest(Rec) then;

                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    ToolTip = 'Executes the Cancel Approval Request action.';

                }
                separator(Action1102755066) { }
                action("Cancel Document")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Document';
                    ToolTip = 'Executes the Cancel Document action.';
                    trigger OnAction()
                    begin
                        //Post Committment Reversals
                        Rec.TestField(Rec.Status, Rec.Status::Approved);
                        if Confirm(Text002, true) then begin
                            Doc_Type := Doc_Type::Imprest;
                            BudgetControl.ReverseEntries(Doc_Type, Rec."Payment Voucher Doc. No");
                            Rec.Status := Rec.Status::Cancelled;
                            Rec.Modify();
                        end;
                    end;
                }
                separator(Action1102755068) { }
                action("Open for OverExpenditure")
                {
                    ApplicationArea = Basic;
                    Caption = 'Open for OverExpenditure';
                    ToolTip = 'Executes the Open for OverExpenditure action.';
                    trigger OnAction()
                    begin
                        //only allow for over expenditure if grant allows for over expenditure
                        job.TestField("Allow OverExpenditure", true);
                        //Opening should only be for Pending Documents
                        Rec.TestField(Rec.Status, Rec.Status::Pending);
                        //Open for Overexpenditure
                        Rec."Allow Overexpenditure" := true;
                        Rec."Open for Overexpenditure by" := UserId;
                        Rec."Date opened for OvExpenditure" := Today;
                        Rec.Modify();
                        //Open lines
                        Payline.Reset();
                        Payline.SetRange(Payline."Surrender Doc No.", Rec.No);
                        if Payline.Find('-') then
                            repeat
                                Payline."Allow Overexpenditure" := true;
                                Payline."Open for Overexpenditure by" := UserId;
                                Payline."Date opened for OvExpenditure" := Today;
                                Payline.Modify();
                            until Payline.Next() = 0;
                        //End open for Overexpenditure
                    end;
                }
                action("Import Tasks")
                {
                    ApplicationArea = Basic;
                    Caption = 'Import Tasks';
                    ToolTip = 'Executes the Import Tasks action.';
                    trigger OnAction()
                    begin
                        AutopopulateLines();
                    end;
                }
            }
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
                    Rec.Reset();
                    Rec.SetFilter(Rec.No, Rec.No);
                    Report.Run(39004318, true, true, Rec);
                    Rec.Reset();
                end;
            }
        }
    }

    trigger OnInit()
    begin
        ImprestLinesEditable := true;
        ShortcutDimension2CodeEditable := true;
        GlobalDimension1CodeEditable := true;
        "Currency CodeEditable" := true;
        "Grant PhaseEditable" := true;
        "Surrender Posting DateEditable" := true;
        "Responsibility CenterEditable" := true;
        "Account No.Editable" := true;
        "Surrender DateEditable" := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter();
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
        GrantDetails: Record "Grant Surrender Details";
        EntryNo: Integer;
        GLAccount: Record "G/L Account";
        IsImprest: Boolean;
        GenledSetup: Record "Cash Office Setup";
        ImprestAmt: Decimal;
        DimName1: Text[60];
        DimName2: Text[60];
        CashPaymentLine: Record "Cash Payment Line";
        PaymentLine: Record "Staff Advance Lines";
        SelectForm: Page "Cash Surrender Lines";
        CurrSurrDocNo: Code[20];
        JournalPostSuccessful: Codeunit "Journal Post Successful";
        Commitments: Record Committment;
        BCSetup: Record "Budgetary Control Setup";
        BudgetControl: Codeunit "Budgetary Control";
        Doc_Type: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash,PurchInvoice,StaffClaim,StaffAdvance,StaffSurrender,GrantSurrender;
        ImprestReq: Record "Staff Advance Header";
        UserMgt: Codeunit "User Setup Management BR";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,GrantSurrender;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        ApprovalEntries: Page "Approval Entries";
        AccountName: Text[100];
        AdjustGenJnl: Codeunit "Adjust Gen. Journal Balance";
        TravAccHeader: Record "Staff Advance Surrender Header";
        CheckBudgetAvail: Codeunit "Budgetary Control";
        Payline: Record "Grant Surrender Details";
        Temp: Record "Cash Office User Template";
        SurrBatch: Code[10];
        SurrTemplate: Code[10];
        Text000: Label 'You have not specified the Actual Amount Spent. This document will only reverse the committment and you will have to receipt the total amount returned.';
        Text001: Label 'Document Not Posted';
        Text002: Label 'Are you sure you want to Cancel this Document?';
        GrantPhases: Record "Grant Phases";
        job: Record Jobs;
        JobPlanning: Record "Job-Planning Line";
        PVLines: Record "Payment Line";
        [InDataSet]
        "Surrender DateEditable": Boolean;
        [InDataSet]
        "Account No.Editable": Boolean;
        [InDataSet]
        "Responsibility CenterEditable": Boolean;
        [InDataSet]
        "Surrender Posting DateEditable": Boolean;
        [InDataSet]
        "Grant PhaseEditable": Boolean;
        [InDataSet]
        "Currency CodeEditable": Boolean;
        [InDataSet]
        GlobalDimension1CodeEditable: Boolean;
        [InDataSet]
        ShortcutDimension2CodeEditable: Boolean;
        [InDataSet]
        ImprestLinesEditable: Boolean;
        Text19051930: Label 'Enter Grant Accounting Details below';


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
            //   CurrForm."Payment Voucher Doc. No".EDITABLE:=FALSE;
            "Responsibility CenterEditable" := false;
            "Surrender Posting DateEditable" := true;
            //CurrForm.Amount.EDITABLE:=FALSE;
            "Grant PhaseEditable" := false;
            "Currency CodeEditable" := false;
            GlobalDimension1CodeEditable := false;
            ShortcutDimension2CodeEditable := false;
            ImprestLinesEditable := false;

        end else begin
            "Surrender DateEditable" := true;
            "Account No.Editable" := true;
            //   CurrForm."Payment Voucher Doc. No".EDITABLE:=TRUE;
            "Responsibility CenterEditable" := true;
            "Surrender Posting DateEditable" := false;
            //CurrForm.Amount.EDITABLE:=TRUE;
            "Grant PhaseEditable" := true;
            "Currency CodeEditable" := true;
            GlobalDimension1CodeEditable := true;
            ShortcutDimension2CodeEditable := true;
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
        /*
          Posted:=TRUE;
          Status:=Status::Posted;
          "Date Posted":=TODAY;
          "Time Posted":=TIME;
          "Posted By":=USERID;
          MODIFY;
        //Tag the Source Imprest Requisition as Surrendered
           ImprestReq.RESET;
           ImprestReq.SETRANGE(ImprestReq."No.","Payment Voucher Doc. No");
           IF ImprestReq.FIND('-') THEN BEGIN
             ImprestReq."Surrender Status":=ImprestReq."Surrender Status"::Full;
             ImprestReq.MODIFY;
           END;
        //End Tag
        //Post Committment Reversals
        Doc_Type:=Doc_Type::StaffSurrender;
        BudgetControl.ReverseEntries(Doc_Type,"Payment Voucher Doc. No");
        */

    end;


    procedure CompareAllAmounts()
    begin
    end;


    procedure LinesCommitmentStatus() Exists: Boolean
    var
        BCsetup: Record "Budgetary Control Setup";
    begin
        if BCsetup.Get() then begin
            if not BCsetup.Mandatory then begin
                Exists := false;
                exit;
            end;
        end else begin
            Exists := false;
            exit;
        end;
        Exists := false;
        Payline.Reset();
        Payline.SetRange(Payline."Surrender Doc No.", Rec.No);
        Payline.SetRange(Payline.Committed, false);
        Payline.SetRange(Payline."Budgetary Control A/C", true);
        if Payline.Find('-') then
            Exists := true;
    end;


    procedure AutopopulateLines()
    begin
        PVLines.Reset();
        PVLines.SetRange(PVLines."Grant No", Rec.Grant);
        PVLines.SetRange(PVLines."Account No.", Rec."Account No.");
        //PVLines.SETRANGE(PVLines."Job-Planning Line No","Job-Planning Line No");
        if PVLines.Find('-') then begin
            GrantDetails.Init();
            GrantDetails."Line No." := 0;
            repeat
            begin

                GrantDetails."Surrender Doc No." := Rec.No;
                GrantDetails."Line No." := GrantDetails."Line No." + 1000;
                GrantDetails."PV No" := PVLines.No;
                GrantDetails."Grant No" := PVLines."Grant No";
                GrantDetails."Job-Planning Line No" := PVLines."Job-Planning Line No";
                GrantDetails.Validate(GrantDetails."Grant No");
                GrantDetails."Posting Date" := PVLines."Date Posted";
                GrantDetails.Partner := PVLines."Account No.";
                GrantDetails."Disbursed Amount" := PVLines."NetAmount LCY";
                GrantDetails."Shortcut Dimension 1 Code" := Rec."Global Dimension 1 Code";
                GrantDetails."Shortcut Dimension 2 Code" := Rec."Global Dimension 2 Code";
                GrantDetails."Shortcut Dimension 3 Code" := Rec."Shortcut Dimension 3 Code";
                GrantDetails."Shortcut Dimension 4 Code" := Rec."Shortcut Dimension 4 Code";
                GrantDetails."Currency Code 1" := Rec."Currency Code";
                GrantDetails.Insert(true);
            end;
            until PVLines.Next() = 0;

        end else
            Error('No posted payments Lines were found for Project no.' + ' ' + Rec.Grant + ' ' + 'account' + ' ' + Rec."Account No.");
    end;
}
