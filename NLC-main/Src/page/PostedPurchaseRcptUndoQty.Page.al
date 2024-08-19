#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193911 "Posted Purchase Rcpt. Undo Qty"
{
    AutoSplitKey = true;
    Caption = 'Lines';
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = ConfirmationDialog;
    SourceTable = "Purch. Rcpt. Line-Undo";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
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
                field("Return Reason Code"; Rec."Return Reason Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Return Reason Code field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Quantity To Undo"; Rec."Quantity To Undo")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity To Undo field.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure Code field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Quantity Invoiced"; Rec."Quantity Invoiced")
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                    ToolTip = 'Specifies the value of the Quantity Invoiced field.';
                }
                field("Qty. Rcd. Not Invoiced"; Rec."Qty. Rcd. Not Invoiced")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Qty. Rcd. Not Invoiced field.';
                }
                field("Requested Receipt Date"; Rec."Requested Receipt Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Requested Receipt Date field.';
                }
                field("Promised Receipt Date"; Rec."Promised Receipt Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Promised Receipt Date field.';
                }
                field("Planned Receipt Date"; Rec."Planned Receipt Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Receipt Date field.';
                }
                field("Expected Receipt Date"; Rec."Expected Receipt Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected Receipt Date field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(OrderTracking)
                {
                    ApplicationArea = Basic;
                    Caption = 'Order &Tracking';
                    Image = OrderTracking;
                    ToolTip = 'Executes the Order &Tracking action.';
                    trigger OnAction()
                    begin
                        ShowTracking();
                    end;
                }
                action("&Undo Receipt")
                {
                    ApplicationArea = Basic;
                    Caption = '&Undo Receipt';
                    ToolTip = 'Executes the &Undo Receipt action.';
                    trigger OnAction()
                    begin

                        UndoReceiptLine();
                    end;
                }
            }
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortcutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                    trigger OnAction()
                    begin
                        Rec.ShowDimensions();
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    ToolTip = 'Executes the Co&mments action.';
                    trigger OnAction()
                    begin
                        Rec.ShowLineComments();
                    end;
                }
                action("Item &Tracking Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Item &Tracking Entries';
                    Image = ItemTrackingLedger;
                    ToolTip = 'Executes the Item &Tracking Entries action.';
                    trigger OnAction()
                    begin
                        Rec.ShowItemTrackingLines();
                    end;
                }
                action("Item Invoice &Lines")
                {
                    ApplicationArea = Basic;
                    Caption = 'Item Invoice &Lines';
                    Image = ItemInvoice;
                    ToolTip = 'Executes the Item Invoice &Lines action.';
                    trigger OnAction()
                    begin
                        Rec.ShowItemPurchInvLines();
                    end;
                }
            }
        }
    }

    var
        "Purch.Rcpt.Line-Undo": Record "Purch. Rcpt. Line-Undo";


    procedure ShowTracking()
    var
        ItemLedgEntry: Record "Item Ledger Entry";
        TempItemLedgEntry: Record "Item Ledger Entry" temporary;
        TrackingForm: Page "Order Tracking";
    begin
        Rec.TestField(Rec.Type, Rec.Type::Item);
        if Rec."Item Rcpt. Entry No." <> 0 then begin
            ItemLedgEntry.Get(Rec."Item Rcpt. Entry No.");
            TrackingForm.SetItemLedgEntry(ItemLedgEntry);
        end else
            TrackingForm.SetMultipleItemLedgEntries(TempItemLedgEntry,
              Database::"Purch. Rcpt. Line", 0, Rec."Document No.", '', 0, Rec."Line No.");

        TrackingForm.RunModal();
    end;


    procedure UndoReceiptLine()
    var
        PurchRcptLine: Record "Purch. Rcpt. Line";
    begin
        PurchRcptLine.Copy(Rec);

        //Added-------------copy from tbl 121 to 39006027 ---Ampatrh
        "Purch.Rcpt.Line-Undo".TransferFields(Rec, true);
        "Purch.Rcpt.Line-Undo".Insert(true);

        //CurrPage.SETSELECTIONFILTER(PurchRcptLine);
        //CODEUNIT.RUN(CODEUNIT::"Undo Purchase Receipt Line",PurchRcptLine);
    end;


    procedure ShowItemPurchInvLines()
    begin
        Rec.TestField(Rec.Type, Rec.Type::Item);
        Rec.ShowItemPurchInvLines();
    end;


    procedure CopyLinesToUndotbl()
    var
        "Purch.Rcpt.Line-Undo": Record "Purch. Rcpt. Line-Undo";
        "Purch.Rcpt.Line": Record "Purch. Rcpt. Line";
    begin
        "Purch.Rcpt.Line".Reset();
        "Purch.Rcpt.Line".SetRange("Purch.Rcpt.Line"."Document No.", Rec."Document No.");
        if "Purch.Rcpt.Line".Find('-') then
            repeat
                "Purch.Rcpt.Line-Undo".TransferFields("Purch.Rcpt.Line", true);
                "Purch.Rcpt.Line-Undo".Insert(true);
            until "Purch.Rcpt.Line".Next() = 0;
    end;
}
