#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50128 pageextension50128 extends "General Journal Batches"
{
    layout
    {
        addafter("Bal. Account No.")
        {
            field(BatchApprovalNo; Rec.BatchApprovalNo)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the BatchApprovalNo field.';
            }
            field("Batch Workflow No. Series"; Rec."Batch Workflow No. Series")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Batch Workflow No. Series field.';
            }
            field(Status; Rec.Status)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Status field.';
            }
        }
        addafter("Allow Payment Export")
        {
            field("Responsibility Center"; Rec."Responsibility Center")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Responsibility Center field.';
            }
        }
    }
}
