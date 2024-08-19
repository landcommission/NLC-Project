#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193887 "Partner Card"
{
    Caption = 'Partner Card';
    DeleteAllowed = false;
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Vendor;
    SourceTableView = where("Vendor Type" = filter("Implementing Partner"));
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the vendor''s name. You can enter a maximum of 30 characters, both numbers and letters.';
                }
                field("Vendor Type"; Rec."Vendor Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Vendor Type field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the vendor''s address.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies additional address information.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the postal code.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the country/region of the address.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the vendor''s telephone number.';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Basic;
                    Editable = ContactEditable;
                    Importance = Promoted;
                    ToolTip = 'Specifies the name of the person you regularly contact when you do business with this vendor.';
                    trigger OnValidate()
                    begin
                        ContactOnAfterValidate();
                    end;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the vendor''s city.';
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies an alternate name that you can use to search for the record in question when you cannot remember the value in the Name field.';
                }
                field("Balance (LCY)"; Rec."Balance (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the total value of your completed purchases from the vendor in the current fiscal year. It is calculated from amounts excluding VAT on all completed purchase invoices and credit memos.';
                    trigger OnDrillDown()
                    var
                        VendLedgEntry: Record "Vendor Ledger Entry";
                        DtldVendLedgEntry: Record "Detailed Vendor Ledg. Entry";
                    begin
                        DtldVendLedgEntry.SetRange("Vendor No.", Rec."No.");
                        Rec.CopyFilter(Rec."Global Dimension 1 Filter", DtldVendLedgEntry."Initial Entry Global Dim. 1");
                        Rec.CopyFilter(Rec."Global Dimension 2 Filter", DtldVendLedgEntry."Initial Entry Global Dim. 2");
                        Rec.CopyFilter(Rec."Currency Filter", DtldVendLedgEntry."Currency Code");
                        VendLedgEntry.DrillDownOnEntries(DtldVendLedgEntry);
                    end;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code of the responsibility center, such as a distribution hub, that is associated with the involved user, company, customer, or vendor.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies which transactions with the vendor that cannot be processed, for example a vendor that is declared insolvent.';
                }
                field("PIN No."; Rec."PIN No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PIN No. field.';
                }
                field("Vendor Bank Account"; Rec."Vendor Bank Account")
                {
                    ApplicationArea = Basic;
                    Caption = 'Partner  Bank Account';
                    ToolTip = 'Specifies the value of the Partner  Bank Account field.';
                }
                field("Vendor Bank Branch Code"; Rec."Vendor Bank Branch Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Partner Bank Branch Code';
                    ToolTip = 'Specifies the value of the Partner Bank Branch Code field.';
                }
                field("Phone No.2"; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the vendor''s telephone number.';
                }
                field("Fax No."; Rec."Fax No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the vendor''s fax number.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the vendor''s email address.';
                }
                field("Home Page"; Rec."Home Page")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the vendor''s web site.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the vendor''s trade type to link transactions made for this vendor with the appropriate general ledger account according to the general posting setup.';
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                }
                field("Vendor Posting Group"; Rec."Vendor Posting Group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Sub Posting Group';
                    Importance = Promoted;
                    ToolTip = 'Specifies the vendor''s market type to link business transactions made for the vendor with the appropriate account in the general ledger.';
                }
                field("Prices Including VAT"; Rec."Prices Including VAT")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies if the Unit Price and Line Amount fields on document lines should be shown with or without VAT.';
                }
                field("Application Method"; Rec."Application Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies how to apply payments to entries for this vendor.';
                }
                field("Partner Type"; Rec."Partner Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies if the vendor is a person or a company.';
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.';
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies how to make payment, such as with bank transfer, cash, or check.';
                }
                field("Our Account No."; Rec."Our Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies your account number with the vendor, if you have one.';
                }
                /* field("Preferred Bank Account";Rec."Preferred Bank Account")
                {
                    ApplicationArea = Basic;
                } */
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the currency code that is inserted by default when you create purchase documents or journal lines for the vendor.';
                }
                field("Language Code"; Rec."Language Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the language that is used when translating specified text on documents to foreign business partner, such as an item description on an order confirmation.';
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the vendor''s VAT registration number.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies when the vendor card was last modified.';
                }
            }
        }
        area(FactBoxes)
        {
            part(Control1904651607; "Vendor Statistics FactBox")
            {
                Caption = 'Sub Statistics FactBox';
                SubPageLink = "No." = field("No."),
                              "Currency Filter" = field("Currency Filter"),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                Visible = true;
            }
            part(Control1903435607; "Vendor Hist. Buy-from FactBox")
            {
                Caption = 'Sub Hist. Buy-from FactBox';
                SubPageLink = "No." = field("No."),
                              "Currency Filter" = field("Currency Filter"),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
                Visible = true;
            }
            part(Control1906949207; "Vendor Hist. Pay-to FactBox")
            {
                Caption = 'Sub Hist. Pay-to FactBox';
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
            group("&Partner")
            {
                Caption = '&Partner';
                Image = Vendor;
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = page "Default Dimensions";
                    RunPageLink = "Table ID" = const(23),
                                  "No." = field("No.");
                    ShortcutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
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
                action("Order &Addresses")
                {
                    ApplicationArea = Basic;
                    Caption = 'Order &Addresses';
                    Image = Addresses;
                    RunObject = page "Order Address List";
                    RunPageLink = "Vendor No." = field("No.");
                    ToolTip = 'Executes the Order &Addresses action.';
                }
                action("Main Sub/Sub")
                {
                    ApplicationArea = Basic;
                    RunObject = page "Main Sub Components";
                    RunPageLink = "Main Sub No." = field("No.");
                    ToolTip = 'Executes the Main Sub/Sub action.';
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
                action("Cross References")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cross References';
                    Image = Change;
                    RunObject = page "Item References";
                    RunPageLink = "Reference Type" = const(Vendor),
                                  "Reference Type No." = field("No.");
                    RunPageView = sorting("Reference Type", "Reference Type No.");
                    ToolTip = 'Executes the Cross References action.';
                }
                action("Online Map")
                {
                    ApplicationArea = Basic;
                    Caption = 'Online Map';
                    Image = Map;
                    ToolTip = 'Executes the Online Map action.';
                    trigger OnAction()
                    begin
                        Rec.DisplayMap();
                    end;
                }
                separator(Action11) { }
                separator(Action83)
                {
                    Caption = '';
                }
                separator(Action108) { }
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
                    RunPageView = sorting("Vendor No.", "Item No.");
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
                separator(Action117) { }
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
                    Image = VendorLedger;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
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
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Apply Template")
                {
                    ApplicationArea = Basic;
                    Caption = 'Apply Template';
                    Ellipsis = true;
                    Image = ApplyTemplate;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Apply Template action.';
                    trigger OnAction()
                    var
                        ConfigTemplateMgt: Codeunit "Config. Template Management";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        ConfigTemplateMgt.UpdateFromTemplateSelection(RecRef);
                    end;
                }
            }
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
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "Purchase Journal";
                ToolTip = 'Executes the Purchase Journal action.';
            }
        }
        area(Reporting)
        {
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
            action("Vendor - Balance to Date")
            {
                ApplicationArea = Basic;
                Caption = 'Vendor - Balance to Date';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = report "Vendor - Balance to Date";
                ToolTip = 'Executes the Vendor - Balance to Date action.';
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        ActivateFields();
    end;

    trigger OnAfterGetRecord()
    begin
        ActivateFields();
    end;

    trigger OnInit()
    begin
        ContactEditable := true;
        MapPointVisible := true;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Vendor Type" := Rec."Vendor Type"::"Implementing Partner";
    end;

    trigger OnOpenPage()
    var
        MapMgt: Codeunit "Online Map Management";
    begin
        ActivateFields();
        if not MapMgt.TestSetup() then
            MapPointVisible := false;
    end;

    var
        CalendarMgmt: Codeunit "Calendar Management";
        PaymentToleranceMgt: Codeunit "Payment Tolerance Management";
        CustomizedCalEntry: Record "Customized Calendar Entry";
        CustomizedCalendar: Record "Customized Calendar Change";
        Text001: Label 'Do you want to allow payment tolerance for entries that are currently open?';
        Text002: Label 'Do you want to remove payment tolerance from entries that are currently open?';
        [InDataSet]
        MapPointVisible: Boolean;
        [InDataSet]
        ContactEditable: Boolean;


    procedure ActivateFields()
    begin
        ContactEditable := Rec."Primary Contact No." = '';
    end;

    local procedure ContactOnAfterValidate()
    begin
        ActivateFields();
    end;
}
