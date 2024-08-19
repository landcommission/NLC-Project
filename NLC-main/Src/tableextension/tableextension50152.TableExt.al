#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50152 tableextension50152 extends "Job Planning Line"
{

    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ValidateModification;

    IF "Usage Link" THEN BEGIN
    #4..8
    END;

    IF (Quantity <> 0) AND ItemExists("No.") THEN BEGIN
      JobPlanningLineReserve.DeleteLine(Rec);
      CALCFIELDS("Reserved Qty. (Base)");
      TESTFIELD("Reserved Qty. (Base)",0);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..11
     // JobPlanningLineReserve.DeleteLine(Rec);
    #13..15
    */
    //end;
}
