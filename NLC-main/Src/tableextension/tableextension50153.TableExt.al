#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50153 tableextension50153 extends "Job Entry No."
{
    procedure GetNextEntryNo(): Integer
    begin
        Rec.LockTable();
        if not Rec.Get() then
            Rec.Insert();
        Rec."Entry No." := Rec."Entry No." + 1;
        Rec.Modify();
        exit(Rec."Entry No.");
    end;
}
