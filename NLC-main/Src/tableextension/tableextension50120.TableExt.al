#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50120 tableextension50120 extends "G/L Budget Name"
{
    fields
    {
        field(50002; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Approved';
            OptionMembers = Open,"Pending Approval",Approved;
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        field(50005; "Responsibility Center"; Code[20])
        {
            Caption = 'Responsibility Center';
            DataClassification = CustomerContent;
            // //TableRelation = Table39005929;
        }
    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GLBudgetEntry.SETCURRENTKEY("Budget Name");
    GLBudgetEntry.SETRANGE("Budget Name",Name);
    GLBudgetEntry.DELETEALL(TRUE);

    AnalysisViewBudgetEntry.SETRANGE("Budget Name",Name);
    AnalysisViewBudgetEntry.DELETEALL(TRUE);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*

    GLBudgetEntry.SETCURRENTKEY("Budget Name");
    GLBudgetEntry.SETRANGE("Budget Name",Name);
    IF GLBudgetEntry.FINDFIRST THEN
        ERROR('The Budget '+Name+' has Entries, Cannot be deleted');
    #3..6
    */
    //end;
}
