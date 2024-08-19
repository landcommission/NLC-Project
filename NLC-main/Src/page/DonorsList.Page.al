#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193884 "Donors List"
{
    Caption = 'Donors List';
    CardPageId = "Donors Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = Customer;
    SourceTableView = where("Account Type" = filter(Donor));
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
                    ToolTip = 'Specifies the number of the customer. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the customer''s name.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code for the responsibility center that will administer this customer by default.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies from which location sales to this customer will be processed by default.';
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
                    ToolTip = 'Specifies the customer''s telephone number.';
                }
                field("Fax No."; Rec."Fax No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the customer''s fax number.';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the person you regularly contact when you do business with this customer.';
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies a code for the salesperson who normally handles this customer''s account.';
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Donor Posting Group';
                    Visible = false;
                    ToolTip = 'Specifies the customer''s market type to link business transactions to.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the customer''s trade type to link transactions made for this customer with the appropriate general ledger account according to the general posting setup.';
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the customer''s VAT specification to link transactions made for this customer to.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the default currency for the customer.';
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies an alternate name that you can use to search for a customer.';
                }
                field("Credit Limit (LCY)"; Rec."Credit Limit (LCY)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the maximum amount you allow the customer to exceed the payment balance before warnings are issued.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies which transactions with the customer that cannot be processed, for example, because the customer is insolvent.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies when the customer card was last modified.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Control1902018507; "Customer Statistics FactBox")
            {
                Caption = 'Donor Statistics FactBox';
                SubPageLink = "No." = field("No."),
                              "Currency Filter" = field("Currency Filter"),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                Visible = true;
            }
            part(Control1900316107; "Customer Details FactBox")
            {
                Caption = 'Donor Details FactBox>';
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
            group("&Customer")
            {
                Caption = '&Customer';
                Image = Customer;
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = page "Comment Sheet";
                    RunPageLink = "Table Name" = const(Customer),
                                  "No." = field("No.");
                    ToolTip = 'Executes the Co&mments action.';
                }
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
                        RunPageLink = "Table ID" = const(18),
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
                            Cust: Record Customer;
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(Cust);
                            // DefaultDimMultiple.SetMultiCust(Cust);
                            DefaultDimMultiple.RunModal();
                        end;
                    }
                }
                action("Bank Accounts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bank Accounts';
                    Image = BankAccount;
                    RunObject = page "Customer Bank Account List";
                    RunPageLink = "Customer No." = field("No.");
                    ToolTip = 'Executes the Bank Accounts action.';
                }
                action("Direct Debit Mandates")
                {
                    ApplicationArea = Basic;
                    Caption = 'Direct Debit Mandates';
                    Image = MakeAgreement;
                    RunObject = page "SEPA Direct Debit Mandates";
                    RunPageLink = "Customer No." = field("No.");
                    ToolTip = 'Executes the Direct Debit Mandates action.';
                }
                action("Ship-&to Addresses")
                {
                    ApplicationArea = Basic;
                    Caption = 'Ship-&to Addresses';
                    Image = ShipAddress;
                    RunObject = page "Ship-to Address List";
                    RunPageLink = "Customer No." = field("No.");
                    ToolTip = 'Executes the Ship-&to Addresses action.';
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
                action("Donor Contacts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Donor Contacts';
                    Image = ContactReference;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = page "HR Calendar Card";
                    RunPageLink = "Created By" = field("No.");
                    ToolTip = 'Executes the Donor Contacts action.';
                }
                action("Cross Re&ferences")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cross Re&ferences';
                    Image = Change;
                    RunObject = page "Item References";
                    RunPageLink = "Reference Type" = const(Customer),
                                  "Reference Type No." = field("No.");
                    RunPageView = sorting("Reference Type", "Reference Type No.");
                    ToolTip = 'Executes the Cross Re&ferences action.';
                }
                separator(Action17) { }
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
                    RunObject = page "Customer Ledger Entries";
                    RunPageLink = "Customer No." = field("No.");
                    RunPageView = sorting("Customer No.");
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
                    RunObject = page "Customer Statistics";
                    RunPageLink = "No." = field("No."),
                                  "Date Filter" = field("Date Filter"),
                                  "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                    ShortcutKey = 'F7';
                    ToolTip = 'Executes the Statistics action.';
                }
                action("S&ales")
                {
                    ApplicationArea = Basic;
                    Caption = 'S&ales';
                    Image = Sales;
                    RunObject = page "Customer Sales";
                    RunPageLink = "No." = field("No."),
                                  "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                    ToolTip = 'Executes the S&ales action.';
                }
                action("Entry Statistics")
                {
                    ApplicationArea = Basic;
                    Caption = 'Entry Statistics';
                    Image = EntryStatistics;
                    RunObject = page "Customer Entry Statistics";
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
                    RunObject = page "Cust. Stats. by Curr. Lines";
                    RunPageLink = "Customer Filter" = field("No."),
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
            group(ActionGroup24)
            {
                Caption = 'S&ales';
                Image = Sales;
                action("Invoice &Discounts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoice &Discounts';
                    Image = CalculateInvoiceDiscount;
                    RunObject = page "Cust. Invoice Discounts";
                    RunPageLink = Code = field("Invoice Disc. Code");
                    ToolTip = 'Executes the Invoice &Discounts action.';
                }
                action(Prices)
                {
                    ApplicationArea = Basic;
                    Caption = 'Prices';
                    Image = Price;
                    RunObject = page "Sales Prices";
                    RunPageLink = "Sales Type" = const(Customer),
                                  "Sales Code" = field("No.");
                    RunPageView = sorting("Sales Type", "Sales Code");
                    ToolTip = 'Executes the Prices action.';
                }
                action("Line Discounts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Line Discounts';
                    Image = LineDiscount;
                    RunObject = page "Sales Line Discounts";
                    RunPageLink = "Sales Type" = const(Customer),
                                  "Sales Code" = field("No.");
                    RunPageView = sorting("Sales Type", "Sales Code");
                    ToolTip = 'Executes the Line Discounts action.';
                }
                action("Prepa&yment Percentages")
                {
                    ApplicationArea = Basic;
                    Caption = 'Prepa&yment Percentages';
                    Image = PrepaymentPercentages;
                    RunObject = page "Sales Prepayment Percentages";
                    RunPageLink = "Sales Type" = const(Customer),
                                  "Sales Code" = field("No.");
                    RunPageView = sorting("Sales Type", "Sales Code");
                    ToolTip = 'Executes the Prepa&yment Percentages action.';
                }
                action("S&td. Cust. Sales Codes")
                {
                    ApplicationArea = Basic;
                    Caption = 'S&td. Cust. Sales Codes';
                    Image = CodesList;
                    RunObject = page "Standard Customer Sales Codes";
                    RunPageLink = "Customer No." = field("No.");
                    ToolTip = 'Executes the S&td. Cust. Sales Codes action.';
                }
            }
            group(Documents)
            {
                Caption = 'Documents';
                Image = Documents;
                action(Quotes)
                {
                    ApplicationArea = Basic;
                    Caption = 'Quotes';
                    Image = Quote;
                    RunObject = page "Sales Quotes";
                    RunPageLink = "Sell-to Customer No." = field("No.");
                    RunPageView = sorting("Sell-to Customer No.");
                    ToolTip = 'Executes the Quotes action.';
                }
                action(Orders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Orders';
                    Image = Document;
                    RunObject = page "Sales Order List";
                    RunPageLink = "Sell-to Customer No." = field("No.");
                    RunPageView = sorting("Sell-to Customer No.");
                    ToolTip = 'Executes the Orders action.';
                }
                action("Return Orders")
                {
                    ApplicationArea = Basic;
                    Caption = 'Return Orders';
                    Image = ReturnOrder;
                    RunObject = page "Sales Return Order List";
                    RunPageLink = "Sell-to Customer No." = field("No.");
                    RunPageView = sorting("Sell-to Customer No.");
                    ToolTip = 'Executes the Return Orders action.';
                }
                group("Issued Documents")
                {
                    Caption = 'Issued Documents';
                    Image = Documents;
                    action("Issued &Reminders")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Issued &Reminders';
                        Image = OrderReminder;
                        RunObject = page "Issued Reminder List";
                        RunPageLink = "Customer No." = field("No.");
                        RunPageView = sorting("Customer No.", "Posting Date");
                        ToolTip = 'Executes the Issued &Reminders action.';
                    }
                    action("Issued &Finance Charge Memos")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Issued &Finance Charge Memos';
                        Image = FinChargeMemo;
                        RunObject = page "Issued Fin. Charge Memo List";
                        RunPageLink = "Customer No." = field("No.");
                        RunPageView = sorting("Customer No.", "Posting Date");
                        ToolTip = 'Executes the Issued &Finance Charge Memos action.';
                    }
                }
                action("Blanket Orders")
                {
                    ApplicationArea = Basic;
                    Caption = 'Blanket Orders';
                    Image = BlanketOrder;
                    RunObject = page "Blanket Sales Orders";
                    RunPageLink = "Sell-to Customer No." = field("No.");
                    RunPageView = sorting("Document Type", "Sell-to Customer No.");
                    ToolTip = 'Executes the Blanket Orders action.';
                }
            }
            group("Credit Card")
            {
                Caption = 'Credit Card';
                Image = CreditCard;
                group("Credit Cards")
                {
                    Caption = 'Credit Cards';
                    Image = CreditCard;
                    /*  action("C&redit Cards")
                     {
                         ApplicationArea = Basic;
                         Caption = 'C&redit Cards';
                         Image = CreditCard;
                         RunObject = Page "DO Payment Credit Card List";
                         RunPageLink = "Customer No."=field("No.");
                     }
                     action("Credit Cards Transaction Lo&g Entries")
                     {
                         ApplicationArea = Basic;
                         Caption = 'Credit Cards Transaction Lo&g Entries';
                         Image = CreditCardLog;
                         RunObject = Page "DO Payment Trans. Log Entries";
                         RunPageLink = "Customer No."=field("No.");
                     } */
                }
            }
            group(Service)
            {
                Caption = 'Service';
                Image = ServiceItem;
                action("Service Orders")
                {
                    ApplicationArea = Basic;
                    Caption = 'Service Orders';
                    Image = Document;
                    RunObject = page "Service Orders";
                    RunPageLink = "Customer No." = field("No.");
                    RunPageView = sorting("Document Type", "Customer No.");
                    ToolTip = 'Executes the Service Orders action.';
                }
                action("Ser&vice Contracts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Ser&vice Contracts';
                    Image = ServiceAgreement;
                    RunObject = page "Customer Service Contracts";
                    RunPageLink = "Customer No." = field("No.");
                    RunPageView = sorting("Customer No.", "Ship-to Code");
                    ToolTip = 'Executes the Ser&vice Contracts action.';
                }
                action("Service &Items")
                {
                    ApplicationArea = Basic;
                    Caption = 'Service &Items';
                    Image = ServiceItem;
                    RunObject = page "Service Items";
                    RunPageLink = "Customer No." = field("No.");
                    RunPageView = sorting("Customer No.", "Ship-to Code", "Item No.", "Serial No.");
                    ToolTip = 'Executes the Service &Items action.';
                }
            }
        }
        area(Creation)
        {
            action("Blanket Sales Order")
            {
                ApplicationArea = Basic;
                Caption = 'Blanket Sales Order';
                Image = BlanketOrder;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = page "Blanket Sales Order";
                RunPageLink = "Sell-to Customer No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Executes the Blanket Sales Order action.';
            }
            action("Sales Quote")
            {
                ApplicationArea = Basic;
                Caption = 'Sales Quote';
                Image = Quote;
                Promoted = true;
                PromotedCategory = New;
                RunObject = page "Sales Quote";
                RunPageLink = "Sell-to Customer No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Executes the Sales Quote action.';
            }
            action("Sales Invoice")
            {
                ApplicationArea = Basic;
                Caption = 'Sales Invoice';
                Image = Invoice;
                Promoted = true;
                PromotedCategory = New;
                RunObject = page "Sales Invoice";
                RunPageLink = "Sell-to Customer No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Executes the Sales Invoice action.';
            }
            action("Sales Order")
            {
                ApplicationArea = Basic;
                Caption = 'Sales Order';
                Image = Document;
                Promoted = true;
                PromotedCategory = New;
                RunObject = page "Sales Order";
                RunPageLink = "Sell-to Customer No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Executes the Sales Order action.';
            }
            action("Sales Credit Memo")
            {
                ApplicationArea = Basic;
                Caption = 'Sales Credit Memo';
                Image = CreditMemo;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = page "Sales Credit Memo";
                RunPageLink = "Sell-to Customer No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Executes the Sales Credit Memo action.';
            }
            action("Sales Return Order")
            {
                ApplicationArea = Basic;
                Caption = 'Sales Return Order';
                Image = ReturnOrder;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = page "Sales Return Order";
                RunPageLink = "Sell-to Customer No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Executes the Sales Return Order action.';
            }
            action("Service Quote")
            {
                ApplicationArea = Basic;
                Caption = 'Service Quote';
                Image = Quote;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = page "Service Quote";
                RunPageLink = "Customer No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Executes the Service Quote action.';
            }
            action("Service Invoice")
            {
                ApplicationArea = Basic;
                Caption = 'Service Invoice';
                Image = Invoice;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = page "Service Invoice";
                RunPageLink = "Customer No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Executes the Service Invoice action.';
            }
            action("Service Order")
            {
                ApplicationArea = Basic;
                Caption = 'Service Order';
                Image = Document;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = page "Service Order";
                RunPageLink = "Customer No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Executes the Service Order action.';
            }
            action("Service Credit Memo")
            {
                ApplicationArea = Basic;
                Caption = 'Service Credit Memo';
                Image = CreditMemo;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = page "Service Credit Memo";
                RunPageLink = "Customer No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Executes the Service Credit Memo action.';
            }
            action(Reminder)
            {
                ApplicationArea = Basic;
                Caption = 'Reminder';
                Image = Reminder;
                Promoted = true;
                PromotedCategory = New;
                RunObject = page Reminder;
                RunPageLink = "Customer No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Executes the Reminder action.';
            }
            action("Finance Charge Memo")
            {
                ApplicationArea = Basic;
                Caption = 'Finance Charge Memo';
                Image = FinChargeMemo;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = page "Finance Charge Memo";
                RunPageLink = "Customer No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Executes the Finance Charge Memo action.';
            }
        }
        area(Processing)
        {
            action("Cash Receipt Journal")
            {
                ApplicationArea = Basic;
                Caption = 'Cash Receipt Journal';
                Image = CashReceiptJournal;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "Cash Receipt Journal";
                ToolTip = 'Executes the Cash Receipt Journal action.';
            }
            action("Sales Journal")
            {
                ApplicationArea = Basic;
                Caption = 'Sales Journal';
                Image = Journals;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "Sales Journal";
                ToolTip = 'Executes the Sales Journal action.';
            }
        }
        area(Reporting)
        {
            group(General)
            {
                Caption = 'General';
                action("Customer List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Customer List';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = report "Customer - List";
                    ToolTip = 'Executes the Customer List action.';
                }
                action("Customer Register")
                {
                    ApplicationArea = Basic;
                    Caption = 'Customer Register';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = report "Customer Register";
                    ToolTip = 'Executes the Customer Register action.';
                }
                action("Customer - Top 10 List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Customer - Top 10 List';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = report "Customer - Top 10 List";
                    ToolTip = 'Executes the Customer - Top 10 List action.';
                }
            }
            group(Sales)
            {
                Caption = 'Sales';
                Image = Sales;
                action("Customer - Order Summary")
                {
                    ApplicationArea = Basic;
                    Caption = 'Customer - Order Summary';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = report "Customer - Order Summary";
                    ToolTip = 'Executes the Customer - Order Summary action.';
                }
                action("Customer - Order Detail")
                {
                    ApplicationArea = Basic;
                    Caption = 'Customer - Order Detail';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = report "Customer - Order Detail";
                    ToolTip = 'Executes the Customer - Order Detail action.';
                }
                action("Customer - Sales List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Customer - Sales List';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = report "Customer - Sales List";
                    ToolTip = 'Executes the Customer - Sales List action.';
                }
                action("Sales Statistics")
                {
                    ApplicationArea = Basic;
                    Caption = 'Sales Statistics';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = report "Sales Statistics";
                    ToolTip = 'Executes the Sales Statistics action.';
                }
                action("Customer/Item Sales")
                {
                    ApplicationArea = Basic;
                    Caption = 'Customer/Item Sales';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = report "Customer/Item Sales";
                    ToolTip = 'Executes the Customer/Item Sales action.';
                }
            }
            group("Financial Management")
            {
                Caption = 'Financial Management';
                Image = "Report";
                action("Customer - Detail Trial Bal.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Customer - Detail Trial Bal.';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = report "Customer - Detail Trial Bal.";
                    ToolTip = 'Executes the Customer - Detail Trial Bal. action.';
                }
                action("Customer - Summary Aging")
                {
                    ApplicationArea = Basic;
                    Caption = 'Customer - Summary Aging';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = report "Customer - Summary Aging";
                    ToolTip = 'Executes the Customer - Summary Aging action.';
                }
                action("Customer Detailed Aging")
                {
                    ApplicationArea = Basic;
                    Caption = 'Customer Detailed Aging';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = report "Customer Detailed Aging";
                    ToolTip = 'Executes the Customer Detailed Aging action.';
                }
                action(Statement)
                {
                    ApplicationArea = Basic;
                    Caption = 'Statement';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = report Statement;
                    ToolTip = 'Executes the Statement action.';
                }
                action(Action1903839806)
                {
                    ApplicationArea = Basic;
                    Caption = 'Reminder';
                    Image = Reminder;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = report Reminder;
                    ToolTip = 'Executes the Reminder action.';
                }
                action("Aged Accounts Receivable")
                {
                    ApplicationArea = Basic;
                    Caption = 'Aged Accounts Receivable';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = report "Aged Accounts Receivable";
                    ToolTip = 'Executes the Aged Accounts Receivable action.';
                }
                action("Customer - Balance to Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Customer - Balance to Date';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = report "Customer - Balance to Date";
                    ToolTip = 'Executes the Customer - Balance to Date action.';
                }
                action("Customer - Trial Balance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Customer - Trial Balance';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = report "Customer - Trial Balance";
                    ToolTip = 'Executes the Customer - Trial Balance action.';
                }
                action("Customer - Payment Receipt")
                {
                    ApplicationArea = Basic;
                    Caption = 'Customer - Payment Receipt';
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = report "Customer - Payment Receipt";
                    ToolTip = 'Executes the Customer - Payment Receipt action.';
                }
            }
        }
    }


    procedure GetSelectionFilter(): Text
    var
        Cust: Record Customer;
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        CurrPage.SetSelectionFilter(Cust);
        exit(SelectionFilterManagement.GetSelectionFilterForCustomer(Cust));
    end;


    procedure SetSelection(var Cust: Record Customer)
    begin
        CurrPage.SetSelectionFilter(Cust);
    end;
}
