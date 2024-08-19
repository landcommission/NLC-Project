#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50124 pageextension50124 extends "Posted Purchase Rcpt. Subform"
{
    var
        "Purch.Rcpt.Line-Undo": Record "Purch. Rcpt. Line-Undo";
        UndoQuantity: Decimal;


    //Unsupported feature: Code Insertion on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //begin
    /*
    "Purch.Rcpt.Line-Undo".RESET;
    "Purch.Rcpt.Line-Undo".SETRANGE("Purch.Rcpt.Line-Undo"."Line No.","Line No.");
    "Purch.Rcpt.Line-Undo".SETRANGE("Purch.Rcpt.Line-Undo"."Document No.","Document No.");
    IF "Purch.Rcpt.Line-Undo".FIND('-') THEN BEGIN
     UndoQuantity:="Purch.Rcpt.Line-Undo"."Quantity To Undo";
    END;
    */
    //end;


    //Unsupported feature: Code Insertion on "OnOpenPage".

    //trigger OnOpenPage()
    //begin
    /*
    "Purch.Rcpt.Line-Undo".RESET;
    "Purch.Rcpt.Line-Undo".SETRANGE("Purch.Rcpt.Line-Undo"."Line No.","Line No.");
    "Purch.Rcpt.Line-Undo".SETRANGE("Purch.Rcpt.Line-Undo"."Document No.","Document No.");
    IF "Purch.Rcpt.Line-Undo".FIND('-') THEN BEGIN
     UndoQuantity:="Purch.Rcpt.Line-Undo"."Quantity To Undo";
    END;
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: PurchLine) (VariableCollection) on "UndoReceiptLine(PROCEDURE 2)".



    //Unsupported feature: Code Modification on "UndoReceiptLine(PROCEDURE 2)".

    //procedure UndoReceiptLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    PurchRcptLine.COPY(Rec);
    CurrPage.SETSELECTIONFILTER(PurchRcptLine);
    CODEUNIT.RUN(CODEUNIT::"Undo Purchase Receipt Line",PurchRcptLine);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF UndoQuantity=0 THEN ERROR('Enter the quantity to return so as to continue');

    IF UndoQuantity>Quantity THEN ERROR('Quantity to undo cannot be greater than the original received quantity');

    PurchRcptLine.COPY(Rec);

    //Added-------------copy from tbl 121 to 39006027 ---Ampath
     "Purch.Rcpt.Line-Undo".TRANSFERFIELDS(Rec,TRUE);
     "Purch.Rcpt.Line-Undo".INSERT(TRUE);

    "Purch.Rcpt.Line-Undo".RESET;
    "Purch.Rcpt.Line-Undo".SETRANGE("Purch.Rcpt.Line-Undo"."Line No.","Line No.");
    "Purch.Rcpt.Line-Undo".SETRANGE("Purch.Rcpt.Line-Undo"."Document No.","Document No.");
    IF "Purch.Rcpt.Line-Undo".FIND('-') THEN BEGIN
      "Purch.Rcpt.Line-Undo"."Quantity To Undo":=UndoQuantity;
      "Purch.Rcpt.Line-Undo".MODIFY;
    END;

    CurrPage.SETSELECTIONFILTER(PurchRcptLine);

    CODEUNIT.RUN(CODEUNIT::"Undo Purchase Receipt Line",PurchRcptLine);

    //Added--for AMPATH  ****
    PurchLine.RESET;
    PurchLine.SETRANGE(PurchLine."Document No.",PurchRcptLine."Order No.");
    PurchLine.SETRANGE(PurchLine."Line No.","Line No.");
    IF PurchLine.FIND('-') THEN BEGIN
      PurchLine."Qty. to Invoice":=PurchRcptLine.Quantity-UndoQuantity;
      PurchLine.MODIFY;
    END;
    */
    //end;

    local procedure CopyLinesToUndotbl()
    var
        "Purch.Rcpt.Line-Undo": Record "Purch. Rcpt. Line-Undo";
        "Purch.Rcpt.Line": Record "Purch. Rcpt. Line";
    begin
        "Purch.Rcpt.Line".Reset();
        "Purch.Rcpt.Line".SetRange("Purch.Rcpt.Line"."Document No.", Rec."Document No.");
        if "Purch.Rcpt.Line".Find('-') then
            repeat
                "Purch.Rcpt.Line-Undo".TransferFields("Purch.Rcpt.Line", true);
                "Purch.Rcpt.Line-Undo".Insert(true);
            until "Purch.Rcpt.Line".Next() = 0;
    end;
}
