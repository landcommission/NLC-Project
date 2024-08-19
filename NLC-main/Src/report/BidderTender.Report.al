#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193727 "Bidder Tender"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Bidder Tender.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Bidder Tender';
    dataset
    {
        dataitem("Bidder Tender"; "Bidder Tender")
        {
            column(ReportForNavId_1; 1) { }
            column(TenderID_BidderTender; "Bidder Tender"."Tender ID") { }
            column(PINNo_BidderTender; "Bidder Tender"."PIN No.") { }
            column(DateCreated_BidderTender; "Bidder Tender"."Date Created") { }
            column(CreatedBy_BidderTender; "Bidder Tender"."Created By") { }
            column(ReceiptNo_BidderTender; "Bidder Tender"."Receipt No.") { }
            column(NonRefundableFee_BidderTender; "Bidder Tender"."Non Refundable Fee") { }
            column(Status_BidderTender; "Bidder Tender".Status) { }
            column(Comment_BidderTender; "Bidder Tender".Comment) { }
            column(SerialNo_BidderTender; "Bidder Tender"."Serial No") { }
            column(Email_BidderTender; "Bidder Tender".Email) { }
            column(TendererNames_BidderTender; "Bidder Tender"."Tenderer Names") { }
            column(TelephoneNo_BidderTender; "Bidder Tender"."Telephone No") { }
            column(WitnessNames_BidderTender; "Bidder Tender"."Witness Names") { }
            column(TenderName_BidderTender; "Bidder Tender"."Tender Name") { }
            column(PostedToPortal_BidderTender; "Bidder Tender"."Posted To Portal") { }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }
}
