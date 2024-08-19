#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193686 "Payment Request Header"
{
    // //Use if Cheque is to be Validated
    // Payments.RESET;
    // Payments.SETRANGE(Payments."No.","No.");
    // IF Payments.FINDFIRST THEN
    //   BEGIN
    //     IF Payments."Pay Mode"=Payments."Pay Mode"::Cheque THEN
    //       BEGIN
    //          IF STRLEN(Payments."Cheque No.")<>6 THEN
    //           BEGIN
    //             ERROR ('Invalid Cheque Number Inserted');
    //           END;
    //       END;
    //   END;
    // **************************************************************************************
    // //Use if Paying Bank Account should not be overdrawn
    //
    // //get the source account balance from the database table
    // BankAcc.RESET;
    // BankAcc.SETRANGE(BankAcc."No.",Payment."Paying Bank Account");
    // BankAcc.SETRANGE(BankAcc."Bank Type",BankAcc."Bank Type"::Cash);
    // IF BankAcc.FINDFIRST THEN
    //   BEGIN
    //     Payments.TESTFIELD(Payments.Date,TODAY);
    //     BankAcc.CALCFIELDS(BankAcc."Balance (LCY)");
    //     "Current Source A/C Bal.":=BankAcc."Balance (LCY)";
    //     IF ("Current Source A/C Bal."-Payment."Total Net Amount")<0 THEN
    //       BEGIN
    //         ERROR('The transaction will result in a negative balance in the BANK ACCOUNT.');
    //       END;
    //   END;

    Caption = 'Payment Request';
    DeleteAllowed = false;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    RefreshOnActivate = true;
    SourceTable = "Payments Header";
    SourceTableView = where("Payment Type" = const(Express));
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = DateEditable;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = GlobalDimension1CodeEditable;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Function Name"; Rec."Function Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = ShortcutDimension2CodeEditable;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Budget Center Name"; Rec."Budget Center Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Editable = ShortcutDimension3CodeEditable;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field(Dim3; Rec.Dim3)
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    Editable = ShortcutDimension4CodeEditable;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                }
                field(Dim4; Rec.Dim4)
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    Editable = PaymodeEditable;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = "Currency CodeEditable";
                    Visible = false;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    Editable = BankEditabl;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Paying Bank Account field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    Caption = 'Payment to';
                    Editable = PayeeEditable;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Payment to field.';
                }
                field("On Behalf Of"; Rec."On Behalf Of")
                {
                    ApplicationArea = Basic;
                    Editable = OnBehalfEditable;
                    Visible = false;
                    ToolTip = 'Specifies the value of the On Behalf Of field.';
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Payment Narration field.';
                }
                field("Cheque Type"; Rec."Cheque Type")
                {
                    ApplicationArea = Basic;
                    Editable = "Cheque TypeEditable";
                    Visible = false;
                    ToolTip = 'Specifies the value of the Cheque Type field.';
                    trigger OnValidate()
                    begin
                        if Rec."Cheque Type" = Rec."Cheque Type"::"Computer Check" then
                            "Cheque No.Editable" := false
                        else
                            "Cheque No.Editable" := true;
                    end;
                }
                field("Invoice Currency Code"; Rec."Invoice Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = "Invoice Currency CodeEditable";
                    Visible = false;
                    ToolTip = 'Specifies the value of the Invoice Currency Code field.';
                }
                field(Cashier; Rec.Cashier)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Cashier field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Total Payment Amount"; Rec."Total Payment Amount")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Total Payment Amount field.';
                }
                field("Total VAT Amount"; Rec."Total VAT Amount")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Total VAT Amount field.';
                }
                field("Total Witholding Tax Amount"; Rec."Total Witholding Tax Amount")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Total Witholding Tax Amount field.';
                }
                field("Total Retention Amount"; Rec."Total Retention Amount")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Total Retention Amount field.';
                }
                field("""Total Payment Amount"" -( ""Total Witholding Tax Amount""+""Total VAT Amount""+""Total Retention Amount"")"; Rec."Total Payment Amount" - (Rec."Total Witholding Tax Amount" + Rec."Total VAT Amount" + Rec."Total Retention Amount"))
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Net Amount';
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Total Net Amount field.';
                }
                field("Total Payment Amount LCY"; Rec."Total Payment Amount LCY")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Net Amount LCY';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Net Amount LCY field.';
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cheque/EFT No.';
                    Editable = "Cheque No.Editable";
                    Visible = false;
                    ToolTip = 'Specifies the value of the Cheque/EFT No. field.';
                    trigger OnValidate()
                    begin
                        //check if the cheque has been inserted
                        Rec.TestField(Rec."Paying Bank Account");
                        PVHead.Reset();
                        PVHead.SetRange(PVHead."Paying Bank Account", Rec."Paying Bank Account");
                        PVHead.SetRange(PVHead."Pay Mode", PVHead."Pay Mode"::Cheque);
                        if PVHead.FindFirst() then
                            repeat
                                if PVHead."Cheque No." = Rec."Cheque No." then
                                    if PVHead."No." <> Rec."No." then
                                        Error('The Cheque Number has already been utilised');
                            until PVHead.Next() = 0;
                    end;
                }
                field("Payment Release Date"; Rec."Payment Release Date")
                {
                    ApplicationArea = Basic;
                    Editable = "Payment Release DateEditable";
                    Visible = false;
                    ToolTip = 'Specifies the value of the Payment Release Date field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
            }
            part(PVLines; "Payment Request Lines")
            {
                SubPageLink = No = field("No.");
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
                action("Copy Invoice")
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy Invoice';
                    ToolTip = 'Executes the Copy Invoice action.';
                }
                separator(Action21) { }
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
                action("Cancel Approval Re&quest")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';

                }
                separator(Action9) { }
                action("Create PV")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create PV';
                    Image = CreateDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Create PV action.';
                    trigger OnAction()
                    var
                        RecLines: Record "Payment Line";
                        PaymentsHeader: Record "Payments Header";
                        PaymentsLine: Record "Payment Line";
                    begin
                        Rec.TestField(Rec."Pay Mode");
                        PaymentsHeader.Init();
                        PaymentsHeader.TransferFields(Rec);
                        PaymentsHeader."No." := '';
                        if Rec."Pay Mode" = Rec."Pay Mode"::Cash then
                            PaymentsHeader."Payment Type" := PaymentsHeader."Payment Type"::"Petty Cash"
                        else
                            PaymentsHeader."Payment Type" := PaymentsHeader."Payment Type"::Normal;
                        PaymentsHeader."Creation Doc No." := Rec."No.";
                        PaymentsHeader.Insert(true);

                        PaymentsHeader."Global Dimension 1 Code" := Rec."Global Dimension 1 Code";
                        PaymentsHeader."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                        PaymentsHeader.Modify();


                        RecLines.SetRange(RecLines.No, Rec."No.");
                        if RecLines.FindSet() then
                            repeat
                                PaymentsLine.Init();
                                PaymentsLine.TransferFields(RecLines);
                                PaymentsLine.No := PaymentsHeader."No.";
                                PaymentsLine.Insert();
                            until RecLines.Next() = 0;

                        Rec.Status := Rec.Status::Posted;
                        Rec.Posted := true;
                        Rec."Date Posted" := Today;
                        Rec."Time Posted" := Time;
                        Rec.Modify();

                        if Rec."Pay Mode" = Rec."Pay Mode"::Cash then
                            Page.Run(39005902, PaymentsHeader)
                        else
                            Page.Run(39005905, PaymentsHeader);
                    end;
                }
                action("Cancel Payment Document")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Payment Document';
                    Image = CancelAttachment;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Cancel Payment Document action.';
                    trigger OnAction()
                    var
                        PaymentHeader: Record "Payments Header";
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Approved);
                        PaymentHeader.Reset();
                        PaymentHeader.SetRange(PaymentHeader."Creation Doc No.", Rec."No.");
                        PaymentHeader.SetRange(Status, Rec.Status::Approved);
                        if PaymentHeader.FindFirst() then begin
                            if Confirm('Are you sure you want to cancel document %1, and reopen the payment request %2 ?', false, PaymentHeader."No.", Rec."No.") then begin
                                PaymentHeader.Status := PaymentHeader.Status::Cancelled;
                                PaymentHeader.Modify();
                                Rec.Posted := false;
                                Rec.Modify();
                            end
                        end
                        else
                            Error('No Payment Document exists for this Payment Request');
                    end;
                }
            }
            group("&Functions")
            {
                Caption = '&Functions';
                Visible = false;
                action("Post Payment")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Payment';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;
                    ToolTip = 'Executes the Post Payment action.';

                }
                separator(Action1102755026) { }
                action(Action1102755034)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        Approvalentries: Page "Approval Entries";
                    begin
                        /*
                        IF "Payment Type"="Payment Type"::Normal THEN
                          DocumentType:=DocumentType::"Payment Voucher"
                        ELSE
                        */
                        DocumentType := DocumentType::Requisition;
                        Approvalentries.Setfilters(Database::"Payments Header", DocumentType, Rec."No.");
                        Approvalentries.Run();

                    end;
                }
                action(Action1102755007)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
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
                    Visible = false;
                    ToolTip = 'Executes the Print preview action.';
                }
                action(Action1102755028)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';

                }
                separator(Action1102755009) { }
                action("Check Budgetary Availability")
                {
                    ApplicationArea = Basic;
                    Caption = 'Check Budgetary Availability';
                    Image = Balance;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    Visible = false;
                    ToolTip = 'Executes the Check Budgetary Availability action.';
                    trigger OnAction()
                    var
                        BCSetup: Record "Budgetary Control Setup";
                    begin
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
                    Visible = false;
                    ToolTip = 'Executes the Cancel Budget Commitment action.';
                    trigger OnAction()
                    begin
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
                separator(Action1102755033) { }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print/Preview';
                    Image = ConfirmAndPrint;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    Visible = false;
                    ToolTip = 'Executes the Print/Preview action.';
                    trigger OnAction()
                    begin
                        if Rec.Status <> Rec.Status::Approved then
                            Error('You can only print a Payment Voucher after it is fully Approved');



                        //IF Status=Status::Pending THEN
                        //ERROR('You cannot Print until the document is released for approval');
                        Rec.Reset();
                        Rec.SetFilter(Rec."No.", Rec."No.");
                        Report.Run(39005903, true, true, Rec);
                        Rec.Reset();

                        CurrPage.Update();
                        CurrPage.SaveRecord();
                    end;
                }
                action("Bank Letter")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Letter';
                    Visible = false;
                    ToolTip = 'Executes the Bank Letter action.';
                    trigger OnAction()
                    var
                        FilterbyPayline: Record "Payment Line";
                    begin
                        if Rec.Status = Rec.Status::Pending then
                            Error('You cannot Print until the document is released for approval');
                        FilterbyPayline.Reset();
                        FilterbyPayline.SetFilter(FilterbyPayline.No, Rec."No.");
                        Report.Run(39006007, true, true, FilterbyPayline);
                        Rec.Reset();
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
                    Visible = false;
                    ToolTip = 'Executes the Co&mments action.';
                }
                separator(Action1102756005) { }
                action("Cancel Document")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Document';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;
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
                Visible = false;
                action("Copy Loan")
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy Loan';
                    Image = GetLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;
                    ToolTip = 'Executes the Copy Loan action.';
                }
                action(Action1102755012)
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy Invoice';
                    Visible = false;
                    ToolTip = 'Executes the Copy Invoice action.';

                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //Currpageupdate;
        CurrPageUpdate();
    end;

    trigger OnInit()
    begin
        PVLinesEditable := true;
        DateEditable := true;
        PayeeEditable := true;
        ShortcutDimension2CodeEditable := true;
        "Payment NarrationEditable" := true;
        GlobalDimension1CodeEditable := true;
        "Currency CodeEditable" := true;
        "Invoice Currency CodeEditable" := true;
        "Cheque TypeEditable" := true;
        "Payment Release DateEditable" := true;
        "Cheque No.Editable" := true;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Payment Type" := Rec."Payment Type"::Express;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter();
        //Add dimensions if set by default here
        Rec."Global Dimension 1 Code" := UserMgt.GetSetDimensions(UserId, 1);
        Rec.Validate(Rec."Global Dimension 1 Code");
        Rec."Shortcut Dimension 2 Code" := UserMgt.GetSetDimensions(UserId, 2);
        Rec.Validate(Rec."Shortcut Dimension 2 Code");
        Rec."Shortcut Dimension 3 Code" := UserMgt.GetSetDimensions(UserId, 3);
        Rec.Validate(Rec."Shortcut Dimension 3 Code");
        Rec."Shortcut Dimension 4 Code" := UserMgt.GetSetDimensions(UserId, 4);
        Rec.Validate(Rec."Shortcut Dimension 4 Code");

        //OnAfterGetCurrRecord;
        UpdateControls();
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        UpdateControls();
    end;


    var
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
        Text001: Label 'This Document no %1 has printed Cheque No %2 which will have to be voided first before reposting.';
        CheckManagement: Codeunit CheckManagement;
        Text000: Label 'Do you want to Void Check No %1';
        Text002: Label 'You have selected post and generate a computer cheque ensure that your cheque printer is ready do you want to continue?';
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
        prAssignEmp: Record "CshMgt Approvals";
        PaymentsHeader: Record "Payments Header";
        PaymentsLine: Record "Payment Line";


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
        Appl: Record "Workplan Activities";
    begin

        InvText := '';
        Appl.Reset();
        ///Appl.SETRANGE(Appl."Document Type",Appl."Document Type"::PV);
        ///Appl.SETRANGE(Appl."Document No.","No.");
        ///Appl.SETRANGE(Appl."Line No.",LineNo);
        if Appl.FindFirst() then
            repeat
            ///      InvText:=COPYSTR(InvText + ',' + Appl."Appl. Doc. No",1,50);
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
                if PayLine."Account Type" = PayLine."Account Type"::Customer then
                    GenJnlLine."Document Type" := GenJnlLine."Document Type"::" "
                else
                    GenJnlLine."Document Type" := GenJnlLine."Document Type"::Payment;
                GenJnlLine."Account Type" := PayLine."Account Type";
                GenJnlLine."Account No." := PayLine."Account No.";
                GenJnlLine.Validate(GenJnlLine."Account No.");
                GenJnlLine."External Document No." := Payments."Cheque No.";
                GenJnlLine.Description := CopyStr(PayLine."Transaction Name" + ':' + Payment.Payee, 1, 50);
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
                    GenJnlLine."Document Type" := GenJnlLine."Document Type"::Payment;
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
                    GenJnlLine."Document Type" := GenJnlLine."Document Type"::Payment;
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
                    GenJnlLine.Amount := -PayLine."Withholding Tax Amount";
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"G/L Account";
                    GenJnlLine."Bal. Account No." := '';
                    GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
                    GenJnlLine.Description := CopyStr('W/Tax:' + Format(PayLine."Account Name") + '::' + strText, 1, 50);
                    GenJnlLine."Shortcut Dimension 1 Code" := PayLine."Global Dimension 1 Code";
                    GenJnlLine."Shortcut Dimension 2 Code" := PayLine."Shortcut Dimension 2 Code";
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
                GenJnlLine."Document Type" := GenJnlLine."Document Type"::Payment;
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
                GenJnlLine."Document Type" := GenJnlLine."Document Type"::Payment;
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
                GenJnlLine."Shortcut Dimension 2 Code" := PayLine."Shortcut Dimension 2 Code";
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

            Codeunit.Run(Codeunit::"Gen. Jnl.-Post Line", GenJnlLine);
            Post := false;
            Post := JournlPosted.PostedSuccessfully();
            if Post then
                if PayLine.FindFirst() then
                    repeat
                        PayLine."Date Posted" := Today;
                        PayLine."Time Posted" := Time;
                        PayLine."Posted By" := UserId;
                        PayLine.Status := PayLine.Status::Posted;
                        PayLine.Modify();
                    until PayLine.Next() = 0;

        end;
    end;


    procedure UpdatePageControls()
    begin
        if Rec.Status <> Rec.Status::Approved then begin
            "Payment Release DateEditable" := false;
            //CurrForm."Paying Bank Account".EDITABLE:=FALSE;
            //CurrForm."Pay Mode".EDITABLE:=FALSE;
            //CurrForm."Currency Code".EDITABLE:=TRUE;
            "Cheque No.Editable" := false;
            "Cheque TypeEditable" := false;
            "Invoice Currency CodeEditable" := true;
        end else begin
            "Payment Release DateEditable" := true;
            //CurrForm."Paying Bank Account".EDITABLE:=TRUE;
            //CurrForm."Pay Mode".EDITABLE:=TRUE;
            if Rec."Pay Mode" = Rec."Pay Mode"::Cheque then
                "Cheque TypeEditable" := true;
            //CurrForm."Currency Code".EDITABLE:=FALSE;
            if Rec."Cheque Type" <> Rec."Cheque Type"::"Computer Check" then
                "Cheque No.Editable" := true;
            "Invoice Currency CodeEditable" := false;
            PaymodeEditable := true;
            BankEditabl := true;
            OnBehalfEditable := true;
            RespEditabl := true;

        end;
        if Rec.Status = Rec.Status::Pending then begin
            "Currency CodeEditable" := true;
            GlobalDimension1CodeEditable := true;
            "Payment NarrationEditable" := true;
            ShortcutDimension2CodeEditable := true;
            PayeeEditable := true;
            ShortcutDimension3CodeEditable := true;
            ShortcutDimension4CodeEditable := true;
            DateEditable := true;
            PaymodeEditable := true;
            BankEditabl := true;
            OnBehalfEditable := true;
            RespEditabl := true;

            PVLinesEditable := true;
        end else begin
            "Currency CodeEditable" := false;
            GlobalDimension1CodeEditable := false;
            "Payment NarrationEditable" := false;
            ShortcutDimension2CodeEditable := false;
            PayeeEditable := true;
            ShortcutDimension3CodeEditable := false;
            ShortcutDimension4CodeEditable := false;
            DateEditable := false;
            PVLinesEditable := false;
        end;

        if Rec.Status = Rec.Status::Posted then begin
            PaymodeEditable := false;
            BankEditabl := false;
            OnBehalfEditable := false;
            RespEditabl := false;
            PVLinesEditable := false;
        end;
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
    begin
        PayLine.Reset();
        PayLine.SetRange(PayLine.No, Rec."No.");
        PayLine.SetRange(PayLine."Account Type", PayLine."Account Type"::Customer);
        exit(PayLine.FindFirst());
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
        if Rec.Status = Rec.Status::Pending then
            StatusEditable := true
        else
            StatusEditable := false;
    end;


    procedure CurrPageUpdate()
    begin
        xRec := Rec;
        UpdateControls();
        UpdatePageControls();
        CurrPage.Update();
    end;


    procedure InsertPvLine(prAssignEmpLoan: Record "CshMgt Approvals")
    var
        PvLine: Record "Payment Line";
    begin
        PayLine.Reset();
        ////PayLine.SETRANGE(PayLine."Loan No",prAssignEmpLoan."Entry No");
        if PayLine.FindFirst() then
            Error('Another %1 Payment Voucher number %2 already exist for this loan', PayLine.Status, PayLine.No);
        //exit();

        PvLine.Init();
        PvLine."Line No." := 0;
        PvLine.Type := 'LOAN';
        PvLine.No := Rec."No.";
        PvLine.Date := Today;
        PvLine."Account Type" := PvLine."Account Type"::Customer;
        /*{
        PvLine."Account No.":=prAssignEmpLoan."Employee Code";
        PvLine."Account Name":=prAssignEmpLoan."Transaction Name"+'Loan for employee'+prAssignEmpLoan."Employee Code";
        PvLine.Remarks:=prAssignEmpLoan."Transaction Name"+'Loan for employee'+prAssignEmpLoan."Employee Code";
        PvLine."Transaction Name":=prAssignEmpLoan."Transaction Name"+'Loan for employee'+prAssignEmpLoan."Employee Code";
        PvLine.VALIDATE(Amount,prAssignEmpLoan.Balance);
        PvLine."Loan No":=prAssignEmpLoan."Entry No";
      PvLine.INSERT;
         }*/

    end;


    procedure CreatePV()
    var
        PVhdr: Record "Payments Header";
        PVLines: Record "Payment Line";
        PayTypes: Record "Receipts and Payment Types";
        Vendor: Record Vendor;
        VendLedger: Record "Vendor Ledger Entry";
        PVHeader: Record "Payments Header";
    begin
        /*
        //confirm if invoice has been fully paid
        VendLedger.RESET;
        VendLedger.SETRANGE(VendLedger."Vendor No.","Pay-to Vendor No.");
        VendLedger.SETRANGE(VendLedger."Document Type",VendLedger."Document Type"::Invoice);
        VendLedger.SETRANGE(VendLedger."Document No.","No.");
        VendLedger.FINDFIRST;
        VendLedger.CALCFIELDS("Remaining Amount");
        IF VendLedger."Remaining Amount">=0 THEN BEGIN
         MESSAGE('The invoice has been fully applied, Payment Voucher not created');
         EXIT;
        END;

        //check if a pending pv for invoice exists
          PVHeader.RESET;
          PVHeader.SETFILTER(PVHeader.Status,'<>%1',PVHeader.Status::Cancelled);
          PVHeader.SETRANGE(PVHeader.Posted,FALSE);
          PVHeader.SETRANGE(PVHeader."Invoice No","No.");
          IF PVHeader.FINDFIRST THEN BEGIN
            MESSAGE('A Payment voucher for this invoice already exists');
            EXIT;
          END;

        PVhdr.INIT;
        PVhdr."No.":='';
        PVhdr.Date:=TODAY;
        PVhdr."Currency Code":="Currency Code";
        PVhdr.Payee:="Pay-to Name";
        PVhdr."On Behalf Of":="Pay-to Name";
        PVhdr.Cashier:=USERID;
        PVhdr."Payment Type":=PVhdr."Payment Type"::Express;
        PVhdr."Global Dimension 1 Code":="Shortcut Dimension 1 Code";
        PVhdr.VALIDATE("Global Dimension 1 Code");
        PVhdr."Shortcut Dimension 2 Code":="Shortcut Dimension 2 Code";
        PVhdr.VALIDATE("Shortcut Dimension 2 Code");
        PVhdr."Responsibility Center":="Responsibility Center";
        PVhdr."Payment Narration":="Posting Description";
        PVhdr."Dimension Set ID":="Dimension Set ID";
        PVhdr."Invoice No":="No.";//"Pre-Assigned No.";
        PVhdr.INSERT(TRUE);

        PVLines.INIT;
        PVLines."Line No.":=0;
        PVLines.No:=PVhdr."No.";
          PayTypes.RESET;
          PayTypes.SETRANGE(PayTypes."Account Type",PayTypes."Account Type"::Vendor);
          Vendor.GET("Buy-from Vendor No.");
          PayTypes.SETRANGE(PayTypes."Default Grouping",Vendor."Vendor Posting Group");
          PayTypes.FINDFIRST;
        PVLines.Type:=PayTypes.Code;
        PVLines.Date:=TODAY;
        PVLines."Account Type":=PVLines."Account Type"::Vendor;
        PVLines."Account No.":="Pay-to Vendor No.";
        PVLines."Account Name":="Pay-to Name";
        CALCFIELDS("Amount Including VAT");
        PVLines.Amount:=VendLedger."Remaining Amount"*-1;
        PVLines.VALIDATE(Amount);
        PVLines.Remarks:="Posting Description";
        PVLines."Applies-to Doc. Type":=PVLines."Applies-to Doc. Type"::Invoice;
        PVLines.VALIDATE("Applies-to Doc. No.","No.");
        //PVLines."Applies-to ID":=PVhdr."No.";
        //PVLines.VALIDATE("Apply to ID","No.");
        PVLines.VALIDATE("Global Dimension 1 Code","Shortcut Dimension 1 Code");
        PVLines.VALIDATE("Shortcut Dimension 2 Code","Shortcut Dimension 2 Code");
        PVLines."Dimension Set ID":="Dimension Set ID";
        PVLines.INSERT;

        PAGE.RUN(PAGE::"Payment Header",PVhdr);
        */

    end;
}
