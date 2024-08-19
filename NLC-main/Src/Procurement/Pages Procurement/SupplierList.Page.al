#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50127 "Supplier List"
{
    Caption = 'Supplier List';
    CardPageID = "Supplier Card";
    Editable = true;
    InsertAllowed = true;
    PageType = List;
    SourceTable = Vendor;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                field(LocationCode; "Location Code")
                {
                    ApplicationArea = Basic;
                }
                field(PostCode; "Post Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(CountryRegionCode; "Country/Region Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(PhoneNo; "Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(FaxNo; "Fax No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Contact; Contact)
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Posting Group"; "Vendor Posting Group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Supplier Posting Group';
                    Visible = false;
                }
                field(GenBusPostingGroup; "Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(VATBusPostingGroup; "VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(PaymentTermsCode; "Payment Terms Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(CurrencyCode; "Currency Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(SearchName; "Search Name")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(LastDateModified; "Last Date Modified")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Location Code2"; "Location Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Supplier)
            {
                Caption = 'Supplier';
                Image = Vendor;
            }
            group(Purchases)
            {
                Caption = '&Purchases';
                Image = Purchasing;
                action(Items)
                {
                    ApplicationArea = Basic;
                    Caption = 'Items';
                    Image = Item;
                    RunObject = Page "Vendor Item Catalog";
                    RunPageLink = "Vendor No." = field("No.");
                    RunPageView = sorting("Vendor No.");
                }
            }
            group(Documents)
            {
                Caption = 'Documents';
                Image = Administration;
                action(Orders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Orders';
                    Image = Document;
                    RunObject = Page "Purchase Order List";
                    RunPageLink = "Buy-from Vendor No." = field("No.");
                    RunPageView = sorting("Document Type", "Buy-from Vendor No.");
                }
                action(ReturnOrders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Return Orders';
                    Image = ReturnOrder;
                    RunObject = Page "Purchase Return Order List";
                    RunPageLink = "Buy-from Vendor No." = field("No.");
                    RunPageView = sorting("Document Type", "Buy-from Vendor No.");
                }
                action(BlanketOrders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Blanket Orders';
                    Image = BlanketOrder;
                    RunObject = Page "Blanket Purchase Orders";
                    RunPageLink = "Buy-from Vendor No." = field("No.");
                    RunPageView = sorting("Document Type", "Buy-from Vendor No.");
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action(Action21)
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchases';
                    Image = Purchase;
                    RunObject = Page "Vendor Purchases";
                    RunPageLink = "No." = field("No."),
                                  "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                }
            }
        }
        area(reporting)
        {
            group(General)
            {
                Caption = 'General';
                action(SupplierList)
                {
                    ApplicationArea = Basic;
                    Caption = 'Supplier - List';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report "Vendor - List";
                }
            }
            group(ActionGroup5)
            {
                Caption = 'Orders';
                Image = "Report";
                action(SupplierOrderSummary)
                {
                    ApplicationArea = Basic;
                    Caption = 'Supplier - Order Summary';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report "Vendor - Order Summary";
                }
                action(SupplierOrderDetail)
                {
                    ApplicationArea = Basic;
                    Caption = 'Supplier - Order Detail';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report "Vendor - Order Detail";
                }
            }
            group(Purchase)
            {
                Caption = 'Purchase';
                Image = Purchase;
                action(SupplierPurchaseList)
                {
                    ApplicationArea = Basic;
                    Caption = 'Supplier - Purchase List';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Report "Vendor - Purchase List";
                }
                action(SupplierItemPurchases)
                {
                    ApplicationArea = Basic;
                    Caption = 'Supplier/Item Purchases';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report "Vendor/Item Purchases";
                }
                action(PurchaseStatistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Statistics';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report "Purchase Statistics";
                }
            }
        }
    }


    procedure GetSelectionFilter(): Text
    var
        Vend: Record Vendor;
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        CurrPage.SetSelectionFilter(Vend);
        exit(SelectionFilterManagement.GetSelectionFilterForVendor(Vend));
    end;


    procedure SetSelection(var Vend: Record Vendor)
    begin
        CurrPage.SetSelectionFilter(Vend);
    end;
}

