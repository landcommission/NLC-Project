#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194243 "HR Overall Comments"
{
    PageType = List;
    SourceTable = "HR Overall Comments";
    ApplicationArea = All;
    Caption = 'HR Overall Comments';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No series"; Rec."No series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No series field.';
                }
                field("Appraisal Code"; Rec."Appraisal Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Code field.';
                }
                field("Supervisor Comments"; Rec."Supervisor Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor Comments field.';
                }
                field("Appraisee Comments"; Rec."Appraisee Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisee Comments field.';
                }
                field("Part"; Rec.Part)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Part field.';
                }
                field("Second Supervisor Comments"; Rec."Second Supervisor Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Supervisor Comments field.';
                }
            }
        }
    }

    actions { }
}
