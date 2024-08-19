#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50125 tableextension50125 extends "Purch. Rcpt. Line"
{
    fields
    {
        field(50061; t; Code[10])
        {
            Caption = 't';
            DataClassification = CustomerContent;
        }
    }


    //Unsupported feature: Code Modification on "InsertInvLineFromRcptLine(PROCEDURE 2)".

    //procedure InsertInvLineFromRcptLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SETRANGE("Document No.","Document No.");

    TempPurchLine := PurchLine;
    #4..65
      PurchLine.Quantity := 0;
      PurchLine."Outstanding Qty. (Base)" := 0;
      PurchLine."Outstanding Quantity" := 0;
      PurchLine."Quantity Received" := 0;
      PurchLine."Qty. Received (Base)" := 0;
      PurchLine."Quantity Invoiced" := 0;
      PurchLine."Qty. Invoiced (Base)" := 0;
    #73..124
      IF "Attached to Line No." = 0 THEN
        SETRANGE("Attached to Line No.","Line No.");
    UNTIL (NEXT = 0) OR ("Attached to Line No." = 0);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..68
      PurchLine.l8 := 0;
    #70..127
    */
    //end;
}
