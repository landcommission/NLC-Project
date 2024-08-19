#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50115 pageextension50115 extends "Purchase List"
{

    //Unsupported feature: Property Insertion (SourceTableView) on ""Purchase List"(Page 53)".


    //Unsupported feature: Property Insertion (CardPageID) on ""Purchase List"(Page 53)".

    layout
    {
        addafter("No.")
        {
            field("Posting Description"; Rec."Posting Description")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies additional posting information for the document. After you post the document, the description can add detail to vendor and customer ledger entries.';
            }
        }
    }
}
