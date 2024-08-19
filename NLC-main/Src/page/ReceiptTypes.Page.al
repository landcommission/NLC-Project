#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193626 "Receipt Types"
{
    PageType = Card;
    SourceTable = "Receipts and Payment Types";
    SourceTableView = where(Type = const(Receipt));
    ApplicationArea = All;
    Caption = 'Receipt Types';
    layout
    {
        area(Content)
        {
            group(Control1)
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
                        //check the account type selected by the user
                        case Rec."Account Type" of
                            Rec."Account Type"::Customer:

                                CustomerPaymentOnAccountVisibl := true;
                            Rec."Account Type"::Vendor,
                            Rec."Account Type"::"Bank Account",
                            Rec."Account Type"::"Fixed Asset",
                            Rec."Account Type"::"G/L Account":

                                CustomerPaymentOnAccountVisibl := false;
                        end;
                    end;
                }
                field("Customer Payment On Account"; Rec."Customer Payment On Account")
                {
                    ApplicationArea = Basic;
                    Visible = CustomerPaymentOnAccountVisibl;
                    ToolTip = 'Specifies the value of the Customer Payment On Account field.';
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
                field("Transation Remarks"; Rec."Transation Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transation Remarks field.';
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
        OnAfterGetCurrRecord();
    end;

    trigger OnInit()
    begin
        CustomerPaymentOnAccountVisibl := true;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Type := Rec.Type::Receipt;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        OnAfterGetCurrRecord();
    end;

    var
        [InDataSet]
        CustomerPaymentOnAccountVisibl: Boolean;

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        //check the account type selected by the user
        case Rec."Account Type" of
            Rec."Account Type"::Customer:

                CustomerPaymentOnAccountVisibl := true;
            Rec."Account Type"::Vendor,
            Rec."Account Type"::"Bank Account",
            Rec."Account Type"::"Fixed Asset",
            Rec."Account Type"::"G/L Account":

                CustomerPaymentOnAccountVisibl := false;
        end;
    end;
}
