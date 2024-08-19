#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194129 "HR Job Interview Factbo"
{
    PageType = List;
    SourceTable = "HR Job Interview";
    ApplicationArea = All;
    Caption = 'HR Job Interview Factbo';
    layout
    {
        area(Content)
        {
            field("Interview Description"; Rec."Interview Description")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Interview Description field.';
            }
            field(Score; Rec.Score)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Score field.';
            }
            field("Total Score"; Rec."Total Score")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Total Score field.';
            }
            field(Comments; Rec.Comments)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Comments field.';
            }
        }
    }

    actions { }
}
