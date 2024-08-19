#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193866 "Phase Reporting SchedulesAudit"
{
    PageType = List;
    SourceTable = "Phase Reporting Schedules";
    ApplicationArea = All;
    Caption = 'Phase Reporting SchedulesAudit';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Phase; Rec.Phase)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phase field.';
                }
                field("Table ID"; Rec."Table ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Table ID field.';
                }
                field("Partner/Donor"; Rec."Partner/Donor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Partner/Donor field.';
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project field.';
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
                field(Notified; Rec.Notified)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notified field.';
                }
                field("Audit Dates"; Rec."Audit Dates")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Dates field.';
                }
                field(AlertSent; Rec.AlertSent)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the AlertSent field.';
                }
            }
        }
    }

    actions { }
}
