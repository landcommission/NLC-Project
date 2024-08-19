#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50117 tableextension50117 extends "Customer Posting Group"
{
    fields
    {

        //Unsupported feature: Code Modification on ""Receivables Account"(Field 2).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CheckGLAcc("Receivables Account",FALSE,FALSE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CheckGLAcc("Receivables Account",FALSE,FALSE);

        //Prevent deletion once entries exist
        TestNoEntriesExist(FIELDCAPTION(Code));
        */
        //end;
    }


    //Unsupported feature: Code Insertion on "OnDelete".

    //trigger OnDelete()
    //var
    //LedgEntry: Record "Cust. Ledger Entry";
    //begin
    /*

    //Prevent deletion once entries exist
    TestNoEntriesExist(FIELDCAPTION(Code));
      LedgEntry.SETCURRENTKEY(LedgEntry."Customer Posting Group");
    LedgEntry.SETRANGE("Customer Posting Group",Code);
    IF LedgEntry.FIND('-') THEN
      ERROR(
          Text002);
    */
    //end;

    procedure TestNoEntriesExist(CurrentFieldName: Text[100])
    var
        LedgEntry: Record "Cust. Ledger Entry";
        Custled: Record "Cust. Ledger Entry";
    begin
        //To prevent change of field
        /*  LedgEntry.SETCURRENTKEY(LedgEntry."Customer Posting Group");
        LedgEntry.SETRANGE("Customer Posting Group",Code);
        IF LedgEntry.FIND('-') THEN
          ERROR(
              Text001,
            CurrentFieldName);
            */

        Custled.Reset();
        Custled.SetRange(Custled."Customer Posting Group", Rec.Code);
        if Custled.Find('-') then
            Error(
           Text001,
             CurrentFieldName);

    end;

    var
        Text001: Label 'You cannot Modify the contents of the Customer Posting Group it has one or more  ledger entries posted with this code.';
        Text002: Label 'You cannot delete the contents of the Customer Posting Group it has one or more  ledger entries posted with this code.';
}
