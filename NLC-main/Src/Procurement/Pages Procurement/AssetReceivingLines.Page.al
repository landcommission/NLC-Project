#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50066 "Asset Receiving Lines"
{
    Editable = false;
    PageType = List;
    SourceTable = "Store Requistion Line";

    layout
    {
        area(content)
        {
            repeater(Control14)
            {
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    OptionCaption = 'Item,Asset';
                }
                field("Requistion No";"Requistion No")
                {
                    ApplicationArea = Basic;
                }
                field("Asset No";"No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Asset No';
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Asset Quantity";"Asset Quantity")
                {
                    ApplicationArea = Basic;
                    Caption = 'Quantity';
                }
                field("Asset Unit Cost";"Asset Unit Cost")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Cost";"Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Line Amount";"Line Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Quantity";"Approved Quantity")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("IFMIS Nos";"IFMIS Nos")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
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
                    ShortCutKey = 'Shift+Ctrl+I';

                    trigger OnAction()
                    begin
                        OpenItemTrackingLines;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Type:=Type::Asset;

        ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Type:=Type::Asset
    end;

    trigger OnOpenPage()
    begin
         Type:=Type::Asset
    end;

    var
        ShortcutDimCode: array [8] of Code[20];
}

