#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50119 tableextension50119 extends "Inventory Posting Group"
{

    //Unsupported feature: Code Insertion on "OnDelete".

    //trigger OnDelete()
    //begin
    /*

    //Prevent deletion once entries exist
    TestNoEntriesExist(FIELDCAPTION(Code));
    */
    //end;

    procedure TestNoEntriesExist(CurrentFieldName: Text[100])
    var
        ItemLedgEntry: Record "Value Entry";
    begin
        //To prevent change of field
        ItemLedgEntry.SetCurrentKey(ItemLedgEntry."Inventory Posting Group");
        ItemLedgEntry.SetRange("Inventory Posting Group", Rec.Code);
        if ItemLedgEntry.Find('-') then
            Error(
              Text001,
              CurrentFieldName);
    end;

    var
        Text001: Label 'You cannot delete the contents of the %1 field because this %2 has one or more  ledger entries posted with this code.';
}
