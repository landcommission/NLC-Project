#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50109 tableextension50109 extends "Sales Line"
{
    fields
    {
        field(39004350; "Indirect  Cost %"; Decimal)
        {
            Caption = 'Line Discount %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if Rec.AllowIndirectCost() = false then
                    Error('This donor doesnt allow indirect costs');
                TestJobPlanningLine1();
                Rec.TestStatusOpen();
                Rec."Indirect Cost Amount" :=
                  Round(
                    Round(Rec.Quantity * Rec."Unit Price", Currency."Amount Rounding Precision") *
                    Rec."Indirect  Cost %" / 100, Currency."Amount Rounding Precision");
                Rec."Inv. Discount Amount" := 0;
                Rec."Inv. Disc. Amount to Invoice" := 0;
                Rec.UpdateAmounts2();
            end;
        }
        field(39004351; "Indirect Cost Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Line Discount Amount';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if Rec.AllowIndirectCost() = false then
                    Error('This donor doesnt allow indirect costs');
                TestJobPlanningLine1();
                Rec.TestStatusOpen();
                Rec.TestField(Rec.Quantity);
                if xRec."Line Discount Amount" <> Rec."Line Discount Amount" then
                    if Round(Rec.Quantity * Rec."Unit Price", Currency."Amount Rounding Precision") <> 0 then
                        Rec."Indirect  Cost %" :=
                          Round(
                           Rec."Indirect Cost Amount" / Round(Rec.Quantity * Rec."Unit Price", Currency."Amount Rounding Precision") * 100,
                            0.00001)
                    else
                        Rec."Indirect  Cost %" := 0;
                Rec."Inv. Discount Amount" := 0;
                Rec."Inv. Disc. Amount to Invoice" := 0;
                Rec.UpdateAmounts2();
            end;
        }
        field(39004352; "G/L Entry"; Integer)
        {
            CalcFormula = count("G/L Entry" where(Paid = filter(false),
                                                   Amount = filter(> 0)));
            FieldClass = FlowField;
            Caption = 'G/L Entry';
            Editable = false;
            trigger OnLookup()
            begin
                //Check and insert any new g/l Entry first--------------------
                Rec.insertToGLEntrySelect();

                //Edit unpaid g/lEntries with this sales line
                objGLEntrySelect.Reset();
                objGLEntrySelect.SetRange(objGLEntrySelect.Paid, false);
                objGLEntrySelect.SetFilter(objGLEntrySelect.Amount, '>0');
                //objGLEntrySelect.SETRANGE(objGLEntrySelect."G/L Account No.","No.");
                if objGLEntrySelect.Find('-') then
                    repeat
                        objGLEntrySelect."Sales Line No." := Rec."Document No.";
                        objGLEntrySelect."Sales Line Line No." := Rec."Line No.";
                        objGLEntrySelect.Modify();
                    until objGLEntrySelect.Next() = 0;

                objGLEntrySelect.Reset();
                //objGLEntrySelect.SETRANGE(objGLEntrySelect."G/L Account No.","No.");
                objGLEntrySelect.SetRange(objGLEntrySelect.Paid, false);
                objGLEntrySelect.SetFilter(objGLEntrySelect.Amount, '>0');
                if objGLEntrySelect.Find('-') then
                    Page.Run(39005536, objGLEntrySelect);
            end;
        }
    }

    procedure AllowIndirectCost() AllowIndirectCost: Boolean
    begin
        AllowIndirectCost := false;
        objCust.Reset();
        objCust.SetRange(objCust."No.", Rec."Sell-to Customer No.");
        if objCust.Find('-') then
            if objCust."Allow Indirect Cost" = true then
                AllowIndirectCost := true;
    end;

    procedure UpdateAmounts2()
    var
        RemLineAmountToInvoice: Decimal;
    begin
        if CurrFieldNo <> Rec.FieldNo(Rec."Allow Invoice Disc.") then
            Rec.TestField(Rec.Type);
        Rec.GetSalesHeader();

        if Rec."Line Amount" <> xRec."Line Amount" then
            Rec."VAT Difference" := 0;
        if Rec."Line Amount" <> Round(Rec.Quantity * Rec."Unit Price", Currency."Amount Rounding Precision") + Rec."Indirect Cost Amount" then begin
            Rec."Line Amount" := Round(Rec.Quantity * Rec."Unit Price", Currency."Amount Rounding Precision") + Rec."Indirect Cost Amount";
            Rec."VAT Difference" := 0;
        end;
        Rec.UpdateVATAmounts();
        if not Rec."Prepayment Line" then begin
            if Rec."Prepayment %" <> 0 then begin
                if Rec.Quantity < 0 then
                    Rec.FieldError(Rec.Quantity, StrSubstNo(Text047, Rec.FieldCaption(Rec."Prepayment %")));
                if Rec."Unit Price" < 0 then
                    Rec.FieldError(Rec."Unit Price", StrSubstNo(Text047, Rec.FieldCaption(Rec."Prepayment %")));
            end;
            if SalesHeader."Document Type" <> SalesHeader."Document Type"::Invoice then begin
                Rec."Prepayment VAT Difference" := 0;
                if not PrePaymentLineAmountEntered then
                    Rec."Prepmt. Line Amount" := Round(Rec."Line Amount" * Rec."Prepayment %" / 100, Currency."Amount Rounding Precision");
                if Rec."Prepmt. Line Amount" < Rec."Prepmt. Amt. Inv." then
                    Rec.FieldError(Rec."Prepmt. Line Amount", StrSubstNo(Text049, Rec."Prepmt. Amt. Inv."));
                PrePaymentLineAmountEntered := false;
                if Rec."Prepmt. Line Amount" <> 0 then begin
                    RemLineAmountToInvoice :=
                      Round(Rec."Line Amount" * (Rec.Quantity - Rec."Quantity Invoiced") / Rec.Quantity, Currency."Amount Rounding Precision");
                    if RemLineAmountToInvoice < (Rec."Prepmt. Line Amount" - Rec."Prepmt Amt Deducted") then
                        Rec.FieldError(Rec."Prepmt. Line Amount", StrSubstNo(Text045, RemLineAmountToInvoice + Rec."Prepmt Amt Deducted"));
                end;
            end;
        end;
        Rec.InitOutstandingAmount();
        if (CurrFieldNo <> 0) and
           not ((Rec.Type = Rec.Type::Item) and (CurrFieldNo = Rec.FieldNo(Rec."No.")) and (Rec.Quantity <> 0) and
                // a write transaction may have been started
                (Rec."Qty. per Unit of Measure" <> xRec."Qty. per Unit of Measure")) and // ...continued condition
           (Rec."Document Type" <= Rec."Document Type"::Invoice) and
           ((Rec."Outstanding Amount" + Rec."Shipped Not Invoiced") > 0)
        then
            CustCheckCreditLimit.SalesLineCheck(Rec);

        if Rec.Type = Rec.Type::"Charge (Item)" then
            Rec.UpdateItemChargeAssgnt();

        Rec.CalcPrepaymentToDeduct();
    end;

    procedure insertToGLEntrySelect()
    begin
        objGLEntry.Reset();
        objGLEntry.SetFilter(objGLEntry.Amount, '>%1', 0);
        if objGLEntry.Find('-') then
            repeat
                objGLEntrySelect.Reset();
                objGLEntrySelect.SetRange(objGLEntrySelect."Entry No.", objGLEntry."Entry No.");
                if not objGLEntrySelect.Find('-') then begin
                    objGLEntrySelect.TransferFields(objGLEntry, true);
                    objGLEntrySelect.Insert(true);
                end;
            until objGLEntry.Next() = 0;
    end;

    var
        objCust: Record Customer;
        objGLEntry: Record "G/L Entry";
        objGLEntrySelect: Record "G/L Entry";
        Currency: Record Currency;
        Text045: Label 'cannot be more than %1';
        Text046: Label 'You cannot return more than the %1 units that you have shipped for %2 %3.';
        Text047: Label 'must be positive when %1 is not 0.';
        Text048: Label 'You cannot use item tracking on a %1 created from a %2.';
        Text049: Label 'cannot be %1.';
        Text051: Label 'You cannot use %1 in a %2.';
        SalesHeader: Record "Sales Header";
        CustCheckCreditLimit: Codeunit "Cust-Check Cr. Limit";

    local procedure TestJobPlanningLine1()
    var
        JobPostLine: Codeunit "Job Post-Line";

    begin

        if "Job Contract Entry No." = 0 then
            exit;

        JobPostLine.TestSalesLine(Rec);
    end;
}
