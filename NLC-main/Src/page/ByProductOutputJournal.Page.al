#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193746 "By- Product Output Journal"
{
    AutoSplitKey = true;
    Caption = 'By- Product Output Journal';
    DataCaptionFields = "Journal Batch Name";
    DelayedInsert = true;
    PageType = Worksheet;
    SaveValues = true;
    SourceTable = "Item Journal Line";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            field(CurrentJnlBatchName; CurrentJnlBatchName)
            {
                ApplicationArea = Basic;
                Caption = 'Batch Name';
                Lookup = true;
                ToolTip = 'Specifies the value of the Batch Name field.';
                trigger OnLookup(var Text: Text): Boolean
                begin
                    CurrPage.SaveRecord();
                    ItemJnlMgt.LookupName(CurrentJnlBatchName, Rec);
                    CurrPage.Update(false);
                    ItemJnlMgt.CheckName(CurrentJnlBatchName, Rec);
                end;

                trigger OnValidate()
                begin
                    ItemJnlMgt.CheckName(CurrentJnlBatchName, Rec);
                    CurrentJnlBatchNameOnAfterVali();
                end;
            }
            repeater(Control1)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the posting date for the entry.';
                }
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the order that created the entry.';
                    trigger OnValidate()
                    begin
                        ItemJnlMgt.GetConsump(Rec, ProdOrderDescription);
                    end;
                }
                field("Order Line No."; Rec."Order Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the line number of the order that created the entry.';
                }
                field("Prod. Order Comp. Line No."; Rec."Prod. Order Comp. Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the production order component line number.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the date when the related document was created.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies a document number that refers to the customer''s or vendor''s numbering system.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a document number for the journal line.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the item on the journal line.';
                    trigger OnValidate()
                    begin
                        Rec.ShowShortcutDimCode(ShortcutDimCode);
                    end;
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the variant of the item on the line.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a description of the item on the journal line.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("ShortcutDimCode[3]"; ShortcutDimCode[3])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,3';
                    Visible = false;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[3] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(3, ShortcutDimCode[3]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(3, ShortcutDimCode[3]);
                    end;
                }
                field("ShortcutDimCode[4]"; ShortcutDimCode[4])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,4';
                    Visible = false;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[4] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(4, ShortcutDimCode[4]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(4, ShortcutDimCode[4]);
                    end;
                }
                field("ShortcutDimCode[5]"; ShortcutDimCode[5])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,5';
                    Visible = false;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[5] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(5, ShortcutDimCode[5]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(5, ShortcutDimCode[5]);
                    end;
                }
                field("ShortcutDimCode[6]"; ShortcutDimCode[6])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,6';
                    Visible = false;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[6] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(6, ShortcutDimCode[6]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(6, ShortcutDimCode[6]);
                    end;
                }
                field("ShortcutDimCode[7]"; ShortcutDimCode[7])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,7';
                    Visible = false;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[7] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(7, ShortcutDimCode[7]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(7, ShortcutDimCode[7]);
                    end;
                }
                field("ShortcutDimCode[8]"; ShortcutDimCode[8])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,8';
                    Visible = false;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[8] field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(8, ShortcutDimCode[8]);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(8, ShortcutDimCode[8]);
                    end;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the code for the inventory location where the item on the journal line will be registered.';
                }
                field("Bin Code"; Rec."Bin Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies a bin code for the item.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the vendor''s or customer''s trade type to link transactions made for this business partner with the appropriate general ledger account according to the general posting setup.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the item''s product type to link transactions made for this item with the appropriate general ledger account according to the general posting setup.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the number of units of the item to be included on the journal line.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the cost of one unit of the item or resource on the line.';
                }
                field("Unit Amount"; Rec."Unit Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the price of one unit of the item on the journal line.';
                }
                field("Applies-to Entry"; Rec."Applies-to Entry")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies if the quantity on the journal line must be applied to an already-posted entry. In that case, enter the entry number that the quantity will be applied to.';
                }
                field("Applies-from Entry"; Rec."Applies-from Entry")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the outbound item ledger entry, whose cost is forwarded to the inbound item ledger entry.';
                }
                field("Source No."; Rec."Source No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Source No. field.';
                }
                field("Output From Line"; Rec."Output From Line")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Output From Line field.';
                }
                field("Work Shift Code"; Rec."Work Shift Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the work shift code for this Journal line.';
                }
            }
            group(Control73)
            {
                fixed(Control1902114901)
                {
                    group("Prod. Order Name")
                    {
                        Caption = 'Prod. Order Name';
                        field(ProdOrderDescription; ProdOrderDescription)
                        {
                            ApplicationArea = Basic;
                            Editable = false;
                            ToolTip = 'Specifies the value of the ProdOrderDescription field.';
                        }
                    }
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortcutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                    trigger OnAction()
                    begin
                        Rec.ShowDimensions();
                        CurrPage.SaveRecord();
                    end;
                }
                action("Item &Tracking Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    ShortcutKey = 'Shift+Ctrl+I';
                    ToolTip = 'Executes the Item &Tracking Lines action.';
                    trigger OnAction()
                    begin
                        Rec.OpenItemTrackingLines(false);
                    end;
                }
                action("Bin Contents")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bin Contents';
                    Image = BinContent;
                    RunObject = page "Bin Contents List";
                    RunPageLink = "Location Code" = field("Location Code"),
                                  "Item No." = field("Item No."),
                                  "Variant Code" = field("Variant Code");
                    RunPageView = sorting("Location Code", "Bin Code", "Item No.", "Variant Code", "Unit of Measure Code");
                    ToolTip = 'Executes the Bin Contents action.';
                }
            }
            group("Pro&d. Order")
            {
                Caption = 'Pro&d. Order';
                Image = "Order";
                action(Card)
                {
                    ApplicationArea = Basic;
                    Caption = 'Card';
                    Image = EditLines;
                    RunObject = page "Released Production Order";
                    RunPageLink = "No." = field("Order No.");
                    ShortcutKey = 'Shift+F7';
                    ToolTip = 'Executes the Card action.';
                }
                group("Ledger E&ntries")
                {
                    Caption = 'Ledger E&ntries';
                    Image = Entries;
                    action("Item Ledger E&ntries")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Item Ledger E&ntries';
                        Image = ItemLedger;
                        RunObject = page "Item Ledger Entries";
                        RunPageLink = "Order Type" = const(Production),
                                      "Order No." = field("Order No.");
                        ShortcutKey = 'Ctrl+F7';
                        ToolTip = 'Executes the Item Ledger E&ntries action.';
                    }
                    action("Capacity Ledger Entries")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Capacity Ledger Entries';
                        Image = CapacityLedger;
                        RunObject = page "Capacity Ledger Entries";
                        RunPageLink = "Order Type" = const(Production),
                                      "Order No." = field("Order No.");
                        ToolTip = 'Executes the Capacity Ledger Entries action.';
                    }
                }
            }
        }
        area(Processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Calc. Co&nsumption")
                {
                    ApplicationArea = Basic;
                    Caption = 'Calc. Co&nsumption';
                    Ellipsis = true;
                    Image = CalculateConsumption;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;
                    ToolTip = 'Executes the Calc. Co&nsumption action.';
                    trigger OnAction()
                    var
                        CalcConsumption: Report "Calc. Consumption";
                    begin
                        CalcConsumption.SetTemplateAndBatchName(Rec."Journal Template Name", Rec."Journal Batch Name");

                        CalcConsumption.RunModal();
                    end;
                }
                action("Load By-Products")
                {
                    ApplicationArea = Basic;
                    Caption = 'Load By-Products';
                    Image = CalculateConsumption;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Load By-Products action.';

                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action("Test Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Test Report';
                    Ellipsis = true;
                    Image = TestReport;
                    ToolTip = 'Executes the Test Report action.';
                    trigger OnAction()
                    begin
                        ReportPrint.PrintItemJnlLine(Rec);
                    end;
                }
                action("P&ost")
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortcutKey = 'F9';
                    ToolTip = 'Executes the P&ost action.';
                    trigger OnAction()
                    begin
                        TestMandatoryFields();
                        Rec.PostingItemJnlFromProduction(false);
                        CurrentJnlBatchName := Rec.GetRangeMax(Rec."Journal Batch Name");
                        CurrPage.Update(false);
                    end;
                }
                action("Post and &Print")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post and &Print';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortcutKey = 'Shift+F9';
                    ToolTip = 'Executes the Post and &Print action.';
                    trigger OnAction()
                    begin
                        TestMandatoryFields();
                        Rec.PostingItemJnlFromProduction(true);
                        CurrentJnlBatchName := Rec.GetRangeMax(Rec."Journal Batch Name");
                        CurrPage.Update(false);
                    end;
                }
            }
            action("&Print")
            {
                ApplicationArea = Basic;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the &Print action.';
                trigger OnAction()
                var
                    ItemJnlLine: Record "Item Journal Line";
                begin
                    ItemJnlLine.Copy(Rec);
                    ItemJnlLine.SetRange("Journal Template Name", Rec."Journal Template Name");
                    ItemJnlLine.SetRange("Journal Batch Name", Rec."Journal Batch Name");
                    Report.RunModal(Report::"Inventory Movement", true, true, ItemJnlLine);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        ItemJnlMgt.GetConsump(Rec, ProdOrderDescription);
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnDeleteRecord(): Boolean
    var
        ReserveItemJnlLine: Codeunit "Item Jnl. Line-Reserve";
    begin
        Commit();
        if not ReserveItemJnlLine.DeleteLineConfirm(Rec) then
            exit(false);
        ReserveItemJnlLine.DeleteLine(Rec);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.SetUpNewLine(xRec);
        Rec.Validate(Rec."Entry Type", Rec."Entry Type"::Consumption);
        Clear(ShortcutDimCode);
    end;

    trigger OnOpenPage()
    var
        JnlSelected: Boolean;
    begin
        OpenedFromBatch := (Rec."Journal Batch Name" <> '') and (Rec."Journal Template Name" = '');
        if OpenedFromBatch then begin
            CurrentJnlBatchName := Rec."Journal Batch Name";
            ItemJnlMgt.OpenJnl(CurrentJnlBatchName, Rec);
            exit;
        end;
        ItemJnlMgt.TemplateSelection(Page::"Consumption Journal", 4, false, Rec, JnlSelected);
        if not JnlSelected then
            Error('');
        ItemJnlMgt.OpenJnl(CurrentJnlBatchName, Rec);
    end;

    var
        ItemJnlMgt: Codeunit ItemJnlManagement;
        ReportPrint: Codeunit "Test Report-Print";
        ProdOrderDescription: Text[50];
        CurrentJnlBatchName: Code[10];
        ShortcutDimCode: array[8] of Code[20];
        OpenedFromBatch: Boolean;

    local procedure CurrentJnlBatchNameOnAfterVali()
    begin
        CurrPage.SaveRecord();
        ItemJnlMgt.SetName(CurrentJnlBatchName, Rec);
        CurrPage.Update(false);
    end;


    procedure TestMandatoryFields()
    var
        ItemJnlLine: Record "Item Journal Line";
    begin
        ItemJnlLine.SetRange("Journal Template Name", Rec."Journal Template Name");
        ItemJnlLine.SetRange("Journal Batch Name", Rec."Journal Batch Name");
        ItemJnlLine.FindSet();
        repeat
            ItemJnlLine.TestField(ItemJnlLine."Work Shift Code");
            ItemJnlLine.TestField(ItemJnlLine."Output From Line");
        until ItemJnlLine.Next() = 0;
    end;
}
