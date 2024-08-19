#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50126 pageextension50126 extends "Apply Customer Entries"
{

    //Unsupported feature: Property Modification (OptionString) on "CalcType(Variable 1029)".

    //var
    //>>>> ORIGINAL VALUE:
    //CalcType : Direct,GenJnlLine,SalesHeader,ServHeader;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CalcType : Direct,GenJnlLine,SalesHeader,ServHeader,Receipt;
    //Variable type has not been exported.

    var
        ReceiptLine: Record "Receipt Line";
        ReceiptHeader: Record "Receipts Header";
        GenJnlLineApply: Boolean;


    //Unsupported feature: Code Modification on "SetApplyingCustLedgEntry(PROCEDURE 9)".

    //procedure SetApplyingCustLedgEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CASE CalcType OF
      CalcType::SalesHeader:
        BEGIN
    #4..72
          ApplyingCustLedgEntry."Remaining Amount" := GenJnlLine.Amount;
          CalcApplnAmount;
        END;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..75
      //Receipts
      CalcType::Receipt:
        BEGIN
          ApplyingCustLedgEntry."Entry No." := 1;
          ApplyingCustLedgEntry."Posting Date" := ReceiptLine.Date;
          ApplyingCustLedgEntry."Document Type" := ApplyingCustLedgEntry."Document Type"::Invoice;
          ApplyingCustLedgEntry."Document No." := ReceiptLine.No;
          ApplyingCustLedgEntry."Customer No." := ReceiptLine."Account No.";
          ApplyingCustLedgEntry.Description := ReceiptLine."Account Name";
          ApplyingCustLedgEntry."Currency Code" := ReceiptLine."Currency Code";
          ApplyingCustLedgEntry.Amount := -ReceiptLine.Amount;
          ApplyingCustLedgEntry."Remaining Amount" := -ReceiptLine.Amount;
          CalcApplnAmount;

        END;

    END;
    */
    //end;


    //Unsupported feature: Code Modification on "CalcApplnAmount(PROCEDURE 4)".

    //procedure CalcApplnAmount();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    AppliedAmount := 0;
    PmtDiscAmount := 0;
    DifferentCurrenciesInAppln := FALSE;
    #4..123
              END;
          END;
        END;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..126

     //Receipts
      CalcType::Receipt:
        BEGIN
          FindAmountRounding;

          CASE ApplnType OF
            ApplnType::"Applies-to Doc. No.":
              BEGIN
                AppliedCustLedgEntry := Rec;
                WITH AppliedCustLedgEntry DO BEGIN
                  CALCFIELDS("Remaining Amount");

                  IF "Currency Code" <> ApplnCurrencyCode THEN
                    "Remaining Amount" :=
                      CurrExchRate.ExchangeAmtFCYToFCY(
                        ApplnDate,"Currency Code",ApplnCurrencyCode,"Remaining Amount");

                  AppliedAmount := ROUND("Remaining Amount",AmountRoundingPrecision);

                  IF NOT DifferentCurrenciesInAppln THEN
                    DifferentCurrenciesInAppln := ApplnCurrencyCode <> "Currency Code";

                END;
                CheckRounding;
              END;

            ApplnType::"Applies-to ID":
              BEGIN
                AppliedCustLedgEntry.SETCURRENTKEY("Customer No.",Open,Positive);
                AppliedCustLedgEntry.SETRANGE("Customer No.",ReceiptLine."Account No.");

                AppliedCustLedgEntry.SETRANGE(Open,TRUE);
                AppliedCustLedgEntry.SETRANGE("Applies-to ID",ReceiptLine."Applies-to ID");

                HandlChosenEntries(2,
                  GenJnlLine.Amount,
                  GenJnlLine."Currency Code",
                  GenJnlLine."Posting Date");

              END;
          END;
        END;

     //Receipts

    END;
    */
    //end;

    procedure SetReceipts(NewReceiptLine: Record "Receipt Line"; var NewCustLedgEntry: Record "Cust. Ledger Entry"; ApplnTypeSelect: Integer)
    var
        TotalAdjCostLCY: Decimal;
    begin
        ReceiptLine := NewReceiptLine;
        Rec.CopyFilters(NewCustLedgEntry);
        ApplyingAmount := -ReceiptLine.Amount;

        ReceiptHeader.Reset();
        ReceiptHeader.SetRange(ReceiptHeader."No.", NewReceiptLine.No);
        if ReceiptHeader.Find('-') then begin
            ApplnDate := ReceiptHeader.Date;
            ApplnCurrencyCode := ReceiptHeader."Currency Code";
            CalcType := CalcType::Receipt;
        end;
        case ApplnTypeSelect of
            ReceiptLine.FieldNo("Applies-to Doc. No."):
                ApplnType := ApplnType::"Applies-to Doc. No.";
            ReceiptLine.FieldNo("Applies-to ID"):
                ApplnType := ApplnType::"Applies-to ID";
        end;

        SetApplyingCustLedgEntry();
    end;
}
