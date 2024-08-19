#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193703 "Payment Types Lists"
{
    CardPageId = "Payment Types";
    PageType = List;
    SourceTable = "Receipts and Payment Types";
    SourceTableView = where(Type = const(Payment));
    ApplicationArea = All;
    Caption = 'Payment Types Lists';
    layout
    {
        area(Content)
        {
            repeater(Control1)
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
                    trigger OnValidate()
                    begin
                        AccountTypeOnAfterValidate();
                    end;
                }
                field("Payment Reference"; Rec."Payment Reference")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Reference field.';
                }
                field("VAT Chargeable"; Rec."VAT Chargeable")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Chargeable field.';
                    trigger OnValidate()
                    begin
                        UpdateControl();
                    end;
                }
                field("Withholding Tax Chargeable"; Rec."Withholding Tax Chargeable")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Withholding Tax Chargeable field.';
                    trigger OnValidate()
                    begin
                        UpdateControl();
                    end;
                }
                field("VAT Withheld Code"; Rec."VAT Withheld Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Withheld Code field.';
                }
                field("Calculate Retention"; Rec."Calculate Retention")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Calculate Retention field.';
                    trigger OnValidate()
                    begin
                        UpdateControl();
                    end;
                }
                field("VAT Code"; Rec."VAT Code")
                {
                    ApplicationArea = Basic;
                    Enabled = "VAT CodeEnable";
                    ToolTip = 'Specifies the value of the VAT Code field.';
                }
                field("Withholding Tax Code"; Rec."Withholding Tax Code")
                {
                    ApplicationArea = Basic;
                    Enabled = "Withholding Tax CodeEnable";
                    ToolTip = 'Specifies the value of the Withholding Tax Code field.';
                }
                field("Retention Code"; Rec."Retention Code")
                {
                    ApplicationArea = Basic;
                    Enabled = "Retention CodeEnable";
                    ToolTip = 'Specifies the value of the Retention Code field.';
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
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions { }

    trigger OnAfterGetRecord()
    begin
        //CurrPage."G/L AccountVisible":=("Account Type"="Account Type"::"G/L Account");
        OnAfterGetCurrRecord();
    end;

    trigger OnInit()
    begin
        "Retention CodeEnable" := true;
        "Withholding Tax CodeEnable" := true;
        "VAT CodeEnable" := true;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Type := Rec.Type::Payment;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Account Type" := Rec."Account Type"::None;
        OnAfterGetCurrRecord();
    end;

    trigger OnOpenPage()
    begin
        UpdateControl();
    end;

    var
        [InDataSet]
        "VAT CodeEnable": Boolean;
        [InDataSet]
        "Withholding Tax CodeEnable": Boolean;
        [InDataSet]
        "Retention CodeEnable": Boolean;


    procedure UpdateControl()
    begin
        if Rec."VAT Chargeable" = Rec."VAT Chargeable"::Yes then
            "VAT CodeEnable" := true
        else
            "VAT CodeEnable" := false;

        if Rec."Withholding Tax Chargeable" = Rec."Withholding Tax Chargeable"::Yes then
            "Withholding Tax CodeEnable" := true
        else
            "Withholding Tax CodeEnable" := false;

        if Rec."Calculate Retention" = Rec."Calculate Retention"::Yes then
            "Retention CodeEnable" := true

        else
            "Retention CodeEnable" := false;
    end;

    local procedure AccountTypeOnAfterValidate()
    begin
        //CurrPage."G/L Account".VISIBLE:=("Account Type"="Account Type"::"G/L Account");
    end;

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        UpdateControl();
    end;
}
