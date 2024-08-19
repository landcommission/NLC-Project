#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194076 "AssetPurchase Requisition Lin"
{
    ApplicationArea = Basic;
    PageType = ListPart;
    SourceTable = "Store Requistion Line";
    UsageCategory = Lists;
    Caption = 'AssetPurchase Requisition Lin';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    OptionCaption = 'Item,Asset';
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Requistion No"; Rec."Requistion No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requistion No field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Purchase Remarks"; Rec."Description 2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Remarks';
                    ToolTip = 'Specifies the value of the Purchase Remarks field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
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
                field(Quantity; Rec."Quantity Requested")
                {
                    ApplicationArea = Basic;
                    Caption = 'Quantity';
                    ToolTip = 'Specifies the value of the Quantity field.';
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
                field("Purchasing Store"; Rec."Purchasing Store")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchasing Store field.';
                }
                field("Request Status"; Rec."Request Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Status field.';
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
