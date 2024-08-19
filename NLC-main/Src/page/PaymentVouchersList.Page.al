#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193642 "Payment Vouchers List"
{
    CardPageId = "Payment Header";
    Editable = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Payments Header";
    SourceTableView = where("Payment Type" = const(Normal),
                            Posted = const(false));
    ApplicationArea = All;
    Caption = 'Payment Vouchers List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Payment Type"; Rec."Payment Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Payment Type field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paying Bank Account field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Total VAT Amount"; Rec."Total VAT Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total VAT Amount field.';
                }
                field("Total Witholding Tax Amount"; Rec."Total Witholding Tax Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Witholding Tax Amount field.';
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Net Amount field.';
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cheque No. field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1102755014; Notes) { }
            systempart(Control1102755015; MyNotes) { }
            systempart(Control1102755016; Outlook) { }
            systempart(Control1102755017; Links) { }
        }
    }

    actions
    {
        area(Processing)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action("Post Payment")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Payment';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortcutKey = 'F9';
                    ToolTip = 'Executes the Post Payment action.';
                    trigger OnAction()
                    begin
                        //Post PV Entries
                        CurrPage.SaveRecord();
                        CheckPVRequiredItems(Rec);
                        PostPaymentVoucher(Rec);

                        //Print Here
                        //RESET;
                        //SETFILTER("No.","No.");
                        //REPORT.RUN(39005884,TRUE,TRUE,Rec);
                        //RESET;
                        //End Print Here
                    end;
                }
                separator(Action19) { }
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
                        Approvalentries: Page "Approval Entries";
                    begin
                        if Rec."Payment Type" = Rec."Payment Type"::Normal then
                            DocumentType := DocumentType::"Payment Voucher"
                        else
                            DocumentType := DocumentType::"Express Pv";
                        Approvalentries.Setfilters(Database::"Payments Header", DocumentType, Rec."No.");
                        Approvalentries.Run();
                    end;
                }
                action("Send A&pproval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                    //ApprovalMgt: Codeunit "Export F/O Consolidation";
                    begin
                        if not LinesExists() then
                            Error('There are no Lines created for this Document');
                        //Ensure No Items That should be committed that are not
                        if LinesCommitmentStatus() then
                            Error('There are some lines that have not been committed');

                        //Release the PV for Approval
                        //if ApprovalMgt.SendPVApprovalRequest(Rec) then;
                    end;
                }
                action("Print preview")
                {
                    ApplicationArea = Basic;
                    RunObject = report "Payment Voucher";
                    ToolTip = 'Executes the Print preview action.';
                }
                action("Cancel Approval Re&quest")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';

                }
                separator(Action14) { }
                action("Check Budgetary Availability")
                {
                    ApplicationArea = Basic;
                    Caption = 'Check Budgetary Availability';
                    Image = Balance;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Check Budgetary Availability action.';
                    trigger OnAction()
                    var
                        BCSetup: Record "Budgetary Control Setup";
                    begin
                        if not (Rec.Status = Rec.Status::Pending) then
                            Error('Document must be Pending/Open');

                        BCSetup.Get();
                        if not BCSetup.Mandatory then
                            exit;

                        if not AllFieldsEntered() then
                            Error('Some of the Key Fields on the Lines:[ACCOUNT NO.,AMOUNT] Have not been Entered please RECHECK your entries');
                        //First Check whether other lines are already committed.
                        Commitments.Reset();
                        Commitments.SetRange(Commitments."Document Type", Commitments."Document Type"::"Payment Voucher");
                        Commitments.SetRange(Commitments."Document No.", Rec."No.");
                        if Commitments.Find('-') then begin
                            if Confirm('Lines in this Document appear to be committed do you want to re-commit?', false) = false then
                                exit;
                            Commitments.Reset();
                            Commitments.SetRange(Commitments."Document Type", Commitments."Document Type"::"Payment Voucher");
                            Commitments.SetRange(Commitments."Document No.", Rec."No.");
                            Commitments.DeleteAll();
                        end;

                        CheckBudgetAvail.CheckPayments(Rec);
                    end;
                }
                action("Cancel Budget Commitment")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Budget Commitment';
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Cancel Budget Commitment action.';
                    trigger OnAction()
                    begin
                        if not (Rec.Status = Rec.Status::Pending) then
                            Error('Document must be Pending/Open');

                        if Confirm('Do you Wish to Cancel the Commitment entries for this document', false) = false then
                            exit;

                        Commitments.Reset();
                        Commitments.SetRange(Commitments."Document Type", Commitments."Document Type"::"Payment Voucher");
                        Commitments.SetRange(Commitments."Document No.", Rec."No.");
                        Commitments.DeleteAll();

                        PayLine.Reset();
                        PayLine.SetRange(PayLine.No, Rec."No.");
                        if PayLine.Find('-') then
                            repeat
                                PayLine.Committed := false;
                                PayLine.Modify();
                            until PayLine.Next() = 0;
                    end;
                }
                separator(Action11) { }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print/Preview';
                    Image = ConfirmAndPrint;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Print/Preview action.';
                    trigger OnAction()
                    begin
                        if Rec.Status <> Rec.Status::Approved then
                            Error('You can only print a Payment Voucher after it is fully Approved');



                        //IF Status=Status::Pending THEN
                        //ERROR('You cannot Print until the document is released for approval');

                        Rec.Reset();
                        Rec.SetFilter(Rec."No.", Rec."No.");
                        Report.Run(Report::"Payment Voucher NCA", true, true, Rec);
                        /*
                        PayLine.SETRANGE(PayLine.No,"No.");
                        PayLine.FINDFIRST;
                        IF PayLine."Applies-to ID" <> '' THEN
                        REPORT.RUN(50289,TRUE,TRUE,PayLine);
                        */
                        Rec.Reset();

                        CurrPage.Update();
                        CurrPage.SaveRecord();

                    end;
                }
                action("Vendor Payment Advise")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor Payment Advise';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    ToolTip = 'Executes the Vendor Payment Advise action.';
                    trigger OnAction()
                    begin
                        if Rec.Status = Rec.Status::Pending then
                            Error('You cannot Print until the document is released for approval');
                        Rec.Reset();
                        Rec.SetFilter(Rec."No.", Rec."No.");
                        Report.Run(50289, true, true, Rec);
                        Rec.Reset();
                    end;
                }
                action("Cheque Confirmation")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cheque Confirmation';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    ToolTip = 'Executes the Cheque Confirmation action.';
                    trigger OnAction()
                    var
                        FilterbyPayline: Record "Payment Line";
                    begin
                        /*
                        IF Status=Status::Pending THEN
                           ERROR('You cannot Print until the document is released for approval');
                        FilterbyPayline.RESET;
                        FilterbyPayline.SETFILTER(FilterbyPayline.No,"No.");
                        */

                        Bank.Reset();
                        Bank.SetFilter("No.", Rec."Paying Bank Account");
                        if Rec."Payment Release Date" <> 0D then
                            Bank.SetFilter("Date Filter", '%1', Rec."Payment Release Date");
                        Report.Run(39005996, true, true, Bank);

                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = page "Funds Mgt Comment List";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("No.");
                    ToolTip = 'Executes the Co&mments action.';
                }
                separator(Action6) { }
                action("ReOpen Document")
                {
                    ApplicationArea = Basic;
                    Caption = 'ReOpen Document';
                    Image = ReOpen;
                    ToolTip = 'Executes the ReOpen Document action.';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        if not Confirm('Are you sure you want to reopen this document?') then
                            exit;
                        Rec.Status := Rec.Status::Pending;
                        Rec.Modify();
                    end;
                }
                action("Cancel Document")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Document';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Cancel Document action.';
                    trigger OnAction()
                    var
                        Text000: Label 'Are you sure you want to cancel this Document?';
                        Text001: Label 'You have selected not to Cancel the Document';
                    begin
                        if Rec.Status = Rec.Status::Posted then
                            Error('Please reverse this document first');//TESTFIELD(Status,Status::Approved);
                        if Confirm(Text000, true) then begin
                            //Post Reversal Entries for Commitments
                            Doc_Type := Doc_Type::"Payment Voucher";
                            CheckBudgetAvail.ReverseEntries(Doc_Type, Rec."No.");
                            Rec.Status := Rec.Status::Cancelled;
                            Rec.Modify();
                        end else
                            Error(Text001);
                    end;
                }
            }
            group("Copy Documents")
            {
                Caption = 'Copy Documents';
                action("Copy Invoice")
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy Invoice';
                    ToolTip = 'Executes the Copy Invoice action.';
                }
                action("Get Payment Request Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Get Payment Request Lines';
                    Image = GetLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Get Payment Request Lines action.';
                    trigger OnAction()
                    var
                        RecLines: Record "Payment Line";
                        PaymentsHeader: Record "Payments Header";
                        PaymentsLine: Record "Payment Line";
                    begin
                        /*
                        PaymentsHeader.INIT;
                          PaymentsHeader.TRANSFERFIELDS(Rec);
                          PaymentsHeader."No.":='';
                        PaymentsHeader.INSERT(TRUE);

                        PaymentsHeader."Global Dimension 1 Code":="Global Dimension 1 Code";
                        PaymentsHeader."Shortcut Dimension 2 Code":="Shortcut Dimension 2 Code";
                        PaymentsHeader.MODIFY;


                        RecLines.SETRANGE(RecLines.No,"No.");
                        IF RecLines.FINDSET THEN
                        REPEAT
                          PaymentsLine.INIT;
                          PaymentsLine.TRANSFERFIELDS(RecLines);
                          PaymentsLine.No:="No.";
                          PaymentsLine.INSERT(TRUE);
                        UNTIL RecLines.NEXT=0;


                        Status:=Status::Posted;
                        Posted:=TRUE;
                        "Date Posted":=TODAY;
                        "Time Posted":=TIME;
                        MODIFY;

                        PAGE.RUN(39005905,PaymentsHeader);
                        */

                        CurrPage.Update(true);
                        InsertRequestLines();

                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        /*
        IF UserMgt.GetPurchasesFilter() <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center" ,UserMgt.GetPurchasesFilter());
          FILTERGROUP(0);
        END;
        */


        if UserMgt.GetSetDimensions(UserId, 2) <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange(Rec."Shortcut Dimension 2 Code", UserMgt.GetSetDimensions(UserId, 2));
            Rec.FilterGroup(0);
        end;
        /*
        FILTERGROUP(2);
        SETRANGE(Cashier,USERID);
        FILTERGROUP(0);
         */

    end;

    var
        Text001: Label 'This Document no %1 has printed Cheque No %2 which will have to be voided first before reposting.';
        Text000: Label 'Do you want to Void Check No %1';
        Text002: Label 'You have selected post and generate a computer cheque ensure that your cheque printer is ready do you want to continue?';
        PayLine: Record "Payment Line";
        PVUsers: Record "W/P Budget Buffer";
        strFilter: Text[250];
        IntC: Integer;
        IntCount: Integer;
        Payments: Record "Payments Header";
        RecPayTypes: Record "Receipts and Payment Types";
        TarriffCodes: Record "Tariff Codes";
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        CashierLinks: Record "Cash Office User Template";
        LineNo: Integer;
        Temp: Record "Cash Office User Template";
        JTemplate: Code[10];
        JBatch: Code[10];
        PCheck: Codeunit "Posting Check FP";
        Post: Boolean;
        strText: Text[100];
        PVHead: Record "Payments Header";
        BankAcc: Record "Bank Account";
        CheckBudgetAvail: Codeunit "Budgetary Control";
        Commitments: Record Committment;
        UserMgt: Codeunit "User Setup Management BR";
        JournlPosted: Codeunit "Journal Post Successful";
        Doc_Type: Option LPO,Requisition,Imprest,"Payment Voucher";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,Load,Discharge,"Express Pv";
        DocPrint: Codeunit "Document-Print";
        CheckLedger: Record "Check Ledger Entry";
        CheckManagement: Codeunit CheckManagement;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        AdjustGenJnl: Codeunit "Adjust Gen. Journal Balance";
        [InDataSet]
        "Cheque No.Editable": Boolean;
        [InDataSet]
        "Payment Release DateEditable": Boolean;
        [InDataSet]
        "Cheque TypeEditable": Boolean;
        [InDataSet]
        "Invoice Currency CodeEditable": Boolean;
        [InDataSet]
        "Currency CodeEditable": Boolean;
        [InDataSet]
        GlobalDimension1CodeEditable: Boolean;
        [InDataSet]
        "Payment NarrationEditable": Boolean;
        [InDataSet]
        ShortcutDimension2CodeEditable: Boolean;
        [InDataSet]
        PayeeEditable: Boolean;
        [InDataSet]
        ShortcutDimension3CodeEditable: Boolean;
        [InDataSet]
        ShortcutDimension4CodeEditable: Boolean;
        [InDataSet]
        DateEditable: Boolean;
        [InDataSet]
        PVLinesEditable: Boolean;
        StatusEditable: Boolean;
        PaymodeEditable: Boolean;
        BankEditabl: Boolean;
        OnBehalfEditable: Boolean;
        RespEditabl: Boolean;
        Bank: Record "Bank Account";


    procedure PostPaymentVoucher(Rec: Record "Payments Header")
    begin

        // DELETE ANY LINE ITEM THAT MAY BE PRESENT
        GenJnlLine.Reset();
        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
        if GenJnlLine.Find('+') then
            LineNo := GenJnlLine."Line No." + 1000
        else
            LineNo := 1000;
        GenJnlLine.DeleteAll();
        GenJnlLine.Reset();

        Payments.Reset();
        Payments.SetRange(Payments."No.", Rec."No.");
        if Payments.Find('-') then begin
            PayLine.Reset();
            PayLine.SetRange(PayLine.No, Payments."No.");
            if PayLine.Find('-') then
                repeat
                    PostHeader(Payments);
                until PayLine.Next() = 0;

            Post := false;
            Post := JournlPosted.PostedSuccessfully();

            if Post then begin
                Rec.Posted := true;
                Rec.Status := Payments.Status::Posted;
                Rec."Posted By" := UserId;
                Rec."Date Posted" := Today;
                Rec."Time Posted" := Time;
                Rec.Modify();

                //Post Reversal Entries for Commitments
                Doc_Type := Doc_Type::"Payment Voucher";
                CheckBudgetAvail.ReverseEntries(Doc_Type, Rec."No.");
            end;

        end;
    end;


    procedure PostHeader(var Payment: Record "Payments Header")
    begin

        if (Payments."Pay Mode" = Payments."Pay Mode"::Cheque) and (Rec."Cheque Type" = Rec."Cheque Type"::" ") then
            Error('Cheque type has to be specified');

        if Payments."Pay Mode" = Payments."Pay Mode"::Cheque then
            if (Payments."Cheque No." = '') and (Rec."Cheque Type" = Rec."Cheque Type"::"Manual Check") then
                Error('Please ensure that the cheque number is inserted');

        if Payments."Pay Mode" = Payments."Pay Mode"::EFT then
            if Payments."Cheque No." = '' then
                Error('Please ensure that the EFT number is inserted');

        if Payments."Pay Mode" = Payments."Pay Mode"::"Letter of Credit" then
            if Payments."Cheque No." = '' then
                Error('Please ensure that the Letter of Credit ref no. is entered.');
        GenJnlLine.Reset();
        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);

        if GenJnlLine.Find('+') then
            LineNo := GenJnlLine."Line No." + 1000
        else
            LineNo := 1000;


        LineNo := LineNo + 1000;
        GenJnlLine.Init();
        GenJnlLine."Journal Template Name" := JTemplate;
        GenJnlLine.Validate(GenJnlLine."Journal Template Name");
        GenJnlLine."Journal Batch Name" := JBatch;
        GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
        GenJnlLine."Line No." := LineNo;
        GenJnlLine."Source Code" := 'PAYMENTJNL';
        GenJnlLine."Posting Date" := Payment."Payment Release Date";
        if CustomerPayLinesExist() then
            GenJnlLine."Document Type" := GenJnlLine."Document Type"::" "
        else
            GenJnlLine."Document Type" := GenJnlLine."Document Type"::Payment;
        GenJnlLine."Document No." := Payments."No.";
        GenJnlLine."External Document No." := Payments."Cheque No.";

        GenJnlLine."Account Type" := GenJnlLine."Account Type"::"Bank Account";
        GenJnlLine."Account No." := Payments."Paying Bank Account";
        GenJnlLine.Validate(GenJnlLine."Account No.");

        GenJnlLine."Currency Code" := Payments."Currency Code";
        GenJnlLine.Validate(GenJnlLine."Currency Code");
        //CurrFactor
        GenJnlLine."Currency Factor" := Payments."Currency Factor";
        GenJnlLine.Validate("Currency Factor");

        Payments.CalcFields(Payments."Total Net Amount", Payments."Total VAT Amount");
        GenJnlLine.Amount := -(Payments."Total Net Amount");
        GenJnlLine.Validate(GenJnlLine.Amount);
        GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
        GenJnlLine."Bal. Account No." := '';

        GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
        GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
        GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
        GenJnlLine."Shortcut Dimension 2 Code" := PayLine."Shortcut Dimension 2 Code";
        GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
        //GenJnlLine.ValidateShortcutDimCode(3,PayLine."Shortcut Dimension 3 Code");
        //GenJnlLine.ValidateShortcutDimCode(4,PayLine."Shortcut Dimension 4 Code");
        GenJnlLine."Dimension Set ID" := PayLine."Dimension Set ID";
        GenJnlLine.Description := CopyStr(Rec."Payment Narration", 1, 50);//COPYSTR('Pay To:' + Payments.Payee,1,50);
        GenJnlLine.Validate(GenJnlLine.Description);

        if Rec."Pay Mode" <> Rec."Pay Mode"::Cheque then
            GenJnlLine."Bank Payment Type" := GenJnlLine."Bank Payment Type"::" "
        else
            if Rec."Cheque Type" = Rec."Cheque Type"::"Computer Check" then
                GenJnlLine."Bank Payment Type" := GenJnlLine."Bank Payment Type"::"Computer Check"
            else
                GenJnlLine."Bank Payment Type" := GenJnlLine."Bank Payment Type"::" ";
        if GenJnlLine.Amount <> 0 then
            GenJnlLine.Insert();

        //Post Other Payment Journal Entries
        PostPV(Payments);
    end;


    procedure GetAppliedEntries(var LineNo: Integer) InvText: Text[100]
    var
        Appl: Record "CshMgt Application";
    begin
        InvText := '';
        Appl.Reset();
        Appl.SetRange(Appl."Document Type", Appl."Document Type"::PV);
        Appl.SetRange(Appl."Document No.", Rec."No.");
        Appl.SetRange(Appl."Line No.", LineNo);
        if Appl.FindFirst() then
            repeat
                InvText := CopyStr(InvText + ',' + Appl."Appl. Doc. No", 1, 50);
            until Appl.Next() = 0;
    end;


    procedure InsertApproval()
    var
        Appl: Record "CshMgt Approvals";
        LineNo: Integer;
    begin
        LineNo := 0;
        Appl.Reset();
        if Appl.FindLast() then
            LineNo := Appl."Line No.";

        LineNo := LineNo + 1;

        Appl.Reset();
        Appl.Init();
        Appl."Line No." := LineNo;
        Appl."Document Type" := Appl."Document Type"::PV;
        Appl."Document No." := Rec."No.";
        Appl."Document Date" := Rec.Date;
        Appl."Process Date" := Today;
        Appl."Process Time" := Time;
        Appl."Process User ID" := UserId;
        Appl."Process Name" := Rec."Current Status";
        //Appl."Process Machine":=ENVIRON('COMPUTERNAME');
        Appl.Insert();
    end;


    procedure LinesCommitmentStatus() Exists: Boolean
    var
        BCSetup: Record "Budgetary Control Setup";
    begin
        if BCSetup.Get() then begin
            if not BCSetup.Mandatory then begin
                Exists := false;
                exit;
            end;
        end else begin
            Exists := false;
            exit;
        end;
        Exists := false;
        PayLine.Reset();
        PayLine.SetRange(PayLine.No, Rec."No.");
        PayLine.SetRange(PayLine.Committed, false);
        PayLine.SetRange(PayLine."Budgetary Control A/C", true);
        if PayLine.Find('-') then
            Exists := true;
    end;


    procedure CheckPVRequiredItems(Rec: Record "Payments Header")
    begin
        if Rec.Posted then
            Error('The Document has already been posted');

        Rec.TestField(Rec.Status, Rec.Status::Approved);
        Rec.TestField(Rec."Paying Bank Account");
        Rec.TestField(Rec."Pay Mode");
        Rec.TestField(Rec."Payment Release Date");
        //Confirm whether Bank Has the Cash
        if Rec."Pay Mode" = Rec."Pay Mode"::Cash then
            CheckBudgetAvail.CheckFundsAvailability(Rec);
        /*
         //Confirm Payment Release Date is today);
        IF "Pay Mode"="Pay Mode"::Cash THEN
          TESTFIELD("Payment Release Date",WORKDATE);
        */
        /*Check if the user has selected all the relevant fields*/
        Temp.Get(UserId);

        JTemplate := Temp."Payment Journal Template";
        JBatch := Temp."Payment Journal Batch";

        if JTemplate = '' then
            Error('Ensure the PV Template is set up in Cash Office Setup');
        if JBatch = '' then
            Error('Ensure the PV Batch is set up in the Cash Office Setup');

        if (Rec."Pay Mode" = Rec."Pay Mode"::Cheque) and (Rec."Cheque Type" = Rec."Cheque Type"::"Computer Check") then
            if not Confirm(Text002, false) then
                Error('You have selected to Abort PV Posting');
        //Check whether there is any printed cheques and lines not posted
        CheckLedger.Reset();
        CheckLedger.SetRange(CheckLedger."Document No.", Rec."No.");
        CheckLedger.SetRange(CheckLedger."Entry Status", CheckLedger."Entry Status"::Printed);
        if CheckLedger.Find('-') then begin
            //Ask whether to void the printed cheque
            GenJnlLine.Reset();
            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
            GenJnlLine.FindFirst();
            if Confirm(Text000, false, CheckLedger."Check No.") then
                CheckManagement.VoidCheck(GenJnlLine)
            else
                Error(Text001, Rec."No.", CheckLedger."Check No.");
        end;

    end;


    procedure PostPV(var Payment: Record "Payments Header")
    var
        StaffClaim: Record "Staff Claims Header";
        AdvanceHeader: Record "Staff Advance Header";
        PayReqHeader: Record "Payments Header";
    begin
        PayLine.Reset();
        PayLine.SetRange(PayLine.No, Payments."No.");
        if PayLine.Find('-') then begin

            repeat
                strText := GetAppliedEntries(PayLine."Line No.");
                Payment.TestField(Payment.Payee);
                PayLine.TestField(PayLine.Amount);
                // PayLine.TESTFIELD(PayLine."Global Dimension 1 Code");

                //BANK
                if PayLine."Pay Mode" = PayLine."Pay Mode"::Cash then begin
                    CashierLinks.Reset();
                    CashierLinks.SetRange(CashierLinks.UserID, UserId);
                end;

                //CHEQUE
                LineNo := LineNo + 1000;
                GenJnlLine.Init();
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                GenJnlLine."Source Code" := 'PAYMENTJNL';
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Posting Date" := Payment."Payment Release Date";
                GenJnlLine."Document No." := PayLine.No;
                if CustomerPayLinesExist() then
                    GenJnlLine."Document Type" := GenJnlLine."Document Type"::" "
                else
                    GenJnlLine."Document Type" := GenJnlLine."Document Type"::Payment;
                GenJnlLine."Account Type" := PayLine."Account Type";
                GenJnlLine."Account No." := PayLine."Account No.";
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."External Document No." := Payments."Cheque No.";
                GenJnlLine.Description := CopyStr(Rec."Payment Narration", 1, 50);
                //    GenJnlLine.Description:=COPYSTR(PayLine."Transaction Name" + ':' + Payment.Payee,1,50);
                GenJnlLine."Currency Code" := Payments."Currency Code";
                GenJnlLine.Validate("Currency Code");
                GenJnlLine."Currency Factor" := Payments."Currency Factor";
                GenJnlLine.Validate("Currency Factor");
                if PayLine."VAT Code" = '' then
                    GenJnlLine.Amount := PayLine."Net Amount"
                else
                    GenJnlLine.Amount := PayLine."Net Amount";
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine."VAT Prod. Posting Group" := PayLine."VAT Prod. Posting Group";
                GenJnlLine.Validate(GenJnlLine."VAT Prod. Posting Group");
                //GenJnlLine.VALIDATE(GenJnlLine."Bal. Account No.");
                GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine."Shortcut Dimension 2 Code" := PayLine."Shortcut Dimension 2 Code";
                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
                GenJnlLine."Dimension Set ID" := PayLine."Dimension Set ID";
                GenJnlLine."Applies-to Doc. Type" := GenJnlLine."Applies-to Doc. Type"::Invoice;
                GenJnlLine."Applies-to Doc. No." := PayLine."Applies-to Doc. No.";
                GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                GenJnlLine."Applies-to ID" := PayLine."Applies-to ID";

                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert();

                //Post VAT to GL[VAT GL]
                TarriffCodes.Reset();
                TarriffCodes.SetRange(TarriffCodes.Code, PayLine."VAT Code");
                if TarriffCodes.Find('-') then begin
                    TarriffCodes.TestField(TarriffCodes."Account No.");
                    LineNo := LineNo + 1000;
                    GenJnlLine.Init();
                    GenJnlLine."Journal Template Name" := JTemplate;
                    GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                    GenJnlLine."Journal Batch Name" := JBatch;
                    GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                    GenJnlLine."Source Code" := 'PAYMENTJNL';
                    GenJnlLine."Line No." := LineNo;
                    GenJnlLine."Posting Date" := Payment."Payment Release Date";
                    //IF CustomerPayLinesExist THEN
                    GenJnlLine."Document Type" := GenJnlLine."Document Type"::" ";
                    //ELSE
                    // GenJnlLine."Document Type":=GenJnlLine."Document Type"::Payment;
                    GenJnlLine."Document No." := PayLine.No;
                    GenJnlLine."External Document No." := Payments."Cheque No.";
                    GenJnlLine."Account Type" := GenJnlLine."Account Type"::"G/L Account";
                    GenJnlLine."Account No." := TarriffCodes."Account No.";
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Currency Code" := Payments."Currency Code";
                    GenJnlLine.Validate(GenJnlLine."Currency Code");
                    //CurrFactor
                    GenJnlLine."Currency Factor" := Payments."Currency Factor";
                    GenJnlLine.Validate("Currency Factor");

                    GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::" ";
                    GenJnlLine.Validate(GenJnlLine."Gen. Posting Type");
                    GenJnlLine."Gen. Bus. Posting Group" := '';
                    GenJnlLine.Validate(GenJnlLine."Gen. Bus. Posting Group");
                    GenJnlLine."Gen. Prod. Posting Group" := '';
                    GenJnlLine.Validate(GenJnlLine."Gen. Prod. Posting Group");
                    GenJnlLine."VAT Bus. Posting Group" := '';
                    GenJnlLine.Validate(GenJnlLine."VAT Bus. Posting Group");
                    GenJnlLine."VAT Prod. Posting Group" := '';
                    GenJnlLine.Validate(GenJnlLine."VAT Prod. Posting Group");
                    GenJnlLine.Amount := -PayLine."VAT Amount";
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
                    GenJnlLine."Bal. Account No." := '';
                    GenJnlLine.Description := CopyStr('VAT:' + Format(PayLine."Account Type") + '::' + Format(PayLine."Account Name"), 1, 50);
                    GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                    GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                    GenJnlLine."Shortcut Dimension 2 Code" := PayLine."Shortcut Dimension 2 Code";
                    GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
                    GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine."Dimension Set ID" := PayLine."Dimension Set ID";

                    if GenJnlLine.Amount <> 0 then
                        GenJnlLine.Insert();
                end;

                //POST W/TAX to Respective W/TAX GL Account
                TarriffCodes.Reset();
                TarriffCodes.SetRange(TarriffCodes.Code, PayLine."Withholding Tax Code");
                if TarriffCodes.Find('-') then begin
                    TarriffCodes.TestField(TarriffCodes."Account No.");
                    LineNo := LineNo + 1000;
                    GenJnlLine.Init();
                    GenJnlLine."Journal Template Name" := JTemplate;
                    GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                    GenJnlLine."Journal Batch Name" := JBatch;
                    GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                    GenJnlLine."Source Code" := 'PAYMENTJNL';
                    GenJnlLine."Line No." := LineNo;
                    GenJnlLine."Posting Date" := Payment."Payment Release Date";
                    //IF CustomerPayLinesExist THEN
                    GenJnlLine."Document Type" := GenJnlLine."Document Type"::" ";
                    //ELSE
                    // GenJnlLine."Document Type":=GenJnlLine."Document Type"::Payment;
                    GenJnlLine."Document No." := PayLine.No;
                    GenJnlLine."External Document No." := Payments."Cheque No.";
                    GenJnlLine."Account Type" := TarriffCodes."Account Type";
                    GenJnlLine."Account No." := TarriffCodes."Account No.";
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Currency Code" := Payments."Currency Code";
                    GenJnlLine.Validate(GenJnlLine."Currency Code");
                    //CurrFactor
                    GenJnlLine."Currency Factor" := Payments."Currency Factor";
                    GenJnlLine.Validate("Currency Factor");

                    GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::" ";
                    GenJnlLine.Validate(GenJnlLine."Gen. Posting Type");
                    GenJnlLine."Gen. Bus. Posting Group" := '';
                    GenJnlLine.Validate(GenJnlLine."Gen. Bus. Posting Group");
                    GenJnlLine."Gen. Prod. Posting Group" := '';
                    GenJnlLine.Validate(GenJnlLine."Gen. Prod. Posting Group");
                    GenJnlLine."VAT Bus. Posting Group" := '';
                    GenJnlLine.Validate(GenJnlLine."VAT Bus. Posting Group");
                    GenJnlLine."VAT Prod. Posting Group" := '';
                    GenJnlLine.Validate(GenJnlLine."VAT Prod. Posting Group");
                    GenJnlLine.Amount := -PayLine."Withholding Tax Amount";
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
                    GenJnlLine."Bal. Account No." := '';
                    GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                    GenJnlLine.Description := CopyStr('W/Tax:' + Format(PayLine."Account Name") + '::' + strText, 1, 50);
                    GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                    GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                    GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
                    GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine."Dimension Set ID" := PayLine."Dimension Set ID";

                    if GenJnlLine.Amount <> 0 then
                        GenJnlLine.Insert();
                end;
                //Post VAT Balancing Entry Goes to Vendor
                LineNo := LineNo + 1000;
                GenJnlLine.Init();
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                GenJnlLine."Source Code" := 'PAYMENTJNL';
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Posting Date" := Payment."Payment Release Date";
                //IF CustomerPayLinesExist THEN
                GenJnlLine."Document Type" := GenJnlLine."Document Type"::" ";
                //ELSE
                // GenJnlLine."Document Type":=GenJnlLine."Document Type"::Payment;
                GenJnlLine."Document No." := PayLine.No;
                GenJnlLine."External Document No." := Payments."Cheque No.";
                GenJnlLine."Account Type" := PayLine."Account Type";
                GenJnlLine."Account No." := PayLine."Account No.";
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Currency Code" := Payments."Currency Code";
                GenJnlLine.Validate(GenJnlLine."Currency Code");
                //CurrFactor
                GenJnlLine."Currency Factor" := Payments."Currency Factor";
                GenJnlLine.Validate("Currency Factor");

                if PayLine."VAT Code" = '' then
                    GenJnlLine.Amount := 0
                else
                    GenJnlLine.Amount := PayLine."VAT Amount";
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
                GenJnlLine."Bal. Account No." := '';
                GenJnlLine.Description := CopyStr('VAT:' + Format(PayLine."Account Type") + '::' + Format(PayLine."Account Name"), 1, 50);
                GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine."Shortcut Dimension 2 Code" := PayLine."Shortcut Dimension 2 Code";
                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
                GenJnlLine."Dimension Set ID" := PayLine."Dimension Set ID";
                GenJnlLine."Applies-to Doc. Type" := GenJnlLine."Applies-to Doc. Type"::Invoice;
                GenJnlLine."Applies-to Doc. No." := PayLine."Apply to";
                GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                GenJnlLine."Applies-to ID" := PayLine."Apply to ID";
                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert();

                //Post W/TAX Balancing Entry Goes to Vendor
                LineNo := LineNo + 1000;
                GenJnlLine.Init();
                GenJnlLine."Journal Template Name" := JTemplate;
                GenJnlLine.Validate(GenJnlLine."Journal Template Name");
                GenJnlLine."Journal Batch Name" := JBatch;
                GenJnlLine.Validate(GenJnlLine."Journal Batch Name");
                GenJnlLine."Source Code" := 'PAYMENTJNL';
                GenJnlLine."Line No." := LineNo;
                GenJnlLine."Posting Date" := Payment."Payment Release Date";
                //IF CustomerPayLinesExist THEN
                GenJnlLine."Document Type" := GenJnlLine."Document Type"::" ";
                //ELSE
                // GenJnlLine."Document Type":=GenJnlLine."Document Type"::Payment;
                GenJnlLine."Document No." := PayLine.No;
                GenJnlLine."External Document No." := Payments."Cheque No.";
                GenJnlLine."Account Type" := PayLine."Account Type";
                GenJnlLine."Account No." := PayLine."Account No.";
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."Currency Code" := Payments."Currency Code";
                GenJnlLine.Validate(GenJnlLine."Currency Code");
                //CurrFactor
                GenJnlLine."Currency Factor" := Payments."Currency Factor";
                GenJnlLine.Validate("Currency Factor");
                //Remittance Type
                GenJnlLine."Remittance Type" := GenJnlLine."Remittance Type"::"W/Tax";

                GenJnlLine."Gen. Posting Type" := GenJnlLine."Gen. Posting Type"::" ";
                GenJnlLine.Validate(GenJnlLine."Gen. Posting Type");
                GenJnlLine."Gen. Bus. Posting Group" := '';
                GenJnlLine.Validate(GenJnlLine."Gen. Bus. Posting Group");
                GenJnlLine."Gen. Prod. Posting Group" := '';
                GenJnlLine.Validate(GenJnlLine."Gen. Prod. Posting Group");
                GenJnlLine."VAT Bus. Posting Group" := '';
                GenJnlLine.Validate(GenJnlLine."VAT Bus. Posting Group");
                GenJnlLine."VAT Prod. Posting Group" := '';
                GenJnlLine.Validate(GenJnlLine."VAT Prod. Posting Group");
                GenJnlLine.Amount := PayLine."Withholding Tax Amount";
                GenJnlLine.Validate(GenJnlLine.Amount);
                GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
                GenJnlLine."Bal. Account No." := '';
                GenJnlLine.Description := CopyStr('W/Tax:' + strText, 1, 50);
                GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                GenJnlLine."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
                GenJnlLine."Dimension Set ID" := PayLine."Dimension Set ID";
                GenJnlLine."Applies-to Doc. Type" := GenJnlLine."Applies-to Doc. Type"::Invoice;
                GenJnlLine."Applies-to Doc. No." := PayLine."Apply to";
                GenJnlLine.Validate(GenJnlLine."Applies-to Doc. No.");
                GenJnlLine."Applies-to ID" := PayLine."Apply to ID";
                if GenJnlLine.Amount <> 0 then
                    GenJnlLine.Insert();



            until PayLine.Next() = 0;

            Commit();
            //Post the Journal Lines
            GenJnlLine.Reset();
            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
            //Adjust Gen Jnl Exchange Rate Rounding Balances
            AdjustGenJnl.Run(GenJnlLine);
            //End Adjust Gen Jnl Exchange Rate Rounding Balances


            //Before posting if paymode is cheque print the cheque
            if (Rec."Pay Mode" = Rec."Pay Mode"::Cheque) and (Rec."Cheque Type" = Rec."Cheque Type"::"Computer Check") then begin
                DocPrint.PrintCheck(GenJnlLine);
                Codeunit.Run(Codeunit::"Adjust Gen. Journal Balance", GenJnlLine);
                //Confirm Cheque printed //Not necessary.
            end;

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnlLine);
            Post := false;
            Post := JournlPosted.PostedSuccessfully();
            if Post then begin
                if PayLine.FindFirst() then
                    repeat
                        PayLine."Date Posted" := Today;
                        PayLine."Time Posted" := Time;
                        PayLine."Posted By" := UserId;
                        PayLine.Status := PayLine.Status::Posted;
                        PayLine.Modify();
                    until PayLine.Next() = 0;
                //update creation doc as posted
                if StaffClaim.Get(Rec."Creation Doc No.") then begin
                    StaffClaim."Date Posted" := Today;
                    StaffClaim."Time Posted" := Time;
                    StaffClaim."Posted By" := UserId;
                    StaffClaim.Status := Rec.Status::Posted;
                    StaffClaim.Posted := true;
                    StaffClaim.Modify();
                end;
                if AdvanceHeader.Get(Rec."Creation Doc No.") then begin
                    AdvanceHeader."Date Posted" := Today;
                    AdvanceHeader."Time Posted" := Time;
                    AdvanceHeader."Posted By" := UserId;
                    AdvanceHeader.Status := Rec.Status::Posted;
                    AdvanceHeader.Posted := true;
                    AdvanceHeader.Modify();
                end;
                if PayReqHeader.Get(Rec."Creation Doc No.") then begin
                    PayReqHeader."Date Posted" := Today;
                    PayReqHeader."Time Posted" := Time;
                    PayReqHeader."Posted By" := UserId;
                    PayReqHeader.Status := Rec.Status::Posted;
                    PayReqHeader.Posted := true;
                    PayReqHeader.Modify();
                end;
            end;

        end;
    end;


    procedure UpdatePageControls()
    begin
        /*
           IF Status<>Status::Approved THEN BEGIN
             "Payment Release DateEditable" :=FALSE;
             //CurrForm."Paying Bank Account".EDITABLE:=FALSE;
             //CurrForm."Pay Mode".EDITABLE:=FALSE;
             //CurrForm."Currency Code".EDITABLE:=TRUE;
             "Cheque No.Editable" :=FALSE;
             "Cheque TypeEditable" :=FALSE;
             "Invoice Currency CodeEditable" :=TRUE;
           END ELSE BEGIN
             "Payment Release DateEditable" :=TRUE;
             //CurrForm."Paying Bank Account".EDITABLE:=TRUE;
             //CurrForm."Pay Mode".EDITABLE:=TRUE;
             IF "Pay Mode"="Pay Mode"::Cheque THEN
               "Cheque TypeEditable" :=TRUE;
             //CurrForm."Currency Code".EDITABLE:=FALSE;
             IF "Cheque Type"<>"Cheque Type"::"Computer Check" THEN
                 "Cheque No.Editable" :=TRUE;
             "Invoice Currency CodeEditable" :=FALSE;
            PaymodeEditable:=TRUE;
            BankEditabl:=TRUE;
            OnBehalfEditable:=TRUE;
            RespEditabl:=TRUE;

           END;
           IF Status=Status::Pending THEN BEGIN
             "Currency CodeEditable" :=TRUE;
             GlobalDimension1CodeEditable :=TRUE;
             "Payment NarrationEditable" :=TRUE;
             ShortcutDimension2CodeEditable :=TRUE;
             PayeeEditable :=TRUE;
             ShortcutDimension3CodeEditable :=TRUE;
             ShortcutDimension4CodeEditable :=TRUE;
             DateEditable :=TRUE;
            PaymodeEditable:=TRUE;
            BankEditabl:=TRUE;
            OnBehalfEditable:=TRUE;
            RespEditabl:=TRUE;

             PVLinesEditable :=TRUE;
           END ELSE BEGIN
             "Currency CodeEditable" :=FALSE;
             GlobalDimension1CodeEditable :=FALSE;
             "Payment NarrationEditable" :=FALSE;
             ShortcutDimension2CodeEditable :=FALSE;
             PayeeEditable :=TRUE;
             ShortcutDimension3CodeEditable :=FALSE;
             ShortcutDimension4CodeEditable :=FALSE;
             DateEditable :=FALSE;
             PVLinesEditable :=FALSE;
           END;

           IF Status=Status::Posted THEN BEGIN
            PaymodeEditable:=FALSE;
            BankEditabl:=FALSE;
            OnBehalfEditable:=FALSE;
            RespEditabl:=FALSE;
            PVLinesEditable :=FALSE;
           END;
        */

    end;


    procedure LinesExists(): Boolean
    var
        PayLines: Record "Payment Line";
    begin
        HasLines := false;
        PayLines.Reset();
        PayLines.SetRange(PayLines.No, Rec."No.");
        if PayLines.Find('-') then begin
            HasLines := true;
            exit(HasLines);
        end;
    end;


    procedure AllFieldsEntered(): Boolean
    var
        PayLines: Record "Payment Line";
    begin
        AllKeyFieldsEntered := true;
        PayLines.Reset();
        PayLines.SetRange(PayLines.No, Rec."No.");
        if PayLines.Find('-') then begin
            repeat
                if (PayLines."Account No." = '') or (PayLines.Amount <= 0) then
                    AllKeyFieldsEntered := false;
            until PayLines.Next() = 0;
            exit(AllKeyFieldsEntered);
        end;
    end;


    procedure CustomerPayLinesExist(): Boolean
    var
        PayLine: Record "Payment Line";
        PayLine1: Record "Payment Line";
    begin
        PayLine.Reset();
        PayLine.SetRange(PayLine.No, Rec."No.");
        PayLine.SetRange(PayLine."Account Type", PayLine."Account Type"::Customer);
        if PayLine.FindFirst() then
            exit(true)
        else begin
            PayLine1.Reset();
            PayLine1.SetRange(PayLine1.No, Rec."No.");
            PayLine1.SetFilter(PayLine1."Net Amount", '<%1', 0);
            if PayLine1.FindFirst() then
                exit(true)
            else
                exit(false)
        end
    end;

    local procedure CurrpageupdateOld()
    begin
        xRec := Rec;
        UpdatePageControls();
        CurrPage.Update();
        //Set the filters here
        Rec.SetRange(Rec.Posted, false);
        Rec.SetRange(Rec."Payment Type", Rec."Payment Type"::Normal);
        Rec.SetFilter(Rec.Status, '<>Cancelled');
    end;


    procedure UpdateControls()
    begin
        /*
        IF Status=Status::Pending THEN
        StatusEditable:=TRUE
        ELSE
        StatusEditable:=FALSE;
        */

    end;


    procedure CurrPageUpdate()
    begin
        xRec := Rec;
        UpdateControls();
        UpdatePageControls();
        CurrPage.Update();
    end;


    procedure InsertRequestLines()
    var
        Counter: Integer;
        Request: Record "Payments Header";
        RequestList: Page "Payment Requests List";
        RequestLines: Record "Payment Line";
        Line: Record "Payment Line";
    begin
        Request.SetRange(Request.Status, Request.Status::Approved);
        if Request.FindSet() then begin
            RequestList.LookupMode(true);
            RequestList.SetTableView(Request);
            if RequestList.RunModal() = Action::LookupOK then begin
                RequestList.SetSelection(Request);
                Counter := Request.Count;
                if Counter > 0 then
                    if Request.FindSet() then
                        repeat
                            RequestLines.Reset();
                            RequestLines.SetRange(RequestLines.No, Request."No.");
                            RequestLines.FindSet();
                            repeat
                                Line.Init();
                                Line.TransferFields(RequestLines);
                                Line.No := Rec."No.";
                                Line.Insert(true);
                            until RequestLines.Next() = 0;
                            Request.Status := Rec.Status::Posted;
                            Request.Posted := true;
                            Request."Date Posted" := Today;
                            Request."Time Posted" := Time;
                            Request.Modify();
                        until Request.Next() = 0;
            end;
        end
    end;
}
