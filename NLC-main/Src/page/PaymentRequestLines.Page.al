#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193687 "Payment Request Lines"
{
    PageType = ListPart;
    SourceTable = "Payment Line";
    ApplicationArea = All;
    Caption = 'Payment Request Lines';
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
                    Editable = true;
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
                field("Invoice No."; Rec."Invoice No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invoice No. field.';
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
                        /*IF "Account Type" IN ["Account Type"::Customer,"Account Type"::Vendor,
                        "Account Type"::"G/L Account","Account Type"::"Bank Account","Account Type"::"Fixed Asset"] THEN

                        CASE "Account Type" OF
                          "Account Type"::"G/L Account":
                            BEGIN

                        TESTFIELD(Amount);
                        RecPayTypes.RESET;
                        RecPayTypes.SETRANGE(RecPayTypes.Code,Type);
                        RecPayTypes.SETRANGE(RecPayTypes.Type,RecPayTypes.Type::Payment);
                        IF RecPayTypes.FIND('-') THEN BEGIN
                        IF RecPayTypes."VAT Chargeable"=RecPayTypes."VAT Chargeable"::Yes THEN
                          BEGIN
                            RecPayTypes.TESTFIELD(RecPayTypes."VAT Code");
                            TarriffCodes.RESET;
                            TarriffCodes.SETRANGE(TarriffCodes.Code,RecPayTypes."VAT Code");
                            IF TarriffCodes.FIND('-') THEN
                              BEGIN
                                "VAT Amount":=(TarriffCodes.Percentage/100)*Amount;
                                "VAT Amount":=(Amount/((TarriffCodes.Percentage+100))*TarriffCodes.Percentage);
                              END;
                          END
                        ELSE
                          BEGIN
                            "VAT Amount":=0;
                          END;

                        IF RecPayTypes."Withholding Tax Chargeable"=RecPayTypes."Withholding Tax Chargeable"::Yes THEN
                          BEGIN
                            RecPayTypes.TESTFIELD(RecPayTypes."Withholding Tax Code");
                            TarriffCodes.RESET;
                            TarriffCodes.SETRANGE(TarriffCodes.Code,RecPayTypes."Withholding Tax Code");
                            IF TarriffCodes.FIND('-') THEN
                              BEGIN
                                "Withholding Tax Amount":=(TarriffCodes.Percentage/100)*Amount;
                                "Withholding Tax Amount":=(Amount-"VAT Amount")*(TarriffCodes.Percentage/100);
                              END;
                          END
                        ELSE
                          BEGIN
                            "Withholding Tax Amount":=0;
                          END;
                        END;
                        END;
                          "Account Type"::Customer:
                            BEGIN

                        TESTFIELD(Amount);
                        RecPayTypes.RESET;
                        RecPayTypes.SETRANGE(RecPayTypes.Code,Type);
                        RecPayTypes.SETRANGE(RecPayTypes.Type,RecPayTypes.Type::Payment);
                        IF RecPayTypes.FIND('-') THEN BEGIN
                        IF RecPayTypes."VAT Chargeable"=RecPayTypes."VAT Chargeable"::Yes THEN BEGIN
                        TESTFIELD("VAT Code");
                        TarriffCodes.RESET;
                        TarriffCodes.SETRANGE(TarriffCodes.Code,"VAT Code");
                        IF TarriffCodes.FIND('-') THEN BEGIN
                        //"VAT Amount":=(TarriffCodes.Percentage/100)*Amount;
                        "VAT Amount":=(Amount/((TarriffCodes.Percentage+100))*TarriffCodes.Percentage);
                        //
                        END;
                        END
                        ELSE BEGIN
                        "VAT Amount":=0;
                        END;

                        IF RecPayTypes."Withholding Tax Chargeable"=RecPayTypes."Withholding Tax Chargeable"::Yes THEN BEGIN
                        TESTFIELD("Withholding Tax Code");
                        TarriffCodes.RESET;
                        TarriffCodes.SETRANGE(TarriffCodes.Code,"Withholding Tax Code");
                        IF TarriffCodes.FIND('-') THEN BEGIN
                        "Withholding Tax Amount":=(TarriffCodes.Percentage/100)*Amount;

                        "Withholding Tax Amount":=(TarriffCodes.Percentage/100)*(Amount-"VAT Amount");

                        END;
                        END
                        ELSE BEGIN
                        "Withholding Tax Amount":=0;
                        END;
                        END;



                            END;
                          "Account Type"::Vendor:
                            BEGIN

                        TESTFIELD(Amount);
                        RecPayTypes.RESET;
                        RecPayTypes.SETRANGE(RecPayTypes.Code,Type);
                        RecPayTypes.SETRANGE(RecPayTypes.Type,RecPayTypes.Type::Payment);
                        IF RecPayTypes.FIND('-') THEN BEGIN
                        IF RecPayTypes."VAT Chargeable"=RecPayTypes."VAT Chargeable"::Yes THEN BEGIN
                        TESTFIELD("VAT Code");
                        TarriffCodes.RESET;
                        TarriffCodes.SETRANGE(TarriffCodes.Code,"VAT Code");
                        IF TarriffCodes.FIND('-') THEN BEGIN
                        "VAT Amount":=(TarriffCodes.Percentage/100)*Amount;
                        //
                        "VAT Amount":=(Amount/((TarriffCodes.Percentage+100))*TarriffCodes.Percentage);
                        //
                        END;
                        END
                        ELSE BEGIN
                        "VAT Amount":=0;
                        END;

                        IF RecPayTypes."Withholding Tax Chargeable"=RecPayTypes."Withholding Tax Chargeable"::Yes THEN BEGIN
                        TESTFIELD("Withholding Tax Code");
                        TarriffCodes.RESET;
                        TarriffCodes.SETRANGE(TarriffCodes.Code,"Withholding Tax Code");
                        IF TarriffCodes.FIND('-') THEN BEGIN
                        "Withholding Tax Amount":=(TarriffCodes.Percentage/100)*Amount;
                        //
                        "Withholding Tax Amount":=(TarriffCodes.Percentage/100)*(Amount-"VAT Amount");
                        //
                        END;
                        END
                        ELSE BEGIN
                        "Withholding Tax Amount":=0;
                        END;
                        END;


                            END;
                          "Account Type"::"Bank Account":
                            BEGIN

                        TESTFIELD(Amount);
                        RecPayTypes.RESET;
                        RecPayTypes.SETRANGE(RecPayTypes.Code,Type);
                        RecPayTypes.SETRANGE(RecPayTypes.Type,RecPayTypes.Type::Payment);
                        IF RecPayTypes.FIND('-') THEN BEGIN
                        IF RecPayTypes."VAT Chargeable"=RecPayTypes."VAT Chargeable"::Yes THEN BEGIN
                        RecPayTypes.TESTFIELD(RecPayTypes."VAT Code");
                        TarriffCodes.RESET;
                        TarriffCodes.SETRANGE(TarriffCodes.Code,RecPayTypes."VAT Code");
                        IF TarriffCodes.FIND('-') THEN BEGIN
                        //
                        "VAT Amount":=(TarriffCodes.Percentage/100)*Amount;
                        "VAT Amount":=(Amount/((TarriffCodes.Percentage+100))*TarriffCodes.Percentage);
                        //
                        END;
                        END
                        ELSE BEGIN
                        "VAT Amount":=0;
                        END;

                        IF RecPayTypes."Withholding Tax Chargeable"=RecPayTypes."Withholding Tax Chargeable"::Yes THEN BEGIN
                        RecPayTypes.TESTFIELD(RecPayTypes."Withholding Tax Code");
                        TarriffCodes.RESET;
                        TarriffCodes.SETRANGE(TarriffCodes.Code,RecPayTypes."Withholding Tax Code");
                        IF TarriffCodes.FIND('-') THEN BEGIN
                        //
                        "Withholding Tax Amount":=(TarriffCodes.Percentage/100)*Amount;
                        "Withholding Tax Amount":=(TarriffCodes.Percentage/100)*(Amount-"VAT Amount");
                        //
                        END;
                        END
                        ELSE BEGIN
                        "Withholding Tax Amount":=0;
                        END;
                        END;


                            END;
                          "Account Type"::"Fixed Asset":
                            BEGIN

                        TESTFIELD(Amount);
                        RecPayTypes.RESET;
                        RecPayTypes.SETRANGE(RecPayTypes.Code,Type);
                        RecPayTypes.SETRANGE(RecPayTypes.Type,RecPayTypes.Type::Payment);
                        IF RecPayTypes.FIND('-') THEN BEGIN
                        IF RecPayTypes."VAT Chargeable"=RecPayTypes."VAT Chargeable"::Yes THEN BEGIN
                        RecPayTypes.TESTFIELD(RecPayTypes."VAT Code");
                        TarriffCodes.RESET;
                        TarriffCodes.SETRANGE(TarriffCodes.Code,RecPayTypes."VAT Code");
                        IF TarriffCodes.FIND('-') THEN BEGIN
                        //"VAT Amount":=(TarriffCodes.Percentage/100)*Amount;
                        "VAT Amount":=(Amount/((TarriffCodes.Percentage+100))*TarriffCodes.Percentage);
                        END;
                        END
                        ELSE BEGIN
                        "VAT Amount":=0;
                        END;

                        IF RecPayTypes."Withholding Tax Chargeable"=RecPayTypes."Withholding Tax Chargeable"::Yes THEN BEGIN
                        RecPayTypes.TESTFIELD(RecPayTypes."Withholding Tax Code");
                        TarriffCodes.RESET;
                        TarriffCodes.SETRANGE(TarriffCodes.Code,RecPayTypes."Withholding Tax Code");
                        IF TarriffCodes.FIND('-') THEN BEGIN
                        //
                        "Withholding Tax Amount":=(TarriffCodes.Percentage/100)*Amount;
                        "Withholding Tax Amount":=(TarriffCodes.Percentage/100)*(Amount-"VAT Amount");
                        //
                        END;
                        END
                        ELSE BEGIN
                        "Withholding Tax Amount":=0;
                        END;
                        END;


                            END;
                        END;


                        "Net Amount":=Amount-"Withholding Tax Amount";
                        VALIDATE("Net Amount");
                        */

                    end;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
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
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
            }
        }
    }

    actions { }

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

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
        ShortcutDimCode: array[8] of Code[20];
}
