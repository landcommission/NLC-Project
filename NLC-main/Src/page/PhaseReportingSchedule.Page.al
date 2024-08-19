#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193871 "Phase Reporting Schedule"
{
    DelayedInsert = true;
    Editable = false;
    PageType = Card;
    SourceTable = "Phase Reporting Schedules";
    ApplicationArea = All;
    Caption = 'Phase Reporting Schedule';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project field.';
                }
                field(Phase; Rec.Phase)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phase field.';
                }
                field(Months; Rec.Months)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Months field.';
                }
                field("Reporting Date"; Rec."Reporting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reporting Date field.';
                }
            }
        }
    }

    actions { }
}
