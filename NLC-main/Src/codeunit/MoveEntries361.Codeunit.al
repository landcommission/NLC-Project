#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
codeunit 50032 MoveEntries361
{
    var
        AccountingPeriod: Record "Accounting Period";
        Text000: Label 'You cannot delete %1 %2 because it has ledger entries in a fiscal year that has not been closed yet.';
        Text001: Label 'You cannot delete %1 %2 because there are one or more open ledger entries.';
        Text002: Label 'There are item entries that have not been adjusted for item %1. ';
        Text003: Label 'If you delete this item the inventory valuation will be incorrect. ';
        Text004: Label 'Use the %2 batch job before deleting the item.';
        Text005: Label 'Adjust Cost - Item Entries';
        Text006: Label 'You cannot delete %1 %2 because it has ledger entries.';
        Text007: Label 'You cannot delete %1 %2 because there are outstanding purchase order lines.';
        Text008: Label 'There are item entries that have not been completely invoiced for item %1. ';
        Text009: Label 'Invoice all item entries before deleting the item.';
        JobLedgEntry: Record "Job-Ledger Entry";
        PurchOrderLine: Record "Purchase Line";

        InvtAdjmtEntryOrder: Record "Inventory Adjmt. Entry (Order)";
        ServLedgEntry: Record "Service Ledger Entry";
        WarrantyLedgEntry: Record "Warranty Ledger Entry";
        Text015: Label 'You cannot delete %1 %2 because there are outstanding purchase return order lines.';


    procedure MoveJobEntries2(Job: Record Jobs)
    begin
        JobLedgEntry.SetCurrentKey("Job No.");
        JobLedgEntry.SetRange("Job No.", Job."No.");

        JobLedgEntry.LockTable();
        if JobLedgEntry.Find('-') then
            Error(
              Text006,
              Job.TableCaption, Job."No.");

        PurchOrderLine.SetCurrentKey("Document Type");
        PurchOrderLine.SetFilter(
          "Document Type", '%1|%2',
          PurchOrderLine."Document Type"::Order,
          PurchOrderLine."Document Type"::"Return Order");
        PurchOrderLine.SetRange("Job No.", Job."No.");
        if PurchOrderLine.Find('-') then begin
            if PurchOrderLine."Document Type" = PurchOrderLine."Document Type"::Order then
                Error(Text007, Job.TableCaption, Job."No.");
            if PurchOrderLine."Document Type" = PurchOrderLine."Document Type"::"Return Order" then
                Error(Text015, Job.TableCaption, Job."No.");
        end;

        ServLedgEntry.LockTable();

        ServLedgEntry.Reset();
        ServLedgEntry.SetRange("Job No.", Job."No.");
        AccountingPeriod.SetRange(Closed, false);
        if AccountingPeriod.Find('-') then
            ServLedgEntry.SetFilter("Posting Date", '>=%1', AccountingPeriod."Starting Date");
        if ServLedgEntry.Find('-') then
            Error(
              Text000,
              Job.TableCaption, Job."No.");

        ServLedgEntry.SetRange("Posting Date");
        ServLedgEntry.SetRange(Open, true);
        if ServLedgEntry.Find('+') then
            Error(
              Text001,
              Job.TableCaption, Job."No.");

        ServLedgEntry.SetRange(Open);
        ServLedgEntry.ModifyAll("Job No.", '');
    end;

}
