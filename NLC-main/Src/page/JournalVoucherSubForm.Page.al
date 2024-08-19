#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193689 "Journal Voucher SubForm"
{
    PageType = ListPart;
    SourceTable = "Gen. Journal Line";
    ApplicationArea = All;
    Caption = 'Journal Voucher SubForm';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the posting date for the entry.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the type of document that the entry on the journal line is.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies a document number for the journal line.';
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
                    trigger OnValidate()
                    begin
                        Rec.Validate(Rec."Currency Code", Header."Currency Code");
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a description of the entry.';
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
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the total amount (including VAT) that the journal line consists of.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department';
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Division';
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a document number that refers to the customer''s or vendor''s numbering system.';
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
                field("VAT %"; Rec."VAT %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the relevant VAT rate for the particular combination of VAT business posting group and VAT product posting group. Do not enter the percent sign, only the number. For example, if the VAT rate is 25 %, enter 25 in this field.';
                }
                field("VAT Amount (LCY)"; Rec."VAT Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Amount (LCY) field.';
                }
            }
        }
    }

    actions { }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Line No." := GetLastLine();
        Header.Get(Rec."Journal Template Name", Rec."Journal Batch Name", '10000');
        Rec."Posting Date" := Header."Posting Date";
        Rec."Document Type" := Header."Document Type";
        Rec."Document No." := Header."Document No.";
    end;

    var
        Header: Record "Gen. Journal Line";


    procedure GetLastLine(): Integer
    var
        JournalLine: Record "Gen. Journal Line";
    begin
        JournalLine.SetRange(JournalLine."Journal Template Name", Rec."Journal Template Name");
        JournalLine.SetRange(JournalLine."Journal Batch Name", Rec."Journal Batch Name");
        JournalLine.FindLast();
        exit(JournalLine."Line No." + 10000);
    end;
}
