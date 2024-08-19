#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193729 "Item Tendered Per Supplier"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Item Tendered Per Supplier.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Item Tendered Per Supplier';
    dataset
    {
        dataitem("Purchase Price Temp"; "Purchase Price Temp")
        {
            column(ReportForNavId_1; 1) { }
            column(ItemNo_PurchasePriceTemp; "Purchase Price Temp"."Item No.") { }
            column(Description_PurchasePriceTemp; "Purchase Price Temp".Description) { }
            column(CurrencyCode_PurchasePriceTemp; "Purchase Price Temp"."Currency Code") { }
            column(StartingDate_PurchasePriceTemp; "Purchase Price Temp"."Starting Date") { }
            column(DirectUnitCost_PurchasePriceTemp; "Purchase Price Temp"."Direct Unit Cost") { }
            column(QuestionaireNo_PurchasePriceTemp; "Purchase Price Temp"."Questionaire No") { }
            column(TenderNo_PurchasePriceTemp; "Purchase Price Temp"."Tender No.") { }
            column(PINNo_PurchasePriceTemp; "Purchase Price Temp"."PIN No.") { }
            column(ReceiptNo_PurchasePriceTemp; "Purchase Price Temp"."Receipt No.") { }
            column(LineNo_PurchasePriceTemp; "Purchase Price Temp"."Line No.") { }
            column(MinimumQuantity_PurchasePriceTemp; "Purchase Price Temp"."Minimum Quantity") { }
            column(EndingDate_PurchasePriceTemp; "Purchase Price Temp"."Ending Date") { }
            column(UnitofMeasureCode_PurchasePriceTemp; "Purchase Price Temp"."Unit of Measure Code") { }
            column(Brand_PurchasePriceTemp; "Purchase Price Temp".Brand) { }
            column(Formulation_PurchasePriceTemp; "Purchase Price Temp".Formulation) { }
            column(UnitSize_PurchasePriceTemp; "Purchase Price Temp"."Unit Size") { }
            column(UnitTradeWSalePrice_PurchasePriceTemp; "Purchase Price Temp"."Unit Trade/ W/Sale Price") { }
            column(Discount_PurchasePriceTemp; "Purchase Price Temp".Discount) { }
            column(VAT_PurchasePriceTemp; "Purchase Price Temp".VAT) { }
            column(FinalTender_PurchasePriceTemp; "Purchase Price Temp"."Final Tender") { }
            column(RecommendedUnitRetailPrice_PurchasePriceTemp; "Purchase Price Temp"."Recommended Unit Retail Price") { }
            column(Supplier_PurchasePriceTemp; "Purchase Price Temp".Supplier) { }
            column(Manufacturer_PurchasePriceTemp; "Purchase Price Temp".Manufacturer) { }
            column(PackSize_PurchasePriceTemp; "Purchase Price Temp"."Pack Size") { }
            column(Remarks_PurchasePriceTemp; "Purchase Price Temp".Remarks) { }
            column(TenderResult_PurchasePriceTemp; "Purchase Price Temp"."Tender Result") { }
            column(Country_PurchasePriceTemp; "Purchase Price Temp".Country) { }
            column(SampleRequired_PurchasePriceTemp; "Purchase Price Temp"."Sample Required") { }
            column(SampleSize_PurchasePriceTemp; "Purchase Price Temp"."Sample Size") { }
            column(Company_PurchasePriceTemp; "Purchase Price Temp".Company) { }
            column(CurrentPrice_PurchasePriceTemp; "Purchase Price Temp"."Current Price") { }
            column(Variance_PurchasePriceTemp; "Purchase Price Temp".Variance) { }
            column(Prefered_PurchasePriceTemp; "Purchase Price Temp".Prefered) { }
            column(Description2_PurchasePriceTemp; "Purchase Price Temp"."Description 2") { }
            column(Attachment_PurchasePriceTemp; "Purchase Price Temp".Attachment) { }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }
}
