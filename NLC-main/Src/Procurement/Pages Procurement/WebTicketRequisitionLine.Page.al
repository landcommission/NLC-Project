#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 52194255 "Web Ticket Requisition Line"
{
    PageType = ListPart;
    SourceTable = "Store Requistion Line";
    //SourceTableView = where("Booking Type"=const(Ticket));

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                field("Requistion No";"Requistion No")
                {
                    ApplicationArea = Basic;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No";"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name";"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                    OptionCaption = 'Service';
                }
                field("Booking Type";"Booking Type")
                {
                    ApplicationArea = Basic;
                }
                field("Purpose of Travel";"Purpose of Travel")
                {
                    ApplicationArea = Basic;
                }
                field("Destination From";"Destination From")
                {
                    ApplicationArea = Basic;
                }
                field("Destination To";"Destination To")
                {
                    ApplicationArea = Basic;
                }
                field("Departure Date";"Departure Date")
                {
                    ApplicationArea = Basic;
                }
                field("Departure Time";"Departure Time")
                {
                    ApplicationArea = Basic;
                }
                field("Return Date";"Return Date")
                {
                    ApplicationArea = Basic;
                }
                field("Return Time";"Return Time")
                {
                    ApplicationArea = Basic;
                }
                field("Request Status";"Request Status")
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
        ShowShortcutDimCode(ShortcutDimCode);
    end;

    var
        ShortcutDimCode: array [8] of Code[20];
}

