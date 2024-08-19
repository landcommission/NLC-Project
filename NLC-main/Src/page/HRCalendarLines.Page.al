#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193510 "HR Calendar Lines"
{
    PageType = ListPart;
    SourceTable = "HR Calendar List";
    ApplicationArea = All;
    Caption = 'HR Calendar Lines';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                Editable = true;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Day; Rec.Day)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Day field.';
                }
                field("Non Working"; Rec."Non Working")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Non Working field.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason field.';
                }
            }
        }
    }

    actions { }
}
