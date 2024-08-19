#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50121 "Items Requisition Lines"
{
    PageType = ListPart;
    SourceTable = "Store Requistion Line";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    OptionCaption = 'Item,Asset';
                }
                field("No."; "No.")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        ItemRec.Reset;
                        ItemRec.SetRange(ItemRec."No.", "No.");
                        if ItemRec.Find('-') then
                            "Unit of Measure" := ItemRec."Purch. Unit of Measure";
                        "Unit Cost" := ItemRec."Last Direct Cost";
                    end;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Unit of Measure"; "Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Quantity Requested"; "Quantity Requested")
                {
                    ApplicationArea = Basic;
                    Editable = "Request Status" = "Request Status"::Open;
                }
                field("Quantity Delivered"; "Quantity Delivered")
                {
                    ApplicationArea = Basic;
                    Editable = "Request Status" = "Request Status"::Released;
                }
                field("Quantity Inspected"; "Quantity Inspected")
                {
                    ApplicationArea = Basic;
                    Editable = "Request Status" = "Request Status"::Released;
                }
                field("Unit Cost"; "Unit Cost")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin

                        "Line Amount" := "Unit Cost" * "Quantity Delivered"
                    end;
                }
                field("Line Amount"; "Line Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Request Status"; "Request Status")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("IFMIS Nos"; "IFMIS Nos")
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
        //ShowShortcutDimCode(ShortcutDimCode);
        Type := Type::Item
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Type := Type::Item;

        ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        Type := Type::Item
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Type := Type::Item
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        Type := Type::Item
    end;

    trigger OnOpenPage()
    begin
        Type := Type::Item
    end;

    var
        ShortcutDimCode: array[8] of Code[20];
        ItemRec: Record Item;
}

