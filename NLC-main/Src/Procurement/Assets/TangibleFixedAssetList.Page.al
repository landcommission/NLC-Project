#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50114 "Tangible Fixed Asset List"
{
    Caption = 'Tangible Fixed Asset List';
    CardPageID = "Tangible Fixed Asset Card";
    Editable = false;
    PageType = List;
    SourceTable = "Fixed Asset";
    SourceTableView = where("FA Class Code" = const('TANGIBLE'));

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
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(SupplierName; "Supplier Name")
                {
                    ApplicationArea = Basic;
                }
                // field(ResponsibleEmployeeName; "Responsible Employee Name")
                // {
                //     ApplicationArea = Basic;
                // }
                field(LocationName; "Location Name")
                {
                    ApplicationArea = Basic;
                }
                field(SearchDescription; "Search Description")
                {
                    ApplicationArea = Basic;
                }
                field(SerialNo; "Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field(FAClassCode; "FA Class Code")
                {
                    ApplicationArea = Basic;
                }
                field(FASubclassCode; "FA Subclass Code")
                {
                    ApplicationArea = Basic;
                }
                field(AssetMovementStatus; "Asset Movement Status")
                {
                    ApplicationArea = Basic;
                }
                // field(POCode; "IFMIS Code")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'PO Code';
                // }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(FixedAsset)
            {
                Caption = 'Fixed &Asset';
                Image = FixedAssets;
                action(DepreciationBooks)
                {
                    ApplicationArea = Basic;
                    Caption = 'Depreciation &Books';
                    Image = DepreciationBooks;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "FA Depreciation Books";
                    RunPageLink = "FA No." = field("No.");
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Fixed Asset Statistics";
                    RunPageLink = "FA No." = field("No.");
                    ShortCutKey = 'F7';
                }
                action(AssetMovementRegister)
                {
                    ApplicationArea = Basic;
                    Caption = 'Asset Movement Register';
                    Image = FARegisters;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Asset Issue Request Lines";
                    RunPageLink = "Asset No." = field("No."),
                                  Status = const(Approved);
                    RunPageMode = View;
                }
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    action(DimensionsSingle)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-Single';
                        Image = Dimensions;
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID" = const(5600),
                                      "No." = field("No.");
                        ShortCutKey = 'Shift+Ctrl+D';
                    }
                    action(DimensionsMultiple)
                    {
                        AccessByPermission = TableData Dimension = R;
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;

                        trigger OnAction()
                        var
                            FA: Record "Fixed Asset";
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(FA);
                            //DefaultDimMultiple.SetMultiFA(FA);
                            DefaultDimMultiple.RunModal;
                        end;
                    }
                }
                action(MaintenanceLedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Main&tenance Ledger Entries';
                    Image = MaintenanceLedgerEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Maintenance Ledger Entries";
                    RunPageLink = "FA No." = field("No.");
                    RunPageView = sorting("FA No.");
                }
                action(Picture)
                {
                    ApplicationArea = Basic;
                    Caption = 'Picture';
                    Image = Picture;
                    RunObject = Page "Fixed Asset Picture";
                    RunPageLink = "No." = field("No.");
                }
                action(CopyFixedAsset)
                {
                    ApplicationArea = Basic;
                    Caption = 'C&opy Fixed Asset';
                    Ellipsis = true;
                    Image = CopyFixedAssets;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        CopyFA: Report "Copy Fixed Asset";
                    begin
                        CopyFA.SetFANo("No.");
                        CopyFA.RunModal;
                    end;
                }
                action(FAPostingTypesOverview)
                {
                    ApplicationArea = Basic;
                    Caption = 'FA Posting Types Overview';
                    Image = ShowMatrix;
                    RunObject = Page "FA Posting Types Overview";
                }
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const("Fixed Asset"),
                                  "No." = field("No.");
                }
            }
            group(MainAsset)
            {
                Caption = 'Main Asset';
                Image = Components;
                action(MainAssetComponents)
                {
                    ApplicationArea = Basic;
                    Caption = 'M&ain Asset Components';
                    Image = Components;
                    RunObject = Page "Main Asset Components";
                    RunPageLink = "Main Asset No." = field("No.");
                }
                action(MainAssetStatistics)
                {
                    ApplicationArea = Basic;
                    Caption = 'Ma&in Asset Statistics';
                    Image = StatisticsDocument;
                    RunObject = Page "Main Asset Statistics";
                    RunPageLink = "FA No." = field("No.");
                }
                separator(Action45)
                {
                    Caption = '';
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action(LedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Ledger E&ntries';
                    Image = FixedAssetLedger;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "FA Ledger Entries";
                    RunPageLink = "FA No." = field("No.");
                    RunPageView = sorting("FA No.");
                    ShortCutKey = 'Ctrl+F7';
                }
                action(ErrorLedgerEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Error Ledger Entries';
                    Image = ErrorFALedgerEntries;
                    RunObject = Page "FA Error Ledger Entries";
                    RunPageLink = "Canceled from FA No." = field("No.");
                    RunPageView = sorting("Canceled from FA No.");
                }
                action(MaintenanceRegistration)
                {
                    ApplicationArea = Basic;
                    Caption = 'Maintenance &Registration';
                    Image = MaintenanceRegistrations;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Maintenance Registration";
                    RunPageLink = "FA No." = field("No.");
                }
            }
        }
        area(processing)
        {
            action(FixedAssetJournal)
            {
                ApplicationArea = Basic;
                Caption = 'Fixed Asset Journal';
                Image = Journal;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Fixed Asset Journal";
            }
            action(FixedAssetGLJournal)
            {
                ApplicationArea = Basic;
                Caption = 'Fixed Asset G/L Journal';
                Image = Journal;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Fixed Asset G/L Journal";
            }
            action(FixedAssetReclassificationJournal)
            {
                ApplicationArea = Basic;
                Caption = 'Fixed Asset Reclassification Journal';
                Image = Journal;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "FA Reclass. Journal";
            }
            action(RecurringFixedAssetJournal)
            {
                ApplicationArea = Basic;
                Caption = 'Recurring Fixed Asset Journal';
                Image = Journal;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Recurring Fixed Asset Journal";
            }
            action(CalculateDepreciation)
            {
                ApplicationArea = Basic;
                Caption = 'Calculate Depreciation';
                Ellipsis = true;
                Image = CalculateDepreciation;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Report "Calculate Depreciation";
            }
        }
        area(reporting)
        {
            action(FixedAssetRegister)
            {
                ApplicationArea = Basic;
                Caption = 'Fixed Asset Register';
                Image = "Report";
                RunObject = Report "Fixed Asset Register";
            }
            action(FixedAssetBookValue01)
            {
                ApplicationArea = Basic;
                Caption = 'Fixed Asset - Book Value 01';
                Image = ItemAvailability;
                RunObject = Report "Fixed Asset - Book Value 01";
            }
            action(FixedAssetBookValue02)
            {
                ApplicationArea = Basic;
                Caption = 'Fixed Asset - Book Value 02';
                Image = "Report";
                RunObject = Report "Fixed Asset - Book Value 02";
            }
            action(FixedAssetsDetails)
            {
                ApplicationArea = Basic;
                Caption = 'Fixed Assets - Details';
                Image = "Report";
                RunObject = Report "Fixed Asset - Details";
            }
            action(FixedAssetsAcquisitionList)
            {
                ApplicationArea = Basic;
                Caption = 'Fixed Assets - Acquisition List';
                Image = "Report";
                RunObject = Report "Fixed Asset - Acquisition List";
            }
            action(FixedAssetsList)
            {
                ApplicationArea = Basic;
                Caption = 'Fixed Assets - List';
                Image = "Report";
                RunObject = Report "Fixed Asset - List";
            }
            action(StockQuantities)
            {
                ApplicationArea = Basic;
                Caption = 'Stock Quantities';
                Image = "Report";
                RunObject = Report 50084;
            }
            action(InventoryValuation)
            {
                ApplicationArea = Basic;
                Caption = 'Inventory Valuation';
                Image = "Report";
                RunObject = Report "Inventory Valuation";
            }
            action(StocktakingProcess)
            {
                ApplicationArea = Basic;
                Caption = 'Stock taking Process';
                Image = "Report";
                RunObject = Page "Phys. Inventory Journal";
            }
            action(DepartmentalConsumptionReport)
            {
                ApplicationArea = Basic;
                Caption = 'Departmental Consumption Report';
                Image = "Report";
                RunObject = Report 50087;
            }
            action(ConsumptionTrendAnalys)
            {
                ApplicationArea = Basic;
                Caption = 'Consumption Trend Analys';
                Image = "Report";
                RunObject = Report 50088;
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "FA Class Code" := 'TANGIBLE'
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "FA Class Code" := 'TANGIBLE'
    end;
}

