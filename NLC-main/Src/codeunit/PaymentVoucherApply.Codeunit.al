#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
codeunit 52193455 "Payment Voucher Apply"
{
    TableNo = "Payment Line";

    trigger OnRun()
    begin
        PVLine.Copy(Rec);
        begin
            PayToVendorNo := PVLine."Account No.";
            VendLedgEntry.SetCurrentKey("Vendor No.", Open);
            VendLedgEntry.SetRange("Vendor No.", PayToVendorNo);
            VendLedgEntry.SetRange(Open, true);
            if PVLine."Applies-to ID" = '' then
                PVLine."Applies-to ID" := PVLine.No;
            if PVLine."Applies-to ID" = '' then
                Error(
                  Text000,
                  PVLine.FieldCaption(PVLine.No), PVLine.FieldCaption(PVLine."Applies-to ID"));
            //ApplyVendEntries."SetPVLine-Delete"(PVLine,PVLine.FIELDNO("Applies-to ID"));
            ApplyVendEntries.SetPVLine(PVLine, VendLedgEntry, PVLine.FieldNo("Applies-to ID"));
            ApplyVendEntries.SetRecord(VendLedgEntry);
            ApplyVendEntries.SetTableView(VendLedgEntry);
            ApplyVendEntries.LookupMode(true);
            OK := ApplyVendEntries.RunModal() = Action::LookupOK;
            Clear(ApplyVendEntries);
            if not OK then
                exit;
            VendLedgEntry.Reset();
            VendLedgEntry.SetCurrentKey("Vendor No.", Open);
            VendLedgEntry.SetRange("Vendor No.", PayToVendorNo);
            VendLedgEntry.SetRange(Open, true);
            VendLedgEntry.SetRange("Applies-to ID", PVLine."Applies-to ID");
            if VendLedgEntry.Find('-') then begin
                PVLine."Applies-to Doc. Type" := 0;
                PVLine."Applies-to Doc. No." := '';
            end else
                PVLine."Applies-to ID" := '';

            PVLine.Modify();
        end;
    end;

    var
        Text000: Label 'You must specify %1 or %2.';
        PVLine: Record "Payment Line";
        VendLedgEntry: Record "Vendor Ledger Entry";
        PayToVendorNo: Code[20];
        OK: Boolean;
        ApplyVendEntries: Page "Apply Vendor Entries";
}
