#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193677 "Change General Journal"
{
    AutoSplitKey = true;
    Caption = 'General Journal';
    DataCaptionExpression = Rec.DataCaption();
    DelayedInsert = true;
    PageType = Worksheet;
    SaveValues = true;
    SourceTable = "Gen. Journal Line";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            field(CurrentJnlBatchName; CurrentJnlBatchName)
            {
                ApplicationArea = Basic;
                Caption = 'Batch Name';
                Lookup = true;
                ToolTip = 'Specifies the value of the Batch Name field.';
                trigger OnLookup(var Text: Text): Boolean
                begin
                    CurrPage.SaveRecord();
                    GenJnlManagement.LookupName(CurrentJnlBatchName, Rec);
                    CurrPage.Update(false);
                end;

                trigger OnValidate()
                begin
                    GenJnlManagement.CheckName(CurrentJnlBatchName, Rec);
                    CurrentJnlBatchNameOnAfterVali();
                end;
            }
            repeater(Control1)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the posting date for the entry.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the date when the related document was created.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the type of document that the entry on the journal line is.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a document number for the journal line.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies a document number that refers to the customer''s or vendor''s numbering system.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the type of account that the entry on the journal line will be posted to.';
                    trigger OnValidate()
                    begin
                        GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
                    end;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the account number that the entry on the journal line will be posted to.';
                    trigger OnValidate()
                    begin
                        GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
                        Rec.ShowShortcutDimCode(ShortcutDimCode);
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a description of the entry.';
                }
                field("Business Unit Code"; Rec."Business Unit Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the code for the business unit that the fixed asset entry is linked to.';
                }
                field("Salespers./Purch. Code"; Rec."Salespers./Purch. Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the salesperson or purchaser who is linked to the journal line.';
                }
                field("Campaign No."; Rec."Campaign No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the number of the campaign that the journal line is linked to.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    AssistEdit = true;
                    Visible = false;
                    ToolTip = 'Specifies the code of the currency for the amounts on the journal line.';
                    trigger OnAssistEdit()
                    begin
                        ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", Rec."Posting Date");
                        if ChangeExchangeRate.RunModal() = Action::OK then
                            Rec.Validate(Rec."Currency Factor", ChangeExchangeRate.GetParameter());

                        Clear(ChangeExchangeRate);
                    end;
                }
                field("Gen. Posting Type"; Rec."Gen. Posting Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the type of transaction.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the vendor''s or customer''s trade type to link transactions made for this business partner with the appropriate general ledger account according to the general posting setup.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the item''s product type to link transactions made for this item with the appropriate general ledger account according to the general posting setup.';
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the VAT specification of the involved item or resource to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the total amount (including VAT) that the journal line consists of.';
                }
                field("Debit Amount"; Rec."Debit Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the total of the ledger entries that represent debits.';
                }
                field("Credit Amount"; Rec."Credit Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the total of the ledger entries that represent credits.';
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the amount of VAT that is included in the total amount.';
                }
                field("VAT Difference"; Rec."VAT Difference")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the difference between the calculated VAT amount and a VAT amount that you have entered manually.';
                }
                field("Bal. VAT Amount"; Rec."Bal. VAT Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the amount of Bal. VAT included in the total amount.';
                }
                field("Bal. VAT Difference"; Rec."Bal. VAT Difference")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the difference between the calculate VAT amount and the VAT amount that you have entered manually.';
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the type of account that a balancing entry is posted to, such as BANK for a cash account.';
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the general ledger, customer, vendor, or bank account that the balancing entry is posted to, such as a cash account for cash purchases.';
                    trigger OnValidate()
                    begin
                        GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
                        Rec.ShowShortcutDimCode(ShortcutDimCode);
                    end;
                }
                field("Bal. Gen. Posting Type"; Rec."Bal. Gen. Posting Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the general posting type associated with the balancing account that will be used when you post the entry on the journal line.';
                }
                field("Bal. Gen. Bus. Posting Group"; Rec."Bal. Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the general business posting group code associated with the balancing account that will be used when you post the entry.';
                }
                field("Bal. Gen. Prod. Posting Group"; Rec."Bal. Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the general product posting group code associated with the balancing account that will be used when you post the entry.';
                }
                field("Bal. VAT Bus. Posting Group"; Rec."Bal. VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the code of the VAT business posting group that will be used when you post the entry on the journal line.';
                }
                field("Bal. VAT Prod. Posting Group"; Rec."Bal. VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the code of the VAT product posting group that will be used when you post the entry on the journal line.';
                }
                field("Bill-to/Pay-to No."; Rec."Bill-to/Pay-to No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the number of the bill-to customer or pay-to vendor that the entry is linked to.';
                }
                field("Ship-to/Order Address Code"; Rec."Ship-to/Order Address Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the address code of the ship-to customer or order-from vendor that the entry is linked to.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("ShortcutDimCode[3]"; ShortcutDimCode[3])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,3';
                    Visible = false;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[3] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(3, ShortcutDimCode[3]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(3, ShortcutDimCode[3]);
                    end;
                }
                field("ShortcutDimCode[4]"; ShortcutDimCode[4])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,4';
                    Visible = false;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[4] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(4, ShortcutDimCode[4]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(4, ShortcutDimCode[4]);
                    end;
                }
                field("ShortcutDimCode[5]"; ShortcutDimCode[5])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,5';
                    Visible = false;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[5] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(5, ShortcutDimCode[5]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(5, ShortcutDimCode[5]);
                    end;
                }
                field("ShortcutDimCode[6]"; ShortcutDimCode[6])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,6';
                    Visible = false;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[6] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(6, ShortcutDimCode[6]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(6, ShortcutDimCode[6]);
                    end;
                }
                field("ShortcutDimCode[7]"; ShortcutDimCode[7])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,7';
                    Visible = false;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[7] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(7, ShortcutDimCode[7]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(7, ShortcutDimCode[7]);
                    end;
                }
                field("ShortcutDimCode[8]"; ShortcutDimCode[8])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,8';
                    Visible = false;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[8] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(8, ShortcutDimCode[8]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(8, ShortcutDimCode[8]);
                    end;
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.';
                }
                field("Applied (Yes/No)"; Rec.IsApplied())
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IsApplied field.';
                }
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the number of the posted document that this document or journal line will be applied to when you post, for example to register payment.';
                }
                field("Applies-to ID"; Rec."Applies-to ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the ID of entries that will be applied to when you choose the Apply Entries action.';
                }
                field("On Hold"; Rec."On Hold")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies that the related entry represents an unpaid invoice for which either a payment suggestion, a reminder, or a finance charge memo exists.';
                }
                field("Bank Payment Type"; Rec."Bank Payment Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the code for the payment type to be used for the entry on the journal line.';
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the reason code, a supplementary source code that enables you to trace the entry.';
                }
            }
            group(Control30)
            {
                fixed(Control1901776101)
                {
                    group("Account Name")
                    {
                        Caption = 'Account Name';
                        field(AccName; AccName)
                        {
                            ApplicationArea = Basic;
                            Editable = false;
                            ToolTip = 'Specifies the value of the AccName field.';
                        }
                    }
                    group("Bal. Account Name")
                    {
                        Caption = 'Bal. Account Name';
                        field(BalAccName; BalAccName)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Bal. Account Name';
                            Editable = false;
                            ToolTip = 'Specifies the value of the Bal. Account Name field.';
                        }
                    }
                    group(Control1902759701)
                    {
                        Caption = 'Balance';
                        field(Balance; Balance + Rec."Balance (LCY)" - xRec."Balance (LCY)")
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Balance';
                            Editable = false;
                            Visible = BalanceVisible;
                            ToolTip = 'Specifies the value of the Balance field.';
                        }
                    }
                    group("Total Balance")
                    {
                        Caption = 'Total Balance';
                        field(TotalBalance; TotalBalance + Rec."Balance (LCY)" - xRec."Balance (LCY)")
                        {
                            ApplicationArea = Basic;
                            AutoFormatType = 1;
                            Caption = 'Total Balance';
                            Editable = false;
                            Visible = TotalBalanceVisible;
                            ToolTip = 'Specifies the value of the Total Balance field.';
                        }
                    }
                }
            }
        }
        area(FactBoxes)
        {
            part(Control1900919607; "Dimension Set Entries FactBox")
            {
                SubPageLink = "Dimension Set ID" = field("Dimension Set ID");
                Visible = false;
            }
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
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
                action("Apply Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Apply Entries';
                    Ellipsis = true;
                    Image = ApplyEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = codeunit "Gen. Jnl.-Apply";
                    ShortcutKey = 'Shift+F11';
                    ToolTip = 'Executes the Apply Entries action.';
                }
                action("Insert Conv. LCY Rndg. Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Insert Conv. LCY Rndg. Lines';
                    Image = InsertCurrency;
                    RunObject = codeunit "Adjust Gen. Journal Balance";
                    ToolTip = 'Executes the Insert Conv. LCY Rndg. Lines action.';
                }
                separator(Action107)
                {
                    Caption = '-';
                }
                action("&Get Standard Journals")
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
                action("&Save as Standard Journal")
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
                separator(Action1102755000) { }
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
                        GenJnlBatch.SetRange(GenJnlBatch.Name, CurrentJnlBatchName);
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

                        //First Update the Batch with a number
                        GenJnlBatch.Reset();
                        GenJnlBatch.SetRange(GenJnlBatch.Name, CurrentJnlBatchName);
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
                        GenJnlBatch.SetRange(GenJnlBatch.Name, CurrentJnlBatchName);
                        if GenJnlBatch.Find('-') then;
                        // if ApprovalMgt.CancelJVApprovalRequest(GenJnlBatch,true,true) then;
                        //End allocate batch number
                    end;
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action(Reconcile)
                {
                    ApplicationArea = Basic;
                    Caption = 'Reconcile';
                    Image = Reconcile;
                    ShortcutKey = 'Ctrl+F11';
                    ToolTip = 'Executes the Reconcile action.';
                    trigger OnAction()
                    begin
                        GLReconcile.SetGenJnlLine(Rec);
                        GLReconcile.Run();
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
                        GenJnlBatch.SetRange(GenJnlBatch.Name, CurrentJnlBatchName);
                        GenJnlBatch.SetRange(GenJnlBatch."Journal Template Name", Rec."Journal Template Name");
                        if GenJnlBatch.Find('-') then
                            if GenJnlBatch.Status <> GenJnlBatch.Status::"Pending Approval" then
                                Error('The Batch %1 you are trying to post is yet to be approved', CurrentJnlBatchName);

                        Codeunit.Run(Codeunit::"Gen. Jnl.-Post Line", Rec);

                        //Check batch status is approved
                        if JournalPosted.PostedSuccessfully() then begin
                            GenJnlBatch.Reset();
                            GenJnlBatch.SetRange(GenJnlBatch.Name, CurrentJnlBatchName);
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
                        /*
                        //Check batch status is approved
                        GenJnlBatch.RESET;
                        GenJnlBatch.SETRANGE(GenJnlBatch.Name,CurrentJnlBatchName);
                        GenJnlBatch.SETRANGE(GenJnlBatch."Journal Template Name","Journal Template Name");
                        IF GenJnlBatch.FIND('-') THEN BEGIN
                          IF GenJnlBatch.Status<>GenJnlBatch.Status::Approved THEN
                             ERROR('The Batch %1 you are trying to post is yet to be approved',CurrentJnlBatchName);
                        END;
                        */
                        Codeunit.Run(Codeunit::"Gen. Jnl.-Post+Print", Rec);
                        CurrentJnlBatchName := Rec.GetRangeMax(Rec."Journal Batch Name");
                        CurrPage.Update(false);

                    end;
                }
            }
            group(JV)
            {
                Caption = 'JV';
                action("Journal Voucher")
                {
                    ApplicationArea = Basic;
                    Caption = 'Journal Voucher';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Journal Voucher action.';
                    trigger OnAction()
                    begin

                        GenJnlLine.Reset();
                        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", Rec."Journal Template Name");
                        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", Rec."Journal Batch Name");
                        //REPORT.RUN(39006006,TRUE,FALSE,GenJnlLine);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
        UpdateBalance();
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnInit()
    begin
        TotalBalanceVisible := true;
        BalanceVisible := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        UpdateBalance();
        Rec.SetUpNewLine(xRec, Balance, BelowxRec);
        Clear(ShortcutDimCode);
        Clear(AccName);
    end;

    trigger OnOpenPage()
    var
        JnlSelected: Boolean;
    begin
        BalAccName := '';
        OpenedFromBatch := (Rec."Journal Batch Name" <> '') and (Rec."Journal Template Name" = '');

        CurrentJnlBatchName := DefinedJnlBatchName;//**changes

        if OpenedFromBatch then begin
            CurrentJnlBatchName := Rec."Journal Batch Name";
            GenJnlManagement.OpenJnl(CurrentJnlBatchName, Rec);
            exit;
        end;
        GenJnlManagement.TemplateSelection(Page::"General Journal", 0, false, Rec, JnlSelected);
        if not JnlSelected then
            Error('');
        GenJnlManagement.OpenJnl(CurrentJnlBatchName, Rec);
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
        Text000: Label 'General Journal lines have been successfully inserted from Standard General Journal %1.';
        Text001: Label 'Standard General Journal %1 has been successfully created.';
        OpenedFromBatch: Boolean;
        [InDataSet]
        BalanceVisible: Boolean;
        [InDataSet]
        TotalBalanceVisible: Boolean;
        GenJnlLine: Record "Gen. Journal Line";
        UserSetup: Record "User Setup";
        BatchName: Record "Gen. Journal Batch";
        GenJnlBatch: Record "Gen. Journal Batch";
        JournalPosted: Codeunit "Journal Post Successful";
        CashUserSetup: Record "Cash Office User Template";
        DefinedJnlBatchName: Code[10];

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


    procedure GetBatchToOpen(BatchName: Code[10])
    begin
        DefinedJnlBatchName := BatchName;
        //CurrentJnlBatchName:=BatchName;
        //MESSAGE('%1',DefinedJnlBatchName);
    end;
}
