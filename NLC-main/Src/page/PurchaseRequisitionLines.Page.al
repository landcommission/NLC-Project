#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194170 "Purchase Requisition Lines"
{
    PageType = ListPart;
    SourceTable = "Store Requistion Line";
    ApplicationArea = All;
    Caption = 'Purchase Requisition Lines';
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
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Remark';
                    ToolTip = 'Specifies the value of the Remark field.';
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
                field("Quantity Delivered"; Rec."Quantity Delivered")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity Delivered field.';
                    trigger OnValidate()
                    begin


                        Rec."Line Amount" := Rec."Unit Cost" * Rec."Quantity Delivered"
                    end;
                }
                field("Quantity Inspected"; Rec."Quantity Requested")
                {
                    ApplicationArea = Basic;
                    Caption = 'Quantity Inspected';
                    Editable = Rec."Request Status" = Rec."Request Status"::Released;
                    ToolTip = 'Specifies the value of the Quantity Inspected field.';
                    trigger OnValidate()
                    begin
                        if Rec."Quantity Delivered" <> 0 then
                            if Rec."Quantity Requested" > Rec."Quantity Delivered" then
                                Error('The Quantity Inspected cannot be greater than Quantity Delivered');
                    end;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Cost field.';
                    trigger OnValidate()
                    begin

                        Rec."Line Amount" := Rec."Unit Cost" * Rec."Quantity Delivered"
                    end;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line Amount field.';
                }
                field(Store; Rec."Issuing Store")
                {
                    ApplicationArea = Basic;
                    Caption = 'Store';
                    ToolTip = 'Specifies the value of the Store field.';
                }
                field("Request Status"; Rec."Request Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Request Status field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
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


    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Type := Rec.Type::Item;

        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Item
    end;

    var
        ShortcutDimCode: array[8] of Code[20];
}
