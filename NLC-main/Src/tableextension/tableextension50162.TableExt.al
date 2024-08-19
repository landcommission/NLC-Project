#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50162 tableextension50162 extends "FA Posting Group"
{

    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    FAAlloc.SETRANGE(Code,Code);
    FAAlloc.DELETEALL(TRUE);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    FAAlloc.SETRANGE(Code,Code);
    FAAlloc.DELETEALL(TRUE);

    TestNoEntriesExist(FIELDCAPTION("Acquisition Cost Account"),"Acquisition Cost Account");
    TestNoEntriesExist(FIELDCAPTION("Appreciation Account"),"Appreciation Account");
    TestNoEntriesExist(FIELDCAPTION("Accum. Depreciation Account"),"Accum. Depreciation Account");
    */
    //end;


    //Unsupported feature: Code Insertion on "OnModify".

    //trigger OnModify()
    //begin
    /*
     {
    TestNoEntriesExist(FIELDCAPTION("Acquisition Cost Account"),"Acquisition Cost Account");
    TestNoEntriesExist(FIELDCAPTION("Appreciation Account"),"Appreciation Account");
    TestNoEntriesExist(FIELDCAPTION("Accum. Depreciation Account"),"Accum. Depreciation Account");
      }
    */
    //end;


    //Unsupported feature: Code Insertion on "OnRename".

    //trigger OnRename()
    //begin
    /*

    TestNoEntriesExist(FIELDCAPTION("Acquisition Cost Account"),"Acquisition Cost Account");
    TestNoEntriesExist(FIELDCAPTION("Appreciation Account"),"Appreciation Account");
    TestNoEntriesExist(FIELDCAPTION("Accum. Depreciation Account"),"Accum. Depreciation Account");
    */
    //end;

    procedure TestNoEntriesExist(CurrentFieldName: Text[100]; GLNO: Code[20])
    var
        GLLedgEntry: Record "G/L Entry";
    begin

        //FALED.SETCURRENTKEY(GLLedgEntry."G/L Account No.");
        FALed.Reset();
        FALed.SetRange(FALed."FA Posting Group", Rec.Code);
        if FALed.Find('-') then
            Error(
            Text000,
             CurrentFieldName);
    end;

    var
        Text000: Label 'You cannot change %1 because there are one or more ledger entries associated with this account.';
        FALed: Record "FA Ledger Entry";
}
