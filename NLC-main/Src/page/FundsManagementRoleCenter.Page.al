
#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193966 "Funds Management Role Center"
{
    Caption = 'Role Center- Funds Management';
    PageType = RoleCenter;
    ApplicationArea = All;

    layout
    {
        area(rolecenter)
        {
            group(Control12)
            {
                part(Control11; "Finance Performance")
                {
                    Visible = false;
                }
                part(Control10; "Funds Management Activities") { }
                systempart(Control9; Outlook) { }
            }
            group(Control8)
            {
                part(Control7; "Trailing Sales Orders Chart")
                {
                    Visible = false;
                }
                part(Control6; "My Job Queue")
                {
                    Visible = false;
                }
                part(Control5; "Cash Flow Forecast Chart") { }
                part(Control4; "My Customers") { }
                part(Control3; "My Vendors") { }
                part(Control2; "Copy Profile") { }
                systempart(Control1; MyNotes) { }
            }
        }
    }

    actions
    {
        area(Creation)
        {
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                action("Posted Sales Invoices")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Sales Invoices';
                    Image = PostedOrder;
                    RunObject = page "Posted Sales Invoices";
                    ToolTip = 'Executes the Posted Sales Invoices action.';
                }
                action("Posted Sales Credit Memos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Sales Credit Memos';
                    Image = PostedOrder;
                    RunObject = page "Posted Sales Credit Memos";
                    ToolTip = 'Executes the Posted Sales Credit Memos action.';
                }
                action("Posted Purchase Invoices")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Purchase Invoices';
                    RunObject = page "Posted Purchase Invoices";
                    ToolTip = 'Executes the Posted Purchase Invoices action.';
                }
                action("<Page 39005569 >")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted InterBank Transfer';
                    ToolTip = 'Executes the Posted InterBank Transfer action.';
                    //RunObject = Page UnknownPage39006033;
                }
                action("<Page 39005565>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Payment Voucher';
                    Image = VendorPayment;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = page "Posted Payment Vouchers List";
                    RunPageMode = Create;
                    RunPageView = where(Status = filter(Posted),
                                        Posted = filter(true),
                                        "Payment Type" = const(Normal));
                    ToolTip = 'Executes the Posted Payment Voucher action.';
                }
                action("<Page 39005585 >")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Receipts';
                    Image = ReceivableBill;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = page "Posted Receipt List";
                    RunPageMode = Edit;
                    RunPageView = where(Posted = filter(true));
                    ToolTip = 'Executes the Posted Receipts action.';
                }
                action("<Page 39005567 >")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Petty Cash';
                    Image = Payment;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = page "Posted Petty Cash Vouchers";
                    RunPageMode = Create;
                    RunPageView = where(Status = filter(Posted),
                                        Posted = filter(true),
                                        "Payment Type" = const("Petty Cash"));
                    ToolTip = 'Executes the Posted Petty Cash action.';
                }
                action("<Page 39005571 >")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Staff Travel Advance';
                    Image = Travel;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = page "Workplan Budget Creation";
                    RunPageMode = Create;
                    ToolTip = 'Executes the Posted Staff Travel Advance action.';
                }
                action("<Page 39005573 >")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Staff Travel Advance Accounting';
                    Image = Reconcile;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = page "Workplan Activities";
                    RunPageMode = Create;
                    ToolTip = 'Executes the Posted Staff Travel Advance Accounting action.';
                }
                action("<Page 39005579 >")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Staff Claims';
                    Image = InsertTravelFee;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = page "Posted Staff Claims List";
                    RunPageMode = Create;
                    RunPageView = where(Status = filter(Posted));
                    ToolTip = 'Executes the Posted Staff Claims action.';
                }
            }
        }
    }
}
