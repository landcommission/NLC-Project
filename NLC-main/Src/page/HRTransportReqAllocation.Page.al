page 52194244 "HR Transport Req Allocation"
{
    ApplicationArea = All;
    Caption = 'HR Transport Req Allocation';
    PageType = Card;
    SourceTable = "HR Transport Requisition";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Transport Request No"; Rec."Transport Request No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Transport Request No field.';
                }
                field("Vehicle Allocated"; Rec."Vehicle Allocated")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Allocated field.';
                }

                field("Vehicle Description"; Rec."Vehicle Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Description field.';
                    Editable = false;
                }

                field(Driver; Rec.Driver)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driver field.';
                }

                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }

                field("Reference No"; Rec."Reference No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Reference No. field.';
                }

                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the County field.';
                }

                field("County Description"; Rec."County Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the County Description field.';
                }

                field(Destination; Rec."Trip To Destination")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Trip To Destination field.';
                }

                field("Purpose of Trip"; Rec."Purpose of Trip")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Purpose of Trip field.';
                }

                field("Days Applied"; Rec."Days Applied")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Days Applied field.';
                }

                field("Travel Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Return Date field.';
                }
                field("Time of Trip"; Rec."Time of Trip")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Time of Trip field.';
                }
                field("Time of Return"; Rec."Time of Return")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Time of Return field.';
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Wheelchair Accessible"; Rec."Wheelchair Accessible")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Wheelchair Accessible field.';
                }
            }
            part("Passenger List"; "Passenger Request List")
            {
                Caption = 'Passenger List';
                SubPageLink = "Requisition No" = field("Transport Request No");
                Visible = true;
            }
        }
    }
}
