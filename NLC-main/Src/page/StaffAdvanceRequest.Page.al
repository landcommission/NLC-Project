#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193663 "Staff Advance Request"
{
    Caption = 'Staff Advance Request';
    DeleteAllowed = false;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Staff Advance Header";
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
                    Visible = DocNoVisible;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = DateEditable;
                    ToolTip = 'Specifies the value of the Date field.';
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = DateEditable;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
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
                    Editable = false;
                    ToolTip = 'Specifies the value of the Function Name field.';
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
                    Editable = false;
                    ToolTip = 'Specifies the value of the Budget Center Name field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field(Dim3; Rec.Dim3)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Dim3 field.';
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                }
                field(Dim4; Rec.Dim4)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Dim4 field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = "Currency CodeEditable";
                    Visible = true;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    Editable = "Paying Bank AccountEditable";
                    Visible = PayingBankVisible;
                    ToolTip = 'Specifies the value of the Paying Bank Account field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = PayingBankNameVisible;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                    Editable = DateEditable;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field(Cashier; Rec.Cashier)
                {
                    ApplicationArea = Basic;
                    Caption = 'Requestor ID';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requestor ID field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Net Amount field.';
                }
                field("Total Net Amount LCY"; Rec."Total Net Amount LCY")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Net Amount LCY field.';
                }
                field("Payment Release Date"; Rec."Payment Release Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posting Date';
                    Editable = "Payment Release DateEditable";
                    Visible = PostingDateVisible;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    Editable = "Pay ModeEditable";
                    Visible = PaymodeVisible;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cheque/EFT No.';
                    Editable = "Cheque No.Editable";
                    Visible = ChequeNoVisible;
                    ToolTip = 'Specifies the value of the Cheque/EFT No. field.';
                }
            }
            part(PVLines; "Staff Advance Lines")
            {
                SubPageLink = No = field("No.");
            }
            systempart(Control7; Links)
            {
                Visible = true;
            }
            systempart(Control5; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action("Post&print")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Payment and Print';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = true;
                    ToolTip = 'Executes the Post Payment and Print action.';
                    trigger OnAction()
                    begin
                        CheckImprestRequiredItems(Rec);
                        PostImprest(Rec);
                        Report.Run(39005881, true, true, Rec);
                        /*
                          RESET;
                          SETFILTER("No.","No.");
                          REPORT.RUN(39005881,TRUE,TRUE,Rec);
                          RESET;
                        */

                    end;
                }
                separator(Action1102755021) { }
                action(postPayment)
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Payment';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = true;
                    ToolTip = 'Executes the Post Payment action.';
                    trigger OnAction()
                    var
                        Doctype: Option " ";
                    begin
                        Rec.TestField(Status, Rec.Status::Approved);
                        CheckImprestRequiredItems(Rec);
                        PostImprest(Rec);

                        CheckBudgetAvail.ReverseEntries(Doctype, Rec."No.");
                    end;
                }
                separator(Action1102755026) { }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        DocumentType := DocumentType::"Staff Advance";
                        ApprovalEntries.Setfilters(Database::"Staff Advance Header", DocumentType, Rec."No.");
                        ApprovalEntries.Run();
                    end;
                }
                action(SendApproval)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                    //ApprovalMgt: Codeunit "Export F/O Consolidation";
                    begin
                        Rec.TestField(Status, Rec.Status::Pending);

                        if not LinesExists() then
                            Error('There are no Lines created for this Document');

                        if not AllFieldsEntered() then
                            Error('Some of the Key Fields on the Lines:[ACCOUNT NO.,AMOUNT] Have not been Entered please RECHECK your entries');

                        //Ensure No Items That should be committed that are not
                        if LinesCommitmentStatus() then
                            Error('There are some lines that have not been committed');

                        //Release the Imprest for Approval
                        // IF ApprovalMgt.SendAdvanceApprovalRequest(Rec) THEN;
                    end;
                }
                action(CancelApproval)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';

                }
                separator(Action1102755009) { }
                action(CheckBudget)
                {
                    ApplicationArea = Basic;
                    Caption = 'Check Budgetary Availability';
                    Image = Balance;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    Visible = true;
                    ToolTip = 'Executes the Check Budgetary Availability action.';
                    trigger OnAction()
                    var
                        BCSetup: Record "Budgetary Control Setup";
                    begin
                        Rec.TestField(Status, Rec.Status::Pending);

                        BCSetup.Get();
                        if not BCSetup.Mandatory then
                            exit;

                        if not LinesExists() then
                            Error('There are no Lines created for this Document');

                        if not AllFieldsEntered() then
                            Error('Some of the Key Fields on the Lines:[ACCOUNT NO.,AMOUNT] Have not been Entered please RECHECK your entries');

                        //First Check whether other lines are already committed.
                        Commitments.Reset();
                        Commitments.SetRange(Commitments."Document Type", Commitments."Document Type"::StaffAdvance);
                        Commitments.SetRange(Commitments."Document No.", Rec."No.");
                        if Commitments.Find('-') then begin
                            if Confirm('Lines in this Document appear to be committed do you want to re-commit?', false) = false then
                                exit;
                            Commitments.Reset();
                            Commitments.SetRange(Commitments."Document Type", Commitments."Document Type"::StaffAdvance);
                            Commitments.SetRange(Commitments."Document No.", Rec."No.");
                            Commitments.DeleteAll();
                        end;

                        CheckBudgetAvail.CheckStaffAdvance(Rec);
                    end;
                }
                action(CancelBudget)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Budget Commitment';
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    Visible = true;
                    ToolTip = 'Executes the Cancel Budget Commitment action.';
                    trigger OnAction()
                    begin

                        Rec.TestField(Status, Rec.Status::Pending);

                        if Confirm('Do you Wish to Cancel the Commitment entries for this document', false) = false then
                            exit;

                        Commitments.Reset();
                        Commitments.SetRange(Commitments."Document Type", Commitments."Document Type"::StaffAdvance);
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
                action(PrintPreview)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print/Preview';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    Visible = PageActionsVisible;
                    ToolTip = 'Executes the Print/Preview action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::Approved);
                        if Rec."Pay Mode" = Rec."Pay Mode"::" " then
                            Error('Please Select A Pay Mode');
                        if (Rec.Status = Rec.Status::Pending) or (Rec.Status = Rec.Status::Cancelled) or (Rec.Status = Rec.Status::"Pending Approval") then
                            Error('You can not print a document that is %1', Rec.Status);
                        Rec.Reset();
                        Rec.SetFilter("No.", Rec."No.");
                        Report.Run(Report::"Petty Cash Requisition NCA", true, true, Rec);
                        Rec.Reset();

                        /*
                       SETFILTER("No.","No.");
                       IF "Pay Mode"="Pay Mode"::Cash THEN
                       REPORT.RUN(39005907,TRUE,TRUE,Rec)
                       ELSE IF"Pay Mode"="Pay Mode"::Cheque THEN
                       REPORT.RUN(39005904,TRUE,TRUE,Rec);
                          */

                    end;
                }
                separator(Action1102756006) { }
                action(CancelDoc)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Document';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    Visible = PageActionsVisible;
                    ToolTip = 'Executes the Cancel Document action.';
                    trigger OnAction()
                    var
                        Text000: Label 'Are you sure you want to Cancel this Document?';
                        Text001: Label 'You have selected not to Cancel this Document';
                        GlEntry: Record "G/L Entry";
                    begin


                        //TESTFIELD(Status,Status::Approved);
                        if (Rec.Status = Rec.Status::Approved) or (Rec.Status = Rec.Status::Pending) then
                            if Confirm(Text000, true) then begin
                                //Post Committment Reversals
                                Doc_Type := Doc_Type::Imprest;
                                BudgetControl.ReverseEntries(Doc_Type, Rec."No.");
                                Rec.Status := Rec.Status::Cancelled;
                                Rec.Modify();
                            end
                            else
                                Error(Text001);
                    end;
                }
                action(UploadDoc)
                {
                    ApplicationArea = Basic;
                    Caption = 'Upload Document';
                    Image = Upload;
                    Visible = PageActionsVisible;
                    ToolTip = 'Executes the Upload Document action.';
                    trigger OnAction()
                    var
                        vartest: Variant;
                    begin
                        Upload('Upload file', 'C:\', 'Text file(*.txt)|*.txt|PDF file(*.pdf)|*.pdf|ALL file(*)|*', 'Doc.txt', vartest)
                    end;
                }
                action("Create Payment Voucher")
                {
                    ApplicationArea = Basic;
                    Image = CreateForm;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Create Payment Voucher action.';
                    trigger OnAction()
                    var
                        PVHeadEr: Record "Payments Header";
                        STClaimLines: Record "Staff Advance Lines";
                        PaymentLines: Record "Payment Line";
                        EntryNo: Integer;
                        ApprovalEntry: Record "Approval Entry";
                        AppEntry: Record "Approval Entry";
                    begin
                        PVHeadEr.Reset();
                        PVHeadEr.SetRange(PVHeadEr."Creation Doc No.", Rec."No.");
                        PVHeadEr.SetFilter(PVHeadEr.Status, '<>%1', PVHeadEr.Status::Cancelled);
                        if PVHeadEr.Find('-') = true then
                            Error('Payment Voucher has already been created for Staff Adavance %1', PVHeadEr."No.");

                        Rec.TestField(Status, Rec.Status::Approved);
                        Rec.TestField("Pay Mode");
                        CheckIfIsAboveCashLimit();
                        Rec.TestField("Paying Bank Account");

                        if not Confirm('Are you sure you want to create a Payment Voucher for %1', false, Rec."No.") then
                            Error('Creation of Payment Voucher Stopped')
                        else begin

                            PVHeadEr.Init();
                            PVHeadEr.Date := Rec.Date;
                            PVHeadEr.Payee := Rec.Payee;
                            PVHeadEr."On Behalf Of" := Rec."On Behalf Of";
                            PVHeadEr.Cashier := Rec.Cashier;
                            PVHeadEr.Status := Rec.Status;
                            if Rec."Pay Mode" = Rec."Pay Mode"::Cash then
                                PVHeadEr."Payment Type" := PVHeadEr."Payment Type"::"Petty Cash"
                            else
                                if Rec."Pay Mode" = Rec."Pay Mode"::Cheque then
                                    PVHeadEr."Payment Type" := PVHeadEr."Payment Type"::Normal;
                            PVHeadEr."Pay Mode" := Rec."Pay Mode";
                            PVHeadEr."Paying Bank Account" := Rec."Paying Bank Account";
                            PVHeadEr.Validate("Paying Bank Account");
                            PVHeadEr."Cheque No." := Rec."Cheque No.";
                            PVHeadEr."Global Dimension 1 Code" := Rec."Global Dimension 1 Code";
                            PVHeadEr.Validate("Global Dimension 1 Code");
                            PVHeadEr."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                            PVHeadEr.Validate("Shortcut Dimension 2 Code");
                            PVHeadEr."Responsibility Center" := Rec."Responsibility Center";
                            PVHeadEr."Payment Release Date" := Rec."Payment Release Date";
                            PVHeadEr."Shortcut Dimension 3 Code" := Rec."Shortcut Dimension 3 Code";
                            PVHeadEr.Validate("Shortcut Dimension 3 Code");
                            PVHeadEr."Shortcut Dimension 4 Code" := Rec."Shortcut Dimension 4 Code";
                            PVHeadEr.Validate("Shortcut Dimension 4 Code");
                            PVHeadEr."Payment Narration" := CopyStr(Rec.Purpose, 1, 50);
                            PVHeadEr."Creation Doc No." := Rec."No.";
                            PVHeadEr.Insert(true);

                            STClaimLines.Reset();
                            STClaimLines.SetRange(STClaimLines.No, Rec."No.");
                            if STClaimLines.Find('-') then begin
                                /*
                                PaymentLines.RESET;
                                IF PaymentLines.FIND('+') THEN BEGIN
                                EntryNo:=PaymentLines."Line No.";
                                END;
                                */

                                EntryNo := 1;

                                repeat

                                    PaymentLines.Init();
                                    PaymentLines."Line No." := 0;
                                    //MESSAGE('%1',EntryNo);
                                    PaymentLines.No := PVHeadEr."No.";
                                    PaymentLines."Account Type" := PaymentLines."Account Type"::Customer;
                                    PaymentLines."Account No." := Rec."Account No.";
                                    PaymentLines."Account Name" := STClaimLines."Account Name";//Payee;
                                    PaymentLines.Type := 'CUSTOMERS';
                                    PaymentLines.Amount := STClaimLines.Amount;
                                    PaymentLines.Validate(Amount);
                                    PaymentLines."Net Amount" := STClaimLines.Amount;
                                    PaymentLines."Global Dimension 1 Code" := STClaimLines."Global Dimension 1 Code";
                                    PaymentLines.Validate("Global Dimension 1 Code");
                                    PaymentLines."Shortcut Dimension 2 Code" := STClaimLines."Shortcut Dimension 2 Code";
                                    PaymentLines.Validate("Shortcut Dimension 2 Code");
                                    PaymentLines."Dimension Set ID" := STClaimLines."Dimension Set ID";
                                    PaymentLines.Insert(true);

                                until STClaimLines.Next() = 0;
                            end;
                            /*
                            ApprovalEntry.RESET;
                            ApprovalEntry.SETRANGE(ApprovalEntry."Document No.","No.");
                            IF ApprovalEntry.FIND('-') THEN BEGIN
                            REPEAT
                            AppEntry.INIT;
                            AppEntry."Table ID":=39005904;
                            AppEntry."Document Type":=AppEntry."Document Type"::"Payment Voucher";
                            AppEntry."Document No.":=PVHeadEr."No.";
                            AppEntry."Sequence No.":=ApprovalEntry."Sequence No.";
                            AppEntry."Approval Code":=ApprovalEntry."Approval Code";
                            AppEntry."Sender ID":=ApprovalEntry."Sender ID";
                            AppEntry."Salespers./Purch. Code":=ApprovalEntry."Salespers./Purch. Code";
                            AppEntry."Approver ID":=ApprovalEntry."Approver ID";
                            AppEntry.Status:=ApprovalEntry.Status;
                            AppEntry."Date-Time Sent for Approval":=ApprovalEntry."Date-Time Sent for Approval";
                            AppEntry."Last Date-Time Modified":=ApprovalEntry."Last Date-Time Modified";
                            AppEntry."Last Modified By ID":=ApprovalEntry."Last Modified By ID";
                            AppEntry."Due Date":=ApprovalEntry."Due Date";
                            AppEntry.Amount:=ApprovalEntry.Amount;
                            AppEntry."Amount (LCY)":=ApprovalEntry."Amount (LCY)";
                            AppEntry."Currency Code":=ApprovalEntry."Currency Code";
                            AppEntry."Approval Type":=ApprovalEntry."Approval Type";
                            AppEntry."Limit Type":=ApprovalEntry."Limit Type";
                            AppEntry."Available Credit Limit (LCY)":=ApprovalEntry."Available Credit Limit (LCY)";
                            AppEntry.Comment:=ApprovalEntry.Comment;
                            AppEntry.INSERT;
                            UNTIL ApprovalEntry.NEXT=0
                            END;
                            */
                        end;

                        Rec.Posted := true;
                        Rec."Date Posted" := Today;
                        Rec."Time Posted" := Time;
                        Rec."Posted By" := UserId;
                        Rec.Modify();


                        if Rec."Pay Mode" = Rec."Pay Mode"::Cash then
                            Page.Run(39005902, PVHeadEr)
                        else
                            Page.Run(39005905, PVHeadEr);

                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //OnAfterGetCurrRecord;
        CurrPageUpdate();
    end;


    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        //check if the documenent has been added while another one is still pending
        TravReqHeader.Reset();
        //TravAccHeader.SETRANGE(SaleHeader."Document Type",SaleHeader."Document Type"::"Cash Sale");
        TravReqHeader.SetRange(TravReqHeader.Cashier, UserId);
        TravReqHeader.SetRange(TravReqHeader.Status, Rec.Status::Pending);
        /*
            IF TravReqHeader.COUNT>0 THEN
              BEGIN
                ERROR('There are still some pending document(s) on your account. Please list & select the pending document to use.  ');
              END;
        //*********************************END ****************************************
        */


        Rec."Payment Type" := Rec."Payment Type"::Imprest;
        Rec."Account Type" := Rec."Account Type"::Customer;

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        //check for pending documents
        StaffAdvance.Reset();
        StaffAdvance.SetRange(StaffAdvance.Cashier, UserId);
        StaffAdvance.SetRange(StaffAdvance.Status, Rec.Status::Pending);
        if StaffAdvance.Count > 0 then
            Error('There are still some pending document(s) on your account. Please list & select the pending document to use.  ');


        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter();
        //Add dimensions if set by default here
        Rec."Global Dimension 1 Code" := UserMgt.GetSetDimensions(UserId, 1);
        Rec.Validate("Global Dimension 1 Code");
        Rec."Shortcut Dimension 2 Code" := UserMgt.GetSetDimensions(UserId, 2);
        Rec.Validate("Shortcut Dimension 2 Code");
        Rec."Shortcut Dimension 3 Code" := UserMgt.GetSetDimensions(UserId, 3);
        Rec.Validate("Shortcut Dimension 3 Code");
        Rec."Shortcut Dimension 4 Code" := UserMgt.GetSetDimensions(UserId, 4);
        Rec.Validate("Shortcut Dimension 4 Code");

        UpdateControls();

        //CurrPageUpdate;
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        UpdateControls();
    end;

    trigger OnOpenPage()
    begin

        if Rec.Status = Rec.Status::"Pending Approval" then
            CurrPage.Editable := false;

        if Rec.Status = Rec.Status::Pending then begin
            PayingBankVisible := false;
            PostingDateVisible := false;
            PaymodeVisible := false;
            ChequeNoVisible := false;
            PageActionsVisible := false;
            PayingBankNameVisible := false
        end else
            if Rec.Status <> Rec.Status::Pending then begin
                PayingBankVisible := true;
                PayingBankNameVisible := true;
                PostingDateVisible := true;
                PaymodeVisible := true;
                ChequeNoVisible := true;
                PageActionsVisible := true;
            end;

        if UserMgt.GetPurchasesFilter() <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange("Responsibility Center", UserMgt.GetPurchasesFilter());
            Rec.FilterGroup(0);
        end;

        UpdateControls();
        SetDocNoVisible();
    end;

    var
        PayLine: Record "Staff Advance Lines";
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
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        Doc_Type: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash;
        BudgetControl: Codeunit "Budgetary Control";
        TravReqHeader: Record "Staff Advance Header";
        [InDataSet]
        "Payment Release DateEditable": Boolean;
        [InDataSet]
        "Paying Bank AccountEditable": Boolean;
        [InDataSet]
        "Pay ModeEditable": Boolean;
        [InDataSet]
        "Cheque No.Editable": Boolean;
        [InDataSet]
        GlobalDimension1CodeEditable: Boolean;
        [InDataSet]
        ShortcutDimension2CodeEditable: Boolean;
        [InDataSet]
        ShortcutDimension3CodeEditable: Boolean;
        [InDataSet]
        ShortcutDimension4CodeEditable: Boolean;
        [InDataSet]
        DateEditable: Boolean;
        [InDataSet]
        "Currency CodeEditable": Boolean;
        StatusEditable: Boolean;
        RespEditable: Boolean;
        AccountEditable: Boolean;
        PurposeEditable: Boolean;
        PayingBankVisible: Boolean;
        PayingBankNameVisible: Boolean;
        PostingDateVisible: Boolean;
        PaymodeVisible: Boolean;
        ChequeNoVisible: Boolean;
        PageActionsVisible: Boolean;
        DocNoVisible: Boolean;
        StaffAdvance: Record "Staff Advance Header";


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
        PayLine.Reset();
        PayLine.SetRange(PayLine.No, Rec."No.");
        PayLine.SetRange(PayLine.Committed, false);
        PayLine.SetRange(PayLine."Budgetary Control A/C", true);
        if PayLine.Find('-') then
            Exists := true;
    end;


    procedure PostImprest(rec: Record "Staff Advance Header")
    begin

        if Temp.Get(UserId) then begin
            GenJnlLine.Reset();
            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
            GenJnlLine.DeleteAll();
        end;

        LineNo := LineNo + 1000;
        GenJnlLine.Init();
        GenJnlLine."Journal Template Name" := JTemplate;
        GenJnlLine."Journal Batch Name" := JBatch;
        GenJnlLine."Line No." := LineNo;
        GenJnlLine."Source Code" := 'PAYMENTJNL';
        GenJnlLine."Posting Date" := rec."Payment Release Date";
        GenJnlLine."Document Type" := GenJnlLine."Document Type"::Invoice;
        GenJnlLine."Document No." := rec."No.";
        GenJnlLine."External Document No." := rec."Cheque No.";
        GenJnlLine."Account Type" := GenJnlLine."Account Type"::Customer;
        GenJnlLine."Account No." := rec."Account No.";
        GenJnlLine.Validate(GenJnlLine."Account No.");
        GenJnlLine.Description := 'Advance: ' + rec."Account No." + ':' + rec.Payee;
        rec.CalcFields("Total Net Amount");
        GenJnlLine.Amount := rec."Total Net Amount";
        GenJnlLine.Validate(GenJnlLine.Amount);
        GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::"Bank Account";
        GenJnlLine."Bal. Account No." := rec."Paying Bank Account";
        GenJnlLine.Validate(GenJnlLine."Bal. Account No.");
        //Added for Currency Codes
        GenJnlLine."Currency Code" := rec."Currency Code";
        GenJnlLine.Validate("Currency Code");
        GenJnlLine."Currency Factor" := rec."Currency Factor";
        GenJnlLine.Validate("Currency Factor");
        /*
        GenJnlLine."Currency Factor":=Payments."Currency Factor";
        GenJnlLine.VALIDATE("Currency Factor");
        */
        GenJnlLine."Shortcut Dimension 1 Code" := rec."Global Dimension 1 Code";
        GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
        GenJnlLine."Shortcut Dimension 2 Code" := rec."Shortcut Dimension 2 Code";
        GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
        GenJnlLine.ValidateShortcutDimCode(3, rec."Shortcut Dimension 3 Code");
        GenJnlLine.ValidateShortcutDimCode(4, rec."Shortcut Dimension 4 Code");

        if GenJnlLine.Amount <> 0 then
            GenJnlLine.Insert();


        GenJnlLine.Reset();
        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
        Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnlLine);

        Post := false;
        Post := JournlPosted.PostedSuccessfully();
        if Post then begin
            rec.Posted := true;
            rec."Date Posted" := Today;
            rec."Time Posted" := Time;
            rec."Posted By" := UserId;
            rec.Status := rec.Status::Posted;
            rec.Modify();
        end;

    end;


    procedure CheckImprestRequiredItems(rec: Record "Staff Advance Header")
    begin

        rec.TestField("Payment Release Date");
        rec.TestField("Paying Bank Account");
        rec.TestField("Account No.");
        rec.TestField("Account Type", rec."Account Type"::Customer);

        if rec.Posted then
            Error('The Document has already been posted');

        rec.TestField(Status, rec.Status::Approved);

        /*Check if the user has selected all the relevant fields*/

        Temp.Get(UserId);
        JTemplate := Temp."Advance Template";
        JBatch := Temp."Advance  Batch";

        if JTemplate = '' then
            Error('Ensure the Staff Advance Template is set up in Cash Office Setup');

        if JBatch = '' then
            Error('Ensure the Staff Advance Batch is set up in the Cash Office Setup');

        if not LinesExists() then
            Error('There are no Lines created for this Document');

    end;


    procedure UpdateControls()
    begin
        if Rec.Status <> Rec.Status::Approved then begin
            "Payment Release DateEditable" := false;
            "Paying Bank AccountEditable" := false;
            "Pay ModeEditable" := false;
            //CurrForm."Currency Code".EDITABLE:=FALSE;
            "Cheque No.Editable" := false;
            //CurrPage.UpdateControls();
        end else begin
            "Payment Release DateEditable" := true;
            "Paying Bank AccountEditable" := true;
            "Pay ModeEditable" := true;
            "Cheque No.Editable" := true;
            //CurrForm."Currency Code".EDITABLE:=TRUE;
            //CurrPage.UpdateControls();
        end;

        if Rec.Status = Rec.Status::Pending then begin
            GlobalDimension1CodeEditable := true;
            ShortcutDimension2CodeEditable := true;
            //CurrForm.Payee.EDITABLE:=TRUE;
            ShortcutDimension3CodeEditable := true;
            ShortcutDimension4CodeEditable := true;
            DateEditable := true;
            //CurrForm."Account No.".EDITABLE:=TRUE;
            "Currency CodeEditable" := true;
            //CurrForm."Paying Bank Account".EDITABLE:=FALSE;
            //CurrPage.UpdateControls();
        end else begin
            GlobalDimension1CodeEditable := false;
            ShortcutDimension2CodeEditable := false;
            //CurrForm.Payee.EDITABLE:=FALSE;
            ShortcutDimension3CodeEditable := false;
            ShortcutDimension4CodeEditable := false;
            DateEditable := false;
            //CurrForm."Account No.".EDITABLE:=FALSE;
            "Currency CodeEditable" := false;
            //CurrForm."Paying Bank Account".EDITABLE:=TRUE;
            //CurrPage.UpdateControls();
        end;

        if (Rec.Status = Rec.Status::Posted) or (Rec.Status = Rec.Status::Cancelled) then begin
            "Payment Release DateEditable" := false;
            "Paying Bank AccountEditable" := false;
            "Pay ModeEditable" := false;
            //CurrForm."Currency Code".EDITABLE:=FALSE;
            "Cheque No.Editable" := false;
            "Payment Release DateEditable" := false;
            "Paying Bank AccountEditable" := false;
            "Pay ModeEditable" := false;
            "Cheque No.Editable" := false;
            RespEditable := false;
            AccountEditable := false;
            PurposeEditable := false;
            //CurrForm."Currency Code".EDITABLE:=TRUE;
            //CurrPage.UpdateControls();
        end;
    end;


    procedure LinesExists(): Boolean
    var
        PayLines: Record "Staff Advance Lines";
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
        PayLines: Record "Staff Advance Lines";
    begin
        AllKeyFieldsEntered := true;
        PayLines.Reset();
        PayLines.SetRange(PayLines.No, Rec."No.");
        if PayLines.Find('-') then begin
            repeat
                if (PayLines."Account No:" = '') or (PayLines.Amount <= 0) then
                    AllKeyFieldsEntered := false;
            until PayLines.Next() = 0;
            exit(AllKeyFieldsEntered);
        end;
    end;

    local procedure OnAfterGetCurrRecord()
    begin
        //xRec := Rec;
        UpdateControls();
    end;


    procedure CurrPageUpdate()
    begin
        xRec := Rec;
        UpdateControls();
        CurrPage.Update();
    end;


    procedure CheckIfIsAboveCashLimit()
    var
        CashOfficeSetup: Record "Cash Office Setup";
    begin
        //if above cash limit then pay mode must be cheque
        if Rec."Pay Mode" <> Rec."Pay Mode"::Cash then
            exit;
        Rec.CalcFields("Total Net Amount");
        CashOfficeSetup.Get();
        if Rec."Total Net Amount" >= CashOfficeSetup."Minimum Cheque Creation Amount" then
            Error('The specified amount %1 should be created as a cheque.', Rec."Total Net Amount");
    end;

    local procedure SetDocNoVisible()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility1400;
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",None,"Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTransfer,LeavePlanner,HrAssetTransfer;
    begin
        DocNoVisible := DocumentNoVisibility.FundsMgtDocumentNoIsVisible(DocType::"Staff Advance", Rec."No.");
    end;
}

