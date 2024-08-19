#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194037 "HR Transport Alloc. Factbox"
{
    PageType = CardPart;
    SourceTable = "HR Transport Allocations H";
    ApplicationArea = All;
    Caption = 'HR Transport Alloc. Factbox';
    layout
    {
        area(Content)
        {
            group(Control1000000017)
            {
                field("Transport Allocation No"; Rec."Transport Allocation No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transport Allocation No field.';
                }
                field("Date of Allocation"; Rec."Date of Allocation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Allocation field.';
                }
                field("Date of Trip"; Rec."Date of Trip")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Trip field.';
                }
                field("Purpose of Trip"; Rec."Purpose of Trip")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purpose of Trip field.';
                }
                field("Vehicle Reg Number"; Rec."Vehicle Reg Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Reg Number field.';
                }
                field("Passenger Capacity"; Rec."Passenger Capacity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Passenger Capacity field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field("Destination(s)"; Rec."Destination(s)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination(s) field.';
                }
                field("Journey Route"; Rec."Journey Route")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Journey Route field.';
                }
                field("Time of Trip"; Rec."Time of Trip")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time of Trip field.';
                }
                field("Opening Odometer Reading"; Rec."Opening Odometer Reading")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opening Odometer Reading field.';
                }
                field("Time out"; Rec."Time out")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time out field.';
                }
                field("Closing Odometer Reading"; Rec."Closing Odometer Reading")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closing Odometer Reading field.';
                }
                field("Time In"; Rec."Time In")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time In field.';
                }
            }
        }
    }

    actions { }
}
