#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193968 "Supply Chain Mngt. Activities"
{
    PageType = List;
    SourceTable = "Supply Chain Management Cues";
    ApplicationArea = All;
    Caption = 'Supply Chain Mngt. Activities';
    layout
    {
        area(Content)
        {
            cuegroup(Group)
            {
                Caption = 'Contracts';
                field("Active Contracts"; Rec."Active Contracts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Active Contracts field.';
                }
                field("Renewed Contracts"; Rec."Renewed Contracts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Renewed Contracts field.';
                }
                field("Closed Contracts"; Rec."Closed Contracts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed Contracts field.';
                }

                actions
                {
                    action("Contract Details")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Contracts list";
                        ToolTip = 'Executes the Contract Details action.';
                    }
                    action("Free Note")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Purchase List";
                        ToolTip = 'Executes the Free Note action.';
                    }
                }
            }
            cuegroup(Valuations)
            {
                Caption = 'Valuations';
                field("Open Vendor Valuation"; Rec."Open Vendor Valuation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Open Vendor Valuation field.';
                }
                field("Pending Vendor Valuation"; Rec."Pending Vendor Valuation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pending Vendor Valuation field.';
                }
                field("Approved Vendor Valuation"; Rec."Approved Vendor Valuation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Vendor Valuation field.';
                }

                actions
                {
                    action("Vendor Valuation Creteria")
                    {
                        ApplicationArea = Basic;
                        RunObject = page "Evaluation Criteria List";
                        ToolTip = 'Executes the Vendor Valuation Creteria action.';
                    }
                }
            }
            cuegroup(WorkPlans)
            {
                Caption = 'WorkPlans';
                field("Open WorkPlans"; Rec."Open WorkPlans")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Open WorkPlans field.';
                }
                field("Pending WorkPlans"; Rec."Pending WorkPlans")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pending WorkPlans field.';
                }
                field("Approved WorkPlans"; Rec."Approved WorkPlans")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved WorkPlans field.';
                }
            }
            cuegroup(Tenders)
            {
                Caption = 'Tenders';
                field("Open Tenders"; Rec."Open Tenders")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Open Tenders field.';
                }
                field("Pending Tenders"; Rec."Pending Tenders")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pending Tenders field.';
                }
                field("Approved Tenders"; Rec."Approved Tenders")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Tenders field.';
                }
                cuegroup(Control21) { }
                field("Purchase Requisition"; Rec."Purchase Requisition")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Requisition field.';
                }
                field("Request For Quotation"; Rec."Request For Quotation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request For Quotation field.';
                }
                field("Restricted Tendering"; Rec."Restricted Tendering")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Restricted Tendering field.';
                }
                field("Dircet Procurement"; Rec."Dircet Procurement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dircet Procurement field.';
                }
                field("Low Value Procurement"; Rec."Low Value Procurement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Low Value Procurement field.';
                }
                field("Direct Procurement"; Rec."Direct Procurement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Direct Procurement field.';
                }
                field("Purchase Quote"; Rec."Purchase Quote")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Quote field.';
                }
                field("Purchase Order"; Rec."Purchase Order")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Order field.';
                }
                field("Purchase Invoice"; Rec."Purchase Invoice")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Invoice field.';
                }
                field("Open Tendering"; Rec."Open Tendering")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Open Tendering field.';
                }
            }
        }
    }

    actions { }
}
