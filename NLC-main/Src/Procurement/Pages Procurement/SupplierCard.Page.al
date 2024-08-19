#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50129 "Supplier Card"
{
    Caption = 'Supplier Card';
    InsertAllowed = true;
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Vendor;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;

                    trigger OnAssistEdit()
                    begin
                        if AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                field(Address; Address)
                {
                    ApplicationArea = Basic;
                }
                field(Address2; "Address 2")
                {
                    ApplicationArea = Basic;
                }
                field(PostCode; "Post Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(CountryRegionCode; "Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field(PhoneNo; "Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(PrimaryContactNo; "Primary Contact No.")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        ActivateFields;
                    end;
                }
                field(Control16; Contact)
                {
                    ApplicationArea = Basic;
                    Editable = ContactEditable;
                    Importance = Promoted;

                    trigger OnValidate()
                    begin
                        ContactOnAfterValidate;
                    end;
                }
                field(City; City)
                {
                    ApplicationArea = Basic;
                }
                field(SearchName; "Search Name")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = Basic;
                }
                field(LastDateModified; "Last Date Modified")
                {
                    ApplicationArea = Basic;
                }
                // field(Category; Category)
                // {
                //     ApplicationArea = Basic;
                // }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field("Phone No.2"; "Phone No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(FaxNo; "Fax No.")
                {
                    ApplicationArea = Basic;
                }
                field(EMail; "E-Mail")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(HomePage; "Home Page")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field(GenBusPostingGroup; "Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                field(VATBusPostingGroup; "VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Supplier Posting Group"; "Vendor Posting Group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Supplier Posting Group';
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                field(InvoiceDiscCode; "Invoice Disc. Code")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(PricesIncludingVAT; "Prices Including VAT")
                {
                    ApplicationArea = Basic;
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
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(23),
                                  "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                }
                action(Contact)
                {
                    AccessByPermission = TableData Contact = R;
                    ApplicationArea = Basic;
                    Caption = 'C&ontact';
                    Image = ContactPerson;

                    trigger OnAction()
                    begin
                        ShowContact;
                    end;
                }
                action(OrderAddresses)
                {
                    ApplicationArea = Basic;
                    Caption = 'Order &Addresses';
                    Image = Addresses;
                    RunObject = Page "Order Address List";
                    RunPageLink = "Vendor No." = field("No.");
                }
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(Vendor),
                                  "No." = field("No.");
                }
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
                    RunPageView = sorting("Vendor No.", "Item No.");
                }
                action(Prices)
                {
                    ApplicationArea = Basic;
                    Caption = 'Prices';
                    Image = Price;
                    RunObject = Page "Purchase Prices";
                    RunPageLink = "Vendor No." = field("No.");
                    RunPageView = sorting("Vendor No.");
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action(Action69)
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
    }

    trigger OnAfterGetCurrRecord()
    begin
        ActivateFields;
    end;

    trigger OnAfterGetRecord()
    begin
        ActivateFields;
    end;

    trigger OnInit()
    begin
        ContactEditable := true;
        MapPointVisible := true;
    end;

    trigger OnOpenPage()
    var
        MapMgt: Codeunit "Online Map Management";
    begin
        ActivateFields;
        if not MapMgt.TestSetup then
            MapPointVisible := false;
    end;

    var
        CalendarMgmt: Codeunit "Calendar Management";
        PaymentToleranceMgt: Codeunit "Payment Tolerance Management";
        CustomizedCalEntry: Record "Customized Calendar Entry";
        CustomizedCalendar: Record "Customized Calendar Change";
        Text001: label 'Do you want to allow payment tolerance for entries that are currently open?';
        Text002: label 'Do you want to remove payment tolerance from entries that are currently open?';
        [InDataSet]
        MapPointVisible: Boolean;
        [InDataSet]
        ContactEditable: Boolean;
        Vendor: Record Vendor;
        Text003: label 'Vendor [%1 - %2] has not attached documents';


    procedure ActivateFields()
    begin
        ContactEditable := "Primary Contact No." = '';
    end;

    local procedure ContactOnAfterValidate()
    begin
        ActivateFields;
    end;


    procedure RecordLinkCheck(job: Record Vendor) RecordLnkExist: Boolean
    var
        objRecordLnk: Record "Record Link";
        TableCaption: RecordID;
        objRecord_Link: RecordRef;
    begin
        objRecord_Link.GetTable(job);
        TableCaption := objRecord_Link.RecordId;
        objRecordLnk.Reset;
        objRecordLnk.SetRange(objRecordLnk."Record ID", TableCaption);
        if objRecordLnk.Find('-') then exit(true) else exit(false);
    end;
}

