page 52193617 "Store Requisition Line"
{
    PageType = ListPart;
    SourceTable = "Store Requistion Lines";
    ApplicationArea = All;
    Caption = 'Store Requisition Line';
    layout
    {
        area(Content)
        {
            repeater(general)
            {
                field(Type; Rec.Type)
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    Caption = 'Remark';
                    ToolTip = 'Specifies the value of the Remark field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Qty in store"; Rec."Qty in store")
                {
                    ToolTip = 'Specifies the value of the Qty in store field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Quantity Requested"; Rec."Quantity Requested")
                {
                    ToolTip = 'Specifies the value of the Quantity Requested field.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ToolTip = 'Specifies the value of the Unit Cost field.';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ToolTip = 'Specifies the value of the Line Amount field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    Caption = 'Quantity To Issue';
                    ToolTip = 'Specifies the value of the Quantity To Issue field.';
                }
                field("Issuing Store"; Rec."Issuing Store")
                {
                    ToolTip = 'Specifies the value of the Issuing Store field.';
                }
                field("Bin Code"; Rec."Bin Code")
                {
                    ToolTip = 'Specifies the value of the Bin Code field.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ToolTip = 'Specifies the value of the Gen. Bus. Posting Group field.';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ToolTip = 'Specifies the value of the Gen. Prod. Posting Group field.';
                }
                field("Item Status"; Rec."Item Status")
                {
                    ToolTip = 'Specifies the value of the Item Status field.';
                }
                field("Lot No."; Rec."Lot No.")
                {
                    Editable = true;
                    ToolTip = 'Specifies the value of the Lot No. field.';
                }
                field(ShortcutDimCode3; Rec."Shortcut Dimension 3 Code")
                {
                    CaptionClass = '1,2,3';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(3, Rec."Shortcut Dimension 3 Code");
                    end;
                }
                field(ShortcutDimCode4; Rec."Shortcut Dimension 4 Code")
                {
                    CaptionClass = '1,2,4';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.LookupShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");
                    end;

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(4, Rec."Shortcut Dimension 4 Code");
                    end;
                }
                /* field(ShortcutDimCode5;"Shortcut Dimension 5 Code")
                {
                    CaptionClass = '1,2,5';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(5,ShortcutDimCode[5]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(5,ShortcutDimCode[5]);
                    end;
                } */
                /* field(ShortcutDimCode[6];ShortcutDimCode[6])
                {
                    CaptionClass = '1,2,6';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(6,ShortcutDimCode[6]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(6,ShortcutDimCode[6]);
                    end;
                }
                field(ShortcutDimCode[7];ShortcutDimCode[7])
                {
                    CaptionClass = '1,2,7';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(7,ShortcutDimCode[7]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(7,ShortcutDimCode[7]);
                    end;
                }
                field(ShortcutDimCode[8];ShortcutDimCode[8])
                {
                    CaptionClass = '1,2,8';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        LookupShortcutDimCode(8,ShortcutDimCode[8]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(8,ShortcutDimCode[8]);
                    end;
                } */
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
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
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    var
        ShortcutDimCode: array[8] of Code[20];
}

