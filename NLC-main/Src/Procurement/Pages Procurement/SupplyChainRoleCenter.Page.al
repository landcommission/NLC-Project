#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50120 "Supply Chain Procurement"
{
    Caption = 'Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part(ApprovalsActivities; "Approvals Activities")
                {
                    ApplicationArea = Suite;
                }
                part(Control1902476008; 9151)
                {
                    Visible = false;
                }
            }
            group(Control1900724708)
            {
                part(Control25; 771)
                {
                    Visible = false;
                }
                part(Control37; 771)
                {
                    Visible = false;
                }
                part(Control21; 772)
                {
                    Visible = false;
                }
                part(Control44; 772)
                {
                    Visible = false;
                }
                part(Control45; 681)
                {
                    Visible = false;
                }
                part(Control35; 675)
                {
                    Visible = false;
                }
                part(Control1905989608; 9152)
                {
                    Visible = false;
                }
                part(Control1903012608; 9175)
                {
                    Visible = false;
                }
                systempart(Control43; MyNotes)
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Fixed Asset Register")
            {
                ApplicationArea = Basic;
                Caption = 'Fixed Asset Register';
                Image = "Report";
                RunObject = Report 5603;
            }
            action("Vendor/&Item Purchases")
            {
                ApplicationArea = Basic;
                Caption = 'Vendor/&Item Purchases';
                Image = "Report";
                RunObject = Report 5606;
            }
            action("Fixed Asset - Book Value 01")
            {
                ApplicationArea = Basic;
                Caption = 'Fixed Asset - Book Value 01';
                Image = ItemAvailability;
                RunObject = Report 5605;
            }
            action("Fixed Assets - Details")
            {
                ApplicationArea = Basic;
                Caption = 'Fixed Assets - Details';
                Image = "Report";
                RunObject = Report 5604;
            }
            action("Fixed Assets - Acquisition List")
            {
                ApplicationArea = Basic;
                Caption = 'Fixed Assets - Acquisition List';
                Image = "Report";
                RunObject = Report 5608;
            }
            action("Fixed Assets - List")
            {
                ApplicationArea = Basic;
                Caption = 'Fixed Assets - List';
                Image = "Report";
                RunObject = Report 5601;
            }
            // action("Stock Taking Worksheet")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Stock Taking Worksheet';
            //     Image = ItemAvailability;
            //     RunObject = Report 50085;
            // }
            action("Stock Quantities")
            {
                ApplicationArea = Basic;
                Caption = 'Stock Quantities';
                Image = "Report";
                RunObject = Report 50084;
            }
            action("Inventory Valuation")
            {
                ApplicationArea = Basic;
                Caption = 'Inventory Valuation';
                Image = "Report";
                RunObject = Report 1001;
            }
            action("Stock taking Process")
            {
                ApplicationArea = Basic;
                Caption = 'Stock taking Process';
                Image = "Report";
                RunObject = Page 392;
            }
            action("Departmental Consumption Report")
            {
                ApplicationArea = Basic;
                Caption = 'Departmental Consumption Report';
                Image = "Report";
                RunObject = Report 50087;
            }
            action("Consumption Trend Analys")
            {
                ApplicationArea = Basic;
                Caption = 'Consumption Trend Analys';
                Image = "Report";
                RunObject = Report 50088;
            }
            action("Asset Transfer Analysis")
            {
                ApplicationArea = Basic;
                Caption = 'Asset Transfer Analysis';
                Image = "Report";
                RunObject = Report 50028;
            }
            action("Fixed Asset Movement Analysis")
            {
                ApplicationArea = Basic;
                Caption = 'Fixed Asset Movement Analysis';
                Image = "Report";
                RunObject = Report 50091;
            }
            action("Fixed Asset - Registers")
            {
                ApplicationArea = Basic;
                Caption = 'Fixed Asset - Registers';
                Image = "Report";
                RunObject = Report 52193750;
            }
        }
        area(embedding)
        {
            action(Suppliers)
            {
                ApplicationArea = Basic;
                Caption = 'Suppliers';
                Image = Vendor;
                RunObject = Page "Supplier List";
            }
            action(Items)
            {
                ApplicationArea = Basic;
                Caption = 'Items';
                Image = Item;
                RunObject = Page "Item List";
            }
            action(Hotels)
            {
                ApplicationArea = Basic;
                Caption = 'Hotels';
                RunObject = Page "Hotel List";
            }
            action("All Fixed Asset")
            {
                ApplicationArea = Basic;
                Caption = 'All Fixed Asset';
                RunObject = Page "Tangible Fixed Asset List";
            }
            action("Available Fixed Assets")
            {
                ApplicationArea = Basic;
                Caption = 'Available Fixed Assets';
                RunObject = Page "Tangible Fixed Asset List";
                RunPageView = where("Asset Movement Status" = const(Available));
            }
            action("Requested Fixed Assets")
            {
                ApplicationArea = Basic;
                Caption = 'Requested Fixed Assets';
                RunObject = Page "Tangible Fixed Asset List";
                RunPageView = where("Asset Movement Status" = const(Requested));
            }
            action("Allocated Fixed Assets")
            {
                ApplicationArea = Basic;
                Caption = 'Allocated Fixed Assets';
                RunObject = Page "Tangible Fixed Asset List";
                RunPageView = where("Asset Movement Status" = const(Allocated));
            }
            action("Issued Fixed Assets")
            {
                ApplicationArea = Basic;
                Caption = 'Issued Fixed Assets';
                RunObject = Page "Tangible Fixed Asset List";
                RunPageView = where("Asset Movement Status" = const(Issued));
            }
            action("Disposed Fixed Assets")
            {
                ApplicationArea = Basic;
                Caption = 'Disposed Fixed Assets';
                RunObject = Page "Tangible Fixed Asset List";
                RunPageView = where("Asset Movement Status" = const(Disposed));
            }
            action("All InTangible Assets")
            {
                ApplicationArea = Basic;
                Caption = 'All InTangible Assets';
                RunObject = Page "InTangible Fixed Asset List";
            }
        }
        area(sections)
        {
            group("Memo Requisition")
            {
                Caption = 'Internal Memo Requisition';
                Image = Departments;

                // action("All Memo Requisitions")
                // {
                //     ApplicationArea = all;
                //     Caption = 'All Memo Requisitions';
                //     RunObject = Page "Internal Memo Requisitions";
                // }
                action("Open Memo Requisitions")
                {
                    ApplicationArea = all;
                    Caption = 'Open Memo Requisitions';
                    RunObject = Page "Internal Memo Requisitions";
                    RunPageLink = Status = const(Open);
                }
                action("Pending Memo Requisitions")
                {
                    ApplicationArea = all;
                    Caption = 'Pending Memo Requisitions';
                    RunObject = Page "Internal Memo Requisitions";
                    RunPageLink = Status = const("Pending Approval");
                }
                action("Approved Memo Requisitions")
                {
                    ApplicationArea = all;
                    Caption = 'Approved Memo Requisitions';
                    RunObject = Page "Internal Memo Requisitions";
                    RunPageLink = Status = const(Released);
                }
                action("Rejected Memo Requisitions")
                {
                    ApplicationArea = all;
                    Caption = 'Rejected Memo Requisitions';
                    RunObject = Page "Internal Memo Requisitions";
                    RunPageLink = Status = const(Rejected);
                }
                action("Processed Memo Requisitions")
                {
                    ApplicationArea = all;
                    Caption = 'Processed Memo Requisitions';
                    RunObject = Page "Internal Memo Requisitions";
                    RunPageLink = Status = const(Posted);
                }

            }
            group("Goods Processing")
            {
                group("Goods Receiving Process")
                {
                    Caption = 'Goods Receiving Process';
                    Image = Departments;
                    action("All Items POs")
                    {
                        ApplicationArea = Basic;
                        Caption = 'All Items POs';
                        RunObject = Page "Purchase Order List";
                        Visible = false;
                    }
                    action("Open Items POs")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Open Items POs';
                        RunObject = Page "Purchase Order List";
                        RunPageView = where(Status = const(Open));
                        Visible = false;
                    }
                    action("Pending Items POs")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Pending Items POs';
                        RunObject = Page "Purchase Order List";
                        RunPageView = where(Status = const("Pending Approval"));
                        Visible = false;
                    }
                    action("Approved Items POs")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Items POs';
                        RunObject = Page "Purchase Order List";
                        RunPageView = where(Status = const(Released),
                                        "Archive Unused Doc" = filter(false));
                        Visible = false;
                    }
                    action("Archived Items POs")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Archived Items POs';
                        RunObject = Page "Purchase Order List";
                        RunPageView = where("Archive Unused Doc" = const(true));
                        Visible = false;
                    }
                    // action("All Items PO")
                    // {
                    //     ApplicationArea = Basic;
                    //     Caption = 'All Items PO';
                    //     RunObject = Page "Items Requisitions Lists";
                    // }
                    action("Open Items PO")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Open Items PO';
                        RunObject = Page "Items Requisitions Lists";
                        RunPageLink = Status = const(Open);
                    }
                    action("Pending Items PO")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Pending Items PO';
                        RunObject = Page "Items Requisitions Lists";
                        RunPageLink = Status = const("Pending Approval");
                    }
                    action("Approved Items PO")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Items PO';
                        RunObject = Page "Items Requisitions Lists";
                        RunPageLink = Status = const(Released);
                    }
                    action("Rejected Items PO")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Rejected Items PO';
                        RunObject = Page "Items Requisitions Lists";
                        RunPageLink = Status = const(Rejected);
                    }
                    action("Posted Items PO")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Posted Items PO';
                        RunObject = Page "Items Requisitions Lists";
                        RunPageLink = Status = const(Posted);
                    }
                }
                group("Goods Issuing Process")
                {
                    Caption = 'Goods Issuing Process';
                    Image = Departments;
                    action("All Store Requisitions")
                    {
                        ApplicationArea = Basic;
                        Caption = 'All Store Requisitions';
                        RunObject = Page "Store Requisitions Lists";
                    }
                    action("Open Store Requisitions")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Open Store Requisitions';
                        RunObject = Page "Store Requisitions Lists";
                        RunPageView = where(Status = const(Open));
                    }
                    action("Pending Approval Store Requisitions")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Pending Approval Store Requisitions';
                        RunObject = Page "Store Requisitions Lists";
                        RunPageView = where(Status = const("Pending Approval"));
                    }
                    action("Rejected Store Requisitions")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Rejected Store Requisitions';
                        RunObject = Page "Store Requisitions Lists";
                        RunPageView = where(Status = const(Rejected));
                    }
                    action("Approved Store Requisitions")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Store Requisitions';
                        RunObject = Page "Released Store Requisitions Ls";
                    }
                    action("Posted Store Requisitions")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Posted Store Requisitions';
                        RunObject = Page "Posted Store Requisition Lists";
                        RunPageView = where(Status = const(Posted));
                    }
                }
            }
            group("Assets Processing")
            {
                group("Assets Receiving Process")
                {
                    Caption = 'Assets Receiving Process';
                    Image = SNInfo;
                    action("All Asset PO")
                    {
                        ApplicationArea = Basic;
                        Caption = 'All Asset PO';
                        RunObject = Page "Asset Purchase Requisition Ls";
                    }
                    action("Open Asset PO")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Open Asset PO';
                        RunObject = Page "Asset Purchase Requisition Ls";
                        RunPageView = where(Status = const(Open));
                    }
                    action("Pending Asset PO")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Pending Asset PO';
                        RunObject = Page "Asset Purchase Requisition Ls";
                        RunPageView = where(Status = const("Pending Approval"));
                    }
                    action("Approved Asset PO")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Asset PO';
                        RunObject = Page "Asset Purchase Requisition Ls";
                        RunPageView = where(Status = const(Released));
                    }
                    action("Posted Asset PO")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Posted Asset PO';
                        RunObject = Page "Asset Purchase Requisition Ls";
                        RunPageView = where(Status = const(Posted));
                    }
                    action("Rejected Asset PO")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Rejected Asset PO';
                        RunObject = Page "Asset Purchase Requisition Ls";
                        RunPageView = where(Status = const(Rejected));
                    }
                    action("Created Fixed Assets")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Created Fixed Assets';
                        RunObject = Page "Create Fixed Asset List";
                    }
                    action("Assets Receiving")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Assets Receiving';
                        RunObject = Page "Asset Receiving Lists";
                        RunPageView = where(Status = const(Open));
                        Visible = true;
                    }
                    action("Received Assets")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Received Assets';
                        RunObject = Page "Asset Receiving Lists";
                        RunPageMode = View;
                        RunPageView = where(Status = const(Posted));
                        Visible = true;
                    }
                }
                group("Assets Allocation Process")
                {
                    Caption = 'Assets Allocation Process';
                    Image = SNInfo;
                    // action("All Asset Allocation Request")
                    // {
                    //     ApplicationArea = Basic;
                    //     Caption = 'All Asset Allocation Request';
                    //     RunObject = Page "Asset Allocation Request List";
                    // }
                    action("Open Asset Allocation Request")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Open Asset Allocation Request';
                        RunObject = Page "Asset Allocation Request List";
                        RunPageLink = Status = const(Open);
                    }
                    action("Pending Asset Allocation Request")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Pending Asset Allocation Request';
                        RunObject = Page "Asset Allocation Request List";
                        RunPageLink = Status = const("Pending Approval");
                    }
                    action("Approved Asset Allocation Request")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Asset Allocation Request';
                        RunObject = Page "Asset Allocation Request List";
                        RunPageLink = Status = const(Approved);
                    }
                    action("Rejected Asset Allocation Request")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Rejected Asset Allocation Request';
                        RunObject = Page "Asset Allocation Request List";
                        RunPageLink = Status = const(Open),
                                        Rejected = const(true);
                    }
                }
                group("Assets Movement Process")
                {
                    Caption = 'Assets Movement Process';
                    Image = SNInfo;
                    action("Asset Issue List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Asset Issue List';
                        RunObject = Page "HR Asset Issue Lists";
                    }
                    action("Asset Return List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Asset Return List';
                        RunObject = Page "HR Asset Return List";
                    }
                    action("Asset Transfers List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Asset Transfers List';
                        RunObject = Page "HR Asset Transfers List";
                    }
                    action("Approved Asset List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Asset List';
                        RunObject = Page "HR ApprovedAsset Transfer List";
                    }
                    action("Issued Asset  List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Issued Asset  List';
                        RunObject = Page "Issued Asset Transfer List";
                    }
                    action("Posted Asset List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Posted Asset List';
                        RunObject = Page "Posted Asset Transfer List";
                    }
                    action("Rejected Asset  List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Rejected Asset  List';
                        RunObject = Page "Rejected Asset Transfer List";
                    }
                }
                group("Assets Incidence Reporting")
                {
                    Caption = 'Assets Incidence Reporting';
                    Image = SNInfo;
                    action("All Incidence Reporting")
                    {
                        ApplicationArea = Basic;
                        Caption = 'All Incidence Reporting';
                        RunObject = Page "Asset Incidence Reporting List";
                        RunPageView = where(Status = filter(<> Posted));
                    }
                    action("Open Incidence Reporting")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Open Incidence Reporting';
                        RunObject = Page "Asset Incidence Reporting List";
                        RunPageView = where(Status = filter(Open));
                    }
                    action("Pending Approval Incidence Reporting")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Pending Approval Incidence Reporting';
                        RunObject = Page "Asset Incidence Reporting List";
                        RunPageView = where(Status = filter("Pending Approval"));
                    }
                    action("Approved Incidence Reporting")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Incidence Reporting';
                        RunObject = Page "Asset Incidence Reporting List";
                        RunPageView = where(Status = filter(Approved));
                    }
                    action("Posted Asset Incidence Reporting")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Posted Asset Incidence Reporting';
                        RunObject = Page "Asset Incidence Reporting List";
                        RunPageView = where(Status = const(Posted));
                    }
                }
            }
            group("Disposal Process")
            {
                Caption = 'Disposal Process';
                Image = SNInfo;
                action("All Departmental Disposal Plans")
                {
                    ApplicationArea = Basic;
                    Caption = 'All Departmental Disposal Plans';
                    RunObject = Page "Departmental Disposal Lists";
                }
                action("Open Departmental Disposal Plans")
                {
                    ApplicationArea = Basic;
                    Caption = 'Open Departmental Disposal Plans';
                    RunObject = Page "Departmental Disposal Lists";
                    RunPageView = where(Status = const(Open));
                }
                action("Pending Departmental Disposal Plans")
                {
                    ApplicationArea = Basic;
                    Caption = 'Pending Departmental Disposal Plans';
                    RunObject = Page "Departmental Disposal Lists";
                    RunPageView = where(Status = const("Pending Approval"));
                }
                action("Approved Departmental Disposal Plans")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Departmental Disposal Plans';
                    RunObject = Page "Departmental Disposal Lists";
                    RunPageView = where(Status = const(Approved));
                }
                action("Approved Disposal Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Disposal Lines';
                    RunObject = Page "Approved Disposal Asset Lines";
                }
                action("Rejected Disposal Asset Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Rejected Disposal Asset Lines';
                    RunObject = Page "Rejected Disposal Asset Lines";
                }
                action("Pending Disposal Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Pending Disposal Lines';
                    RunObject = Page "Pending Disposal Asset Lines";
                }
                action("Disposed Asset Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Disposed Asset Lines';
                    RunObject = Page "Disposed Disposal Asset Lines";
                }
                action("Disposal Periods")
                {
                    ApplicationArea = Basic;
                    Caption = 'Disposal Periods';
                    Image = Item;
                    RunObject = Page "Disposal Periods";
                }
                action("Disposal Methods")
                {
                    ApplicationArea = Basic;
                    Caption = 'Disposal Methods';
                    Image = Item;
                    RunObject = Page "Disposal Methods Lists";
                }
            }
            group("General Setups")
            {
                Caption = 'General Setup';
                // Image = Travel;
                action("Chart of Accounts")
                {
                    ApplicationArea = Basic;
                    Caption = 'Chart of Accounts';
                    Description = 'General Setup';
                    Image = Setup;
                    RunObject = Page 16;
                }
                action("Units of Measure")
                {
                    ApplicationArea = Basic;
                    Caption = 'Units of Measure';
                    Description = 'General Setup';
                    Image = Setup;
                    RunObject = Page 209;
                }
                action("Item Posting Groups")
                {
                    ApplicationArea = Basic;
                    Caption = 'Item Posting Groups';
                    Description = 'General Setup';
                    Image = Setup;
                    RunObject = Page 112;
                }
                action("No Series")
                {
                    ApplicationArea = Basic;
                    Caption = 'No Series';
                    Description = 'General Setup';
                    Image = Setup;
                    RunObject = Page 456;
                }
                action("Item Categories")
                {
                    ApplicationArea = Basic;
                    Caption = 'Item Categories';
                    Description = 'General Setup';
                    Image = Setup;
                    RunObject = Page 5730;
                }
                action("Supplier Categories")
                {
                    ApplicationArea = Basic;
                    Caption = 'Supplier Categories';
                    Description = 'General Setup';
                    Image = Setup;
                    RunObject = Page "Supplier Categories";
                }
                action("General Business Posting Groups")
                {
                    ApplicationArea = Basic;
                    Caption = 'General Business Posting Groups';
                    Description = 'General Setup';
                    Image = Setup;
                    RunObject = Page 312;
                }
                action("General Product Posting Groups")
                {
                    ApplicationArea = Basic;
                    Caption = 'General Product Posting Groups';
                    Description = 'General Setup';
                    Image = Setup;
                    RunObject = Page 313;
                }
                action("General Posting Setup")
                {
                    ApplicationArea = Basic;
                    Caption = 'General Posting Setup';
                    Description = 'General Setup';
                    Image = Setup;
                    RunObject = Page 314;
                }
                action("Posting Periods")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posting Periods';
                    Description = 'General Setup';
                    Image = Setup;
                    RunObject = Page 100;
                }

            }
            group("Asset Setup")
            {
                Caption = 'Asset Setup';

                Description = 'Other HR Setups';
                Image = Travel;
                action("Asset Posting Groups")
                {
                    ApplicationArea = Basic;
                    Caption = 'Asset Posting Groups';
                    Description = 'Asset Setups';
                    Image = Setup;
                    RunObject = Page 5613;
                }
                action("Asset Classes")
                {
                    ApplicationArea = Basic;
                    Caption = 'Asset Classes';
                    Description = 'Asset Setups';
                    Image = Setup;
                    RunObject = Page 5615;
                }
                action("Asset Subclasses")
                {
                    ApplicationArea = Basic;
                    Caption = 'Asset Subclasses';
                    Description = 'Asset Setups';
                    Image = Setup;
                    RunObject = Page 5616;
                }
                action("Asset Locations")
                {
                    ApplicationArea = Basic;
                    Caption = 'Asset Locations';
                    Description = 'Asset Setups';
                    Image = Setup;
                    RunObject = Page 5617;
                }
                action("Asset Insurance Types")
                {
                    ApplicationArea = Basic;
                    Caption = 'Asset Insurance Types';
                    Description = 'Asset Setups';
                    Image = Setup;
                    RunObject = Page 5648;
                }
                action("Asset Maintenance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Asset Maintenance';
                    Description = 'Asset Setups';
                    Image = Setup;
                    RunObject = Page 5642;
                }
                action("Asset Depreciation Book")
                {
                    ApplicationArea = Basic;
                    Caption = 'Asset Depreciation Book';
                    Description = 'Asset Setups';
                    Image = Setup;
                    RunObject = Page 5611;
                }
                action("Asset Depreciation Table")
                {
                    ApplicationArea = Basic;
                    Caption = 'Asset Depreciation Table';
                    Description = 'Asset Setups';
                    Image = Setup;
                    RunObject = Page 5663;
                }
            }

        }
        area(processing)
        {
            group(Approvals)
            {
                Caption = 'Approvals';
                Image = ExecuteBatch;
                action("Approval Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Entries';
                    RunObject = Page "Approval Entries";
                }
            }


            group("Share Point Link")
            {
                Caption = 'Share Point Link';
                group(ActionGroup2)
                {
                    Caption = 'Share Point Link';
                    Image = Travel;
                    action("Sharepoint Information")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Sharepoint Information';
                        Description = 'General Setup';
                        Image = Setup;
                        RunObject = Page "Sharepoint Information";
                    }
                }
            }
        }
    }
}
profile "Supply Chain Procurement"
{
    Caption = 'Supply Chain Procurement';
    RoleCenter = "Supply Chain Procurement";
    ProfileDescription = 'Supply Chain Procurement';
}


