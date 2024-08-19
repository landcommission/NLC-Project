#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193612 "HR Training Application Lists"
{
    CardPageId = "HR Training Application Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "HR Training App Header";
    ApplicationArea = All;
    Caption = 'HR Training Application Lists';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No field.';
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Date field.';
                }
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Title field.';
                }
                field("Course Description"; Rec."Course Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Description field.';
                }
                field("No. of Participants"; Rec."No. of Participants")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Participants field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Training Institution"; Rec."Training Institution")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Institution field.';
                }
                field("Training Venue"; Rec."Training Venue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Venue field.';
                }
                field("Employee No_"; Rec."Employee No_")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No_ field.';
                }
                field(UserId; Rec.UserId)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the UserId field.';
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location field.';
                }
                field("Training Cost Cstimated"; Rec."Training Cost Cstimated")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Cost Cstimated field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control17; Outlook) { }
            systempart(Control18; Notes) { }
            systempart(Control19; Links) { }
        }
    }

    actions { }
}
