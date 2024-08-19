#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193886 "Partners List"
{
    Caption = 'Partners List';
    CardPageId = "Partner Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = Vendor;
    SourceTableView = where("Vendor Type" = filter("Implementing Partner"));
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the vendor''s name. You can enter a maximum of 30 characters, both numbers and letters.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code of the responsibility center, such as a distribution hub, that is associated with the involved user, company, customer, or vendor.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the warehouse location where items from the vendor must be received by default.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the postal code.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the country/region of the address.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the vendor''s telephone number.';
                }
                field("Fax No."; Rec."Fax No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the vendor''s fax number.';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the person you regularly contact when you do business with this vendor.';
                }
                field("Purchaser Code"; Rec."Purchaser Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies which purchaser is assigned to the vendor.';
                }
                field("Vendor Posting Group"; Rec."Vendor Posting Group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Sub Posting Group';
                    Visible = false;
                    ToolTip = 'Specifies the vendor''s market type to link business transactions made for the vendor with the appropriate account in the general ledger.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the vendor''s trade type to link transactions made for this vendor with the appropriate general ledger account according to the general posting setup.';
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the currency code that is inserted by default when you create purchase documents or journal lines for the vendor.';
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies an alternate name that you can use to search for the record in question when you cannot remember the value in the Name field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies which transactions with the vendor that cannot be processed, for example a vendor that is declared insolvent.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies when the vendor card was last modified.';
                }
                field("Application Method"; Rec."Application Method")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies how to apply payments to entries for this vendor.';
                }
                field("Location Code2"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the warehouse location where items from the vendor must be received by default.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Control1901138007; "Vendor Details FactBox")
            {
                Caption = 'Subs Details FactBox';
                SubPageLink = "No." = field("No."),
                              "Currency Filter" = field("Currency Filter"),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                Visible = false;
            }
            part(Control1904651607; "Vendor Statistics FactBox")
            {
                Caption = 'Subs Statistics FactBox';
                SubPageLink = "No." = field("No."),
                              "Currency Filter" = field("Currency Filter"),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                Visible = true;
            }
            part(Control1903435607; "Vendor Hist. Buy-from FactBox")
            {
                Caption = 'Subs Hist. Buy-from FactBox';
                SubPageLink = "No." = field("No."),
                              "Currency Filter" = field("Currency Filter"),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                Visible = true;
            }
            part(Control1906949207; "Vendor Hist. Pay-to FactBox")
            {
                Caption = 'Subs Hist. Pay-to FactBox';
                SubPageLink = "No." = field("No."),
                              "Currency Filter" = field("Currency Filter"),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                Visible = false;
            }
            systempart(Control1900383207; Links)
            {
                Visible = true;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("Ven&dor")
            {
                Caption = 'Ven&dor';
                Image = Vendor;
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    action("Dimensions-Single")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-Single';
                        Image = Dimensions;
                        RunObject = page "Default Dimensions";
                        RunPageLink = "Table ID" = const(23),
                                      "No." = field("No.");
                        ShortcutKey = 'Shift+Ctrl+D';
                        ToolTip = 'Executes the Dimensions-Single action.';
                    }
                    action("Dimensions-&Multiple")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;
                        ToolTip = 'Executes the Dimensions-&Multiple action.';
                        trigger OnAction()
                        var
                            Vend: Record Vendor;
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(Vend);
                            //DefaultDimMultiple.SetMultiVendor(Vend);
                            DefaultDimMultiple.RunModal();
                        end;
                    }
                }
                action("Bank Accounts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Accounts';
                    Image = BankAccount;
                    RunObject = page "Vendor Bank Account List";
                    RunPageLink = "Vendor No." = field("No.");
                    ToolTip = 'Executes the Bank Accounts action.';
                }
                action("C&ontact")
                {
                    ApplicationArea = Basic;
                    Caption = 'C&ontact';
                    Image = ContactPerson;
                    ToolTip = 'Executes the C&ontact action.';
                    trigger OnAction()
                    begin
                        Rec.ShowContact();
                    end;
                }
                separator(Action55) { }
                action("Order &Addresses")
                {
                    ApplicationArea = Basic;
                    Caption = 'Order &Addresses';
                    Image = Addresses;
                    RunObject = page "Order Address List";
                    RunPageLink = "Vendor No." = field("No.");
                    ToolTip = 'Executes the Order &Addresses action.';
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = page "Comment Sheet";
                    RunPageLink = "Table Name" = const(Vendor),
                                  "No." = field("No.");
                    ToolTip = 'Executes the Co&mments action.';
                }
                action("Cross Re&ferences")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cross Re&ferences';
                    Image = Change;
                    RunObject = page "Item References";
                    RunPageLink = "Reference Type" = const(Vendor),
                                  "Reference Type No." = field("No.");
                    RunPageView = sorting("Reference Type", "Reference Type No.");
                    ToolTip = 'Executes the Cross Re&ferences action.';
                }
                separator(Action61) { }
            }
            group("&Purchases")
            {
                Caption = '&Purchases';
                Image = Purchasing;
                action(Items)
                {
                    ApplicationArea = Basic;
                    Caption = 'Items';
                    Image = Item;
                    RunObject = page "Vendor Item Catalog";
                    RunPageLink = "Vendor No." = field("No.");
                    RunPageView = sorting("Vendor No.");
                    ToolTip = 'Executes the Items action.';
                }
                action("Invoice &Discounts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoice &Discounts';
                    Image = CalculateInvoiceDiscount;
                    RunObject = page "Vend. Invoice Discounts";
                    RunPageLink = Code = field("Invoice Disc. Code");
                    ToolTip = 'Executes the Invoice &Discounts action.';
                }
                action(Prices)
                {
                    ApplicationArea = Basic;
                    Caption = 'Prices';
                    Image = Price;
                    RunObject = page "Purchase Prices";
                    RunPageLink = "Vendor No." = field("No.");
                    RunPageView = sorting("Vendor No.");
                    ToolTip = 'Executes the Prices action.';
                }
                action("Line Discounts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Line Discounts';
                    Image = LineDiscount;
                    RunObject = page "Purchase Line Discounts";
                    RunPageLink = "Vendor No." = field("No.");
                    RunPageView = sorting("Vendor No.");
                    ToolTip = 'Executes the Line Discounts action.';
                }
                action("Prepa&yment Percentages")
                {
                    ApplicationArea = Basic;
                    Caption = 'Prepa&yment Percentages';
                    Image = PrepaymentPercentages;
                    RunObject = page "Purchase Prepmt. Percentages";
                    RunPageLink = "Vendor No." = field("No.");
                    RunPageView = sorting("Vendor No.");
                    ToolTip = 'Executes the Prepa&yment Percentages action.';
                }
                action("S&td. Vend. Purchase Codes")
                {
                    ApplicationArea = Basic;
                    Caption = 'S&td. Vend. Purchase Codes';
                    Image = CodesList;
                    RunObject = page "Standard Vendor Purchase Codes";
                    RunPageLink = "Vendor No." = field("No.");
                    ToolTip = 'Executes the S&td. Vend. Purchase Codes action.';
                }
            }
            group(Documents)
            {
                Caption = 'Documents';
                Image = Administration;
                action(Quotes)
                {
                    ApplicationArea = Basic;
                    Caption = 'Quotes';
                    Image = Quote;
                    RunObject = page "Purchase Quotes";
                    RunPageLink = "Buy-from Vendor No." = field("No.");
                    RunPageView = sorting("Document Type", "Buy-from Vendor No.");
                    ToolTip = 'Executes the Quotes action.';
                }
                action(Orders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Orders';
                    Image = Document;
                    RunObject = page "Purchase Order List";
                    RunPageLink = "Buy-from Vendor No." = field("No.");
                    RunPageView = sorting("Document Type", "Buy-from Vendor No.");
                    ToolTip = 'Executes the Orders action.';
                }
                action("Return Orders")
                {
                    ApplicationArea = Basic;
                    Caption = 'Return Orders';
                    Image = ReturnOrder;
                    RunObject = page "Purchase Return Order List";
                    RunPageLink = "Buy-from Vendor No." = field("No.");
                    RunPageView = sorting("Document Type", "Buy-from Vendor No.");
                    ToolTip = 'Executes the Return Orders action.';
                }
                action("Blanket Orders")
                {
                    ApplicationArea = Basic;
                    Caption = 'Blanket Orders';
                    Image = BlanketOrder;
                    RunObject = page "Blanket Purchase Orders";
                    RunPageLink = "Buy-from Vendor No." = field("No.");
                    RunPageView = sorting("Document Type", "Buy-from Vendor No.");
                    ToolTip = 'Executes the Blanket Orders action.';
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Ledger E&ntries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Ledger E&ntries';
                    Image = CustomerLedger;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = page "Vendor Ledger Entries";
                    RunPageLink = "Vendor No." = field("No.");
                    RunPageView = sorting("Vendor No.");
                    ShortcutKey = 'Ctrl+F7';
                    ToolTip = 'Executes the Ledger E&ntries action.';
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = page "Vendor Statistics";
                    RunPageLink = "No." = field("No."),
                                  "Date Filter" = field("Date Filter"),
                                  "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                    ShortcutKey = 'F7';
                    ToolTip = 'Executes the Statistics action.';
                }
                action(Purchases)
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchases';
                    Image = Purchase;
                    RunObject = page "Vendor Purchases";
                    RunPageLink = "No." = field("No."),
                                  "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                    ToolTip = 'Executes the Purchases action.';
                }
                action("Entry Statistics")
                {
                    ApplicationArea = Basic;
                    Caption = 'Entry Statistics';
                    Image = EntryStatistics;
                    RunObject = page "Vendor Entry Statistics";
                    RunPageLink = "No." = field("No."),
                                  "Date Filter" = field("Date Filter"),
                                  "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                    ToolTip = 'Executes the Entry Statistics action.';
                }
                action("Statistics by C&urrencies")
                {
                    ApplicationArea = Basic;
                    Caption = 'Statistics by C&urrencies';
                    Image = Currencies;
                    RunObject = page "Vend. Stats. by Curr. Lines";
                    RunPageLink = "Vendor Filter" = field("No."),
                                  "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = field("Global Dimension 2 Filter"),
                                  "Date Filter" = field("Date Filter");
                    ToolTip = 'Executes the Statistics by C&urrencies action.';
                }
                action("Item &Tracking Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Item &Tracking Entries';
                    Image = ItemTrackingLedger;
                    ToolTip = 'Executes the Item &Tracking Entries action.';

                }
            }
        }
        area(Creation)
        {
            action("Blanket Purchase Order")
            {
                ApplicationArea = Basic;
                Caption = 'Blanket Purchase Order';
                Image = BlanketOrder;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = page "Blanket Purchase Order";
                RunPageLink = "Buy-from Vendor No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Executes the Blanket Purchase Order action.';
            }
            action("Purchase Quote")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Quote';
                Image = Quote;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = page "Purchase Quote";
                RunPageLink = "Buy-from Vendor No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Executes the Purchase Quote action.';
            }
            action("Purchase Invoice")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Invoice';
                Image = Invoice;
                Promoted = true;
                PromotedCategory = New;
                RunObject = page "Purchase Invoice";
                RunPageLink = "Buy-from Vendor No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Executes the Purchase Invoice action.';
            }
            action("Purchase Order")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Order';
                Image = Document;
                Promoted = true;
                PromotedCategory = New;
                RunObject = page "Purchase Order";
                RunPageLink = "Buy-from Vendor No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Executes the Purchase Order action.';
            }
            action("Purchase Credit Memo")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Credit Memo';
                Image = CreditMemo;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = page "Purchase Credit Memo";
                RunPageLink = "Buy-from Vendor No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Executes the Purchase Credit Memo action.';
            }
            action("Purchase Return Order")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Return Order';
                Image = ReturnOrder;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = page "Purchase Return Order";
                RunPageLink = "Buy-from Vendor No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Executes the Purchase Return Order action.';
            }
        }
        area(Processing)
        {
            action("Payment Journal")
            {
                ApplicationArea = Basic;
                Caption = 'Payment Journal';
                Image = PaymentJournal;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "Payment Journal";
                ToolTip = 'Executes the Payment Journal action.';
            }
            action("Purchase Journal")
            {
                ApplicationArea = Basic;
                Caption = 'Purchase Journal';
                Image = Journals;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = page "Purchase Journal";
                ToolTip = 'Executes the Purchase Journal action.';
            }
        }
        area(Reporting)
        {
            group(General)
            {
                Caption = 'General';
                action("Vendor - List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor - List';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = report "Vendor - List";
                    ToolTip = 'Executes the Vendor - List action.';
                }
                action("Vendor Register")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor Register';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = report "Vendor Register";
                    ToolTip = 'Executes the Vendor Register action.';
                }
                action("Vendor Item Catalog")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor Item Catalog';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = report "Vendor Item Catalog";
                    ToolTip = 'Executes the Vendor Item Catalog action.';
                }
                action("Vendor - Labels")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor - Labels';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = report "Vendor - Labels";
                    ToolTip = 'Executes the Vendor - Labels action.';
                }
                action("Vendor - Top 10 List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor - Top 10 List';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = report "Vendor - Top 10 List";
                    ToolTip = 'Executes the Vendor - Top 10 List action.';
                }
            }
            group(ActionGroup5)
            {
                Caption = 'Orders';
                Image = "Report";
                action("Vendor - Order Summary")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor - Order Summary';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = report "Vendor - Order Summary";
                    ToolTip = 'Executes the Vendor - Order Summary action.';
                }
                action("Vendor - Order Detail")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor - Order Detail';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = report "Vendor - Order Detail";
                    ToolTip = 'Executes the Vendor - Order Detail action.';
                }
            }
            group(Purchase)
            {
                Caption = 'Purchase';
                Image = Purchase;
                action("Vendor - Purchase List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor - Purchase List';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = report "Vendor - Purchase List";
                    ToolTip = 'Executes the Vendor - Purchase List action.';
                }
                action("Vendor/Item Purchases")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor/Item Purchases';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = report "Vendor/Item Purchases";
                    ToolTip = 'Executes the Vendor/Item Purchases action.';
                }
                action("Purchase Statistics")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Statistics';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = report "Purchase Statistics";
                    ToolTip = 'Executes the Purchase Statistics action.';
                }
            }
            group("Financial Management")
            {
                Caption = 'Financial Management';
                Image = "Report";
                action("Payments on Hold")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payments on Hold';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = report "Payments on Hold";
                    ToolTip = 'Executes the Payments on Hold action.';
                }
                action("Vendor - Summary Aging")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor - Summary Aging';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = report "Vendor - Summary Aging";
                    ToolTip = 'Executes the Vendor - Summary Aging action.';
                }
                action("Aged Accounts Payable")
                {
                    ApplicationArea = Basic;
                    Caption = 'Aged Accounts Payable';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = report "Aged Accounts Payable";
                    ToolTip = 'Executes the Aged Accounts Payable action.';
                }
                action("Vendor - Balance to Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor - Balance to Date';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = report "Vendor - Balance to Date";
                    ToolTip = 'Executes the Vendor - Balance to Date action.';
                }
                action("Vendor - Trial Balance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor - Trial Balance';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = report "Vendor - Trial Balance";
                    ToolTip = 'Executes the Vendor - Trial Balance action.';
                }
                action("Vendor - Detail Trial Balance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor - Detail Trial Balance';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = report "Vendor - Detail Trial Balance";
                    ToolTip = 'Executes the Vendor - Detail Trial Balance action.';
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Vendor Type" := Rec."Vendor Type"::"Implementing Partner";
    end;


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
