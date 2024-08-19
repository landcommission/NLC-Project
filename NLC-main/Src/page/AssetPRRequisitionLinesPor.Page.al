#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 50006 "Asset PR Requisition Lines Por"
{
    PageType = ListPart;
    SourceTable = "Store Requistion Line";
    ApplicationArea = All;
    Caption = 'Asset PR Requisition Lines Por';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Requistion No"; Rec."Requistion No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requistion No field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description 2 field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Qty in store"; Rec."Qty in store")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qty in store field.';
                }
                field("Request Status"; Rec."Request Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Status field.';
                }
                field("Action Type"; Rec."Action Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Type field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Total Budget"; Rec."Total Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Budget field.';
                }
                field("Current Month Budget"; Rec."Current Month Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Month Budget field.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Cost field.';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line Amount field.';
                }
                field("Quantity Requested"; Rec."Quantity Requested")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity Requested field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Current Actuals Amount"; Rec."Current Actuals Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Actuals Amount field.';
                }
                field(Committed; Rec.Committed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committed field.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gen. Bus. Posting Group field.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';
                }
                field("Issuing Store"; Rec."Issuing Store")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issuing Store field.';
                }
                field("Bin Code"; Rec."Bin Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bin Code field.';
                }
                field("FA No."; Rec."FA No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA No. field.';
                }
                field("Maintenance Code"; Rec."Maintenance Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintenance Code field.';
                }
                field("Last Date of Issue"; Rec."Last Date of Issue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date of Issue field.';
                }
                field("Last Quantity Issued"; Rec."Last Quantity Issued")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Quantity Issued field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Lot No."; Rec."Lot No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lot No. field.';
                }
                field("Item Status"; Rec."Item Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item Status field.';
                }
                field("Purchasing Store"; Rec."Purchasing Store")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchasing Store field.';
                }
                field("Approved Qty"; Rec."Approved Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Qty field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                group("Item Availability by")
                {
                    Caption = 'Item Availability by';
                    Image = ItemAvailability;
                }
                action("Item Tracking Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    ShortcutKey = 'Shift+Ctrl+I';
                    ToolTip = 'Executes the Item &Tracking Lines action.';
                    trigger OnAction()
                    begin
                        Rec.OpenItemTrackingLines();
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Type := Rec.Type::Asset;

        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Asset
    end;

    trigger OnOpenPage()
    begin
        Rec.Type := Rec.Type::Asset
    end;

    var
        ShortcutDimCode: array[8] of Code[20];
}
