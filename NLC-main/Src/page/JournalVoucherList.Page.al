#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193729 "Journal Voucher List"
{
    CardPageId = "Journal Voucher Card";
    Editable = false;
    PageType = List;
    SourceTable = "Gen. Journal Line";
    SourceTableView = where("Line No." = const(10000));
    ApplicationArea = All;
    Caption = 'Journal Voucher List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Journal Template Name"; Rec."Journal Template Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Journal Template Name field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the type of account that the entry on the journal line will be posted to.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
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
                    ToolTip = 'Specifies a document number for the journal line.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a description of the entry.';
                }
                field("VAT %"; Rec."VAT %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the relevant VAT rate for the particular combination of VAT business posting group and VAT product posting group. Do not enter the percent sign, only the number. For example, if the VAT rate is 25 %, enter 25 in this field.';
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the general ledger, customer, vendor, or bank account that the balancing entry is posted to, such as a cash account for cash purchases.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code of the currency for the amounts on the journal line.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the total amount (including VAT) that the journal line consists of.';
                }
                field("Debit Amount"; Rec."Debit Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the total of the ledger entries that represent debits.';
                }
                field("Credit Amount"; Rec."Credit Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the total of the ledger entries that represent credits.';
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the total amount in local currency (including VAT) that the journal line consists of.';
                }
                field("Balance (LCY)"; Rec."Balance (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Balance (LCY) field.';
                }
                field("Currency Factor"; Rec."Currency Factor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Factor field.';
                }
                field("Sales/Purch. (LCY)"; Rec."Sales/Purch. (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the line''s net amount (the amount excluding VAT) if you are using this journal line for an invoice.';
                }
                field("Profit (LCY)"; Rec."Profit (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the line''s profit amount if you are using this journal line for an invoice.';
                }
                field("Inv. Discount (LCY)"; Rec."Inv. Discount (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the amount of the invoice discount if you are using this journal line for an invoice.';
                }
                field("Bill-to/Pay-to No."; Rec."Bill-to/Pay-to No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the bill-to customer or pay-to vendor that the entry is linked to.';
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the account posting group that the entry on the journal line will be posted to.';
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
                field("Salespers./Purch. Code"; Rec."Salespers./Purch. Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the salesperson or purchaser who is linked to the journal line.';
                }
                field("Source Code"; Rec."Source Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source Code field.';
                }
                field("System-Created Entry"; Rec."System-Created Entry")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the System-Created Entry field.';
                }
                field("On Hold"; Rec."On Hold")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies that the related entry represents an unpaid invoice for which either a payment suggestion, a reminder, or a finance charge memo exists.';
                }
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the type of the posted document that this document or journal line will be applied to when you post, for example to register payment.';
                }
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the posted document that this document or journal line will be applied to when you post, for example to register payment.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the due date on the entry.';
                }
                field("Pmt. Discount Date"; Rec."Pmt. Discount Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date on which the amount in the entry must be paid for a payment discount to be granted.';
                }
                field("Payment Discount %"; Rec."Payment Discount %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the payment discount percent granted if payment is made on or before the date in the Pmt. Discount Date field.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the related job.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the quantity of items to be included on the journal line.';
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the amount of VAT that is included in the total amount.';
                }
                field("VAT Posting"; Rec."VAT Posting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Posting field.';
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.';
                }
                field("Applies-to ID"; Rec."Applies-to ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the ID of entries that will be applied to when you choose the Apply Entries action.';
                }
                field("Business Unit Code"; Rec."Business Unit Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code for the business unit that the fixed asset entry is linked to.';
                }
                field("Journal Batch Name"; Rec."Journal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Journal Batch Name field.';
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the reason code, a supplementary source code that enables you to trace the entry.';
                }
                field("Recurring Method"; Rec."Recurring Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a recurring method if the Recurring field of the General Journal Template table indicates the journal is recurring.';
                }
                field("Expiration Date"; Rec."Expiration Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the last date the recurring journal will be posted, if you have indicated in the journal is recurring.';
                }
                field("Recurring Frequency"; Rec."Recurring Frequency")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a recurring frequency if the Recurring field of the General Journal Template table indicates the journal is recurring.';
                }
                field("Allocated Amt. (LCY)"; Rec."Allocated Amt. (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the amount that has been allocated when you have used the Allocations function in the Gen. Jnl. Allocation table.';
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
                field("VAT Calculation Type"; Rec."VAT Calculation Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Calculation Type field.';
                }
                field("EU 3-Party Trade"; Rec."EU 3-Party Trade")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the entry was part of a 3-party trade. If it was, there is a check mark in the field.';
                }
                field("Allow Application"; Rec."Allow Application")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allow Application field.';
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the type of account that a balancing entry is posted to, such as BANK for a cash account.';
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
                field("Bal. VAT Calculation Type"; Rec."Bal. VAT Calculation Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bal. VAT Calculation Type field.';
                }
                field("Bal. VAT %"; Rec."Bal. VAT %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bal. VAT % field.';
                }
                field("Bal. VAT Amount"; Rec."Bal. VAT Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the amount of Bal. VAT included in the total amount.';
                }
                field("Bank Payment Type"; Rec."Bank Payment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code for the payment type to be used for the entry on the journal line.';
                }
                field("VAT Base Amount"; Rec."VAT Base Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Base Amount field.';
                }
                field("Bal. VAT Base Amount"; Rec."Bal. VAT Base Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bal. VAT Base Amount field.';
                }
                field(Correction; Rec.Correction)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the entry as a corrective entry. You can use the field if you need to post a corrective entry to an account.';
                }
                field("Check Printed"; Rec."Check Printed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether a check has been printed for the amount on the payment journal line.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when the related document was created.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a document number that refers to the customer''s or vendor''s numbering system.';
                }
                field("Source Type"; Rec."Source Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source Type field.';
                }
                field("Source No."; Rec."Source No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source No. field.';
                }
                field("Posting No. Series"; Rec."Posting No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting No. Series field.';
                }
                field("Tax Area Code"; Rec."Tax Area Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the tax area that is used to calculate and post sales tax.';
                }
                field("Tax Liable"; Rec."Tax Liable")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies if the customer or vendor is liable for sales tax.';
                }
                field("Tax Group Code"; Rec."Tax Group Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the tax group that is used to calculate and post sales tax.';
                }
                field("Use Tax"; Rec."Use Tax")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies that the purchase is subject to use tax. Use tax is a sales tax that is paid on items that are purchased by a company and are used by that company instead of being sold to a customer.';
                }
                field("Bal. Tax Area Code"; Rec."Bal. Tax Area Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bal. Tax Area Code field.';
                }
                field("Bal. Tax Liable"; Rec."Bal. Tax Liable")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bal. Tax Liable field.';
                }
                field("Bal. Tax Group Code"; Rec."Bal. Tax Group Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bal. Tax Group Code field.';
                }
                field("Bal. Use Tax"; Rec."Bal. Use Tax")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bal. Use Tax field.';
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the VAT specification of the involved item or resource to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                }
                field("Bal. VAT Bus. Posting Group"; Rec."Bal. VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code of the VAT business posting group that will be used when you post the entry on the journal line.';
                }
                field("Bal. VAT Prod. Posting Group"; Rec."Bal. VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code of the VAT product posting group that will be used when you post the entry on the journal line.';
                }
                field("Additional-Currency Posting"; Rec."Additional-Currency Posting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional-Currency Posting field.';
                }
                field("FA Add.-Currency Factor"; Rec."FA Add.-Currency Factor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA Add.-Currency Factor field.';
                }
                field("Source Currency Code"; Rec."Source Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source Currency Code field.';
                }
                field("Source Currency Amount"; Rec."Source Currency Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source Currency Amount field.';
                }
                field("Source Curr. VAT Base Amount"; Rec."Source Curr. VAT Base Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source Curr. VAT Base Amount field.';
                }
                field("Source Curr. VAT Amount"; Rec."Source Curr. VAT Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source Curr. VAT Amount field.';
                }
                field("VAT Base Discount %"; Rec."VAT Base Discount %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Base Discount % field.';
                }
                field("VAT Amount (LCY)"; Rec."VAT Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Amount (LCY) field.';
                }
                field("VAT Base Amount (LCY)"; Rec."VAT Base Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Base Amount (LCY) field.';
                }
                field("Bal. VAT Amount (LCY)"; Rec."Bal. VAT Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bal. VAT Amount (LCY) field.';
                }
                field("Bal. VAT Base Amount (LCY)"; Rec."Bal. VAT Base Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bal. VAT Base Amount (LCY) field.';
                }
                field("Reversing Entry"; Rec."Reversing Entry")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reversing Entry field.';
                }
                field("Allow Zero-Amount Posting"; Rec."Allow Zero-Amount Posting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allow Zero-Amount Posting field.';
                }
                field("Ship-to/Order Address Code"; Rec."Ship-to/Order Address Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the address code of the ship-to customer or order-from vendor that the entry is linked to.';
                }
                field("VAT Difference"; Rec."VAT Difference")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the difference between the calculated VAT amount and a VAT amount that you have entered manually.';
                }
                field("Bal. VAT Difference"; Rec."Bal. VAT Difference")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the difference between the calculate VAT amount and the VAT amount that you have entered manually.';
                }
                field("IC Partner Code"; Rec."IC Partner Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IC Partner Code field.';
                }
                field("IC Direction"; Rec."IC Direction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IC Direction field.';
                }
                field("IC Partner G/L Acc. No."; Rec."IC Partner G/L Acc. No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the account in your IC partner''s company that corresponds to the G/L account on the line.';
                }
                field("IC Partner Transaction No."; Rec."IC Partner Transaction No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IC Partner Transaction No. field.';
                }
                field("Sell-to/Buy-from No."; Rec."Sell-to/Buy-from No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sell-to/Buy-from No. field.';
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Registration No. field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                }
                field(Prepayment; Rec.Prepayment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prepayment field.';
                }
                field("Financial Void"; Rec."Financial Void")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Void field.';
                }
                field("Incoming Document Entry No."; Rec."Incoming Document Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the incoming document that this general journal line is created for.';
                }
                field("Creditor No."; Rec."Creditor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the vendor who sent the purchase invoice.';
                }
                field("Payment Reference"; Rec."Payment Reference")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the payment of the purchase invoice.';
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies how to make payment, such as with bank transfer, cash, or check.';
                }
                field("Applies-to Ext. Doc. No."; Rec."Applies-to Ext. Doc. No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the external document number that will be exported in the payment file.';
                }
                field("Recipient Bank Account"; Rec."Recipient Bank Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the bank account that the amount will be transferred to after it has been exported from the payment journal.';
                }
                field("Message to Recipient"; Rec."Message to Recipient")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the message exported to the payment file when you use the Export Payments to File function in the Payment Journal window.';
                }
                field("Exported to Payment File"; Rec."Exported to Payment File")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies that the payment journal line was exported to a payment file.';
                }
                field("Has Payment Export Error"; Rec."Has Payment Export Error")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies that an error occurred when you used the Export Payments to File function in the Payment Journal window.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
                /* field("Credit Card No.";Rec."Credit Card No.")
                {
                    ApplicationArea = Basic;
                } */
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the related job task.';
                }
                field("Job Unit Price (LCY)"; Rec."Job Unit Price (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the unit price, in the local currency, for the selected account type and account number on the journal line.';
                }
                field("Job Total Price (LCY)"; Rec."Job Total Price (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the total price for the journal line, in the local currency. The value is calculated as follows: Quantity x Unit Price (LCY).';
                }
                field("Job Quantity"; Rec."Job Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the quantity for the job ledger entry that is derived from posting the journal line. If the Job Quantity is 0, the total amount on the job ledger entry will also be 0.';
                }
                field("Job Unit Cost (LCY)"; Rec."Job Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the job cost of one unit of the item or resource on the journal line, in the local currency. The value is calculated as follows: Job Total Cost (LCY) / Job Quantity.';
                }
                field("Job Line Discount %"; Rec."Job Line Discount %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the line discount percentage of the job ledger entry that is related to the purchase line.';
                }
                field("Job Line Disc. Amount (LCY)"; Rec."Job Line Disc. Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Line Disc. Amount (LCY) field.';
                }
                field("Job Unit Of Measure Code"; Rec."Job Unit Of Measure Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the unit of measure code that is used to determine the unit price. This code specifies how the quantity is measured, for example, by the box or by the piece. The application retrieves this code from the corresponding item or resource card.';
                }
                field("Job Line Type"; Rec."Job Line Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the type of planning line to create when a job ledger entry is posted. If the field is empty, no planning lines are created.';
                }
                field("Job Unit Price"; Rec."Job Unit Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the unit price for the selected account type and account number on the journal line.';
                }
                field("Job Total Price"; Rec."Job Total Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the total price for the journal line. The value is calculated as follows: Quantity x Unit Price (LCY).';
                }
                field("Job Unit Cost"; Rec."Job Unit Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the job cost of one unit of the item or resource on the journal line. The value is calculated as follows: Job Total Cost (LCY) / Job Quantity.';
                }
                field("Job Total Cost"; Rec."Job Total Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies if you have assigned a job number and a job task number to the journal line. It shows the amount excluding VAT divided by the job quantity for the journal line. The amount is shown in the currency specified for the job. The value field is calculated as follows: (Amount - VAT Amount) x (Job Currency Rate/Currency Rate).';
                }
                field("Job Line Discount Amount"; Rec."Job Line Discount Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the line discount amount of the job ledger entry.';
                }
                field("Job Line Amount"; Rec."Job Line Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the line amount of the job ledger entry.';
                }
                field("Job Total Cost (LCY)"; Rec."Job Total Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the job total cost if you have assigned a job number and a job task number to the journal line. It shows the Amount (LCY) excluding VAT Amount (LCY)for the journal line.';
                }
                field("Job Line Amount (LCY)"; Rec."Job Line Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the line amount of the job ledger entry.';
                }
                field("Job Currency Factor"; Rec."Job Currency Factor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Currency Factor field.';
                }
                field("Job Currency Code"; Rec."Job Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Currency Code field.';
                }
                field("Job Planning Line No."; Rec."Job Planning Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the job planning line number that the usage should be linked to when the job journal is posted. You can only link to job planning lines that have the Apply Usage Link option enabled.';
                }
                field("Job Remaining Qty."; Rec."Job Remaining Qty.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the quantity that remains to complete a job.';
                }
                field("Direct Debit Mandate ID"; Rec."Direct Debit Mandate ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the identification of the direct-debit mandate that is being used on the journal lines to process a direct debit collection.';
                }
                /* field("Posting Exch. Entry No.";Rec."Posting Exch. Entry No.")
                {
                    ApplicationArea = Basic;
                } */
                field("Payer Information"; Rec."Payer Information")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies payer information that is imported with the bank statement file.';
                }
                field("Transaction Information"; Rec."Transaction Information")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies transaction information that is imported with the bank statement file.';
                }
                /* field("Posting Exch. Line No.";Rec."Posting Exch. Line No.")
                {
                    ApplicationArea = Basic;
                } */
                field("Applied Automatically"; Rec."Applied Automatically")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies that the general journal line has been automatically applied with a matching payment using the Apply Automatically function.';
                }
                field("Campaign No."; Rec."Campaign No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the campaign that the journal line is linked to.';
                }
                field("Prod. Order No."; Rec."Prod. Order No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prod. Order No. field.';
                }
                field("FA Posting Date"; Rec."FA Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the posting date of the related fixed asset transaction, such as a depreciation.';
                }
                field("FA Posting Type"; Rec."FA Posting Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the posting type, if Account Type field contains Fixed Asset.';
                }
                field("Depreciation Book Code"; Rec."Depreciation Book Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code for the depreciation book to which the line will be posted if you have selected Fixed Asset in the Type field for this line.';
                }
                field("Salvage Value"; Rec."Salvage Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the estimated residual value of a fixed asset when it can no longer be used.';
                }
                field("No. of Depreciation Days"; Rec."No. of Depreciation Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of depreciation days if you have selected the Depreciation or Custom 1 option in the FA Posting Type field.';
                }
                field("Depr. until FA Posting Date"; Rec."Depr. until FA Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies if depreciation was calculated until the FA posting date of the line.';
                }
                field("Depr. Acquisition Cost"; Rec."Depr. Acquisition Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies if, when this line was posted, the additional acquisition cost posted on the line was depreciated in proportion to the amount by which the fixed asset had already been depreciated.';
                }
                field("Maintenance Code"; Rec."Maintenance Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a maintenance code.';
                }
                field("Insurance No."; Rec."Insurance No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies an insurance code if you have selected the Acquisition Cost option in the FA Posting Type field.';
                }
                field("Budgeted FA No."; Rec."Budgeted FA No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of a fixed asset with the Budgeted Asset check box selected. When you post the journal or document line, an additional entry is created for the budgeted fixed asset where the amount has the opposite sign.';
                }
                field("Duplicate in Depreciation Book"; Rec."Duplicate in Depreciation Book")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a depreciation book code if you want the journal line to be posted to that depreciation book, as well as to the depreciation book in the Depreciation Book Code field.';
                }
                field("Use Duplication List"; Rec."Use Duplication List")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies whether the line is to be posted to all depreciation books, using different journal batches and with a check mark in the Part of Duplication List field.';
                }
                field("FA Reclassification Entry"; Rec."FA Reclassification Entry")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies if the entry was generated from a fixed asset reclassification journal.';
                }
                field("FA Error Entry No."; Rec."FA Error Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of a posted FA ledger entry to mark as an error entry.';
                }
                field("Index Entry"; Rec."Index Entry")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Index Entry field.';
                }
                field("Source Line No."; Rec."Source Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source Line No. field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a comment about the activity on the journal line. Note that the comment is not carried forward to posted entries.';
                }
                field("Amount Payable"; Rec."Amount Payable")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Payable field.';
                }
                field("Batch Balance"; Rec."Batch Balance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Batch Balance field.';
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Code field.';
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry Type field.';
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Name field.';
                }
                field(Particulars; Rec.Particulars)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Particulars field.';
                }
                field("Expense code"; Rec."Expense code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expense code field.';
                }
            }
        }
    }

    actions { }
}
