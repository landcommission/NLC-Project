#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193625 "Cash Office User Template"
{
    DataCaptionFields = UserID;
    PageType = List;
    SourceTable = "Cash Office User Template";
    ApplicationArea = All;
    Caption = 'Cash Office User Template';
    layout
    {
        area(Content)
        {
            repeater(Control1102758000)
            {
                field(UserID; Rec.UserID)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the UserID field.';
                }
                field("Receipt Journal Template"; Rec."Receipt Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt Journal Template field.';
                }
                field("Receipt Journal Batch"; Rec."Receipt Journal Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt Journal Batch field.';
                }
                field("Imprest Template"; Rec."Imprest Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Template field.';
                }
                field("Imprest  Batch"; Rec."Imprest  Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest  Batch field.';
                }
                field("Default Receipts Bank"; Rec."Default Receipts Bank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Receipts Bank field.';
                }
                field("Default Petty Cash Bank"; Rec."Default Petty Cash Bank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Petty Cash Bank field.';
                }
                field("Default Payment Bank"; Rec."Default Payment Bank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Payment Bank field.';
                }
                field("Payment Journal Template"; Rec."Payment Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Journal Template field.';
                }
                field("Payment Journal Batch"; Rec."Payment Journal Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Journal Batch field.';
                }
                field("Petty Cash Template"; Rec."Petty Cash Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Petty Cash Template field.';
                }
                field("Petty Cash Batch"; Rec."Petty Cash Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Petty Cash Batch field.';
                }
                field("Inter Bank Template Name"; Rec."Inter Bank Template Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inter Bank Template Name field.';
                }
                field("Inter Bank Batch Name"; Rec."Inter Bank Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inter Bank Batch Name field.';
                }
                field("Bank Pay In Journal Template"; Rec."Bank Pay In Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Pay In Journal Template field.';
                }
                field("Bank Pay In Journal Batch"; Rec."Bank Pay In Journal Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Pay In Journal Batch field.';
                }
                field("Claim Template"; Rec."Claim Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Claim Template field.';
                }
                field("Claim  Batch"; Rec."Claim  Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Claim  Batch field.';
                }
                field("Advance Template"; Rec."Advance Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advance Template field.';
                }
                field("Advance  Batch"; Rec."Advance  Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advance  Batch field.';
                }
                field("Advance Surr Template"; Rec."Advance Surr Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advance Surr Template field.';
                }
                field("Advance Surr Batch"; Rec."Advance Surr Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advance Surr Batch field.';
                }
                field("Dim Change Journal Template"; Rec."Dim Change Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dim Change Journal Template field.';
                }
                field("Dim Change Journal Batch"; Rec."Dim Change Journal Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dim Change Journal Batch field.';
                }
                field("Journal Voucher Template"; Rec."Journal Voucher Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Journal Voucher Template field.';
                }
                field("Journal Voucher Batch"; Rec."Journal Voucher Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Journal Voucher Batch field.';
                }
                field("Default Cash Sale Customer"; Rec."Default Cash Sale Customer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Cash Sale Customer field.';
                }
            }
        }
    }

    actions { }
}
