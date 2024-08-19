#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193688 "Journal Voucher Card"
{
    PageType = Document;
    SourceTable = "Gen. Journal Line";
    SourceTableView = where("Line No." = const(10000));
    ApplicationArea = All;
    Caption = 'Journal Voucher Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Journal Template Name"; Rec."Journal Template Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Journal Template Name field.';
                }
                field("Journal Batch Name"; Rec."Journal Batch Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Journal Batch Name field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the type of account that the entry on the journal line will be posted to.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the account number that the entry on the journal line will be posted to.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the posting date for the entry.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the type of document that the entry on the journal line is.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies a document number for the journal line.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a description of the entry.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a document number that refers to the customer''s or vendor''s numbering system.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code of the currency for the amounts on the journal line.';
                }
                field("Batch Balance"; Rec."Batch Balance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Balance';
                    ToolTip = 'Specifies the value of the Balance field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
            }
            part(Control17; "Journal Voucher SubForm")
            {
                SubPageLink = "Journal Template Name" = field("Journal Template Name"),
                              "Journal Batch Name" = field("Journal Batch Name");
                SubPageView = where("Line No." = filter(<> 10000));
            }
        }
        area(FactBoxes)
        {
            part(Control50; "Dimension Set Entries FactBox")
            {
                SubPageLink = "Dimension Set ID" = field("Dimension Set ID");
                Visible = false;
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortcutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                    trigger OnAction()
                    begin
                        Rec.ShowDimensions();
                        CurrPage.SaveRecord();
                    end;
                }
            }
            group("A&ccount")
            {
                Caption = 'A&ccount';
                Image = ChartOfAccounts;
                action(Card)
                {
                    ApplicationArea = Basic;
                    Caption = 'Card';
                    Image = EditLines;
                    RunObject = codeunit "Gen. Jnl.-Show Card";
                    ShortcutKey = 'Shift+F7';
                    ToolTip = 'Executes the Card action.';
                }
                action("Ledger E&ntries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Ledger E&ntries';
                    Image = GLRegisters;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = codeunit "Gen. Jnl.-Show Entries";
                    ShortcutKey = 'Ctrl+F7';
                    ToolTip = 'Executes the Ledger E&ntries action.';
                }
            }
        }
        area(Processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Renumber Document Numbers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Renumber Document Numbers';
                    Image = EditLines;
                    ToolTip = 'Executes the Renumber Document Numbers action.';
                    trigger OnAction()
                    begin
                        Rec.RenumberDocumentNo()
                    end;
                }
                action("Insert Conv. LCY Rndg. Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Insert Conv. LCY Rndg. Lines';
                    Image = InsertCurrency;
                    RunObject = codeunit "Adjust Gen. Journal Balance";
                    ToolTip = 'Executes the Insert Conv. LCY Rndg. Lines action.';
                }
                separator(Action38)
                {
                    Caption = '-';
                }
                action(GetStandardJournals)
                {
                    ApplicationArea = Basic;
                    Caption = '&Get Standard Journals';
                    Ellipsis = true;
                    Image = GetStandardJournal;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the &Get Standard Journals action.';
                    trigger OnAction()
                    var
                        StdGenJnl: Record "Standard General Journal";
                    begin
                        StdGenJnl.FilterGroup := 2;
                        StdGenJnl.SetRange("Journal Template Name", Rec."Journal Template Name");
                        StdGenJnl.FilterGroup := 0;

                        if Page.RunModal(Page::"Standard General Journals", StdGenJnl) = Action::LookupOK then begin
                            StdGenJnl.CreateGenJnlFromStdJnl(StdGenJnl, CurrentJnlBatchName);
                            Message(Text000, StdGenJnl.Code);
                        end;

                        CurrPage.Update(true);
                    end;
                }
                action(SaveAsStandardJournal)
                {
                    ApplicationArea = Basic;
                    Caption = '&Save as Standard Journal';
                    Ellipsis = true;
                    Image = SaveasStandardJournal;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the &Save as Standard Journal action.';
                    trigger OnAction()
                    var
                        GenJnlBatch: Record "Gen. Journal Batch";
                        GeneralJnlLines: Record "Gen. Journal Line";
                        StdGenJnl: Record "Standard General Journal";
                        SaveAsStdGenJnl: Report "Save as Standard Gen. Journal";
                    begin
                        GeneralJnlLines.SetFilter("Journal Template Name", Rec."Journal Template Name");
                        GeneralJnlLines.SetFilter("Journal Batch Name", CurrentJnlBatchName);
                        CurrPage.SetSelectionFilter(GeneralJnlLines);
                        GeneralJnlLines.CopyFilters(Rec);

                        GenJnlBatch.Get(Rec."Journal Template Name", CurrentJnlBatchName);
                        SaveAsStdGenJnl.Initialise(GeneralJnlLines, GenJnlBatch);
                        SaveAsStdGenJnl.RunModal();
                        if not SaveAsStdGenJnl.GetStdGeneralJournal(StdGenJnl) then
                            exit;

                        Message(Text001, StdGenJnl.Code);
                    end;
                }
                separator(Action35) { }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin

                        GenJnlBatch.Reset();
                        GenJnlBatch.SetRange(GenJnlBatch.Name, Rec."Journal Batch Name");//CurrentJnlBatchName);
                        GenJnlBatch.SetRange(GenJnlBatch."Journal Template Name", Rec."Journal Template Name");
                        if GenJnlBatch.Find('-') then begin
                            ApprovalEntries.Setfilters(Database::"Gen. Journal Batch", 13, GenJnlBatch.BatchApprovalNo);
                            ApprovalEntries.Run();

                        end;
                    end;
                }
                action("Send A&pproval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                        //ApprovalMgt: Codeunit "Export F/O Consolidation";
                        GenLedgSetup: Record "General Ledger Setup";
                        NoSeriesMgt: Codeunit NoSeriesManagement;
                    begin
                        CheckBalanced();
                        //First Update the Batch with a number
                        GenJnlBatch.Reset();
                        GenJnlBatch.SetRange(GenJnlBatch.Name, Rec."Journal Batch Name");//CurrentJnlBatchName);
                        GenJnlBatch.SetRange(GenJnlBatch."Journal Template Name", Rec."Journal Template Name");
                        if GenJnlBatch.Find('-') then begin
                            if GenJnlBatch.Status <> GenJnlBatch.Status::Open then
                                Error(Text001);
                            if GenLedgSetup.Get() then begin
                                GenJnlBatch."Batch Workflow No. Series" := '';
                                GenLedgSetup.TestField("GjnlBatch Approval No");
                                NoSeriesMgt.InitSeries(GenLedgSetup."GjnlBatch Approval No", GenJnlBatch."Batch Workflow No. Series"
                                , 0D, GenJnlBatch.BatchApprovalNo, GenJnlBatch."Batch Workflow No. Series");
                                GenJnlBatch.Modify();
                            end;

                            //End allocate batch number
                            //if ApprovalMgt.SendJVApprovalRequest(GenJnlBatch) then;

                        end;
                    end;
                }
                action("Cancel Approval Re&quest")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelledEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Approvals Mgt";
                    //ApprovalMgt: Codeunit "Export F/O Consolidation";
                    begin

                        //First Update the Batch with a number
                        GenJnlBatch.Reset();
                        GenJnlBatch.SetRange(GenJnlBatch.Name, Rec."Journal Batch Name");//CurrentJnlBatchName);
                        if GenJnlBatch.Find('-') then;
                        //if ApprovalMgt.CancelJVApprovalRequest(GenJnlBatch,true,true) then;
                        //End allocate batch number
                    end;
                }
                action("Test Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Test Report';
                    Ellipsis = true;
                    Image = TestReport;
                    ToolTip = 'Executes the Test Report action.';
                    trigger OnAction()
                    begin
                        ReportPrint.PrintGenJnlLine(Rec);
                    end;
                }
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortcutKey = 'F9';
                    ToolTip = 'Executes the P&ost action.';
                    trigger OnAction()
                    begin
                        //Check batch status is approved
                        GenJnlBatch.Reset();
                        GenJnlBatch.SetRange(GenJnlBatch.Name, Rec."Journal Batch Name");//CurrentJnlBatchName);
                        GenJnlBatch.SetRange(GenJnlBatch."Journal Template Name", Rec."Journal Template Name");
                        if GenJnlBatch.Find('-') then
                            if GenJnlBatch.Status <> GenJnlBatch.Status::"Pending Approval" then
                                Error('The Batch %1 you are trying to post is yet to be approved', CurrentJnlBatchName);

                        Codeunit.Run(Codeunit::"Gen. Jnl.-Post Line", Rec);

                        //Check batch status is approved
                        if JournalPosted.PostedSuccessfully() then begin
                            GenJnlBatch.Reset();
                            GenJnlBatch.SetRange(GenJnlBatch.Name, Rec."Journal Batch Name");//CurrentJnlBatchName);
                            GenJnlBatch.SetRange(GenJnlBatch."Journal Template Name", Rec."Journal Template Name");
                            if GenJnlBatch.Find('-') then begin
                                GenJnlBatch.Status := GenJnlBatch.Status::Open;
                                GenJnlBatch.Modify();
                            end;
                        end;

                        CurrentJnlBatchName := Rec.GetRangeMax(Rec."Journal Batch Name");
                        CurrPage.Update(false);
                    end;
                }
                action("Post and &Print")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post and &Print';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortcutKey = 'Shift+F9';
                    ToolTip = 'Executes the Post and &Print action.';
                    trigger OnAction()
                    begin
                        //Check batch status is approved
                        GenJnlBatch.Reset();
                        GenJnlBatch.SetRange(GenJnlBatch.Name, Rec."Journal Batch Name");//CurrentJnlBatchName);
                        GenJnlBatch.SetRange(GenJnlBatch."Journal Template Name", Rec."Journal Template Name");
                        if GenJnlBatch.Find('-') then
                            if GenJnlBatch.Status <> GenJnlBatch.Status::"Pending Approval" then
                                Error('The Batch %1 you are trying to post is yet to be approved', Rec."Journal Batch Name");//CurrentJnlBatchName);

                        Codeunit.Run(Codeunit::"Gen. Jnl.-Post+Print", Rec);

                        //Check batch status is approved
                        if JournalPosted.PostedSuccessfully() then begin
                            GenJnlBatch.Reset();
                            GenJnlBatch.SetRange(GenJnlBatch.Name, Rec."Journal Batch Name");//CurrentJnlBatchName);
                            GenJnlBatch.SetRange(GenJnlBatch."Journal Template Name", Rec."Journal Template Name");
                            if GenJnlBatch.Find('-') then begin
                                GenJnlBatch.Status := GenJnlBatch.Status::Open;
                                GenJnlBatch.Modify();
                            end;
                        end;


                        CurrentJnlBatchName := Rec.GetRangeMax(Rec."Journal Batch Name");
                        CurrPage.Update(false);
                    end;
                }
            }
            group("B&ank")
            {
                Caption = 'B&ank';
                action(ShowStatementLineDetails)
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Statement Details';
                    Image = ExternalDocument;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = page "Bank Statement Line Details";
                    //RunPageLink = "Posting Exch. No."=field("Posting Exch. Entry No."),
                    //              "Line No."=field("Posting Exch. Line No.");
                    Visible = false;
                    ToolTip = 'Executes the Bank Statement Details action.';
                }
                action(Reconcile)
                {
                    ApplicationArea = Basic;
                    Caption = 'Reconcile';
                    Image = Reconcile;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ShortcutKey = 'Ctrl+F11';
                    ToolTip = 'Executes the Reconcile action.';
                    trigger OnAction()
                    begin
                        GLReconcile.SetGenJnlLine(Rec);
                        GLReconcile.Run();
                    end;
                }
            }
            group(Application)
            {
                Caption = 'Application';
                action("Apply Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Apply Manually';
                    Ellipsis = true;
                    Image = ApplyEntries;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = codeunit "Gen. Jnl.-Apply";
                    ShortcutKey = 'Shift+F11';
                    ToolTip = 'Executes the Apply Manually action.';
                }
                action(Match)
                {
                    ApplicationArea = Basic;
                    Caption = 'Apply Automatically';
                    Image = MapAccounts;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    RunObject = codeunit "Match General Journal Lines";
                    ToolTip = 'Executes the Apply Automatically action.';
                }
                action(AddMappingRule)
                {
                    ApplicationArea = Basic;
                    Caption = 'Map Text to Account';
                    Image = CheckRulesSyntax;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Map Text to Account action.';
                    trigger OnAction()
                    var
                        AccountMapping: Record "Text-to-Account Mapping";
                    begin
                        AccountMapping.InsertRec(Rec);
                    end;
                }
            }
            group("Payro&ll")
            {
                Caption = 'Payro&ll';
                action(ImportPayrollTransaction)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import Payroll Transaction';
                    Image = Import;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    Visible = false;
                    ToolTip = 'Executes the Import Payroll Transaction action.';
                    trigger OnAction()
                    var
                        GeneralLedgerSetup: Record "General Ledger Setup";
                        ImportPayrollTransaction: Codeunit "Import Payroll Transaction";
                    begin
                        GeneralLedgerSetup.Get();
                        GeneralLedgerSetup.TestField("Payroll Trans. Import Format");
                        if Rec.FindLast() then;
                        ImportPayrollTransaction.SelectAndImportPayrollDataToGL(Rec, GeneralLedgerSetup."Payroll Trans. Import Format");
                    end;
                }
            }
        }
    }


    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        UserSetup.Get(UserId);
        Rec."Journal Template Name" := UserSetup."Journal Template Name";
        Rec."Journal Batch Name" := UserSetup."Journal Batch Name";
        Rec."Line No." := 10000;

        JnlBatch.Reset();
        JnlBatch.SetRange(JnlBatch."Journal Template Name", UserSetup."Journal Template Name");
        JnlBatch.SetRange(JnlBatch.Name, UserSetup."Journal Batch Name");
        if JnlBatch.FindFirst() then
            Rec."Document No." := NoSeriesMgt.GetNextNo(JnlBatch."No. Series", Rec."Posting Date", true);
        //NoSeriesMgt.InitSeries(GetNoSeriesCode,xRec."No. Series","Posting Date","No.","No. Series");
    end;

    trigger OnOpenPage()
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."Journal Template Name" = '' then
                Error('User has not been setup to process Journal Vouchers');
            Rec.SetRange(Rec."Journal Template Name", UserSetup."Journal Template Name");
            Rec.SetRange(Rec."Journal Batch Name", UserSetup."Journal Batch Name");
        end
        else
            Error('User has not been setup to process Journal Vouchers');

        CurrentJnlBatchName := Rec."Journal Batch Name";
        /*
        JnlBatch.RESET;
        JnlBatch.SETRANGE(JnlBatch."Journal Template Name",UserSetup."Journal Template Name");
        JnlBatch.SETRANGE(JnlBatch.Name,UserSetup."Journal Batch Name");
        IF JnlBatch.FINDFIRST THEN BEGIN
          IF JnlBatch.Status<>JnlBatch.Status::Open THEN
            CurrPage.EDITABLE:=FALSE
          ELSE
            CurrPage.EDITABLE:=TRUE;
          CurrPage.UPDATE;
        END
        */

    end;

    var
        ChangeExchangeRate: Page "Change Exchange Rate";
        GLReconcile: Page Reconciliation;
        GenJnlManagement: Codeunit GenJnlManagement;
        ReportPrint: Codeunit "Test Report-Print";
        CurrentJnlBatchName: Code[10];
        AccName: Text[50];
        BalAccName: Text[50];
        Balance: Decimal;
        TotalBalance: Decimal;
        ShowBalance: Boolean;
        ShowTotalBalance: Boolean;
        ShortcutDimCode: array[8] of Code[20];
        OpenedFromBatch: Boolean;
        [InDataSet]
        BalanceVisible: Boolean;
        [InDataSet]
        TotalBalanceVisible: Boolean;
        StyleTxt: Text;
        GenJnlLine: Record "Gen. Journal Line";
        UserSetup: Record "User Setup";
        BatchName: Record "Gen. Journal Batch";
        GenJnlBatch: Record "Gen. Journal Batch";
        JournalPosted: Codeunit "Journal Post Successful";
        Text000: Label 'General Journal lines have been successfully inserted from Standard General Journal %1.';
        Text001: Label 'Standard General Journal %1 has been successfully created.';
        JnlBatch: Record "Gen. Journal Batch";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    local procedure UpdateBalance()
    begin
        GenJnlManagement.CalcBalance(Rec, xRec, Balance, TotalBalance, ShowBalance, ShowTotalBalance);
        BalanceVisible := ShowBalance;
        TotalBalanceVisible := ShowTotalBalance;
    end;

    local procedure CurrentJnlBatchNameOnAfterVali()
    begin
        CurrPage.SaveRecord();
        GenJnlManagement.SetName(CurrentJnlBatchName, Rec);
        CurrPage.Update(false);
    end;


    procedure SetUserInteractions()
    begin
        StyleTxt := Rec.GetStyle();
    end;


    procedure CheckBalanced()
    var
        JnlLine: Record "Gen. Journal Line";
    begin
        JnlLine.Reset();
        JnlLine.SetRange(JnlLine."Journal Template Name", Rec."Journal Template Name");
        JnlLine.SetRange(JnlLine."Journal Batch Name", Rec."Journal Batch Name");
        JnlLine.FindSet();
        JnlLine.CalcSums(JnlLine.Amount);
        if JnlLine.Amount <> 0 then
            Error('Journal out of balance by %1', JnlLine.Amount);
    end;
}
