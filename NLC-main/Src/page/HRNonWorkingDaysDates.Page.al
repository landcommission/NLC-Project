#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193509 "HR Non Working Days & Dates"
{
    Caption = 'HR Non Working Dates';
    PageType = List;
    SourceTable = "HR Non Working Days & Dates";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason field.';
                }
                field(Recurring; Rec.Recurring)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recurring field.';
                }
            }
        }
    }

    actions { }

    var
        DayOfWeek_Visible: Boolean;
        DateVisible: Boolean;
        HRCalendar: Record "HR Calendar";
        ReasonVisible: Boolean;
}
