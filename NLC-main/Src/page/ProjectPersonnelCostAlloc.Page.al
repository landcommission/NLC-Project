#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193873 "Project Personnel Cost Alloc"
{
    DelayedInsert = true;
    PageType = Card;
    SourceTable = "Project Personnel Cost Alloc";
    ApplicationArea = All;
    Caption = 'Project Personnel Cost Alloc';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Project Role"; Rec."Project Role")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Role field.';
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
                field(comment; Rec.comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the comment field.';
                }
                field("% Allocation Value"; Rec."% Allocation Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the % Allocation Value field.';
                }
            }
        }
    }

    actions { }
}
