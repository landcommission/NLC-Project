/* #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50146 pageextension50146 extends "Approval Setup"
{
    layout
    {
        modify(Cancellations)
        {
            Visible = false;
        }
        modify(Rejections)
        {
            Visible = false;
        }
        modify(Delegations)
        {
            Visible = false;
        }
        addafter("Request Rejection Comment")
        {
            field("Responsibility Center Required";Rec."Responsibility Center Required")
            {
                ApplicationArea = Basic;
            }
        }
    }
}
 */