#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194022 "Cash Purchases Lines"
{
    PageType = ListPart;
    SourceTable = "Payment Line";
    ApplicationArea = All;
    Caption = 'Cash Purchases Lines';
    layout
    {
        area(Content)
        {
            repeater(Control1102760000)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                    trigger OnValidate()
                    begin
                        //check if the payment reference is for farmer purchase
                        if Rec."Payment Reference" = Rec."Payment Reference"::"Farmer Purchase" then
                            if Rec.Amount <> xRec.Amount then
                                Error('Amount cannot be modified');

                        Rec."Amount With VAT" := Rec.Amount;
                        if Rec."Account Type" in [Rec."Account Type"::Customer, Rec."Account Type"::Vendor,
                        Rec."Account Type"::"G/L Account", Rec."Account Type"::"Bank Account", Rec."Account Type"::"Fixed Asset"] then
                            case Rec."Account Type" of
                                Rec."Account Type"::"G/L Account":
                                    begin

                                        Rec.TestField(Rec.Amount);
                                        RecPayTypes.Reset();
                                        RecPayTypes.SetRange(RecPayTypes.Code, Rec.Type);
                                        RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Payment);
                                        if RecPayTypes.Find('-') then begin
                                            if RecPayTypes."VAT Chargeable" = RecPayTypes."VAT Chargeable"::Yes then begin
                                                RecPayTypes.TestField(RecPayTypes."VAT Code");
                                                TarriffCodes.Reset();
                                                TarriffCodes.SetRange(TarriffCodes.Code, RecPayTypes."VAT Code");
                                                if TarriffCodes.Find('-') then begin
                                                    Rec."VAT Amount" := (TarriffCodes.Percentage / 100) * Rec.Amount;
                                                    Rec."VAT Amount" := (Rec.Amount / ((TarriffCodes.Percentage + 100)) * TarriffCodes.Percentage);
                                                end;
                                            end
                                            else
                                                Rec."VAT Amount" := 0;

                                            if RecPayTypes."Withholding Tax Chargeable" = RecPayTypes."Withholding Tax Chargeable"::Yes then begin
                                                RecPayTypes.TestField(RecPayTypes."Withholding Tax Code");
                                                TarriffCodes.Reset();
                                                TarriffCodes.SetRange(TarriffCodes.Code, RecPayTypes."Withholding Tax Code");
                                                if TarriffCodes.Find('-') then begin
                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * Rec.Amount;
                                                    Rec."Withholding Tax Amount" := (Rec.Amount - Rec."VAT Amount") * (TarriffCodes.Percentage / 100);
                                                end;
                                            end
                                            else
                                                Rec."Withholding Tax Amount" := 0;
                                        end;
                                    end;
                                Rec."Account Type"::Customer:
                                    begin

                                        Rec.TestField(Rec.Amount);
                                        RecPayTypes.Reset();
                                        RecPayTypes.SetRange(RecPayTypes.Code, Rec.Type);
                                        RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Payment);
                                        if RecPayTypes.Find('-') then begin
                                            if RecPayTypes."VAT Chargeable" = RecPayTypes."VAT Chargeable"::Yes then begin
                                                Rec.TestField(Rec."VAT Code");
                                                TarriffCodes.Reset();
                                                TarriffCodes.SetRange(TarriffCodes.Code, Rec."VAT Code");
                                                if TarriffCodes.Find('-') then
                                                    //"VAT Amount":=(TarriffCodes.Percentage/100)*Amount;
                                                    Rec."VAT Amount" := (Rec.Amount / ((TarriffCodes.Percentage + 100)) * TarriffCodes.Percentage);
                                                //
                                            end
                                            else
                                                Rec."VAT Amount" := 0;

                                            if RecPayTypes."Withholding Tax Chargeable" = RecPayTypes."Withholding Tax Chargeable"::Yes then begin
                                                Rec.TestField(Rec."Withholding Tax Code");
                                                TarriffCodes.Reset();
                                                TarriffCodes.SetRange(TarriffCodes.Code, Rec."Withholding Tax Code");
                                                if TarriffCodes.Find('-') then begin
                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * Rec.Amount;

                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * (Rec.Amount - Rec."VAT Amount");

                                                end;
                                            end
                                            else
                                                Rec."Withholding Tax Amount" := 0;
                                        end;



                                    end;
                                Rec."Account Type"::Vendor:
                                    begin

                                        Rec.TestField(Rec.Amount);
                                        RecPayTypes.Reset();
                                        RecPayTypes.SetRange(RecPayTypes.Code, Rec.Type);
                                        RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Payment);
                                        if RecPayTypes.Find('-') then begin
                                            if RecPayTypes."VAT Chargeable" = RecPayTypes."VAT Chargeable"::Yes then begin
                                                Rec.TestField(Rec."VAT Code");
                                                TarriffCodes.Reset();
                                                TarriffCodes.SetRange(TarriffCodes.Code, Rec."VAT Code");
                                                if TarriffCodes.Find('-') then begin
                                                    Rec."VAT Amount" := (TarriffCodes.Percentage / 100) * Rec.Amount;
                                                    //
                                                    Rec."VAT Amount" := (Rec.Amount / ((TarriffCodes.Percentage + 100)) * TarriffCodes.Percentage);
                                                    //
                                                end;
                                            end
                                            else
                                                Rec."VAT Amount" := 0;

                                            if RecPayTypes."Withholding Tax Chargeable" = RecPayTypes."Withholding Tax Chargeable"::Yes then begin
                                                Rec.TestField(Rec."Withholding Tax Code");
                                                TarriffCodes.Reset();
                                                TarriffCodes.SetRange(TarriffCodes.Code, Rec."Withholding Tax Code");
                                                if TarriffCodes.Find('-') then begin
                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * Rec.Amount;
                                                    //
                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * (Rec.Amount - Rec."VAT Amount");
                                                    //
                                                end;
                                            end
                                            else
                                                Rec."Withholding Tax Amount" := 0;
                                        end;


                                    end;
                                Rec."Account Type"::"Bank Account":
                                    begin

                                        Rec.TestField(Rec.Amount);
                                        RecPayTypes.Reset();
                                        RecPayTypes.SetRange(RecPayTypes.Code, Rec.Type);
                                        RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Payment);
                                        if RecPayTypes.Find('-') then begin
                                            if RecPayTypes."VAT Chargeable" = RecPayTypes."VAT Chargeable"::Yes then begin
                                                RecPayTypes.TestField(RecPayTypes."VAT Code");
                                                TarriffCodes.Reset();
                                                TarriffCodes.SetRange(TarriffCodes.Code, RecPayTypes."VAT Code");
                                                if TarriffCodes.Find('-') then begin
                                                    //
                                                    Rec."VAT Amount" := (TarriffCodes.Percentage / 100) * Rec.Amount;
                                                    Rec."VAT Amount" := (Rec.Amount / ((TarriffCodes.Percentage + 100)) * TarriffCodes.Percentage);
                                                    //
                                                end;
                                            end
                                            else
                                                Rec."VAT Amount" := 0;

                                            if RecPayTypes."Withholding Tax Chargeable" = RecPayTypes."Withholding Tax Chargeable"::Yes then begin
                                                RecPayTypes.TestField(RecPayTypes."Withholding Tax Code");
                                                TarriffCodes.Reset();
                                                TarriffCodes.SetRange(TarriffCodes.Code, RecPayTypes."Withholding Tax Code");
                                                if TarriffCodes.Find('-') then begin
                                                    //
                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * Rec.Amount;
                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * (Rec.Amount - Rec."VAT Amount");
                                                    //
                                                end;
                                            end
                                            else
                                                Rec."Withholding Tax Amount" := 0;
                                        end;


                                    end;
                                Rec."Account Type"::"Fixed Asset":
                                    begin

                                        Rec.TestField(Rec.Amount);
                                        RecPayTypes.Reset();
                                        RecPayTypes.SetRange(RecPayTypes.Code, Rec.Type);
                                        RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Payment);
                                        if RecPayTypes.Find('-') then begin
                                            if RecPayTypes."VAT Chargeable" = RecPayTypes."VAT Chargeable"::Yes then begin
                                                RecPayTypes.TestField(RecPayTypes."VAT Code");
                                                TarriffCodes.Reset();
                                                TarriffCodes.SetRange(TarriffCodes.Code, RecPayTypes."VAT Code");
                                                if TarriffCodes.Find('-') then
                                                    //"VAT Amount":=(TarriffCodes.Percentage/100)*Amount;
                                                    Rec."VAT Amount" := (Rec.Amount / ((TarriffCodes.Percentage + 100)) * TarriffCodes.Percentage);
                                            end
                                            else
                                                Rec."VAT Amount" := 0;

                                            if RecPayTypes."Withholding Tax Chargeable" = RecPayTypes."Withholding Tax Chargeable"::Yes then begin
                                                RecPayTypes.TestField(RecPayTypes."Withholding Tax Code");
                                                TarriffCodes.Reset();
                                                TarriffCodes.SetRange(TarriffCodes.Code, RecPayTypes."Withholding Tax Code");
                                                if TarriffCodes.Find('-') then begin
                                                    //
                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * Rec.Amount;
                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * (Rec.Amount - Rec."VAT Amount");
                                                    //
                                                end;
                                            end
                                            else
                                                Rec."Withholding Tax Amount" := 0;
                                        end;


                                    end;
                            end;


                        Rec."Net Amount" := Rec.Amount - Rec."Withholding Tax Amount";
                        Rec.Validate(Rec."Net Amount");
                    end;
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Prod. Posting Group field.';
                }
                field("Vendor Bank Account"; Rec."Vendor Bank Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Bank Account field.';
                }
                field("VAT Rate"; Rec."VAT Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Rate field.';
                }
                field("Retention Code"; Rec."Retention Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retention Code field.';
                }
                field("Withholding Tax Code"; Rec."Withholding Tax Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Withholding Tax Code field.';
                    trigger OnValidate()
                    begin
                        TarriffCodes.Reset();
                        TarriffCodes.SetRange(TarriffCodes.Code, Rec."Withholding Tax Code");
                        if TarriffCodes.FindFirst() then
                            //    "Withholding Tax Amount":=(TarriffCodes.Percentage/100)*Amount;
                            Rec."Withholding Tax Amount" := (Rec."Amount With VAT" - Rec."VAT Amount") * (TarriffCodes.Percentage / 100)
                        else
                            Rec."Withholding Tax Amount" := 0;
                        Rec."Net Amount" := Rec.Amount - Rec."Withholding Tax Amount";
                    end;
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the VAT Amount field.';
                }
                field("Withholding Tax Amount"; Rec."Withholding Tax Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Withholding Tax Amount field.';
                }
                field("Retention  Amount"; Rec."Retention  Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retention  Amount field.';
                }
                field("Net Amount"; Rec."Net Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Net Amount field.';
                }
                field("Apply to ID"; Rec."Apply to ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Lookup = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Apply to ID field.';
                }
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applies-to Doc. Type field.';
                }
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applies-to Doc. No. field.';
                }
                field("Applies-to ID"; Rec."Applies-to ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applies-to ID field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Assign Document")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Document';
                Image = Add;
                RunObject = page "Change General Journal";
                RunPageLink = "Journal Template Name" = field(No);
                ToolTip = 'Executes the Assign Document action.';

            }
        }
    }

    var
        RecPayTypes: Record "Receipts and Payment Types";
        TarriffCodes: Record "Tariff Codes";
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        CashierLinks: Record "Cashier Link";
        LineNo: Integer;
        CustLedger: Record "Vendor Ledger Entry";
        CustLedger1: Record "Vendor Ledger Entry";
        Amt: Decimal;
        TotAmt: Decimal;
        ApplyInvoice: Codeunit "Purchase Header Apply";
        AppliedEntries: Record "Workplan Activities";
        VendEntries: Record "Vendor Ledger Entry";
        PInv: Record "Purch. Inv. Header";
        VATPaid: Decimal;
        VATToPay: Decimal;
        PInvLine: Record "Purch. Inv. Line";
        VATBase: Decimal;
}
