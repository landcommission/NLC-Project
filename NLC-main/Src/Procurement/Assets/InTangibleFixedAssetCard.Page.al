#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50111 "InTangible Fixed Asset Card"
{
    Caption = 'InTangible Fixed Asset Card';
    PageType = ListPlus;
    RefreshOnActivate = true;
    SourceTable = "Fixed Asset";
    SourceTableView = where("FA Class Code" = const('INTANGIBLE'));

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
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(SearchDescription; "Search Description")
                {
                    ApplicationArea = Basic;
                }
                field(SerialNo; "Serial No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(FinancedBy; "Financed By")
                {
                    ApplicationArea = Basic;
                }
                field(TagNo; "Tag No")
                {
                    ApplicationArea = Basic;
                }
                field(MakeModel; "Make/Model")
                {
                    ApplicationArea = Basic;
                }
                field(DateofDeliveryInstallation; "Date of Delivery/Installation")
                {
                    ApplicationArea = Basic;
                }
                field(Condition; Condition)
                {
                    ApplicationArea = Basic;
                }
                field(SupplierName; "Supplier Name")
                {
                    ApplicationArea = Basic;
                }
                field(LocationName; "Location Name")
                {
                    ApplicationArea = Basic;
                }
                field(NotesRemarks; "Notes/Remarks")
                {
                    ApplicationArea = Basic;
                }
                field(Inactive; Inactive)
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = Basic;
                }
                field(Supplier; "Vendor No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Supplier';
                }
                field(LocationCode; "Location Code")
                {
                    ApplicationArea = Basic;
                }
                field(AssetType; "Asset Type")
                {
                    ApplicationArea = Basic;
                }
                field(LastDateModified; "Last Date Modified")
                {
                    ApplicationArea = Basic;
                }
                // field(ResponsibleEmployee; "Responsible Officer")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Responsible Employee';
                //     Importance = Promoted;
                // }
                // field(ResponsibleEmployeeName; "Responsible Employee Name")
                // {
                //     ApplicationArea = Basic;
                // }
                field(ResponsibleCounty; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Responsible County';
                }
                // field(ResponsibleCountyName; "Responsible County Name")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Responsible Office"; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Responsible Department';
                }
                // field(ResponsibleDepartmentName; "Responsible Department  Name")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Disposed; Disposed)
                // {
                //     ApplicationArea = Basic;
                // }
                // field(DisposalDate; "Disposal Date")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(DisposedBy; "Disposed By")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(DisposalReason; "Disposal Reason")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(AssetStatus; "Asset Status")
                // {
                //     ApplicationArea = Basic;
                // }
                field(AssetMovementStatus; "Asset Movement Status")
                {
                    ApplicationArea = Basic;
                }
            }
            part(DepreciationBook; "FA Depreciation Books Subform")
            {
                SubPageLink = "FA No." = field("No.");
            }
            group(Posting)
            {
                Caption = 'Posting';
                field(FAClassCode; "FA Class Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(FASubclassCode; "FA Subclass Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(FALocationCode; "FA Location Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(BudgetedAsset; "Budgeted Asset")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
            }
            group(Maintenance)
            {
                Caption = 'Maintenance';
                field("Maintenance Vendor No"; "Vendor No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Maintenance Vendor No';
                    Importance = Promoted;
                }
                field(MaintenanceVendorNo; "Maintenance Vendor No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(UnderMaintenance; "Under Maintenance")
                {
                    ApplicationArea = Basic;
                }
                field(NextServiceDate; "Next Service Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field(WarrantyDate; "Warranty Date")
                {
                    ApplicationArea = Basic;
                }
                field(Insured; Insured)
                {
                    ApplicationArea = Basic;
                }
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
                action(AssetMovementRegister)
                {
                    ApplicationArea = Basic;
                    Caption = 'Asset Movement Register';
                    Image = FARegisters;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Asset Issue Request Lines";
                    RunPageLink = "Asset No." = field("No."),
                                  Status = const(Approved);
                    RunPageMode = View;
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
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(5600),
                                  "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
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
                action(MainAssetComponents)
                {
                    ApplicationArea = Basic;
                    Caption = 'M&ain Asset Components';
                    Image = Components;
                    Promoted = true;
                    PromotedCategory = Process;
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
                separator(Action39)
                {
                    Caption = '';
                }
            }
            group(Insurance)
            {
                Caption = 'Insurance';
                Image = TotalValueInsured;
                action(TotalValueInsured)
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Value Ins&ured';
                    Image = TotalValueInsured;
                    RunObject = Page "Total Value Insured";
                    RunPageLink = "No." = field("No.");
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
            }
        }
        area(processing)
        {
            action(CalculateDepreciation)
            {
                ApplicationArea = Basic;
                Caption = 'Calculate Depreciation';
                Image = CalculateDepreciation;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    FixedAsset: Record "Fixed Asset";
                begin
                    FixedAsset.SetRange("No.", "No.");
                    Report.RunModal(Report::"Calculate Depreciation", true, false, FixedAsset);
                end;
            }
        }
        area(reporting)
        {
            action(FixedAssetsList)
            {
                ApplicationArea = Basic;
                Caption = 'Fixed Assets List';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Fixed Asset - List";
            }
            action(AcquisitionList)
            {
                ApplicationArea = Basic;
                Caption = 'Acquisition List';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Fixed Asset - Acquisition List";
            }
            action(Details)
            {
                ApplicationArea = Basic;
                Caption = 'Details';
                Image = View;
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Fixed Asset - Details";
            }
            action(BookValue01)
            {
                ApplicationArea = Basic;
                Caption = 'Book Value 01';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Fixed Asset - Book Value 01";
            }
            action(BookValue02)
            {
                ApplicationArea = Basic;
                Caption = 'Book Value 02';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Fixed Asset - Book Value 02";
            }
            action(Analysis)
            {
                ApplicationArea = Basic;
                Caption = 'Analysis';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Fixed Asset - Analysis";
            }
            action(ProjectedValue)
            {
                ApplicationArea = Basic;
                Caption = 'Projected Value';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Fixed Asset - Projected Value";
            }
            action(GLAnalysis)
            {
                ApplicationArea = Basic;
                Caption = 'G/L Analysis';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Fixed Asset - G/L Analysis";
            }
            action(Register)
            {
                ApplicationArea = Basic;
                Caption = 'Register';
                Image = Confirm;
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Fixed Asset Register";
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "FA Class Code" := 'INTANGIBLE'
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "FA Class Code" := 'INTANGIBLE'
    end;
}

