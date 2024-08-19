pageextension 50166 "Request To Approve Ext" extends "Requests to Approve"
{
    actions
    {
        addfirst(processing)
        {
            action("Transport Requisition Allocation")
            {
                ApplicationArea = Basic;
                Caption = 'Transport Allocation';
                Ellipsis = true;
                Image = Add;
                Promoted = true;
                PromotedCategory = New;
                RunObject = page "HR Transport Req Allocation";
                RunPageLink = "Transport Request No" = field("Document No.");
                ToolTip = 'Executes the Transport Allocation action.';

            }
        }
    }
}
