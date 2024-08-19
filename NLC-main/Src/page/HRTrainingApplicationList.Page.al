#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194061 "HR Training Application List"
{
    CardPageId = "HR Training Application Header";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "HR Training App Header";
    ApplicationArea = All;
    Caption = 'HR Training Application List';
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
                    Editable = true;
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Title field.';
                }
                field("Course Description"; Rec."Course Description")
                {
                    ApplicationArea = Basic;
                    Editable = true;
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
                    Caption = 'Estimated Cost';
                    ToolTip = 'Specifies the value of the Training Cost Cstimated field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Employee Grade"; Rec."Employee Grade")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Grade field.';
                }
                field(Sponsor; Rec.Sponsor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sponsor field.';
                }
                field("Training Type"; Rec."Training Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Type field.';
                }
                field("Training Category"; Rec.Training_Category)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Category field.';
                }
                field("Part of Recommended Trainning"; Rec."Part of Recommended Trainning")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Part of Recommended Trainning field.';
                }
                field("Last Attend From"; Rec."Last Attend From")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Attend From field.';
                }
                field("Last Attend To"; Rec."Last Attend To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Attend To field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Last training"; Rec."Last training")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last training field.';
                }
                field("Time Last Training Attended"; Rec."Time Last Training Attended")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Last Training Attended field.';
                }
                field("Training Status"; Rec."Training Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Status field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
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
