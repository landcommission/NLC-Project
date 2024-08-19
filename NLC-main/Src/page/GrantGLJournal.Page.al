#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193855 "Grant G/L Journal"
{
    AutoSplitKey = true;
    Caption = 'Grant G/L Journal';
    DataCaptionFields = "Journal Batch Name";
    DelayedInsert = true;
    PageType = Card;
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
                field("VAT %"; Rec."VAT %")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the relevant VAT rate for the particular combination of VAT business posting group and VAT product posting group. Do not enter the percent sign, only the number. For example, if the VAT rate is 25 %, enter 25 in this field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the total amount (including VAT) that the journal line consists of.';
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
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the type of the posted document that this document or journal line will be applied to when you post, for example to register payment.';
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
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the related job.';
                    trigger OnValidate()
                    begin
                        Rec.ShowShortcutDimCode(ShortcutDimCode);
                    end;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the related job task.';
                }
                field("Job Line Type"; Rec."Job Line Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the type of planning line to create when a job ledger entry is posted. If the field is empty, no planning lines are created.';
                }
                field("Job Unit Of Measure Code"; Rec."Job Unit Of Measure Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the unit of measure code that is used to determine the unit price. This code specifies how the quantity is measured, for example, by the box or by the piece. The application retrieves this code from the corresponding item or resource card.';
                }
                field("Job Quantity"; Rec."Job Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the quantity for the job ledger entry that is derived from posting the journal line. If the Job Quantity is 0, the total amount on the job ledger entry will also be 0.';
                }
                field("Job Unit Cost"; Rec."Job Unit Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the job cost of one unit of the item or resource on the journal line. The value is calculated as follows: Job Total Cost (LCY) / Job Quantity.';
                }
                field("Job Unit Cost (LCY)"; Rec."Job Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the job cost of one unit of the item or resource on the journal line, in the local currency. The value is calculated as follows: Job Total Cost (LCY) / Job Quantity.';
                }
                field("Job Total Cost"; Rec."Job Total Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies if you have assigned a job number and a job task number to the journal line. It shows the amount excluding VAT divided by the job quantity for the journal line. The amount is shown in the currency specified for the job. The value field is calculated as follows: (Amount - VAT Amount) x (Job Currency Rate/Currency Rate).';
                }
                field("Job Total Cost (LCY)"; Rec."Job Total Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the job total cost if you have assigned a job number and a job task number to the journal line. It shows the Amount (LCY) excluding VAT Amount (LCY)for the journal line.';
                }
                field("Job Unit Price"; Rec."Job Unit Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the unit price for the selected account type and account number on the journal line.';
                }
                field("Job Unit Price (LCY)"; Rec."Job Unit Price (LCY)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the unit price, in the local currency, for the selected account type and account number on the journal line.';
                }
                field("Job Line Amount"; Rec."Job Line Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the line amount of the job ledger entry.';
                }
                field("Job Line Amount (LCY)"; Rec."Job Line Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the line amount of the job ledger entry.';
                }
                field("Job Line Discount Amount"; Rec."Job Line Discount Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the line discount amount of the job ledger entry.';
                }
                field("Job Line Discount %"; Rec."Job Line Discount %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the line discount percentage of the job ledger entry that is related to the purchase line.';
                }
                field("Job Total Price"; Rec."Job Total Price")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the total price for the journal line. The value is calculated as follows: Quantity x Unit Price (LCY).';
                }
                field("Job Total Price (LCY)"; Rec."Job Total Price (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the total price for the journal line, in the local currency. The value is calculated as follows: Quantity x Unit Price (LCY).';
                }
            }
            group(Control30)
            {
                label(Control36)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19039985;
                }
                field(AccName; AccName)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the AccName field.';
                }
                field(BalAccName; BalAccName)
                {
                    ApplicationArea = Basic;
                    Caption = 'Bal. Account Name';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Bal. Account Name field.';
                }
                field(Balance; Balance + Rec."Balance (LCY)" - xRec."Balance (LCY)")
                {
                    ApplicationArea = Basic;
                    AutoFormatType = 1;
                    Caption = 'Balance';
                    Editable = false;
                    Visible = BalanceVisible;
                    ToolTip = 'Specifies the value of the Balance field.';
                }
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

    actions
    {
        area(Navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                action("<Page Journal Line Dimensions>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = page "Journal Line Dimensions";
                    RunPageLink = "Table ID" = const(81),
                                  "Journal Template Name" = field("Journal Template Name"),
                                  "Journal Batch Name" = field("Journal Batch Name"),
                                  "Journal Line No." = field("Line No.");
                    ShortcutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                }
            }
            group("A&ccount")
            {
                Caption = 'A&ccount';
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
                    RunObject = codeunit "Gen. Jnl.-Show Entries";
                    ShortcutKey = 'Ctrl+F7';
                    ToolTip = 'Executes the Ledger E&ntries action.';
                }
            }
        }
        area(Processing)
        {
            group("P&osting")
            {
                Caption = 'P&osting';
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
                action("P&ost")
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortcutKey = 'F9';
                    ToolTip = 'Executes the P&ost action.';
                    trigger OnAction()
                    begin
                        Codeunit.Run(Codeunit::"Gen. Jnl.-Post Line", Rec);
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
                        Codeunit.Run(Codeunit::"Gen. Jnl.-Post+Print", Rec);
                        CurrentJnlBatchName := Rec.GetRangeMax(Rec."Journal Batch Name");
                        CurrPage.Update(false);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
        OnAfterGetCurrRecord();
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
        OnAfterGetCurrRecord();
    end;

    trigger OnOpenPage()
    var
        JnlSelected: Boolean;
    begin
        OpenedFromBatch := (Rec."Journal Batch Name" <> '') and (Rec."Journal Template Name" = '');
        if OpenedFromBatch then begin
            CurrentJnlBatchName := Rec."Journal Batch Name";
            GenJnlManagement.OpenJnl(CurrentJnlBatchName, Rec);
            exit;
        end;
        GenJnlManagement.TemplateSelection(Page::"Grant G/L Journal", 7, false, Rec, JnlSelected);
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
        OpenedFromBatch: Boolean;
        [InDataSet]
        BalanceVisible: Boolean;
        [InDataSet]
        TotalBalanceVisible: Boolean;
        Text19039985: Label 'Account Name';

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

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        GenJnlManagement.GetAccounts(Rec, AccName, BalAccName);
        UpdateBalance();
    end;
}
