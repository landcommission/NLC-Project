#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193721 "Purchase - Invoice Mod"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Purchase - Invoice Mod.rdlc';
    Caption = 'Goods Receipt Note';
    ApplicationArea = All;

    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Buy-from Vendor No.", "No. Printed";
            RequestFilterHeading = 'Posted Purchase Invoice';
            column(ReportForNavId_3733; 3733) { }
            column(No_PurchInvHeader; "Purch. Inv. Header"."No.") { }
            column(InvDiscAmtCaption; InvDiscAmtCaptionLbl) { }
            column(AllowInvDiscCaption; AllowInvDiscCaptionLbl) { }
            column(NumberText; NumberText[1]) { }
            column(CompanyInfoPicture; CompanyInfo.Picture) { }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = sorting(Number);
                column(ReportForNavId_5701; 5701) { }
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = sorting(Number) where(Number = const(1));
                    column(ReportForNavId_6455; 6455) { }
                    column(PaymentTermsDesc; PaymentTerms.Description) { }
                    column(ShipmentMethodDesc; ShipmentMethod.Description) { }
                    column(DocCaptionCopyText; StrSubstNo(DocumentCaption(), CopyText)) { }
                    column(VendAddr1; VendAddr[1]) { }
                    column(CompanyAddr1; CompanyAddr[1]) { }
                    column(VendAddr2; VendAddr[2]) { }
                    column(CompanyAddr2; CompanyAddr[2]) { }
                    column(VendAddr3; VendAddr[3]) { }
                    column(CompanyAddr3; CompanyAddr[3]) { }
                    column(VendAddr4; VendAddr[4]) { }
                    column(CompanyAddr4; CompanyAddr[4]) { }
                    column(VendAddr5; VendAddr[5]) { }
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.") { }
                    column(VendAddr6; VendAddr[6]) { }
                    column(CompanyInfoHomePage; CompanyInfo."Home Page") { }
                    column(CompanyInfoEMail; CompanyInfo."E-Mail") { }
                    column(CompanyInfoVATRegNo; CompanyInfo."VAT Registration No.") { }
                    column(CompanyInfoGiroNo; CompanyInfo."Giro No.") { }
                    column(CompanyInfoBankName; CompanyInfo."Bank Name") { }
                    column(CompanyInfoBankAccountNo; CompanyInfo."Bank Account No.") { }
                    column(PayToVendNo_PurchInvHeader; "Purch. Inv. Header"."Pay-to Vendor No.") { }
                    column(DocDate_PurchInvHeader; Format("Purch. Inv. Header"."Document Date")) { }
                    column(VATNoText; VATNoText) { }
                    column(VATRegNo_PurchInvHeader; "Purch. Inv. Header"."VAT Registration No.") { }
                    column(DueDate_PurchInvHeader; Format("Purch. Inv. Header"."Due Date")) { }
                    column(PurchaserText; PurchaserText) { }
                    column(SalesPurchPersonName; SalesPurchPerson.Name) { }
                    column(RefText; ReferenceText) { }
                    column(YourRef_PurchInvHeader; "Purch. Inv. Header"."Your Reference") { }
                    column(OrderNoText; OrderNoText) { }
                    column(OrderNo_PurchInvHeader; "Purch. Inv. Header"."Order No.") { }
                    column(VendAddr7; VendAddr[7]) { }
                    column(VendAddr8; VendAddr[8]) { }
                    column(CompanyAddr5; CompanyAddr[5]) { }
                    column(CompanyAddr6; CompanyAddr[6]) { }
                    column(PostingDate_PurchInvHeader; Format("Purch. Inv. Header"."Posting Date")) { }
                    column(PricesIncVAT_PurchInvHeader; "Purch. Inv. Header"."Prices Including VAT") { }
                    column(OutputNo; OutputNo) { }
                    column(ShowInternalInfo; ShowInternalInfo) { }
                    column(VATBaseDisc_PurchInvHeader; "Purch. Inv. Header"."VAT Base Discount %") { }
                    column(PricesInclVATtxt; PricesInclVATtxt) { }
                    column(BuyFromVendNo_PurchInvHeader; "Purch. Inv. Header"."Buy-from Vendor No.") { }
                    column(PhoneNoCaption; PhoneNoCaptionLbl) { }
                    column(HomePageCaption; HomePageCaptionLbl) { }
                    column(EMailCaption; EMailCaptionLbl) { }
                    column(VATRegNoCaption; VATRegNoCaptionLbl) { }
                    column(GiroNoCaption; GiroNoCaptionLbl) { }
                    column(BankNameCaption; BankNameCaptionLbl) { }
                    column(BankAccNoCaption; BankAccNoCaptionLbl) { }
                    column(DueDateCaption; DueDateCaptionLbl) { }
                    column(InvoiceNoCaption; InvoiceNoCaptionLbl) { }
                    column(PostingDateCaption; PostingDateCaptionLbl) { }
                    column(PageCaption; PageCaptionLbl) { }
                    column(PaymentTermsCaption; PaymentTermsCaptionLbl) { }
                    column(ShipmentMethodCaption; ShipmentMethodCaptionLbl) { }
                    column(DocDateCaption; DocDateCaptionLbl) { }
                    column(PayToVendNo_PurchInvHeaderCaption; "Purch. Inv. Header".FieldCaption("Pay-to Vendor No.")) { }
                    column(PricesIncVAT_PurchInvHeaderCaption; "Purch. Inv. Header".FieldCaption("Prices Including VAT")) { }
                    column(BuyFromVendNo_PurchInvHeaderCaption; "Purch. Inv. Header".FieldCaption("Buy-from Vendor No.")) { }
                    column(VendorInvoiceNo; "Purch. Inv. Header"."Vendor Invoice No.") { }
                    column(OrderNo; "Purch. Inv. Header"."Order No.") { }
                    column(WaybillNo; WaybillNo) { }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Purch. Inv. Header";
                        DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                        column(ReportForNavId_7574; 7574) { }
                        column(DimText_DimensionLoop1; DimText) { }
                        column(HeaderDimensionsCaption; HeaderDimensionsCaptionLbl) { }

                        trigger OnAfterGetRecord()
                        begin
                            if DimensionLoop1.Number = 1 then begin
                                if not DimSetEntry1.FindSet() then
                                    CurrReport.Break();
                            end else
                                if not Continue then
                                    CurrReport.Break();

                            Clear(DimText);
                            Continue := false;
                            repeat
                                OldDimText := DimText;
                                if DimText = '' then
                                    DimText := StrSubstNo('%1 %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                else
                                    DimText :=
                                      StrSubstNo(
                                        '%1, %2 %3', DimText,
                                        DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code");
                                if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                    DimText := OldDimText;
                                    Continue := true;
                                    exit;
                                end;
                            until DimSetEntry1.Next() = 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            if not ShowInternalInfo then
                                CurrReport.Break();
                        end;
                    }
                    dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
                    {
                        DataItemLink = "Document No." = field("No.");
                        DataItemLinkReference = "Purch. Inv. Header";
                        DataItemTableView = sorting("Document No.", "Line No.");
                        column(ReportForNavId_5707; 5707) { }
                        column(LineAmt_PurchInvLine; "Purch. Inv. Line"."Line Amount")
                        {
                            AutoFormatExpression = GetCurrencyCode();
                            AutoFormatType = 1;
                        }
                        column(Desc_PurchInvLine; "Purch. Inv. Line".Description) { }
                        column(No_PurchInvLine; "Purch. Inv. Line"."No.") { }
                        column(Qty_PurchInvLine; "Purch. Inv. Line".Quantity) { }
                        column(UOM_PurchInvLine; "Purch. Inv. Line"."Unit of Measure") { }
                        column(DirectUnitCost_PurchInvLine; "Purch. Inv. Line"."Direct Unit Cost")
                        {
                            AutoFormatExpression = GetCurrencyCode();
                            AutoFormatType = 2;
                        }
                        column(LineDisc_PurchInvLine; "Purch. Inv. Line"."Line Discount %") { }
                        column(AllowInvDisc_PurchInvLine; "Purch. Inv. Line"."Allow Invoice Disc.")
                        {
                            IncludeCaption = false;
                        }
                        column(VATIdentifier_PurchInvLine; "Purch. Inv. Line"."VAT Identifier") { }
                        column(LineNo_PurchInvLine; "Purch. Inv. Line"."Line No.") { }
                        column(AllowVATDisctxt; AllowVATDisctxt) { }
                        column(PurchInLineTypeNo; PurchInLineTypeNo) { }
                        column(VATAmtText; VATAmountText) { }
                        column(NegInvDiscAmt_PurchInvLine; -"Purch. Inv. Line"."Inv. Discount Amount")
                        {
                            AutoFormatExpression = GetCurrencyCode();
                            AutoFormatType = 1;
                        }
                        column(TotalText; TotalText) { }
                        column(PurchInvLineAmt; "Purch. Inv. Line".Amount)
                        {
                            AutoFormatExpression = GetCurrencyCode();
                            AutoFormatType = 1;
                        }
                        column(TotalInclVATText; TotalInclVATText) { }
                        column(AmtIncVAT_PurchInvLine; "Purch. Inv. Line"."Amount Including VAT")
                        {
                            AutoFormatExpression = GetCurrencyCode();
                            AutoFormatType = 1;
                        }
                        column(AmtIncVATAmt_PurchInvLine; "Purch. Inv. Line"."Amount Including VAT" - "Purch. Inv. Line".Amount)
                        {
                            AutoFormatExpression = GetCurrencyCode();
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATAmtText; VATAmountLine.VATAmountText()) { }
                        column(TotalExclVATText; TotalExclVATText) { }
                        column(NegLineAmtInvDiscAmtAmtIncVAT_PurchInvLine; -("Purch. Inv. Line"."Line Amount" - "Purch. Inv. Line"."Inv. Discount Amount" - "Purch. Inv. Line"."Amount Including VAT"))
                        {
                            AutoFormatExpression = "Purch. Inv. Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalSubTotal; TotalSubTotal)
                        {
                            AutoFormatExpression = "Purch. Inv. Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalInvDiscAmt; TotalInvoiceDiscountAmount)
                        {
                            AutoFormatExpression = "Purch. Inv. Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalAmt; TotalAmount)
                        {
                            AutoFormatExpression = "Purch. Inv. Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalAmtInclVAT; TotalAmountInclVAT)
                        {
                            AutoFormatExpression = "Purch. Inv. Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalAmtVAT; TotalAmountVAT)
                        {
                            AutoFormatExpression = "Purch. Inv. Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalPaymentDiscOnVAT; TotalPaymentDiscountOnVAT)
                        {
                            AutoFormatType = 1;
                        }
                        column(DirectUnitCostCaption; DirectUnitCostCaptionLbl) { }
                        column(DiscountPctCaption; DiscountPctCaptionLbl) { }
                        column(AmountCaption; AmountCaptionLbl) { }
                        column(SubtotalCaption; SubtotalCaptionLbl) { }
                        column(PymtDiscOnVATCaption; PymtDiscOnVATCaptionLbl) { }
                        column(Desc_PurchInvLineCaption; "Purch. Inv. Line".FieldCaption("Purch. Inv. Line".Description)) { }
                        column(No_PurchInvLineCaption; "Purch. Inv. Line".FieldCaption("Purch. Inv. Line"."No.")) { }
                        column(Qty_PurchInvLineCaption; "Purch. Inv. Line".FieldCaption("Purch. Inv. Line".Quantity)) { }
                        column(UOM_PurchInvLineCaption; "Purch. Inv. Line".FieldCaption("Purch. Inv. Line"."Unit of Measure")) { }
                        column(VATIdentifier_PurchInvLineCaption; "Purch. Inv. Line".FieldCaption("Purch. Inv. Line"."VAT Identifier")) { }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                            column(ReportForNavId_3591; 3591) { }
                            column(DimText_DimensionLoop2; DimText) { }
                            column(LineDimensionsCaption; LineDimensionsCaptionLbl) { }

                            trigger OnAfterGetRecord()
                            begin
                                if DimensionLoop2.Number = 1 then begin
                                    if not DimSetEntry2.FindSet() then
                                        CurrReport.Break();
                                end else
                                    if not Continue then
                                        CurrReport.Break();

                                Clear(DimText);
                                Continue := false;
                                repeat
                                    OldDimText := DimText;
                                    if DimText = '' then
                                        DimText := StrSubstNo('%1 %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    else
                                        DimText :=
                                          StrSubstNo(
                                            '%1, %2 %3', DimText,
                                            DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code");
                                    if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                        DimText := OldDimText;
                                        Continue := true;
                                        exit;
                                    end;
                                until DimSetEntry2.Next() = 0;
                            end;

                            trigger OnPreDataItem()
                            begin
                                if not ShowInternalInfo then
                                    CurrReport.Break();

                                DimSetEntry2.SetRange("Dimension Set ID", "Purch. Inv. Line"."Dimension Set ID");
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if ("Purch. Inv. Line".Type = "Purch. Inv. Line".Type::"G/L Account") and (not ShowInternalInfo) then
                                "Purch. Inv. Line"."No." := '';

                            VATAmountLine.Init();
                            VATAmountLine."VAT Identifier" := "Purch. Inv. Line"."VAT Identifier";
                            VATAmountLine."VAT Calculation Type" := "Purch. Inv. Line"."VAT Calculation Type";
                            VATAmountLine."Tax Group Code" := "Purch. Inv. Line"."Tax Group Code";
                            VATAmountLine."Use Tax" := "Purch. Inv. Line"."Use Tax";
                            VATAmountLine."VAT %" := "Purch. Inv. Line"."VAT %";
                            VATAmountLine."VAT Base" := "Purch. Inv. Line".Amount;
                            VATAmountLine."Amount Including VAT" := "Purch. Inv. Line"."Amount Including VAT";
                            VATAmountLine."Line Amount" := "Purch. Inv. Line"."Line Amount";
                            if "Purch. Inv. Line"."Allow Invoice Disc." then
                                VATAmountLine."Inv. Disc. Base Amount" := "Purch. Inv. Line"."Line Amount";
                            VATAmountLine."Invoice Discount Amount" := "Purch. Inv. Line"."Inv. Discount Amount";
                            VATAmountLine.InsertLine();

                            AllowVATDisctxt := Format("Purch. Inv. Line"."Allow Invoice Disc.");
                            PurchInLineTypeNo := "Purch. Inv. Line".Type;

                            TotalSubTotal += "Purch. Inv. Line"."Line Amount";
                            TotalInvoiceDiscountAmount -= "Purch. Inv. Line"."Inv. Discount Amount";
                            TotalAmount += "Purch. Inv. Line".Amount;
                            TotalAmountVAT += "Purch. Inv. Line"."Amount Including VAT" - "Purch. Inv. Line".Amount;
                            TotalAmountInclVAT += "Purch. Inv. Line"."Amount Including VAT";
                            TotalPaymentDiscountOnVAT += -("Purch. Inv. Line"."Line Amount" - "Purch. Inv. Line"."Inv. Discount Amount" - "Purch. Inv. Line"."Amount Including VAT");
                        end;

                        trigger OnPreDataItem()
                        var
                            PurchInvLine: Record "Purch. Inv. Line";
                            VATIdentifier: Code[10];
                        begin
                            VATAmountLine.DeleteAll();
                            MoreLines := "Purch. Inv. Line".Find('+');
                            while MoreLines and ("Purch. Inv. Line".Description = '') and ("Purch. Inv. Line"."No." = '') and ("Purch. Inv. Line".Quantity = 0) and ("Purch. Inv. Line".Amount = 0) do
                                MoreLines := "Purch. Inv. Line".Next(-1) <> 0;
                            if not MoreLines then
                                CurrReport.Break();
                            "Purch. Inv. Line".SetRange("Purch. Inv. Line"."Line No.", 0, "Purch. Inv. Line"."Line No.");
                            CurrReport.CreateTotals("Purch. Inv. Line"."Line Amount", "Purch. Inv. Line"."Inv. Discount Amount", "Purch. Inv. Line".Amount, "Purch. Inv. Line"."Amount Including VAT");

                            PurchInvLine.SetRange("Document No.", "Purch. Inv. Header"."No.");
                            PurchInvLine.SetFilter(Type, '<>%1', 0);
                            VATAmountText := '';
                            if PurchInvLine.Find('-') then begin
                                VATAmountText := StrSubstNo(Text011, PurchInvLine."VAT %");
                                VATIdentifier := PurchInvLine."VAT Identifier";
                                repeat
                                    if (PurchInvLine."VAT Identifier" <> VATIdentifier) and (PurchInvLine.Quantity <> 0) then
                                        VATAmountText := Text012;
                                until PurchInvLine.Next() = 0;
                            end;
                        end;
                    }
                    dataitem(VATCounter; "Integer")
                    {
                        DataItemTableView = sorting(Number);
                        column(ReportForNavId_6558; 6558) { }
                        column(VATAmtLineVATBase; VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Purch. Inv. Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVATAmt; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Purch. Inv. Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineLineAmt; VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Purch. Inv. Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscBaseAmt; VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Purch. Inv. Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineInvDiscAmt; VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Purch. Inv. Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVAT_VATCounter; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmtLineVATIdentifier_VATCounter; VATAmountLine."VAT Identifier") { }
                        column(VATPercentageCaption; VATPercentageCaptionLbl) { }
                        column(VATBaseCaption; VATBaseCaptionLbl) { }
                        column(VATAmtCaption; VATAmtCaptionLbl) { }
                        column(VATAmtSpecificationCaption; VATAmtSpecificationCaptionLbl) { }
                        column(InvDiscBaseAmtCaption; InvDiscBaseAmtCaptionLbl) { }
                        column(LineAmtCaption; LineAmtCaptionLbl) { }
                        column(VATIdentifierCaption; VATIdentifierCaptionLbl) { }
                        column(TotalCaption; TotalCaptionLbl) { }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(VATCounter.Number);
                        end;

                        trigger OnPreDataItem()
                        begin
                            VATCounter.SetRange(VATCounter.Number, 1, VATAmountLine.Count);
                            CurrReport.CreateTotals(
                              VATAmountLine."Line Amount", VATAmountLine."Inv. Disc. Base Amount",
                              VATAmountLine."Invoice Discount Amount", VATAmountLine."VAT Base", VATAmountLine."VAT Amount");
                        end;
                    }
                    dataitem(VATCounterLCY; "Integer")
                    {
                        DataItemTableView = sorting(Number);
                        column(ReportForNavId_2038; 2038) { }
                        column(VALExchRate; VALExchRate) { }
                        column(VALSpecLCYHeader; VALSpecLCYHeader) { }
                        column(VALVATAmtLCY; VALVATAmountLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VALVATBaseLCY; VALVATBaseLCY)
                        {
                            AutoFormatType = 1;
                        }
                        column(VATAmtLineVAT_VATCounterLCY; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmtLineVATIdentifier_VATCounterLCY; VATAmountLine."VAT Identifier") { }

                        trigger OnAfterGetRecord()
                        begin
                            VATAmountLine.GetLine(VATCounterLCY.Number);
                            VALVATBaseLCY :=
                              VATAmountLine.GetBaseLCY(
                                "Purch. Inv. Header"."Posting Date", "Purch. Inv. Header"."Currency Code",
                                "Purch. Inv. Header"."Currency Factor");
                            VALVATAmountLCY :=
                              VATAmountLine.GetAmountLCY(
                                "Purch. Inv. Header"."Posting Date", "Purch. Inv. Header"."Currency Code",
                                "Purch. Inv. Header"."Currency Factor");
                        end;

                        trigger OnPreDataItem()
                        begin
                            if (not GLSetup."Print VAT specification in LCY") or
                               ("Purch. Inv. Header"."Currency Code" = '')
                            then
                                CurrReport.Break();

                            VATCounterLCY.SetRange(VATCounterLCY.Number, 1, VATAmountLine.Count);
                            CurrReport.CreateTotals(VALVATBaseLCY, VALVATAmountLCY);

                            if GLSetup."LCY Code" = '' then
                                VALSpecLCYHeader := Text007 + Text008
                            else
                                VALSpecLCYHeader := Text007 + Format(GLSetup."LCY Code");

                            CurrExchRate.FindCurrency("Purch. Inv. Header"."Posting Date", "Purch. Inv. Header"."Currency Code", 1);
                            CalculatedExchRate := Round(1 / "Purch. Inv. Header"."Currency Factor" * CurrExchRate."Exchange Rate Amount", 0.000001);
                            VALExchRate := StrSubstNo(Text009, CalculatedExchRate, CurrExchRate."Exchange Rate Amount");
                        end;
                    }
                    dataitem(Total; "Integer")
                    {
                        DataItemTableView = sorting(Number) where(Number = const(1));
                        column(ReportForNavId_3476; 3476) { }
                    }
                    dataitem(Total2; "Integer")
                    {
                        DataItemTableView = sorting(Number) where(Number = const(1));
                        column(ReportForNavId_3363; 3363) { }

                        trigger OnPreDataItem()
                        begin
                            if "Purch. Inv. Header"."Buy-from Vendor No." = "Purch. Inv. Header"."Pay-to Vendor No." then
                                CurrReport.Break();
                        end;
                    }
                    dataitem(Total3; "Integer")
                    {
                        DataItemTableView = sorting(Number) where(Number = const(1));
                        column(ReportForNavId_8272; 8272) { }
                        column(ShipToAddr1; ShipToAddr[1]) { }
                        column(ShipToAddr2; ShipToAddr[2]) { }
                        column(ShipToAddr3; ShipToAddr[3]) { }
                        column(ShipToAddr4; ShipToAddr[4]) { }
                        column(ShipToAddr5; ShipToAddr[5]) { }
                        column(ShipToAddr6; ShipToAddr[6]) { }
                        column(ShipToAddr7; ShipToAddr[7]) { }
                        column(ShipToAddr8; ShipToAddr[8]) { }
                        column(ShipToAddressCaption; ShipToAddressCaptionLbl) { }

                        trigger OnPreDataItem()
                        begin
                            if ShipToAddr[1] = '' then
                                CurrReport.Break();
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    if CopyLoop.Number > 1 then begin
                        OutputNo := OutputNo + 1;
                        CopyText := Text003;
                    end;
                    CurrReport.PageNo := 1;

                    TotalSubTotal := 0;
                    TotalInvoiceDiscountAmount := 0;
                    TotalAmount := 0;
                    TotalAmountVAT := 0;
                    TotalAmountInclVAT := 0;
                    TotalPaymentDiscountOnVAT := 0;
                end;

                trigger OnPostDataItem()
                begin
                    if not CurrReport.Preview then
                        PurchInvCountPrinted.Run("Purch. Inv. Header");
                end;

                trigger OnPreDataItem()
                begin
                    NoOfCopies := 1;
                    OutputNo := 1;
                    NoOfLoops := Abs(NoOfCopies) + 1;
                    CopyText := '';
                    CopyLoop.SetRange(CopyLoop.Number, 1, NoOfLoops);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                //CurrReport.Language := Language.GetLanguageID("Purch. Inv. Header"."Language Code");

                //CompanyInfo.GET;

                if RespCenter.Get("Purch. Inv. Header"."Responsibility Center") then begin
                    FormatAddr.RespCenter(CompanyAddr, RespCenter);
                    CompanyInfo."Phone No." := RespCenter."Phone No.";
                    CompanyInfo."Fax No." := RespCenter."Fax No.";
                end else
                    FormatAddr.Company(CompanyAddr, CompanyInfo);

                DimSetEntry1.SetRange("Dimension Set ID", "Purch. Inv. Header"."Dimension Set ID");

                if "Purch. Inv. Header"."Order No." = '' then
                    OrderNoText := ''
                else
                    OrderNoText := "Purch. Inv. Header".FieldCaption("Purch. Inv. Header"."Order No.");
                if "Purch. Inv. Header"."Purchaser Code" = '' then begin
                    Clear(SalesPurchPerson);
                    PurchaserText := '';
                end else begin
                    SalesPurchPerson.Get("Purch. Inv. Header"."Purchaser Code");
                    PurchaserText := Text000
                end;
                if "Purch. Inv. Header"."Your Reference" = '' then
                    ReferenceText := ''
                else
                    ReferenceText := "Purch. Inv. Header".FieldCaption("Purch. Inv. Header"."Your Reference");
                if "Purch. Inv. Header"."VAT Registration No." = '' then
                    VATNoText := ''
                else
                    VATNoText := "Purch. Inv. Header".FieldCaption("Purch. Inv. Header"."VAT Registration No.");
                if "Purch. Inv. Header"."Currency Code" = '' then begin
                    GLSetup.TestField("LCY Code");
                    TotalText := StrSubstNo(Text001, GLSetup."LCY Code");
                    TotalInclVATText := StrSubstNo(Text002, GLSetup."LCY Code");
                    TotalExclVATText := StrSubstNo(Text006, GLSetup."LCY Code");
                end else begin
                    TotalText := StrSubstNo(Text001, "Purch. Inv. Header"."Currency Code");
                    TotalInclVATText := StrSubstNo(Text002, "Purch. Inv. Header"."Currency Code");
                    TotalExclVATText := StrSubstNo(Text006, "Purch. Inv. Header"."Currency Code");
                end;
                FormatAddr.PurchInvPayTo(VendAddr, "Purch. Inv. Header");
                if "Purch. Inv. Header"."Payment Terms Code" = '' then
                    PaymentTerms.Init()
                else begin
                    PaymentTerms.Get("Purch. Inv. Header"."Payment Terms Code");
                    PaymentTerms.TranslateDescription(PaymentTerms, "Purch. Inv. Header"."Language Code");
                end;
                if "Purch. Inv. Header"."Shipment Method Code" = '' then
                    ShipmentMethod.Init()
                else begin
                    ShipmentMethod.Get("Purch. Inv. Header"."Shipment Method Code");
                    ShipmentMethod.TranslateDescription(ShipmentMethod, "Purch. Inv. Header"."Language Code");
                end;

                FormatAddr.PurchInvShipTo(ShipToAddr, "Purch. Inv. Header");

                if LogInteraction then
                    if not CurrReport.Preview then
                        SegManagement.LogDocument(
                          14, "Purch. Inv. Header"."No.", 0, 0, Database::Vendor, "Purch. Inv. Header"."Buy-from Vendor No.", "Purch. Inv. Header"."Purchaser Code", '', "Purch. Inv. Header"."Posting Description", '');
                PricesInclVATtxt := Format("Purch. Inv. Header"."Prices Including VAT");

                "Purch. Inv. Header".CalcFields("Purch. Inv. Header"."Amount Including VAT");
                //Amount into words
                CheckReport.InitTextVariable();
                CheckReport.FormatNoText(NumberText, "Purch. Inv. Header"."Amount Including VAT", '');

                PurchReceipt.Reset();
                PurchReceipt.SetRange(PurchReceipt."Order No.", "Purch. Inv. Header"."Order No.");
                if PurchReceipt.FindFirst() then
                    WaybillNo := PurchReceipt."No.";
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(NoOfCopies; NoOfCopies)
                    {
                        ApplicationArea = Basic;
                        Caption = 'No. of Copies';
                        ToolTip = 'Specifies the value of the No. of Copies field.';
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Show Internal Information';
                        ToolTip = 'Specifies the value of the Show Internal Information field.';
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies the value of the Log Interaction field.';
                    }
                }
            }
        }

        actions { }

        trigger OnInit()
        begin
            LogInteractionEnable := true;
        end;

        trigger OnOpenPage()
        begin
            LogInteraction := SegManagement.FindInteractTmplCode(14) <> '';
            LogInteractionEnable := LogInteraction;
        end;
    }

    labels { }

    trigger OnInitReport()
    begin
        GLSetup.Get();
    end;

    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        Text000: Label 'Purchaser';
        Text001: Label 'Total %1';
        Text002: Label 'Total %1 Incl. VAT';
        Text003: Label ' COPY';
        Text004: Label 'Store Receipt Voucher %1';
        Text006: Label 'Total %1 Excl. VAT';
        GLSetup: Record "General Ledger Setup";
        CompanyInfo: Record "Company Information";
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        VATAmountLine: Record "VAT Amount Line" temporary;
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        RespCenter: Record "Responsibility Center";
        Language: Record Language;
        CurrExchRate: Record "Currency Exchange Rate";
        PurchInvCountPrinted: Codeunit "Purch. Inv.-Printed";
        FormatAddr: Codeunit "Format Address";
        SegManagement: Codeunit SegManagement;
        VendAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        PurchaserText: Text[30];
        VATNoText: Text[80];
        ReferenceText: Text[80];
        OrderNoText: Text[80];
        TotalText: Text[50];
        TotalInclVATText: Text[50];
        TotalExclVATText: Text[50];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[10];
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        LogInteraction: Boolean;
        VALVATBaseLCY: Decimal;
        VALVATAmountLCY: Decimal;
        VALSpecLCYHeader: Text[80];
        VALExchRate: Text[50];
        Text007: Label 'VAT Amount Specification in ';
        Text008: Label 'Local Currency';
        Text009: Label 'Exchange rate: %1/%2';
        CalculatedExchRate: Decimal;
        Text010: Label 'Purchase - Prepayment Invoice %1';
        OutputNo: Integer;
        PricesInclVATtxt: Text[30];
        AllowVATDisctxt: Text[30];
        VATAmountText: Text[30];
        Text011: Label '%1% VAT';
        Text012: Label 'VAT Amount';
        PurchInLineTypeNo: Integer;
        [InDataSet]
        LogInteractionEnable: Boolean;
        TotalSubTotal: Decimal;
        TotalAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        TotalAmountVAT: Decimal;
        TotalInvoiceDiscountAmount: Decimal;
        TotalPaymentDiscountOnVAT: Decimal;
        PhoneNoCaptionLbl: Label 'Phone No.';
        HomePageCaptionLbl: Label 'Home Page';
        EMailCaptionLbl: Label 'E-Mail';
        VATRegNoCaptionLbl: Label 'VAT Registration No.';
        GiroNoCaptionLbl: Label 'Giro No.';
        BankNameCaptionLbl: Label 'Bank';
        BankAccNoCaptionLbl: Label 'Account No.';
        DueDateCaptionLbl: Label 'Due Date';
        InvoiceNoCaptionLbl: Label 'Invoice No.';
        PostingDateCaptionLbl: Label 'Posting Date';
        PageCaptionLbl: Label 'Page';
        PaymentTermsCaptionLbl: Label 'Payment Terms';
        ShipmentMethodCaptionLbl: Label 'Shipment Method';
        DocDateCaptionLbl: Label 'Document Date';
        HeaderDimensionsCaptionLbl: Label 'Header Dimensions';
        DirectUnitCostCaptionLbl: Label 'Direct Unit Cost';
        DiscountPctCaptionLbl: Label 'Discount %';
        AmountCaptionLbl: Label 'Amount';
        SubtotalCaptionLbl: Label 'Subtotal';
        PymtDiscOnVATCaptionLbl: Label 'Payment Discount on VAT';
        LineDimensionsCaptionLbl: Label 'Line Dimensions';
        VATPercentageCaptionLbl: Label 'VAT %';
        VATBaseCaptionLbl: Label 'VAT Base';
        VATAmtCaptionLbl: Label 'VAT Amount';
        VATAmtSpecificationCaptionLbl: Label 'VAT Amount Specification';
        InvDiscBaseAmtCaptionLbl: Label 'Inv. Disc. Base Amount';
        LineAmtCaptionLbl: Label 'Line Amount';
        VATIdentifierCaptionLbl: Label 'VAT Identifier';
        TotalCaptionLbl: Label 'Total';
        ShipToAddressCaptionLbl: Label 'Ship-to Address';
        InvDiscAmtCaptionLbl: Label 'Invoice Discount Amount';
        AllowInvDiscCaptionLbl: Label 'Allow Invoice Discount';
        NumberText: array[2] of Text[120];
        CheckReport: Report Check;
        PurchReceipt: Record "Purch. Rcpt. Header";
        WaybillNo: Code[20];

    local procedure DocumentCaption(): Text[250]
    begin
        if "Purch. Inv. Header"."Prepayment Invoice" then
            exit(Text010);
        exit(Text004);
    end;


    procedure InitializeRequest(NewNoOfCopies: Integer; NewShowInternalInfo: Boolean; NewLogInteraction: Boolean)
    begin
        NoOfCopies := NewNoOfCopies;
        ShowInternalInfo := NewShowInternalInfo;
        LogInteraction := NewLogInteraction;
    end;
}
