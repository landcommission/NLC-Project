#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50152 pageextension50152 extends "Job Task Lines"
{
    actions
    {
        addafter("<Action49>")
        {
            action("FA WIP Cost Transfer")
            {
                ApplicationArea = Basic;
                Caption = 'FA WIP Cost Transfer';
                Image = TransferToLines;
                ToolTip = 'Executes the FA WIP Cost Transfer action.';
                trigger OnAction()
                begin
                    Rec.TestField(Rec."Job No.");


                    Job.Get(Rec."Job No.");
                    if Job.Blocked = Job.Blocked::All then
                        Job.TestBlocked();

                    Clear(Job);
                    Job.SetRange("No.", Rec."Job No.");
                    Job.FindFirst();

                    Report.RunModal(Report::"Convert WIP to FA", true, false, Job);
                end;
            }
        }
    }

    var
        Job: Record Job;
}
