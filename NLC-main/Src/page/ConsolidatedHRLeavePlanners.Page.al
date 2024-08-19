page 50029 "Consolidated HR Leave Planners"
{
    CardPageId = "Consolidated Leave Planner";
    PageType = List;
    SourceTable = "HR Leave Planner Header";
    SourceTableView = where(Type = filter(Consolidated));
    ApplicationArea = All;
    Caption = 'Consolidated HR Leave Planner List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Code field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field(Names; Rec.Names)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Names field.';
                }
                field("Job Tittle"; Rec."Job Tittle")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Tittle field.';
                }
            }
        }
    }

    actions { }
}