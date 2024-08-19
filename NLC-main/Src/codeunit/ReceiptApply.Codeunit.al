#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
codeunit 52193456 "Receipt Apply"
{
    TableNo = "Receipt Line";

    trigger OnRun()
    begin
        ReceiptLine.Copy(Rec);
        begin
            BilToCustNo := ReceiptLine."Account No.";
            CustLedgEntry.SetCurrentKey("Customer No.", Open);
            CustLedgEntry.SetRange("Customer No.", BilToCustNo);
            CustLedgEntry.SetRange(Open, true);
            if ReceiptLine."Applies-to ID" = '' then
                ReceiptLine."Applies-to ID" := ReceiptLine.No;
            if ReceiptLine."Applies-to ID" = '' then
                Error(
                  Text000,
                  ReceiptLine.FieldCaption(ReceiptLine.No), ReceiptLine.FieldCaption(ReceiptLine."Applies-to ID"));
            ApplyCustEntries.SetReceipts(ReceiptLine, CustLedgEntry, ReceiptLine.FieldNo("Applies-to ID"));
            ApplyCustEntries.SetRecord(CustLedgEntry);
            ApplyCustEntries.SetTableView(CustLedgEntry);
            ApplyCustEntries.LookupMode(true);
            OK := ApplyCustEntries.RunModal() = Action::LookupOK;
            Clear(ApplyCustEntries);
            if not OK then
                exit;
            CustLedgEntry.Reset();
            CustLedgEntry.SetCurrentKey("Customer No.", Open);
            CustLedgEntry.SetRange("Customer No.", BilToCustNo);
            CustLedgEntry.SetRange(Open, true);
            CustLedgEntry.SetRange("Applies-to ID", ReceiptLine."Applies-to ID");
            if CustLedgEntry.Find('-') then begin
                ReceiptLine."Applies-to Doc. Type" := 0;
                ReceiptLine."Applies-to Doc. No." := '';
            end else
                ReceiptLine."Applies-to ID" := '';

            ReceiptLine.Modify();
        end;
    end;

    var
        Text000: Label 'You must specify %1 or %2.';
        ReceiptLine: Record "Receipt Line";
        CustLedgEntry: Record "Cust. Ledger Entry";
        BilToCustNo: Code[20];
        OK: Boolean;
        ApplyCustEntries: Page "Apply Customer Entries";
}
