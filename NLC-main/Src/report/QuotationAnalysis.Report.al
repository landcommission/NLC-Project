#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193697 "Quotation Analysis"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Quotation Analysis.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Quotation Analysis';
    dataset
    {
        dataitem(RFQHeader; "Purchase Header")
        {
            DataItemTableView = where("Document Type" = filter(Quote), DocApprovalType = filter(Quote));
            RequestFilterFields = "Vendor Quote No.", "No.", "Vendor Posting Group", "Buy-from Vendor No.", "Request for Quote No.";
            column(ReportForNavId_1; 1) { }
            dataitem(Quote; "Purchase Header")
            {
                DataItemTableView = sorting("Document Type", "No.") where("Document Type" = filter(Quote), DocApprovalType = filter(Quote));
                column(ReportForNavId_2; 2) { }
                dataitem(PurchLines; "Purchase Line")
                {
                    DataItemLink = "Document No." = field("No.");
                    DataItemTableView = sorting("Document Type", "Document No.", "Line No.") order(ascending) where("Document Type" = filter(Quote));
                    column(ReportForNavId_3; 3) { }
                    column(Description_PurchLines; PurchLines.Description) { }
                    column(Description2_PurchLines; PurchLines."Description 2") { }
                    column(No_PurchLines; PurchLines."No.") { }
                    dataitem(RFQLines; "Purchase Line")
                    {
                        DataItemTableView = sorting("Document Type", "Document No.", "Line No.") order(ascending) where("Document Type" = filter(Quote));
                        column(ReportForNavId_4; 4) { }
                        column(UnitofMeasure_RFQLines; RFQLines."Unit of Measure") { }
                        column(Quantity_RFQLines; RFQLines.Quantity) { }
                        column(BuyfromVendorNo_RFQLines; RFQLines."Buy-from Vendor No.") { }
                        column(Vno; VNo) { }
                        column(Vendors_Name; Vendors.Name) { }
                        column(Amount_RFQLines; RFQLines.Amount) { }

                        trigger OnAfterGetRecord()
                        begin

                            ShowLine := true;
                            Headers.Reset();
                            //Headers.SETRANGE(Headers."Document Type",Headers."Document Type"::Quote);
                            //Headers.SETRANGE(Headers.DocApprovalType,Headers."Document Type"::Quote);
                            Headers.SetRange(Headers."No.", RFQLines."Document No.");
                            Headers.SetRange(Headers."Vendor Quote No.", RFQHeader."Vendor Quote No.");
                            if Headers.Find('-') = false then
                                ShowLine := false;
                            if Vendors.Get(RFQLines."Buy-from Vendor No.") then
                                VNo := VNo + 1;
                        end;

                        trigger OnPreDataItem()
                        begin

                            RFQLines.SetRange(RFQLines.Type, PurchLines.Type);
                            RFQLines.SetRange(RFQLines."No.", PurchLines."No.");
                        end;
                    }

                    trigger OnAfterGetRecord()
                    begin

                        TempPurchLines.Reset();
                        TempPurchLines.SetRange(TempPurchLines."No.", PurchLines."No.");
                        TempPurchLines.SetRange(TempPurchLines.Type, PurchLines.Type);
                        if TempPurchLines.Find('-') then
                            CurrReport.Skip()
                        else begin
                            TempPurchLines := PurchLines;
                            TempPurchLines.Insert();
                        end;
                        LineCount := LineCount + 1;
                        VNo := 0;
                    end;
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
        TempPurchLines: Record "Purchase Line" temporary;
        LineCount: Integer;
        Headers: Record "Purchase Header";
        ShowLine: Boolean;
        Vendors: Record Vendor;
        VNo: Integer;
}
