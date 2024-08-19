#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
codeunit 50033 "Update Analysis View410"
{
    var

    [Scope('OnPrem')]
    procedure UpdateAnalysisView_Budget(Rec: Record "Analysis View")
    var
        MaxNumber: Integer;
        Updatanalysisview: Codeunit "Update Analysis View";
        Text000: Label 'Do you want to update %1 %2?';
    begin
        //Will Update Analysis View from Budgetary Control
        MaxNumber := 2147483647;
        if Rec.Code <> '' then
            if Confirm(Text000, true, Rec.TableCaption, Rec.Code) then begin
                Rec.Modify();
                //Updatanalysisview.UpdateOne(Rec, 2, TRUE);
                Updatanalysisview.Update(Rec, 2, true);
            end;
    end;

}
