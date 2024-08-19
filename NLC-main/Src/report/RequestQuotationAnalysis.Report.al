#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193698 "Request Quotation Analysis"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Request Quotation Analysis.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Request Quotation Analysis';
    dataset
    {
        dataitem("Purchase Quote Header"; "Purchase Quote Header")
        {
            DataItemTableView = sorting("Document Type", "No.");
            RequestFilterFields = "Document Type", "No.";
            column(ReportForNavId_1; 1) { }
            dataitem("Purchase Quote Line"; "Purchase Quote Line")
            {
                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                column(ReportForNavId_2; 2) { }
                dataitem("Purchase Line"; "Purchase Line")
                {
                    DataItemLink = "RFQ No." = field("Document No."), "RFQ Line No." = field("Line No.");
                    DataItemTableView = sorting("Unit Cost (LCY)") order(ascending);
                    column(ReportForNavId_3; 3) { }
                    column(UnitCostLCY_PurchaseLine; "Purchase Line"."Unit Cost (LCY)") { }
                    column(BuyfromVendorNo_PurchaseLine; "Purchase Line"."Buy-from Vendor No.") { }
                    column(DocumentNo_PurchaseLine; "Purchase Line"."Document No.") { }
                }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        Vend: Record Vendor;
}
