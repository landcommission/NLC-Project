#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193624 "Cash Office Setup"
{
    PageType = Card;
    SourceTable = "Cash Office Setup";
    ApplicationArea = All;
    Caption = 'Cash Office Setup';
    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                Caption = 'Numbering';
                field("Normal Payments No"; Rec."Normal Payments No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payment Voucher';
                    ToolTip = 'Specifies the value of the Payment Voucher field.';
                }
                field("Cheque Reject Period"; Rec."Cheque Reject Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cheque Reject Period field.';
                }
                field("Minimum Cheque Creation Amount"; Rec."Minimum Cheque Creation Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Cheque Creation Amount field.';
                }
                field("Petty Cash Payments No"; Rec."Petty Cash Payments No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Petty Cash Payments No field.';
                }
                field("Payment Request Nos"; Rec."Payment Request Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Request Nos field.';
                }
                field("Current Budget"; Rec."Current Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Budget field.';
                }
                field("Current Budget Start Date"; Rec."Current Budget Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Budget Start Date field.';
                }
                field("Current Budget End Date"; Rec."Current Budget End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Budget End Date field.';
                }
                field("Bank Deposit No."; Rec."Bank Deposit No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Deposit No. field.';
                }
                field("InterBank Transfer No."; Rec."InterBank Transfer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the InterBank Transfer No. field.';
                }
                field("Surrender Template"; Rec."Surrender Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surrender Template field.';
                }
                field("Surrender  Batch"; Rec."Surrender  Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surrender  Batch field.';
                }
                field("Receipts No"; Rec."Receipts No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Receipts No';
                    ToolTip = 'Specifies the value of the Bank Receipts No field.';
                }
                field("Cash Receipt Nos"; Rec."Cash Receipt Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cash Receipt Nos field.';
                }
                field("Cashier Transfer Nos"; Rec."Cashier Transfer Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cashier Transfer Nos field.';
                }
                field("Default Bank Deposit Slip A/C"; Rec."Default Bank Deposit Slip A/C")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Bank Deposit Slip A/C field.';
                }
                field("Imprest Req No"; Rec."Imprest Req No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Req No.';
                    ToolTip = 'Specifies the value of the Imprest Req No. field.';
                }
                field("Imprest Surrender No"; Rec."Imprest Surrender No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Surrender No field.';
                }
                field("Staff Claim No."; Rec."Staff Claim No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Claim No field.';
                }
                field("Other Staff Advance No."; Rec."Other Staff Advance No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Other Staff Advance No field.';
                }
                field("Staff Advance Surrender No."; Rec."Staff Advance Surrender No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Other Staff Adv. Surrender No';
                    ToolTip = 'Specifies the value of the Other Staff Adv. Surrender No field.';
                }
                field("Use Central Payment System"; Rec."Use Central Payment System")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Use Central Payment System field.';
                }
                field("Journal Voucher Nos"; Rec."Journal Voucher Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Journal Voucher Nos field.';
                }
                field("Grant Surrender Nos"; Rec."Grant Surrender Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grant Surrender Nos field.';
                }
                field("Cash Purchases"; Rec."Cash Purchases")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cash Purchases field.';
                }
            }
            group("Cash Limit")
            {
                Caption = 'Cash Limit';
                field("Apply Cash Expenditure Limit"; Rec."Apply Cash Expenditure Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Apply Cash Expenditure Limit field.';
                }
                field("Expenditure Limit Amount(LCY)"; Rec."Expenditure Limit Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expenditure Limit Amount(LCY) field.';
                }
                field("Prompt Cash Reimbursement"; Rec."Prompt Cash Reimbursement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prompt Cash Reimbursement field.';
                }
            }
        }
    }

    actions { }
}
