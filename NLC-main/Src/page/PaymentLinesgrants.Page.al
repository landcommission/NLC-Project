#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193817 "Payment Lines grants"
{
    PageType = CardPart;
    SourceTable = Customer;
    ApplicationArea = All;
    Caption = 'Payment Lines grants';
    layout
    {
        area(Content)
        {
            repeater(Control1102760000) { }
        }
    }

    actions { }


    var
        DefaultBatch: Record "Gen. Journal Batch";
        LineNo: Integer;
        CustLedger: Record "Vendor Ledger Entry";
        CustLedger1: Record "Vendor Ledger Entry";
        Amt: Decimal;
        TotAmt: Decimal;
        ApplyInvoice: Codeunit "Purchase Header Apply";
        AppliedEntries: Record "CshMgt Application";
        VendEntries: Record "Vendor Ledger Entry";
        PInv: Record "Purch. Inv. Header";
        VATPaid: Decimal;
        VATToPay: Decimal;
        PInvLine: Record "Purch. Inv. Line";
        VATBase: Decimal;
        [InDataSet]
        "Grant NoVisible": Boolean;
        [InDataSet]
        "Grant PhaseVisible": Boolean;
}
