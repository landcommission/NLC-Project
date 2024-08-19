#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 52194252 "Ticket Memo Requisition Line"
{
    PageType = ListPart;
    SourceTable = 52193902;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    OptionCaption = 'Service';
                }
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(BookingType; "Booking Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PurposeofTravel; "Purpose of Travel")
                {
                    ApplicationArea = Basic;
                    Visible = "Booking Type" = "Booking Type"::Ticket;
                }
                field(DestinationFrom; "Destination From")
                {
                    ApplicationArea = Basic;
                }
                field(DestinationTo; "Destination To")
                {
                    ApplicationArea = Basic;
                }
                field(DepartureDate; "Departure Date")
                {
                    ApplicationArea = Basic;
                }
                field(DepartureTime; "Departure Time")
                {
                    ApplicationArea = Basic;
                }
                field(ReturnDate; "Return Date")
                {
                    ApplicationArea = Basic;
                }
                field(ReturnTime; "Return Time")
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
            group(Line)
            {
                Caption = '&Line';
                Image = Line;
                group(ItemAvailabilityby)
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
        ShortcutDimCode: array[8] of Code[20];
}

