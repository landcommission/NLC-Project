#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193628 "Receipt and Payment Types List"
{
    PageType = List;
    SourceTable = "Receipts and Payment Types";
    ApplicationArea = All;
    Caption = 'Receipt and Payment Types List';
    layout
    {
        area(Content)
        {
            repeater(Control1102758000)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("VAT Chargeable"; Rec."VAT Chargeable")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Chargeable field.';
                }
                field("Withholding Tax Chargeable"; Rec."Withholding Tax Chargeable")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Withholding Tax Chargeable field.';
                }
                field("VAT Code"; Rec."VAT Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Code field.';
                }
                field("Withholding Tax Code"; Rec."Withholding Tax Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Withholding Tax Code field.';
                }
                field("VAT Withheld Code"; Rec."VAT Withheld Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Withheld Code field.';
                }
                field("Default Grouping"; Rec."Default Grouping")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Grouping field.';
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the G/L Account field.';
                }
                field("Pending Voucher"; Rec."Pending Voucher")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pending Voucher field.';
                }
                field("Bank Account"; Rec."Bank Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Account field.';
                }
                field("Transation Remarks"; Rec."Transation Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transation Remarks field.';
                }
                field("Direct Expense"; Rec."Direct Expense")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Direct Expense field.';
                }
            }
        }
    }

    actions { }

    trigger OnInit()
    begin
        CurrPage.LookupMode := true;
    end;
}
