#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50127 pageextension50127 extends "Apply Vendor Entries"
{

    //Unsupported feature: Property Modification (OptionString) on "CalcType(Variable 1027)".

    //var
    //>>>> ORIGINAL VALUE:
    //CalcType : Direct,GenJnlLine,PurchHeader;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CalcType : Direct,GenJnlLine,PurchHeader,PV;
    //Variable type has not been exported.

    var
        PVLine: Record "Payment Line";


    //Unsupported feature: Code Modification on "SetApplyingVendLedgEntry(PROCEDURE 9)".

    //procedure SetApplyingVendLedgEntry();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CASE CalcType OF
      CalcType::PurchHeader:
        BEGIN
    #4..52
          ApplyingVendLedgEntry."Remaining Amount" := GenJnlLine.Amount;
          CalcApplnAmount;
        END;
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..55

      //Added for PV
      CalcType::PV :
        BEGIN
          ApplyingVendLedgEntry."Posting Date" :=PVLine.Date ;
          ApplyingVendLedgEntry."Document Type" :=ApplyingVendLedgEntry."Document Type"::Payment;
          ApplyingVendLedgEntry."Document No." := PVLine.No;
          ApplyingVendLedgEntry."Vendor No." :=PVLine."Account No.";
          ApplyingVendLedgEntry.Description := PVLine."Account Name";
          ApplyingVendLedgEntry."Currency Code" := PVLine."Currency Code";
          ApplyingVendLedgEntry.Amount := PVLine.Amount;
          ApplyingVendLedgEntry."Remaining Amount" := -PVLine.Amount;
          CalcApplnAmount;
        END;

    END;
    */
    //end;


    //Unsupported feature: Code Modification on "SetVendApplId(PROCEDURE 10)".

    //procedure SetVendApplId();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF (CalcType = CalcType::GenJnlLine) AND (ApplyingVendLedgEntry."Posting Date" < "Posting Date") THEN
      ERROR(
        EarlierPostingDateErr,ApplyingVendLedgEntry."Document Type",ApplyingVendLedgEntry."Document No.",
    #4..11
    IF GenJnlLineApply THEN
      VendEntrySetApplID.SetApplId(VendLedgEntry,ApplyingVendLedgEntry,GenJnlLine."Applies-to ID")
    ELSE
      VendEntrySetApplID.SetApplId(VendLedgEntry,ApplyingVendLedgEntry,PurchHeader."Applies-to ID");

    ActionPerformed := VendLedgEntry."Applies-to ID" <> '';
    CalcApplnAmount;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..14

    //Added for PV
    IF CalcType = CalcType::PV THEN
      VendEntrySetApplID.SetApplId(VendLedgEntry,ApplyingVendLedgEntry,PVLine."Applies-to ID")
    ELSE //Added for PV
    #15..18
    */
    //end;


    //Unsupported feature: Code Modification on "CalcApplnAmount(PROCEDURE 7)".

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
        //PV
      CalcType::PV:
        BEGIN
          FindAmountRounding;

          CASE ApplnType OF
            ApplnType::"Applies-to Doc. No." :
              BEGIN
                AppliedVendLedgEntry := Rec;
                WITH AppliedVendLedgEntry DO BEGIN
                  CALCFIELDS("Remaining Amount");

                  IF "Currency Code" <> ApplnCurrencyCode THEN
                    "Remaining Amount" :=
                      CurrExchRate.ExchangeAmtFCYToFCY(
                        ApplnDate,"Currency Code",ApplnCurrencyCode,"Remaining Amount");

                  AppliedAmount := AppliedAmount + ROUND("Remaining Amount",AmountRoundingPrecision);

                  IF NOT DifferentCurrenciesInAppln THEN
                    DifferentCurrenciesInAppln:= ApplnCurrencyCode <> "Currency Code";

                END;
                CheckRounding;
              END;

            ApplnType::"Applies-to ID" :
              BEGIN
                WITH VendLedgEntry DO BEGIN
                  AppliedVendLedgEntry.SETCURRENTKEY("Vendor No.",Open,Positive);
                  AppliedVendLedgEntry.SETRANGE("Vendor No.",PVLine."Account No.");
                  AppliedVendLedgEntry.SETRANGE(Open,TRUE);
                  AppliedVendLedgEntry.SETRANGE("Applies-to ID",PVLine."Applies-to ID");

                  {HandlChosenEntries(2,
                    GenJnlLine.Amount,
                    GenJnlLine."Currency Code",
                    GenJnlLine."Posting Date");}
                  HandlChosenEntries(2,
                    PVLine.Amount,
                    PVLine."Currency Code",
                    PVLine.Date);

                END;
              END;
          END;
        END;

        //PV

    END;
    */
    //end;

    procedure "SetPVLine-Delete"(NewPVLine: Record "Payment Line"; ApplnTypeSelect: Integer)
    var
        PaymentHeader: Record "Payments Header";
    begin

        PVLine := NewPVLine;

        if PVLine."Account Type" = PVLine."Account Type"::Vendor then
            ApplyingAmount := PVLine.Amount;
        //IF GenJnlLine."Bal. Account Type" = GenJnlLine."Bal. Account Type"::Vendor THEN
        ApplyingAmount := PVLine.Amount;
        //Get Payments Header
        PaymentHeader.Reset();
        PaymentHeader.SetRange(PaymentHeader."No.", NewPVLine.No);
        if PaymentHeader.Find('-') then begin
            ApplnDate := PaymentHeader.Date;
            ApplnCurrencyCode := PaymentHeader."Currency Code";
            CalcType := CalcType::PV;
        end;
        case ApplnTypeSelect of
            NewPVLine.FieldNo("Applies-to Doc. No."):
                ApplnType := ApplnType::"Applies-to Doc. No.";
            NewPVLine.FieldNo("Applies-to ID"):
                ApplnType := ApplnType::"Applies-to ID";
        end;

        SetApplyingVendLedgEntry();
    end;

    procedure SetPVLine(NewPVLine: Record "Payment Line"; var NewVendLedgEntry: Record "Vendor Ledger Entry"; ApplnTypeSelect: Integer)
    var
        PaymentHeader: Record "Payments Header";
    begin
        PVLine := NewPVLine;
        Rec.CopyFilters(NewVendLedgEntry);

        ApplyingAmount := PVLine.Amount;

        PaymentHeader.Reset();
        PaymentHeader.SetRange(PaymentHeader."No.", NewPVLine.No);

        if PaymentHeader.Find('-') then begin
            ApplnDate := PaymentHeader.Date;
            ApplnCurrencyCode := PaymentHeader."Currency Code";
            CalcType := CalcType::PV;
        end;

        case ApplnTypeSelect of
            NewPVLine.FieldNo("Applies-to Doc. No."):
                ApplnType := ApplnType::"Applies-to Doc. No.";
            NewPVLine.FieldNo("Applies-to ID"):
                ApplnType := ApplnType::"Applies-to ID";
        end;

        SetApplyingVendLedgEntry();
    end;
}
