#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50138 pageextension50138 extends "Purchases & Payables Setup"
{
    layout
    {
        addafter("Posted Prepmt. Cr. Memo Nos.")
        {
            field("Stores Requisition No"; Rec."Stores Requisition No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Stores Requisition No field.';
            }
            field("Store Requisition Nos."; Rec."Store Requisition Nos.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Store Requisition Nos. field.';
            }
            field("Purchase Req No"; Rec."Purchase Req No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Purchase Req No field.';
            }
            field("Start Order from Requisition"; Rec."Start Order from Requisition")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Start Order from Requisition field.';
            }
            field("Requisition Default Vendor"; Rec."Requisition Default Vendor")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Requisition Default Vendor field.';
            }
            field("Quotation Request No"; Rec."Quotation Request No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Quatation Request No field.';
            }
            field("Appraisal Parameter No"; Rec."Appraisal Parameter No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Appraisal Parameter No field.';
            }
            field("Tender No"; Rec."Tender No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Tender No field.';
            }
            field("Contract No"; Rec."Contract No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Contract No field.';
            }
            field("Disposal Process Nos."; "Disposal Process Nos.")
            {
                ApplicationArea = all;
            }
            field(InternalMemoNos; "Internal Memo Nos.")
            {
                ApplicationArea = Basic;
            }
            field(AssetReceivingNo; "Asset Receiving No")
            {
                ApplicationArea = Basic;
            }
            field("Hotel Nos."; "Hotel Nos.")
            {

            }
        }
    }
}
