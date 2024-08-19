#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 50087 "Dep Consumption Report"
{
    WordLayout = './Layouts/DepConsumptionReport.docx';
    DefaultLayout = Word;

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            DataItemTableView = where("Global Dimension 1 Code" = filter(<> ''), "Entry Type" = const("Negative Adjmt."));
            RequestFilterFields = "Global Dimension 1 Code", "Posting Date", "Document No.", "Item No.";
            column(ReportForNavId_1; 1) { } // Autogenerated by ForNav - Do not delete
            column(ReportForNav_Table32; ReportForNavWriteDataItem('Table32', "Item Ledger Entry")) { }
            column(DocumentNo_ItemLedgerEntry; "Item Ledger Entry"."Document No.")
            {
            }
            column(PostingDate_ItemLedgerEntry; "Item Ledger Entry"."Posting Date")
            {
            }
            column(ItemNo_ItemLedgerEntry; "Item Ledger Entry"."Item No.")
            {
            }
            column(UnitofMeasureCode_ItemLedgerEntry; "Item Ledger Entry"."Unit of Measure Code")
            {
            }
            column(UnitCost; UnitCost)
            {
            }
            column(LineAmount; LineAmount)
            {
            }
            column(CI_Picture; CI.Picture)
            {
            }
            column(TrendDateFilter; TrendDateFilter)
            {
            }
            column(TotalLineAmt; TotalLineAmt)
            {
            }
            column(Descrip; Descrip)
            {
            }
            column(Qty; Qty)
            {
            }

            trigger OnAfterGetRecord();
            begin
                Qty := 0; // Inserted by ForNAV
                TotalLineAmt := 0;
                line := 0;
                StoreReqLine.Reset;
                StoreReqLine.SetRange(StoreReqLine."Requistion No", "Document No.");
                StoreReqLine.SetRange(StoreReqLine."No.", "Item No.");
                if StoreReqLine.Find('-') then begin
                    UnitCost := StoreReqLine."Unit Cost";
                    LineAmount := StoreReqLine."Line Amount";
                    Description := StoreReqLine.Description;
                end;
                if ItemRec.Get("Item Ledger Entry"."Item No.") then
                    Descrip := ItemRec.Description;
                Qty := Abs("Item Ledger Entry".Quantity);
                if "Item Ledger Entry"."Document No." = 'OPENING STOCK'
                then
                    CurrReport.Skip;
                if "Item Ledger Entry"."Document No." = 'ADJUST STOCK'
                then
                    CurrReport.Skip;
                if "Item Ledger Entry"."Document No." = 'STOCK BL'
                then
                    CurrReport.Skip;
                if "Item Ledger Entry"."Document No." = 'STOCK BALANCE'
                then
                    CurrReport.Skip;
                if "Item Ledger Entry"."Document No." = 'STOCKBL'
                then
                    CurrReport.Skip;
                if "Item Ledger Entry"."Document No." = 'STBLADJUST'
                then
                    CurrReport.Skip;
                if "Item Ledger Entry"."Document No." = 'STOCK BALANCE'
                then
                    CurrReport.Skip;
                if "Item Ledger Entry"."Document Type" = "document type"::"Purchase Receipt"
                then
                    CurrReport.Skip;
                if "Item Ledger Entry"."Document Type" = "document type"::"Purchase Invoice"
                then
                    CurrReport.Skip;
                if "Item Ledger Entry"."Document Type" = "document type"::"Purchase Credit Memo"
                then
                    CurrReport.Skip;
                dimension.Reset;
                dimension.SetRange(dimension.Code, "Item Ledger Entry"."Global Dimension 2 Code");
                if dimension.Find('-') then begin
                    DepName := dimension.Name;
                end;
                ItemLedgerEntry.Reset;
                ItemLedgerEntry.SetRange(ItemLedgerEntry."Global Dimension 2 Code", "Item Ledger Entry"."Global Dimension 2 Code");
                if ItemLedgerEntry.Find('-') then begin
                    repeat
                        line := line + LineAmount;
                        TotalLineAmt := TotalLineAmt + LineAmount;
                    //error(format(TotalLineAmt))  ;
                    //error(format(TotalLineAmt))   ;
                    until ItemLedgerEntry.Next = 0;
                end
            end;

        }
    }
    requestpage
    {
        SaveValues = false;
        layout
        {
        }

    }

    trigger OnPreReport()
    begin
        CI.Reset;
        CI.Get();
        CI.CalcFields(CI.Picture);
        TrendFilter := "Item Ledger Entry".GetFilters;
        TrendDateFilter := "Item Ledger Entry".GetFilter("Posting Date");
        ;
        ReportsForNavPre;

    end;

    var
        UnitCost: Decimal;
        StoreReqLine: Record "Store Requistion Line";
        LineAmount: Decimal;
        CI: Record "Company Information";
        TrendFilter: Text[250];
        TrendDateFilter: Text[30];
        Description: Text[100];
        dimension: Record 349;
        DepName: Text[50];
        TotalLineAmt: Decimal;
        ItemLedgerEntry: Record "Item Ledger Entry";
        line: Decimal;
        Descrip: Text[250];
        ItemRec: Record Item;
        Qty: Decimal;

    trigger OnInitReport();
    begin

    end;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var

        ReportForNavTotalsCausedBy: Integer;
        ReportForNavInitialized: Boolean;
        ReportForNavShowOutput: Boolean;



    local procedure ReportsForNavPre()
    begin
    end;

    local procedure ReportForNavSetTotalsCausedBy(value: Integer)
    begin
        ReportForNavTotalsCausedBy := value;
    end;

    local procedure ReportForNavSetShowOutput(value: Boolean)
    begin
        ReportForNavShowOutput := value;
    end;



    local procedure ReportForNavWriteDataItem(dataItemId: Text; rec: Variant): Text
    var
        values: Text;
        jsonObject: JsonObject;
        currLanguage: Integer;
    begin
        if not ReportForNavInitialized then begin

            ReportForNavInitialized := true;
        end;

        case (dataItemId) of
            'Table32':
                begin
                    currLanguage := GlobalLanguage;
                    GlobalLanguage := 1033;
                    jsonObject.Add('DataItem$Table32$CurrentKey$Text', "Item Ledger Entry".CurrentKey);
                    GlobalLanguage := currLanguage;
                end;
        end;

        jsonObject.WriteTo(values);
        exit(values);
    end;
    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
