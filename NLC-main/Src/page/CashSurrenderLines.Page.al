#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193815 "Cash Surrender Lines"
{
    PageType = ListPart;
    SourceTable = "Cust. Ledger Entry";
    ApplicationArea = All;
    Caption = 'Cash Surrender Lines';
    layout
    {
        area(Content)
        {
            repeater(Control1102760000) { }
        }
    }

    actions { }



    procedure SetSurrDoc(var SurrDocNo: Code[20]; var LineNo: Code[20])
    begin
        /*{
        SurrenderDocVar:=SurrDocNo;
        CashPaymentsLine.RESET;
        CashPaymentsLine.SETRANGE(CashPaymentsLine.No,LineNo);
        IF CashPaymentsLine.FIND('-') THEN BEGIN
         REPEAT
          CashPaymentsLine."Temp Surr Doc":=SurrDocNo;
          CashPaymentsLine.MODIFY;
         UNTIL CashPaymentsLine.NEXT=0;
        END;
          }*/

    end;
}
