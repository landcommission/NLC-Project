#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194149 "HR Emp Training Appl. Req List"
{
    ApplicationArea = Basic;
    CardPageId = "HR Emp Training App. Header";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "HR Training App Header";
    UsageCategory = Lists;
    Caption = 'HR Emp Training Appl. Req List';
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
                field("Training Type"; Rec."Training Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Type field.';
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
