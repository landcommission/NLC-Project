#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50143 pageextension50143 extends "Default Dimensions-Multiple"
{
    procedure SetMultiJob2(var Job: Record Job)
    begin
        TempDefaultDim2.DeleteAll();
        if Job.Find('-') then
            repeat
                CopyDefaultDimToDefaultDim(Database::Job, Job."No.");
            until Job.Next() = 0;
    end;

    //Unsupported feature: Property Modification (Subtype) on "SetMultiJob(PROCEDURE 8).Job(Parameter 1000)".
    var
        TempDefaultDim2: Record "Default Dimension" temporary;
}
