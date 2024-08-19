#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
codeunit 52193439 "Job Create-PO 1"
{


    var
        Currency: Record Currency;
        SalesHeader: Record "Purchase Header";
        SalesHeader2: Record "Purchase Header";
        SalesLine: Record "Purchase Line";
        TempJobPlanningLine: Record "HR Leave Periods" temporary;
        Text000: Label 'The lines were successfully transferred to an Order.';
        Text001: Label 'The lines were not transferred to an Order.';
        Text002: Label 'There were no lines to transfer.';
        Text003: Label '%1 %2 = %3 " for %4 were successfully transferred to invoice %5.';
        Text004: Label 'You must specify Order No. or New Order.';
        Text005: Label 'You must specify Credit Memo No. or New Order.';
        Text007: Label 'You must specify %1.';
        TransferExtendedText: Codeunit "Transfer Extended Text";
        JobInvCurrency: Boolean;
        UpdateExchangeRates: Boolean;
        Text008: Label 'The lines were successfully transferred to a credit memo.';
        Text009: Label 'The selected planning lines must have the same %1.';
        Text010: Label 'The currency dates on all planning lines will be updated based on the invoice posting date because there is a difference in currency exchange rates. Recalculations will be based on the Exch. Calculation setup for the Cost and Price values for the job. Do you want to continue?';


    procedure CreateSalesInvoice(var JobPlanningLine: Record "HR Leave Periods"; CrMemo: Boolean)
    var
        SalesHeader: Record "Purchase Header";
        JT: Record "HR Leave Journal Template";
        GetSalesInvoiceNo: Report "Job Transfer to Sales Invoice";
        GetSalesCrMemoNo: Report "Job Transfer to Credit Memo";
        Done: Boolean;
        NewInvoice: Boolean;
        PostingDate: Date;
        InvoiceNo: Code[20];
    begin
        ////JT.GET(JobPlanningLine."Period Description",JobPlanningLine."Grant Task No.");
        if not CrMemo then begin
            GetSalesInvoiceNo.SetCustomer(JobPlanningLine."Period Description");
            GetSalesInvoiceNo.RunModal();
            GetSalesInvoiceNo.GetInvoiceNo(Done, NewInvoice, PostingDate, InvoiceNo);
        end else begin
            GetSalesCrMemoNo.SetCustomer(JobPlanningLine."Period Description");
            GetSalesCrMemoNo.RunModal();
            GetSalesCrMemoNo.GetCreditMemoNo(Done, NewInvoice, PostingDate, InvoiceNo);
        end;

        if Done then begin
            if (PostingDate = 0D) and NewInvoice then
                Error(Text007, SalesHeader.FieldCaption("Posting Date"));
            if (InvoiceNo = '') and not NewInvoice then begin
                if CrMemo then
                    Error(Text005);
                Error(Text004);
            end;
            CreateSalesInvoiceLines(
              JobPlanningLine."Period Description", JobPlanningLine, InvoiceNo, NewInvoice, PostingDate, CrMemo);
        end;
    end;


    procedure CreateSalesInvoiceLines(JobNo: Code[20]; var JobPlanningLine: Record "HR Leave Periods"; InvoiceNo: Code[20]; NewInvoice: Boolean; PostingDate: Date; CreditMemo: Boolean)
    var
        Cust: Record Customer;
        Job: Record "HR Employee Qualifications";
        LineCounter: Integer;
    begin
        /*{
        CLEARALL;
        Job.GET(JobNo);
        IF Job.Blocked = Job.Blocked::"2" THEN
          Job.TestBlocked;
        IF Job."Currency Code" = '' THEN
          JobInvCurrency := Job."Invoice Currency Code" <> '';
        Job.TESTFIELD(Job."To Date");
        Cust.GET(Job."To Date");
        IF CreditMemo THEN
          SalesHeader2."Document Type" := SalesHeader2."Document Type"::"Credit Memo"
        ELSE
          SalesHeader2."Document Type" := SalesHeader2."Document Type"::Order;

        IF NOT NewInvoice THEN
          SalesHeader.GET(SalesHeader2."Document Type",InvoiceNo);

        IF JobPlanningLine.FIND('-') THEN
          REPEAT
            IF JobPlanningLine."Contract Line" AND NOT JobPlanningLine.Transferred THEN BEGIN
              LineCounter := LineCounter + 1;
              IF JobPlanningLine."Period Description" <> JobNo THEN
                ERROR(Text009,JobPlanningLine.FIELDCAPTION("Period Description"));
              IF NewInvoice THEN
                TestExchangeRate(JobPlanningLine,PostingDate)
              ELSE
                TestExchangeRate(JobPlanningLine,SalesHeader."Posting Date");
            END;
          UNTIL JobPlanningLine.NEXT = 0;
        IF LineCounter = 0 THEN
          ERROR(Text002);
        IF NewInvoice THEN
          CreateSalesheader(Job,PostingDate)
        ELSE
          TestSalesHeader(SalesHeader,Job);
        IF JobPlanningLine.FIND('-') THEN
          REPEAT
            IF JobPlanningLine."Contract Line" AND NOT JobPlanningLine.Transferred THEN BEGIN
              IF JobPlanningLine."Date Locked" IN [JobPlanningLine."Date Locked"::"0",JobPlanningLine."Date Locked"::"1",
                JobPlanningLine."Date Locked"::"2"] THEN
                  JobPlanningLine.TESTFIELD("No.");
              CreateSalesLine(JobPlanningLine);
              IF SalesHeader2."Document Type" = SalesHeader2."Document Type":: Order THEN BEGIN
               // JobPlanningLine."Invoice Type" := JobPlanningLine."Invoice Type"::Order;
                JobPlanningLine."Invoice No." := SalesHeader."No.";
              END;
              IF SalesHeader2."Document Type" = SalesHeader2."Document Type":: "Credit Memo" THEN BEGIN
                JobPlanningLine."Invoice Type" := JobPlanningLine."Invoice Type"::"2";
                JobPlanningLine."Invoice No." := SalesHeader."No.";
              END;
              JobPlanningLine.Transferred := TRUE;
              JobPlanningLine."Transferred Date" := PostingDate;
              JobPlanningLine.MODIFY;
            END;
          UNTIL JobPlanningLine.NEXT = 0;
        COMMIT;
        IF CreditMemo THEN
          MESSAGE(Text008)
        ELSE
          MESSAGE(Text000);
         }*/

    end;


    procedure DeleteSalesInvoiceBuffer()
    begin
        ClearAll();
        TempJobPlanningLine.DeleteAll();
    end;


    procedure CreateSalesInvoiceJT(var JT2: Record "HR Leave Journal Template"; PostingDate: Date; InvoicePerTask: Boolean; var NoOfInvoices: Integer; var OldJobNo: Code[20]; var OldJTNo: Code[20]; LastJobTask: Boolean)
    var
        Cust: Record Vendor;
        Job: Record "HR Employee Qualifications";
        JT: Record "HR Leave Journal Template";
        JobPlanningLine: Record "HR Leave Periods";
    begin
        /*{
        CLEARALL;
        IF NOT LastJobTask THEN BEGIN
          JT := JT2;
          IF JT.Name = '' THEN
            EXIT;
          IF JT.Description = '' THEN
            EXIT;
          JT.FIND;
          IF JT."Grant Task Type" <> JT."Grant Task Type"::"0" THEN
            EXIT;
          Job.GET(JT.Name);
        END;
        IF LastJobTask THEN BEGIN
          IF NOT TempJobPlanningLine.FIND('-') THEN
            EXIT;
          Job.GET(TempJobPlanningLine."Period Description");
          JT.GET(TempJobPlanningLine."Period Description",TempJobPlanningLine."Grant Task No.");
        END;
        Job.TESTFIELD(Job."To Date");
        IF Job.Blocked = Job.Blocked::"2" THEN
          Job.TestBlocked;
        IF Job."Currency Code" = '' THEN
          JobInvCurrency := Job."Invoice Currency Code" <> '';
        Cust.GET(Job."To Date");

        IF CreateNewInvoice(JT,InvoicePerTask,OldJobNo,OldJTNo,LastJobTask) THEN BEGIN
          Job.GET(TempJobPlanningLine."Period Description");
          JT.GET(TempJobPlanningLine."Period Description",TempJobPlanningLine."Grant Task No.");
          IF Job."Currency Code" = '' THEN
            JobInvCurrency := Job."Invoice Currency Code" <> '';
          Cust.GET(Job."To Date");
          NoOfInvoices := NoOfInvoices + 1;
          SalesHeader2."Document Type" := SalesHeader2."Document Type"::Order;
          CreateSalesheader(Job,PostingDate);
          IF TempJobPlanningLine.FIND('-') THEN
            REPEAT
              JobPlanningLine := TempJobPlanningLine;
              JobPlanningLine.FIND;
              IF JobPlanningLine."Date Locked" IN [JobPlanningLine."Date Locked"::"0",JobPlanningLine."Date Locked"::"1",
                JobPlanningLine."Date Locked"::"2"] THEN
                  JobPlanningLine.TESTFIELD("No.");
              TestExchangeRate(JobPlanningLine,PostingDate);
              CreateSalesLine(JobPlanningLine);
              IF SalesHeader2."Document Type" = SalesHeader2."Document Type":: Order THEN BEGIN
                JobPlanningLine."Invoice Type" := JobPlanningLine."Invoice Type"::"1";
                JobPlanningLine."Invoice No." := SalesHeader."No.";
              END;
              IF SalesHeader2."Document Type" = SalesHeader2."Document Type":: "Credit Memo" THEN BEGIN
                JobPlanningLine."Invoice Type" := JobPlanningLine."Invoice Type"::"2";
                JobPlanningLine."Invoice No." := SalesHeader."No.";
              END;
              JobPlanningLine.Transferred := TRUE;
              JobPlanningLine."Transferred Date" := PostingDate;
              JobPlanningLine.MODIFY;
            UNTIL TempJobPlanningLine.NEXT = 0;
          TempJobPlanningLine.DELETEALL;
        END;
        IF LastJobTask THEN
          EXIT;
        JobPlanningLine.RESET;
        JobPlanningLine.SETCURRENTKEY("Period Description","Grant Task No.");
        JobPlanningLine.SETRANGE("Period Description",JT2.Name);
        JobPlanningLine.SETRANGE("Grant Task No.",JT2.Description);
        JobPlanningLine.SETFILTER("New Fiscal Year",JT2.GETFILTER("Planning Date Filter"));

        IF JobPlanningLine.FIND('-') THEN
          REPEAT
            IF JobPlanningLine."Contract Line" AND NOT JobPlanningLine.Transferred THEN BEGIN
              TempJobPlanningLine := JobPlanningLine;
              TempJobPlanningLine.INSERT;
            END;
          UNTIL JobPlanningLine.NEXT = 0;
          }*/

    end;

    local procedure CreateNewInvoice(var JT: Record "HR Leave Journal Template"; InvoicePerTask: Boolean; var OldJobNo: Code[20]; var OldJTNo: Code[20]; LastJobTask: Boolean): Boolean
    var
        NewInvoice: Boolean;
    begin
        if LastJobTask then
            NewInvoice := true
        else begin
            if OldJobNo <> '' then begin
                if InvoicePerTask then
                    if (OldJobNo <> JT.Name) or (OldJTNo <> JT.Description) then
                        NewInvoice := true;
                if not InvoicePerTask then
                    if OldJobNo <> JT.Name then
                        NewInvoice := true;
            end;
            OldJobNo := JT.Name;
            OldJTNo := JT.Description;
        end;
        if not TempJobPlanningLine.Find('-') then
            NewInvoice := false;
        exit(NewInvoice);
    end;

    local procedure CreateSalesheader(Job: Record "HR Employee Qualifications"; PostingDate: Date)
    var
        SalesSetup: Record "Purchases & Payables Setup";
        Cust: Record Vendor;
    begin
        /*{
        CLEAR(SalesHeader);
        SalesHeader."Document Type" := SalesHeader2."Document Type";
        SalesSetup.GET;
        IF SalesHeader."Document Type" = SalesHeader."Document Type"::Order THEN
          SalesSetup.TESTFIELD("Invoice Nos.");
        IF SalesHeader."Document Type" = SalesHeader."Document Type"::"Credit Memo" THEN
          SalesSetup.TESTFIELD("Credit Memo Nos.");
        SalesHeader."Posting Date" := PostingDate;
        SalesHeader."Buy-from Vendor No.":=Job."To Date";
        SalesHeader.VALIDATE("Buy-from Vendor No.");
        SalesHeader.INSERT(TRUE);
        Cust.GET(Job."To Date");
        Cust.TESTFIELD(Cust."Pay-to Vendor No.",'');
        SalesHeader.VALIDATE(SalesHeader."Pay-to Vendor No.",Job."To Date");
        IF Job."Currency Code" <> '' THEN
          SalesHeader.VALIDATE("Currency Code",Job."Currency Code")
        ELSE
          SalesHeader.VALIDATE("Currency Code",Job."Invoice Currency Code");
        IF PostingDate <> 0D THEN
          SalesHeader.VALIDATE("Posting Date",PostingDate);
        UpdateSalesHeader(SalesHeader,Job);
        SalesHeader."Responsibility Center":=Job."Responsibility Center";
        SalesHeader.VALIDATE("Responsibility Center" );
        SalesHeader."Posting Description":=Job.Description;
        SalesHeader."Shortcut Dimension 1 Code":=Job."Global Dimension 1 Code";
        SalesHeader.VALIDATE("Shortcut Dimension 1 Code");
        SalesHeader."Shortcut Dimension 2 Code":=Job."Global Dimension 2 Code";
        SalesHeader.VALIDATE("Shortcut Dimension 2 Code");
        SalesHeader.MODIFY(TRUE);
          }*/

    end;

    local procedure CreateSalesLine(var JobPlanningLine: Record "HR Leave Periods")
    var
        Job: Record "HR Employee Qualifications";
        Factor: Integer;
        JobTask: Record "HR Leave Journal Template";
    begin
        /*{
        Factor := 1;
        IF SalesHeader2."Document Type" = SalesHeader2."Document Type"::"Credit Memo" THEN
          Factor := -1;
        TestTransferred(JobPlanningLine);
        JobPlanningLine.TESTFIELD("New Fiscal Year");
        Job.GET(JobPlanningLine."Period Description");
        CLEAR(SalesLine);
        SalesLine."Document Type" := SalesHeader2."Document Type";
        SalesLine."Document No." := SalesHeader."No.";
        //Add Expense code here
        //SalesLine."Expense Code":=JobPlanningLine."Expense Code";
        IF NOT JobInvCurrency THEN BEGIN
          SalesHeader.TESTFIELD("Currency Code",JobPlanningLine."Currency Code");
          IF Job."Currency Code" <> '' THEN
            SalesHeader.TESTFIELD("Currency Factor",JobPlanningLine."Currency Factor");
          SalesHeader.TESTFIELD("Currency Code",Job."Currency Code");
        END;
        IF JobPlanningLine."Date Locked" = JobPlanningLine."Date Locked"::"3" THEN
          SalesLine.VALIDATE(Type,SalesLine.Type::" ");
        IF JobPlanningLine."Date Locked" = JobPlanningLine."Date Locked"::"2" THEN
          SalesLine.VALIDATE(Type,SalesLine.Type::"G/L Account");
        IF JobPlanningLine."Date Locked" = JobPlanningLine."Date Locked"::"1" THEN
          SalesLine.VALIDATE(Type,SalesLine.Type::Item);
        //IF JobPlanningLine.Type = JobPlanningLine.Type::Resource THEN
          //SalesLine.VALIDATE(Type,SalesLine.Type::Resource);

        //Add Expense code here
        //SalesLine."Expense Code":=JobPlanningLine."Expense Code";

        IF SalesLine.Type = SalesLine.Type::" " THEN BEGIN
          SalesLine.Description := JobPlanningLine."Period Code";
          SalesLine."Description 2" := JobPlanningLine."Description 2";
        END ELSE BEGIN
          SalesLine.VALIDATE("No.",JobPlanningLine."No.");
          SalesLine.VALIDATE("Location Code",JobPlanningLine."Location Code");
          //SalesLine.VALIDATE("Work Type Code",JobPlanningLine."Work Type Code");
          SalesLine.VALIDATE("Variant Code",JobPlanningLine."Variant Code");
          SalesLine.VALIDATE("Unit of Measure Code",JobPlanningLine."Unit of Measure Code");
          SalesLine.VALIDATE(Quantity,Factor * JobPlanningLine.Quantity);
          IF JobInvCurrency THEN BEGIN
            Currency.GET(SalesLine."Currency Code");
            SalesLine.VALIDATE("Direct Unit Cost",
              ROUND(JobPlanningLine."Unit Price" * SalesHeader."Currency Factor",
                Currency."Unit-Amount Rounding Precision"));
          END ELSE
            SalesLine.VALIDATE("Direct Unit Cost",JobPlanningLine."Unit Price");
          SalesLine.VALIDATE("Unit Cost (LCY)",JobPlanningLine."Unit Price (LCY)");
          SalesLine.VALIDATE("Line Discount %",JobPlanningLine."Line Discount %");
          SalesLine.Description := JobPlanningLine."Period Code";
          SalesLine."Description 2" := JobPlanningLine."Description 2";
        END;
        IF NOT SalesHeader."Prices Including VAT" THEN
          SalesLine.VALIDATE("Job Line Type",JobPlanningLine."Grant Contract Entry No.");
        SalesLine."Job No." := JobPlanningLine."Period Description";
        //SalesLine."Job Planning Line No." := JobPlanningLine."Grant Task No.";
        SalesLine."Line No." := GetNextLineNo(SalesLine);
        SalesLine.INSERT(TRUE);
          //Force the Dimensions here
          JobTask.RESET;
          JobTask.SETRANGE(JobTask.Name,JobPlanningLine."Period Description");
          JobTask.SETRANGE(JobTask.Description,JobPlanningLine."Grant Task No.");
          IF JobTask.FIND('-') THEN BEGIN
            SalesLine."Shortcut Dimension 1 Code":=JobTask."Global Dimension 1 Code";
            SalesLine.VALIDATE("Shortcut Dimension 1 Code");
            SalesLine."Shortcut Dimension 2 Code":=JobTask."Global Dimension 2 Code";
            SalesLine.VALIDATE("Shortcut Dimension 2 Code");
            SalesLine.MODIFY(TRUE);
          END;

        IF JobInvCurrency THEN BEGIN
          JobPlanningLine."Invoice Currency" := TRUE;
          JobPlanningLine."Inv. Curr. Unit Price" := SalesLine."Direct Unit Cost";
          JobPlanningLine."Inv. Curr. Line Amount" := SalesLine."Line Amount";
          JobPlanningLine."Invoice Currency Code" := Job."Invoice Currency Code";
          JobPlanningLine."Invoice Currency Factor" := SalesHeader."Currency Factor";
        END;

        IF SalesHeader."Prices Including VAT" AND
           (SalesLine.Type <> SalesLine.Type::" ")
        THEN BEGIN
          IF SalesLine."Currency Code" = '' THEN
            Currency.InitRoundingPrecision
          ELSE
            Currency.GET(SalesLine."Currency Code");
          SalesLine."Direct Unit Cost" :=
            ROUND(
              SalesLine."Direct Unit Cost" * (1 + (SalesLine."VAT %" / 100)),
              Currency."Unit-Amount Rounding Precision");
          IF SalesLine.Quantity <> 0 THEN BEGIN
            SalesLine."Line Discount Amount" :=
              ROUND(
                SalesLine.Quantity * SalesLine."Direct Unit Cost" * SalesLine."Line Discount %" / 100,
                Currency."Amount Rounding Precision");
            SalesLine.VALIDATE("Inv. Discount Amount",
              ROUND(
                SalesLine."Inv. Discount Amount" * (1 + (SalesLine."VAT %" / 100)),
                Currency."Amount Rounding Precision"));
          END;
        //  SalesLine.VALIDATE("Job Contract Entry No.",JobPlanningLine."Grant Contract Entry No.");
           SalesLine.MODIFY;
          JobPlanningLine."VAT Unit Price" := SalesLine."Direct Unit Cost";
          JobPlanningLine."VAT Line Discount Amount" := SalesLine."Line Discount Amount";
          JobPlanningLine."VAT Line Amount" := SalesLine."Line Amount";
          JobPlanningLine."VAT %" := SalesLine."VAT %";
        END;
        IF TransferExtendedText.PurchCheckIfAnyExtText(SalesLine,FALSE) THEN
          TransferExtendedText.InsertPurchExtText(SalesLine);
         }*/

    end;

    local procedure GetNextLineNo(SalesLine: Record "Purchase Line"): Integer
    var
        NextLineNo: Integer;
    begin
        SalesLine.SetRange("Document Type", SalesLine."Document Type");
        SalesLine.SetRange("Document No.", SalesLine."Document No.");
        NextLineNo := 10000;
        if SalesLine.Find('+') then
            NextLineNo := SalesLine."Line No." + 10000;
        exit(NextLineNo);
    end;

    local procedure TestTransferred(JobPlanningLine: Record "HR Leave Periods")
    var
        SalesLine: Record "Purchase Line";
        JobTransferLine: Codeunit "Job Transfer Line";
    begin
        //SalesLine.SETCURRENTKEY("Job Contract Entry No.");
        /*SalesLine.SETRANGE("Job Contract Entry No.",JobPlanningLine."Grant Contract Entry No.");
        IF SalesLine.FIND('-') THEN
          ERROR(Text003,
            JobPlanningLine.TABLECAPTION,
            JobPlanningLine.FIELDCAPTION("Line No."),
            JobPlanningLine."Line No.",
            JobTransferLine.JTName(JobPlanningLine."Grant No.",JobPlanningLine."Grant Task No."),
            JobPlanningLine."Grant Contract Entry No.",
            SalesLine."Document No.");
        JobPlanningLine.TESTFIELD(Invoiced,FALSE);
         */

    end;


    procedure DeleteSalesLine(SalesLine: Record "Purchase Line")
    var
        JobPlanningLine: Record "Staff Advanc Surrender Details";
    begin
        //JobPlanningLine.SETCURRENTKEY("Grant Contract Entry No.");
        /*JobPlanningLine.SETRANGE("Grant Contract Entry No.",SalesLine."Job Contract Entry No.");
        IF JobPlanningLine.FIND('-') THEN BEGIN
          JobPlanningLine.InitJobPlanningLine;
          JobPlanningLine.MODIFY;
        END;
         */

    end;


    procedure GetSalesInvoice(JobPlanningLine: Record "HR Leave Periods")
    var
        SalesHeader: Record "Purchase Header";
        SalesLine: Record "Purchase Line";
        SalesInvHeader: Record "Purch. Inv. Header";
        SalesInvLine: Record "Purch. Inv. Line";
        SalesCrMemoHeader: Record "Purch. Cr. Memo Hdr.";
        SalesCrMemoLine: Record "Purch. Cr. Memo Line";
    begin
        /*{
        CLEARALL;
        WITH JobPlanningLine DO BEGIN
          IF "Starting Date" = 0 THEN
            EXIT;
        //  TESTFIELD("Grant No.");
        //  TESTFIELD("Grant Task No.");
        //  TESTFIELD(Transferred);
          IF NOT Invoiced THEN BEGIN
        //    SalesLine.SETCURRENTKEY("Job Contract Entry No.");
            SalesLine.SETRANGE(SalesLine."Job Planning Line No.","Grant Contract Entry No.");
            IF SalesLine.FIND('-') THEN BEGIN
              IF SalesHeader.GET(SalesLine."Document Type",SalesLine."Document No.") THEN;
              IF SalesLine."Document Type" = SalesLine."Document Type"::Order THEN
                PAGE.RUNMODAL(PAGE::"Purchase Order",SalesHeader)
              ELSE
                PAGE.RUNMODAL(PAGE::"Purchase Order",SalesHeader);
            END ELSE
              ERROR(Text001);
          END;
          IF Invoiced THEN BEGIN
        //    SalesCrMemoLine.SETCURRENTKEY("Job Planning Line No.");
         //   SalesCrMemoLine.SETRANGE("Job Contract Entry No.","Grant Contract Entry No.");
         //   IF SalesCrMemoLine.FIND('-') THEN BEGIN;
         //     IF SalesCrMemoHeader.GET(SalesCrMemoLine."Document No.") THEN;
          //    PAGE.RUNMODAL(PAGE::"Purchase Order",SalesCrMemoHeader);
          //  END ELSE BEGIN
           //   SalesInvLine.SETCURRENTKEY("Job Contract Entry No.");
            //  SalesInvLine.SETRANGE("Job Contract Entry No.","Grant Contract Entry No.");
            //  SalesInvLine.FIND('-');
              IF SalesInvHeader.GET(SalesInvLine."Document No.") THEN;
              PAGE.RUNMODAL(PAGE::"Purchase Order",SalesInvHeader);
            END;
          END;
        //END;
           }*/

    end;

    local procedure UpdateSalesHeader(var SalesHeader: Record "Purchase Header"; Job: Record "HR Employee Qualifications")
    begin
        /*SalesHeader."Pay-to Contact No." := Job."Grant-to Contact No.";
        SalesHeader."Pay-to Contact No." := Job."Grant-to Contact";
        SalesHeader."Pay-to Name" := Job."Grant-to Name";
        SalesHeader."Pay-to Address" := Job."Grant-to Address";
        SalesHeader."Pay-to Address 2" := Job."Grant-to Address 2";
        SalesHeader."Pay-to City" := Job."Grant-to City";
        SalesHeader."Pay-to Post Code":= Job."Grant-to Post Code";

        SalesHeader."Buy-from Contact" := Job."Grant-to Contact No.";
        SalesHeader."Buy-from Contact" := Job."Grant-to Contact";
        SalesHeader."Buy-from Vendor Name" := Job."Grant-to Name";
        SalesHeader."Buy-from Address" := Job."Grant-to Address";
        SalesHeader."Buy-from Address 2" := Job."Grant-to Address 2";
        SalesHeader."Buy-from City" := Job."Grant-to City";
        SalesHeader."Pay-to Post Code" := Job."Grant-to Post Code";

        SalesHeader."Ship-to Contact" := Job."Grant-to Contact";
        SalesHeader."Ship-to Name" := Job."Grant-to Name";
        SalesHeader."Ship-to Address" := Job."Grant-to Address";
        SalesHeader."Ship-to Address 2" := Job."Grant-to Address 2";
        SalesHeader."Ship-to City" := Job."Grant-to City";
        SalesHeader."Ship-to Post Code" := Job."Grant-to Post Code";
         */

    end;

    local procedure TestSalesHeader(var SalesHeader: Record "Purchase Header"; var Job: Record "HR Employee Qualifications")
    begin
        /*{
        SalesHeader.TESTFIELD(SalesHeader."Pay-to Vendor No.",Job."To Date");
        SalesHeader.TESTFIELD(SalesHeader."Buy-from Vendor No.",Job."To Date");

        IF Job."Currency Code" <> '' THEN
          SalesHeader.TESTFIELD("Currency Code",Job."Currency Code")
        ELSE
          SalesHeader.TESTFIELD("Currency Code",Job."Invoice Currency Code");
                    }*/

    end;


    procedure TestExchangeRate(var JobPlanningLine: Record "HR Leave Periods"; PostingDate: Date)
    var
        CurrencyExchangeRate: Record "Currency Exchange Rate";
    begin
        /*{
        IF JobPlanningLine."Currency Code" <> '' THEN
          IF (CurrencyExchangeRate.ExchangeRate(PostingDate,JobPlanningLine."Currency Code") <> JobPlanningLine."Currency Factor")
            THEN BEGIN

            IF UpdateExchangeRates = FALSE THEN
              UpdateExchangeRates := CONFIRM(Text010,TRUE);

            IF UpdateExchangeRates = TRUE THEN BEGIN
              JobPlanningLine."Currency Date" := PostingDate;
              JobPlanningLine."Document Date" := PostingDate;
              JobPlanningLine.VALIDATE("Currency Date");
              JobPlanningLine."Last Date Modified" := TODAY;
              JobPlanningLine."User ID" := USERID;
              JobPlanningLine.MODIFY(TRUE);
            END ELSE BEGIN
              ERROR('')
            END;
          END;
           }*/

    end;
}
