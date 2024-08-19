#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193635 "Imprest Surrender Details"
{
    Caption = ' Travel Imprest  Surrender Details';
    PageType = ListPart;
    SourceTable = "Imprest Surrender Details";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1102758000)
            {
                field("Account No:"; Rec."Account No:")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account No: field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Actual Spent"; Rec."Actual Spent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Spent field.';
                }
                field("Cash Receipt No"; Rec."Cash Receipt No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cash Receipt No field.';
                }
                field("Cash Receipt Amount"; Rec."Cash Receipt Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cash Receipt Amount field.';
                }
                field("Imprest Holder"; Rec."Imprest Holder")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Imprest Holder field.';
                }
                field("Apply to"; Rec."Apply to")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Apply to field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec."Apply to" := '';
                        Rec."Apply to ID" := '';

                        //Amt:=0;

                        Custledger.Reset();
                        Custledger.SetCurrentKey(Custledger."Customer No.", Open, "Document No.");
                        Custledger.SetRange(Custledger."Customer No.", Rec."Imprest Holder");
                        Custledger.SetRange(Open, true);
                        //CustLedger.SETRANGE(CustLedger."Transaction Type",CustLedger."Transaction Type"::"Down Payment");
                        Custledger.CalcFields(Custledger.Amount);
                        if Page.RunModal(Page::"Customer Ledger Entries", Custledger) = Action::LookupOK then
                            if Custledger."Applies-to ID" <> '' then begin
                                Custledger1.Reset();
                                Custledger1.SetCurrentKey(Custledger1."Customer No.", Open, "Applies-to ID");
                                Custledger1.SetRange(Custledger1."Customer No.", Rec."Imprest Holder");
                                Custledger1.SetRange(Open, true);
                                //CustLedger1.SETRANGE("Transaction Type",CustLedger1."Transaction Type"::"Down Payment");
                                Custledger1.SetRange("Applies-to ID", Custledger."Applies-to ID");
                                if Custledger1.Find('-') then
                                    repeat
                                        Custledger1.CalcFields(Custledger1.Amount);
                                        Amt := Amt + Abs(Custledger1.Amount);
                                    until Custledger1.Next() = 0;

                                if Amt <> Amt then
                                    //ERROR('Amount is not equal to the amount applied on the application form');
                                    /*Amount:=Amt;
                                    VALIDATE(Amount);*/
                           Rec."Apply to" := Custledger."Document No.";
                                Rec."Apply to ID" := Custledger."Applies-to ID";
                            end else begin
                                if Rec.Amount <> Abs(Custledger.Amount) then
                                    Custledger.CalcFields(Custledger."Remaining Amount");

                                /*Amount:=ABS(CustLedger."Remaining Amount");
                                 VALIDATE(Amount);*/
                                //ERROR('Amount is not equal to the amount applied on the application form');

                                Rec."Apply to" := Custledger."Document No.";
                                Rec."Apply to ID" := Custledger."Applies-to ID";

                            end;

                        if Rec."Apply to ID" <> '' then
                            Rec."Apply to" := '';

                        Rec.Validate(Rec.Amount);

                    end;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
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
        Custledger: Record "Cust. Ledger Entry";
        Custledger1: Record "Cust. Ledger Entry";
        Amt: Decimal;
        ShortcutDimCode: array[8] of Code[20];
}
