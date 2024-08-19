#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193483 "HR Leave Planner List"
{
    CardPageId = "HR Leave Planner Card";
    PageType = List;
    SourceTable = "HR Leave Planner Header";
    SourceTableView = where(Type = filter(Functional));
    ApplicationArea = All;
    Caption = 'HR Leave Planner List';
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions { }
}
