#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50137 tableextension50137 extends "Bank Account Posting Group"
{
    fields
    {

        //Unsupported feature: Code Modification on ""G/L Bank Account No."(Field 2).OnValidate".

        //trigger "(Field 2)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CheckGLAcc("G/L Bank Account No.");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CheckGLAcc("G/L Bank Account No.");
         //Prevent deletion once entries exist
        TestNoEntriesExist(FIELDCAPTION(Code));
        */
        //end;
    }


    //Unsupported feature: Code Insertion on "OnModify".

    //trigger OnModify()
    //begin
    /*

    //Prevent deletion once entries exist
    TestNoEntriesExist(FIELDCAPTION(Code));
    */
    //end;

    procedure TestNoEntriesExist(CurrentFieldName: Text[100])
    var
        LedgEntry: Record "Bank Account Ledger Entry";
    begin
        //To prevent change of field
        LedgEntry.SetCurrentKey(LedgEntry."Bank Acc. Posting Group");
        LedgEntry.SetRange(LedgEntry."Bank Acc. Posting Group", Rec.Code);
        if LedgEntry.Find('-') then
            Error(
                Text001,
              CurrentFieldName);
    end;

    var
        Text001: Label 'You cannot Delete/Modify the contents of the %1 field because this %2 has one or more  ledger entries posted with this code.';
}
